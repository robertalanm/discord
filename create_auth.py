
filename = "auth.json"

def create():
    with open(filename, "w") as f:
        client_id = input("What is you client ID?> ")
        token = input("What is your token?> ")
        
        text = "{\n    \"token\": \"" + token + "\",\n    \"client_id\" \"" + client_id + "\"\n}"

        f.write(text)

create()
