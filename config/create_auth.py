import numpy as np

filename = "auth.json"

class Models():
    client_id = np.array([])
    token = np.array([])


def read():
    with open(".secrets", "r") as ins:
        array = []
        for line in ins:
            array.append(line)
    Models.client_id = array[0]
    Models.token = array[1]


def create():
    with open(filename, "w") as f:
        client_id = Models.client_id
        token = Models.token
        
        text = "{\n    \"token\": \"" + token + "\",\n    \"client_id\" \"" + client_id + "\"\n}"

        f.write(text)

read()
create()
