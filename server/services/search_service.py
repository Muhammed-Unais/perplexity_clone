from config import Settings
from tavily import TavilyClient
from trafilatura import fetch_url, extract

settings = Settings()

tavily_client = TavilyClient(api_key=settings.TAVILY_API_KEY)

class SearchService:
    def web_search(self, query:str)-> dict:
        results = []
        response =  tavily_client.search(query,max_results=10)
        search_results = response.get('results',[])
        
        for result in search_results:
            downloaded = fetch_url(result.get("url"))
            content = extract(downloaded,include_comments=False)
            
            results.append({
                "title":result.get("title",''),
                "url":result.get("url"),
                "content":content
            })
            
            return results
        
        
