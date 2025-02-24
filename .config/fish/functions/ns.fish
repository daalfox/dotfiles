function ns --wraps='eval (ssh-agent -c) && niri --session' --wraps='eval (ssh-agent -c) && niri-session' --wraps='eval (ssh-agent -c) && niri' --description 'alias ns=eval (ssh-agent -c) && niri-session'
  eval (ssh-agent -c) && niri-session $argv
        
end
