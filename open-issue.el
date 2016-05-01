;;; open-issue.el --- Open issue in a WWW browser

;; Copyright (c) 2016 Yoichi NAKAYAMA. All rights reserved.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(defcustom open-issue-issue-regexp "\\([A-Z]+-[0-9]+\\)"
  "Issue regexp.
e.g.
\"\\\\([A-Z]+-[0-9]+\\\\)\"
\"#\\\\([0-9]+\\\\)\""
  :type 'string
  :group 'open-issue)

(defcustom open-issue-issue-url-format "https://jira.atlassian.com/browse/%s"
  "Format string for issue url.
e.g.
\"https://jira.atlassian.com/browse/%s\"
\"http://www.redmine.org/issues/%s\"
\"https://github.com/emacs-mirror/emacs/pull/%s\""
  :type 'string
  :group 'open-issue)

(defun open-issue ()
  "Open issue in a WWW browser.
Issue id is extracted from current point by `open-issue-issue-regexp'.
Prompt for input if nothing found."
  (interactive)
  (let* ((line (thing-at-point 'line))
	 (column (current-column))
	 (id (with-temp-buffer
	       (let ((case-fold-search nil)
		     (min (point-min))
		     found-id)
		 (insert-string line)
		 (goto-char (point-min))
		 (while (re-search-forward open-issue-issue-regexp nil t)
		   (when (and (<= (- (match-beginning 0) min) column)
			      (< column (- (match-end 0) min)))
		     (setq found-id (match-string 1))))
		 found-id))))
    (unless id
      (setq id (read-from-minibuffer "Issue: ")))
    (browse-url (format open-issue-issue-url-format id))))

(provide 'open-issue)

;;; open-issue.el ends here
