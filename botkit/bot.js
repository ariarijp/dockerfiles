var Botkit = require('botkit')

var token = process.env.SLACK_API_TOKEN
if (!token) {
    throw 'SLACK_API_TOKEN is required.'
}

var debug = false
if (process.env.DEBUG) {
    debug = true
}

var controller = Botkit.slackbot({
    json_file_store: 'json_database',
    debug: debug
})

var bot = controller.spawn({
    token: token
}).startRTM()

bot.api.team.info({}, function(err, res) {
    controller.storage.teams.save({
        id: res.team.id
    }, function(err) {});
});

controller.setupWebserver(process.env.PORT, function(err, webserver) {
    if (err) {
        console.error(err)
        process.exit(1)
    }

    controller.createWebhookEndpoints(webserver)
})

controller.hears('hello', ['direct_message', 'direct_mention', 'mention'], function(bot, message) {
    bot.reply(message, 'hello')
})

controller.on('slash_command', function(bot, message) {
    switch (message.command) {
        case '/hello':
            bot.replyPrivate(message, 'hello')
            break
        default:
            break;
    }
})
