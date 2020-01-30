const { request, cheerio } = require('../lib/modules')

let controller = {
    start: () => {
        console.log('hi')
        let options = {
            url: 'https://www.naver.com',
            method: 'get',
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
        //$('#PM_ID_ct > .header > .special_bg > .area_flex > .area_logo > h1 > a > span').text()
        console.log(title)
        console.log(image)
    }
}

module.exports = controller