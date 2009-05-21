(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
					   (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key "\C-cm" 'fullscreen)

;; Color
(if window-system (progn
					(set-background-color "Black")
					(set-foreground-color "LightGray")
					(set-cursor-color "Gray")
					(set-frame-parameter nil 'alpha 80)
					))

;; Macのキーバインドを使う。optionをメタキーにする。
(mac-key-mode 1)
(setq mac-option-modifier 'meta)

;; タブキー
(setq default-tab-width 4)
(setq indent-line-function 'indent-relative-maybe)
     
;; シフト + 矢印で範囲選択
(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)
      
;; 行数を表示
(setq line-number-mode t)
        
;; ビープ音を消す
(setq visible-bell t)
(setq ring-bell-function 'ignore)
         
;; スタートアップページを表示しない
(setq inhibit-startup-message t)
          
;; 対応する括弧を光らせる。
(show-paren-mode 1)
           
;; 編集行のハイライト
(global-hl-line-mode)
            
;; C-hをBSに割当
(global-set-key "\C-h" 'delete-backward-char)

(setq load-path (cons (expand-file-name "~/elisp") load-path))
(autoload 'sense-region-on "sense-region.el"
          "System to toggle region and rectangle." t nil)

;; ミニバッファ履歴リストの最大長：tなら無限
(setq history-length t)
;; session.el
;;   kill-ringやミニバッファで過去に開いたファイルなどの履歴を保存する
(when (require 'session nil t)
  (setq session-initialize '(de-saveplace session keys menus places)
        session-globals-include '((kill-ring 50)
                                  (session-file-alist 500 t)
                                  (file-name-history 10000)))
  (add-hook 'after-init-hook 'session-initialize)
  ;; 前回閉じたときの位置にカーソルを復帰
  (setq session-undo-check -1))
;; minibuf-isearch
;;   minibufでisearchを使えるようにする
(require 'minibuf-isearch nil t)