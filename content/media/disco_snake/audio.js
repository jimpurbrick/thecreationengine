var audiochannels = (function () {

    var channelCount, audiochannels, i;
    channelCount = 8;
    audiochannels = [];

    for (i = 0; i < channelCount; i += 1) {

        // prepare the channels
        audiochannels[i] = {};
        audiochannels[i].channel = new Audio();
        audiochannels[i].finished = -1; // expected end time
    }                  
    return audiochannels;
}());

// HACK: jim: processing.js doesn't like this in a namespace...
function playSample(sample, vol) {
    
    var i, now, sourceAudio, endTime, duration;

    now = new Date();
    sourceAudio = document.getElementById(sample);
	if(sourceAudio.readyState < sourceAudio.HAVE_CURRENT_DATA) { 
		return;
	}
    duration = sourceAudio.duration;
    if(isNaN(duration)) {
        duration = 3.0; // HACK: jim: when duration not known...
    }
    endTime = now.getTime() + duration * 1000;

    for (i = 0; i < audiochannels.length; i += 1) {

        if (audiochannels[i].finished < now.getTime()) {

            audiochannels[i].finished = endTime;
            audiochannels[i].channel.src = sourceAudio.currentSrc;
            audiochannels[i].channel.load();
            audiochannels[i].channel.volume = vol / 100.0;
            audiochannels[i].channel.play();
            break;
        }
    }
}