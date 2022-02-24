# Bike Location

O app foi publicado no site: https://bike-geolocation.herokuapp.com/

Foi criada a classe BikePoint que recebeu os dados da API bike rio. 

Foi utilizada a fórmula do site:
https://www.geeksforgeeks.org/program-distance-two-points-earth/#:~:text=For%20this%20divide%20the%20values,is%20the%20radius%20of%20Earth.

Foi criado o campo de distância para que seja retornada uma array com os pontos mais próximos, com os respectivos objetos associados para renderização no aplicativo.

Para processamento das distâncias foi criada uma classe Geolocation, desacoplada do modelo e presente no módulo GeolocationHelper.

A API do openstreemap foi consumida por meio da gem específica que possuí as mesmas parametrizações de consulta http.
Fonte: https://github.com/WebGents/open_street_map
