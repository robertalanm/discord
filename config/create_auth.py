
filename = "auth.json"

class Models():
    client_id = ""
    token = ""


def read():
    with open(".secrets", "r") as ins:
        array = []
        for line in ins:
            array.append(line)
    Models.client_id = '{}'.format(array[0])
    Models.token = '{}'.format(array[1])


def create():
    with open(filename, "w") as f:
        client_id = Models.client_id
        token = Models.token
        
        #text = '{"token": "' + token + '", ' 
        #client = '"client_id": "' + client_id +  '"}'
        
        #text = '{ "token": "{0}", "client_id": "{1}" }'.format(token, client_id)
        token = '{ \"token\": ' + token + ' "client_id": ' + client_id + ' }' 
        spacer = '\", '
        #f.write(text)
        #print(token + spacer)
        f.write(token)


read()
create()
