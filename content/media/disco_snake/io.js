sequence = window.location.hash;
sequence = sequence.replace("#", "");

function setSequence(seq)
{
    window.location.hash = seq;
}