const { request, cheerio, express } = require('../lib/modules')

let http = require('http').Server(express)

let controller = {
    start: () => {
        express.get('/', function(req, res){
            res.send('<h1>안녕하세요 "/" 경로입니다</h1>')
        })
        http.listen(8091, function(){
            console.log('listening on *:8091')
        })
        console.log('Controller')
        let options = {
            url: 'https://www.naver.com/',
            method: 'GET',
            timeout: 3000
        }
        controller.getBody(options, (result) => {
            controller.convertCheerio(result)
        })
    },
    getBody: (options, callback) => {
        request(options, (err, res, body) => {
            if(err) {
                console.log(`request own error`)
                console.log(err)
                callback(false)
            }
            else {
                try {
                    callback(body)
                } catch (error) {
                    console.log(`request try/catch error`)
                    console.log(error)
                    callback(false)
                }
            }
        })
    },
    convertCheerio: (body) => {
        let $ = cheerio.load(body)
        let title = $('head > meta[property="og:title"]').attr('content')
        let image = $('head > meta[property="og:image"]').attr('content')
        let url = $('head > meta[property="og:url"]').attr('content')
        let title2 = $('head > title').text()
        //$('#PM_ID_ct > .header > .special_bg > .area_flex > .area_logo > h1 > a > span').text()
        console.log(title)
        console.log(image)
        console.log(url)
        console.log(title2)
        let data = {
            title: title,
            img: image,
            url: url,
            sub: title2
        }
    }
}

module.exports = controller