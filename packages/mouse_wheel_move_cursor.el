(defun cursor-down-some-lines ()
  "Move cursor down 10 logical lines"
  (interactive)
  (forward-line 1)
  )

(defun cursor-up-some-lines ()
  "Move cursor up 10 logical lines"
  (interactive)
  (forward-line -1))

(when (string-equal system-type "gnu/linux")
  (progn
    (global-set-key (kbd "<mouse-4>") 'cursor-up-some-lines) ; wheel up
    (global-set-key (kbd "<mouse-5>") 'cursor-down-some-lines) ; wheel down
    )
  )
