#!/usr/bin/env bash

function get_tmux_option() {
	local option=$1
	local default_value=$2
	local -r option_value=$(tmux show-option -gqv "$option")

	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

function generate_left_side_string() {

	session_icon=$(get_tmux_option "@theme_session_icon" "⋅")
	# local separator_end="#[bg=${PALLETE[bg_highlight]}]#{?client_prefix,#[fg=${PALLETE[yellow]}],#[fg=${PALLETE[green]}]}${left_separator:?}#[none]"
	local separator_end="#[bg=${PALLETE[bg_highlight]}]#{?client_prefix,#[fg=${PALLETE[yellow]}],#[fg=${PALLETE[green]}]}${left_separator:?}#[none]"

	echo "#[fg=${PALLETE[fg_gutter]},bold]#{?client_prefix,#[bg=${PALLETE[yellow]}],#[bg=${PALLETE[green]}]} ${session_icon} #S ${separator_end}"
}

function generate_inactive_window_string() {
	# local separator_start="#[bg=${PALLETE['dark5']},fg=${PALLETE['bg_highlight']}]${left_separator:?}#[none]"
	local separator_start="#[bg=${PALLETE['blue7']},fg=${PALLETE['bg_highlight']}]${left_separator:?}#[none]"
	local separator_internal="#[bg=${PALLETE['dark3']},fg=${PALLETE['blue7']}]${left_separator:?}#[none]"
	local separator_end="#[bg=${PALLETE[bg_highlight]},fg=${PALLETE['dark3']}]${left_separator:?}#[none]"

	echo "${separator_start}#[fg=${PALLETE[green2]}]#I${separator_internal}#[fg=${PALLETE[white]}] #{?window_zoomed_flag, , }#W ${separator_end}"
}

function generate_active_window_string() {
	# separator_start="#[bg=${PALLETE['magenta']},fg=${PALLETE['bg_highlight']}]${left_separator:?}#[none]"
	# separator_internal="#[bg=${PALLETE['purple']},fg=${PALLETE['magenta']}]${left_separator:?}#[none]"
	# separator_end="#[bg=${PALLETE[bg_highlight]},fg=${PALLETE['purple']}]${left_separator:?}#[none]"
	separator_start="#[bg=${PALLETE['orange']},fg=${PALLETE['bg_highlight']}]${left_separator:?}#[none]"
	separator_internal="#[bg=${PALLETE['blue']},fg=${PALLETE['orange']}]${left_separator:?}#[none]"
	separator_end="#[bg=${PALLETE[bg_highlight]},fg=${PALLETE['blue']}]${left_separator:?}#[none]"

	echo "${separator_start}#[fg=${PALLETE[terminal_black]}]#I${separator_internal}#[fg=${PALLETE[white]}] #{?window_zoomed_flag, , }#W ${separator_end}#[none]"
}
