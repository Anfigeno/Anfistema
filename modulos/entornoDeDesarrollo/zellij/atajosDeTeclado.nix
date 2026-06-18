# kdl
''
  keybinds clear-defaults=true {
  	scroll {
  		bind "Ctrl c" {
  			ScrollToBottom; SwitchToMode "Normal"
  		}
  		bind "Ctrl d" {
  			PageScrollDown; SwitchToMode "Scroll"
  		}
  		bind "Ctrl u" {
  			PageScrollUp; SwitchToMode "Scroll"
  		}
  		bind "Esc" {
  			SwitchToMode "Normal"
  		}
  		bind "e" {
  			EditScrollback; SwitchToMode "Normal"
  		}
  		bind "j" {
  			ScrollDown; SwitchToMode "Scroll"
  		}
  		bind "k" {
  			ScrollUp; SwitchToMode "Scroll"
  		}
  	}
  	shared_except "tmux" "locked" {
  		bind "Alt w" {
  			SwitchToMode "Tmux"
  		}
  	}
  	tmux {
  		bind "," {
  			SwitchToMode "RenameTab"
  		}
  		bind "Esc" {
  			Write 2; SwitchToMode "Normal"
  		}
  		bind "[" {
  			SwitchToMode "Scroll"
  		}
  		bind "t" {
  			NewTab; SwitchToMode "Normal"
  		}
  		bind "d" {
  			Detach; SwitchToMode "Normal"
  		}
  		bind "f" {
  			ToggleFloatingPanes; SwitchToMode "Normal"
  		}
  		bind "h" {
  			MoveFocus "Left"
  			SwitchToMode "Normal"
  		}
  		bind "j" {
  			MoveFocus "Down"
  			SwitchToMode "Normal"
  		}
  		bind "k" {
  			MoveFocus "Up"
  			SwitchToMode "Normal"
  		}
  		bind "l" {
  			MoveFocus "Right"
  			SwitchToMode "Normal"
  		}
  		bind "n" {
  			GoToNextTab; SwitchToMode "Normal"
  		}
  		bind "p" {
  			GoToPreviousTab; SwitchToMode "Normal"
  		}
  		bind "s" {
  			NewPane "Down"
  			SwitchToMode "Normal"
  		}
  		bind "v" {
  			NewPane "Right"
  			SwitchToMode "Normal"
  		}
  		bind "w" {
  			LaunchOrFocusPlugin "session-manager" {
  				floating true
  				move_to_focused_tab true
  			}
  			SwitchToMode "Normal"
  		}
  		bind "c" {
  			CloseFocus; SwitchToMode "Normal"
  		}
  		bind "z" {
  			ToggleFocusFullscreen; SwitchToMode "Normal"
  		}
  	}
  }
''
