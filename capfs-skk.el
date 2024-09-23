(defun test-capf ()
  (list
   (save-excursion
     (backward-word)
     (point))
   (point)
   (lambda (str pred action)
     (message "CALLED %S %S" str action)
     (setq str "") ;; Ignore prefix!
     (complete-with-action action '("a1" "a2" "a3" "a4"
                                    "b1" "b2" "b3" "b4"
                                    "c1" "c2" "c3" "c4")
                           str pred))))

(setq completion-at-point-functions #'test-capf )  

 

(defun experiment-all-completions (str table pred _point)
  ;; (let* ;; ( (parts '(""))
  ;;        ((parts (split-string str nil t))
  ;;
  ;;(completion-regexp-list (mapcar #'regexp-quote (cdr parts)))
  ;;        (completions (all-completions (or (car parts) "") table pred)))
  ;;   (and completions (nconc completions 0)))
  table)  


(experiment-all-completions
 "ddd"
 '(
   "amc"
   "amb"
   "ahu"
   ) nil nil)

(all-completions
 "a"
 '(
   "amc"
   "amb"
   "ahu"
   ) nil nil)


(defun experiment-try-completion (str table pred _point)
  ;; (let* ((parts (split-string str nil t))
  ;;        (completion-regexp-list (mapcar #'regexp-quote (cdr parts)))
  ;;        (completion (try-completion (or (car parts) "") table pred)))
  ;;   (if (stringp completion)
  ;;       (cons completion (length completion))
  ;;     completion)))
  ;; (car (split-string str nil t))
  t
)

  
(add-to-list 'completion-styles-alist
             '(experiment
               experiment-try-completion experiment-all-completions
               "Experimental completion."))




  

;;;###autoload
(defun test-capf (&optional interactive)
  "Complete with yasnippet at point.
If INTERACTIVE is nil the function acts like a Capf."
  (interactive (list t))
      (let* ((type-beg (ac-skk-prefix))
            (type-end (point))
            (type (buffer-substring-no-properties type-beg type-end))
            (capf (list "ま" "まえ" "まえだ"))
            ;; (capf (skk-capf-candidates type))
            )
       (when capf
          capf))
    (when t
      `(,(ac-skk-prefix) ,(point)
         ;; ,(ac-skk-candidates)
        ;; ,(skk-pre-henkan-make-candidates)
            ,(list "ま" "まえ" "まえだ" "し" "しかく" "しか")
            )))

     

   

   

  



           

  
  
 
  
