from modules.banco import Conector_postgres
import pandas as pd


df = pd.read_csv('projetoyoutube (2).csv', ';') # transformando o .csv em dataframe
df_reset=df.reset_index(drop=True) # excluindo o índice do dataframe
banco = Conector_postgres(host="127.0.0.1", db="Atividade17", user= "postgres", password = "postgres")  #conectando ao banco de dados
        
if __name__ =="__main__":
    
    try:       
        
        # criando a tabela youTube no banco (PostgreSQL)
        banco.inserir("CREATE TABLE IF NOT EXISTS you_Tube (video_id text, title text, datadepublicacao text,	horariodepublicacao time, channelId text, channelTitle text, Category_name text, categoryId integer, datadetendencia text, horariodetedencia text, tags text, view_count integer, gain text, likes integer, dislikes integer, comment_count integer, comments_disabled text, ratings_disabled text, CONSTRAINT youTube_pk PRIMARY KEY (video_id))")
        # inserindo o dataframe na Tabela youTube       
        for index, dado in df_reset.iterrows(): #iterando as linhas do dataframe   
            banco.inserir(f"INSERT INTO you_Tube (video_id, title, datadepublicacao,	horariodepublicacao, channelId, channelTitle, Category_name, categoryId, datadetendencia, horariodetedencia, tags, view_count, gain, likes, dislikes, comment_count, comments_disabled, ratings_disabled) VALUES ('{dado['video_id']}', '{dado['title']}', '{dado['datadepublicacao']}', '{dado['horariodepublicacao']}', '{dado['channelId']}', '{dado['channelTitle']}', '{dado['Category_name']}', '{dado['categoryId']}', '{dado['datadetendencia']}', '{dado['horariodetedencia']}', '{dado['tags']}', '{dado['view_count']}', '{dado['gain']}', '{dado['likes']}', '{dado['dislikes']}', '{dado['comment_count']}', '{dado['comments_disabled']}', '{dado['ratings_disabled']}'); ")      
            
    except Exception as e :
        print(str(e))
        
        
print('Acabou! Dados inseridos com sucesso!')