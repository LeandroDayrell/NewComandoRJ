(function($) {
    var _originalY,
        _transitionDurations = {};

    $(document).ready(function() {

        // expand item
        $('body').on('click', '.item:not(.active)', function() {
            // $('#app').addClass('noscroll');

            _originalY = parseInt($(this).css('top'));

            var _timeFactor = (_originalY - $('#app').scrollTop()) / 667 + 1; // is a responsive enviroment window's height should not be fixed
            _transitionDurations['0.1'] = 0.1 * _timeFactor;
            _transitionDurations['0.225'] = 0.225 * _timeFactor;
            _transitionDurations['0.3'] = 0.3 * _timeFactor;

            var _classes = 'active';

            var top = _originalY;

            if ($('#app').scrollTop() > 100) {
                top = $('#app').scrollTop() - 100;
            }

            var _css = {
                'top': $('#app').scrollTop(),
                'transition': 'top ' + _transitionDurations['0.225'] + 's, width ' + _transitionDurations['0.3'] + 's, height ' + _transitionDurations['0.3'] + 's',
                'padding-bottom': '50px'
            };

            if ($('#app').scrollTop() < _originalY) {
                _classes += ' bounce';
                _css['animation-duration'] = _transitionDurations['0.3'] + 's';
            }

            $(this).addClass(_classes);
            $(this).css(_css);
            $(this).find('.item-content').css('transition-delay', _transitionDurations['0.3'] + 's');
        })

        // collapse item
        $('body').on('click', '.item .close', function() {
            $(this).siblings('.item-content').removeAttr('style');

            var _css = {
                'top': _originalY,
                'transition': 'top ' + _transitionDurations['0.225'] + 's, width ' + _transitionDurations['0.1'] + 's, height ' + _transitionDurations['0.1'] + 's',
                'animation-duration': _transitionDurations['0.225'] + 's',
            };
            $('.item.active').removeClass('active').addClass('collapsing').css(_css);

            // $('#app').removeClass('noscroll');

            setTimeout(function() {
                $('.item.collapsing').removeClass('collapsing bounce').css({
                    'transition': '',
                    'animation-duration': '',
                });
            }, _transitionDurations['0.3'] * 1000);
        })

        // touchstart mousedown animation
        $('body').on('touchstart mousedown', '.item:not(.active)', function() {
            $(this).addClass('start');
        });

        $('body').on('touchend mouseup', '.item:not(.active)', function() {
            $(this).removeClass('start');
        });

    })

})(jQuery);

PS.Phone.Functions.LoadHelpList = function(list) {
    $(".help-app .app-container").html("");

    var heplist = JSON.parse(list);

    $.each(heplist, function(i, help) {
        if (help.emergency) {
            var html = `<div class="item" style="${help.style}">
                <div class="close">×</div>
                <div class="item-title">
                    <h4>${help.name}</h4>
                    <h3>${help.description}</h3>
                </div>
                <div class="item-image">
                    <img src="${help.image}">
                </div>
                <div class="item-content">
                    <p><strong>${help.text}</strong></p>

                    <form id="${i}">
                        <textarea name="message" rows="1" class="question" id="msg" required="" autocomplete="off"></textarea>
                        <label for="msg"><span>${help.message}</span></label>
                        <input class="send-help" type="submit" value="Fazer chamado" style=" border-radius: 20px;" data-app="${i}">
                    </form>
                </div>
            </div>`;
        } else {
            var html = `<div class="item" style="${help.style}">
                <div class="close">
                    ×
                </div>
                <div class="item-title absolute">
                    <h4>${help.name}</h4>
                    <h3>${help.description}</h3>
                </div>
                <div class="item-image">
                    <img src="${help.image}">
                </div>
                <div class="item-content">
                    <p><strong>${help.text}</strong></p>

                    <form id="${i}">
                        <textarea name="message" rows="1" class="question" id="msg" required="" autocomplete="off"></textarea>
                        <label for="msg"><span>${help.message}</span></label>
                        <input class="send-help" type="submit" value="Fazer chamado" style=" border-radius: 20px;" data-app="${i}">
                    </form>
                </div>
            </div>`;
        }

        $(".help-app .app-container").append(html);
    });
}

$(document).on('click', '.send-help', function(e) {
    var app = $(this).attr('data-app');

    var message = $("#" + app + " #msg").val();

    $.post('http://ps_phone/SendHelp', JSON.stringify({
        app: app,
        message: message
    }), function(check) {});

    return false;
});