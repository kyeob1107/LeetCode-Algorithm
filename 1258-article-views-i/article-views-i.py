import pandas as pd

def article_views(views: pd.DataFrame) -> pd.DataFrame:
    result_df = pd.DataFrame()
    result_df['id'] = views[views['author_id']==views['viewer_id']]['author_id'].drop_duplicates(keep='first')
    result_df = result_df.sort_values(by=['id'])
    return result_df
