import spacy
from spacy.lang.zh.examples import sentences


def main():
    nlp = spacy.load("zh_core_web_sm")
    doc = nlp(sentences[0])
    print(doc.text)
    for token in doc:
        print(token.text, token.pos_, token.dep_)


if __name__ == "main":
    main()
