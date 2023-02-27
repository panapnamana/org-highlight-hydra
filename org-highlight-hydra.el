;;Working insertion of symbols function
;;------------------------------------------------------------------------------
(defun surround-region-with-arg-symbol (emph-symbol)
  "Places emph-symbol at the beginning and the end of the marked region."
  (when (not (region-active-p));; see if there is a marked region at all
    (message "region-active-p is nil. This means that no region is active."))
  (if (region-active-p);; when there is a marked region place the symbols
      (progn ;;needed because if is super weird in lisp. It is (if CONDITION STATEMENT ELSE). The progn wraps the code inside so the if regards it as one STATEMENT
	(when (> (point) (mark));;meaning: The Region was created from left to right and point is now at the right border of region
	  (when (char-equal (char-before (region-end)) 32);; when the right side of the region ends on a  whitespace the region is made smaller to the next left word in order for org-emphasize to work (does not work with whitespaces at the edges!)
	    (backward-to-word 1))
	  (exchange-point-and-mark);; flips point and mark and therefore moves point to the left border of the region in order to use forward-to-word to adjust the region
	  (when (char-equal (char-after (region-beginning)) 32);;when the left side of the region has a whitespace at the border the point is moved to the next word
	    (forward-to-word 1))	
	  (goto-char (region-beginning));;move to left side of the region
          (insert emph-symbol);;insert symbol
          (goto-char (region-end));;move to right side of the region
          (insert emph-symbol));; insert symbol
        (when (< (point) (mark)) ;;meaning: The Region was created from right to left and point is now at the left border of region (from here on everything is the same but for the reverse case
    	  (when (char-equal (char-after (region-beginning)) 32)
	    (forward-to-word 1))
          (exchange-point-and-mark)
  	  (when (char-equal (char-before (region-end)) 32)
	    (backward-to-word 1))
	  (exchange-point-and-mark)
	  (goto-char (region-beginning))
          (insert emph-symbol)
          (goto-char (region-end))
          (insert emph-symbol)))
    nil))


(setq my-emph-symbol-plist '(important "¡" question "¿" problem "↯" comment "፧" bold "*" italic "/" verbatim "=" strikethrough "+" underline "_" code "~"))


(defhydra hydra-org-highlight-menu (:color blue)
  "
Emphasize^     ^Highlight
------------------------------
_b_: bold      _m_: important
_i_: italic    _q_: question
_u_: underline _c_: comment
_v_: verbatim  _p_: problem
_s_: strike    ^^
_C_: code      ^^
"
  ("b" (surround-region-with-arg-symbol (plist-get my-emph-symbol-plist 'bold)))
  ("i" (surround-region-with-arg-symbol (plist-get my-emph-symbol-plist 'italic)))
  ("u" (surround-region-with-arg-symbol (plist-get my-emph-symbol-plist 'underline)))
  ("v" (surround-region-with-arg-symbol (plist-get my-emph-symbol-plist 'verbatim)))
  ("s" (surround-region-with-arg-symbol (plist-get my-emph-symbol-plist 'strikethrough)))
  ("C" (surround-region-with-arg-symbol (plist-get my-emph-symbol-plist 'code)))
  ("m" (surround-region-with-arg-symbol (plist-get my-emph-symbol-plist 'important)))  
  ("q" (surround-region-with-arg-symbol (plist-get my-emph-symbol-plist 'question)))
  ("p" (surround-region-with-arg-symbol (plist-get my-emph-symbol-plist 'problem)))
  ("c" (surround-region-with-arg-symbol (plist-get my-emph-symbol-plist 'comment))))

(define-key org-mode-map (kbd "C-c h") 'hydra-org-highlight-menu/body)
  

;;TODO when space is at the border left or right of region, then insert at next non-space char

;;______________________________________________________________________________


