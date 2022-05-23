
#### notes  

#### 2022-05-23  
* experiments  
    -  get the module zh_core_web_sm 



#### 2022-05-19    
* handle traditional Chinese texts  
    - TOCHECK  
        + Integration of CKIP Transformers with spaCy and the TextRank algorithm for traditional Chinese  

    - Chinese Grammar Intelligence (大雅語文智能)


* write the proposal  


#### 2022-05-17  
* Think big  
    - grammar for zh  

* reference 
    - [Practices of the Python Pro](https://www.manning.com/books/practices-of-the-python-pro)  
    - [Software Engineering With Python]  

#### 2022-05-12  
* Object     
    - 评定语文篇章中的潜在**语文知识和主题**， 以此来测量语文课本**篇章难度等级**  

    - 文库 - dataset  
        + 扫描的文章  ?     -NO 
        + 附件1 〈小學中文科常用字表〉  - OK 
        + 不同主题的字词表     - Can't access online  
        
    - 分析篇章内容  - Text Analysis  
        + 语文知识，主题， 难度等级  

* Functions in the engine 
    - This is an Engine not an online platform now  
    - 字的统计 
        + 2.2  常用度？  字詞分佈百分率 -> 文章难度(1-6)？  - How 
        
    - 词的统计  
        +  tokenization + bag-of-words 
        +  2.5  字词表和字体频率 -> 文章**主题或文体**？  - HOW   
            - **不同主题的字词表** - DATA 
            - 上载者提供  
 
    - 句的统计   
        + 语文知识： 句式，复句，标点符号和部分修辞   
        + 文章體裁 (under 篇in their hierarchy) such as  記敘文、描寫文、抒情文 etc  
            - 3 文本的分析  
        + 语文知识的分布 ->  文章难度？  - 　HOW  

        + design a combination of rule-based using phrase statistics as well as machine learning 

* Tech stack  
    - spaCy v3, jieba with user dictionary  
    - CKIP Neural Chinese Word Segmentation, POS Tagging, and NER
        + 简繁体转换  
    - PERT: Pre-training BERT with Permuted Language Model  
    - python 

* TODO  
    - help prepare the proposal with the guidance  
        + reference/examples   

* reference 
    - [ENC2045 Computational Linguistics](https://alvinntnu.github.io/NTNU_ENC2045_LECTURES/nlp/chinese-word-seg.html)
    - [2021-02-16-Adding a custom tokenizer to spaCy and extracting keywords.ipynb](https://colab.research.google.com/github/howard-haowen/blog.ai/blob/master/_notebooks/2021-02-16-Adding-a-custom-tokenizer-to-spaCy-and-extracting-keywords.ipynb#scrollTo=DeU-wUIk0iIk) 


#### 2022-04-26
* data  
    - 扫描的文章  
    - 附件1 〈小學中文科常用字表〉  
    - 不同主题的字词表    

* Text Analysis  
    - tokenization + bag-of-words  
    - TF-IDF 

* questions  
    - 2.2 常用度？  字詞分佈百分率 -> 文章难度？  
    - 2.5  文章**主题或文体**？  
        + 不同主题的字词表？  
    - 2.6  语文知识 -> **文章难度的定义**？ 

#### 2022-04-08 
* confirm the questions with examples 
    - codex 分层记录方法   
        + 是否 已经 扫描 （sou3 miu4）文章 (man4 zoeng1)  
            - 已经 手工 (sau2 gung1) 标注的 文章   

        + p4 - 小灰马嗒嗒 （siu2 fui1 maa5 taap3 taap3） 
            - 标注了 “無不”(mou4 bat1)， “棕色” (zung1 sik1)， “灰濛濛” (fui1 mung4 mung4)  
        要標註（biu1 zu3) 哪些 詞组 （ci4 zou2）/ 句子  (geoi3 zi2)    
            - "家人" (gaa1 jan4)  "例外" (lai6 ngoi6)  

        + 怎么知道 division 
            - “灰濛濛” (fui1 mung4 mung4)  
            - 詞:詞性:着色詞 (zoek6 sik1):ABB 式    

    - Q2.3   
        + 定义  paragraph, discourse  


#### 2022-04-07  
* A engine in smart learning  
    
    - source 
        + **扫描的所有文章**  

    - 语文知识重点分类  Codex  
        + 标注  **哪些词组和句（geio3）式**    
            - 形容词， 助(zo6)词  
            - 比喻 / 
        + 怎么知道 是哪个 division 
        + **是否已经有了 手工标注的 文章**  

    - Q2.3 
        + 歧义  ambiguity  
            - 语法 - 词在句子里的位置和作用 - depentency parsing  
            - 语义 - context 

        + 段落 和 篇章 
            - 定义  paragraph, discourse  
            - 片段之间的联结词？  或者 **可以提供什么协助**  
        
        + 根据成分  筛选   
            - select * based on the structure 
            - confirm ? 

* tech  
    - tokenization（+ 手工规则） + bag of words 
    - entity link 
    - parser, pos 
         

#### 2022-04-06  
* TODO  
    - Q2.3  

    - clarify the resources  

* NLP for traditional Chinese texts  
    - jieba  
        + Tokenization  
    - CkipTagger  
    Chinese word segmentation, 
    named entity recognition, 
    POS for tradition Chinese 

    -  Chinese BERT 
        + Chinese-BERT-wwm 


* sharings  
    - a parkage or toolkit 
    - SpaCy  

    - personalized learning, exercise generation, intelligent student profiling  
        + details from the requirements 
    then how to achieve that, and get some new findings from that  

    - 6-month contract  



#### 2022-03-22  
* language context  

* text analysis and statistics  
    - Tokenization -> Part-of-speech tagging -> Parsing  
    - others
        + personalized learning like e-learning platform  
        +  correct exercise  errors / generation 
        +  intelligent student profiling  


* what we can do  
    - This project is about smart learning for Chinese for primary and junior secondary students. The materials are attached. After digesting the materials, we need to propose what we can do for the suggested topics, and other topics using technology including personalized teaching & learning, Chinese NLP, learning content generation, exercise generation, intelligent student profiling, etc.  

#### reference
* [text-analysis](https://monkeylearn.com/text-analysis/) 