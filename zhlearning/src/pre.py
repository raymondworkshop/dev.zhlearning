import spacy
from spacy.lang.zh.examples import sentences

nlp = spacy.load("zh_core_web_sm")
user_dict = []
nlp.tokenizer.pkuseg_update_user_dict(user_dict)


def main():
    doc = nlp(sentences[0])
    print(doc.text)
    for token in doc:
        print(token.text, token.pos_, token.dep_)


if __name__ == "__main__":
    main()
