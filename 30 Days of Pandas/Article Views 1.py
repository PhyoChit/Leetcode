import pandas as pd

def article_views(views: pd.DataFrame) -> pd.DataFrame:
    self_views = views[views['author_id'] == views['viewer_id']]['author_id'].drop_duplicates().sort_values().rename('id')
    df = pd.DataFrame(self_views)
    return df
