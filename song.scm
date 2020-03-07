(import (lamu ats test hello))
(import (lamu lib basic-notes))
(define (a hello) (values hello hello) )
(import (lamu gui))
(import (lamu music))
(gui-hello-world)

(melody "do re mi")

(helloWorld)
(hello-world)
(foo)
(pulsar)
(frame)
(kawapad)
(current-scheme)
(current-environment)

(define read-symbols (lambda (s) 
                       (call-with-input-string s
                                               (lambda (p)
                                                 (define (loop)
                                                   (let  ((d (read p)))
                                                     (if (eof-object? d)
                                                         '()
                                                         (cons d (loop)))))
                                                 (loop)))))
(read-symbols "(hello (foo bar ) (a . b)) world" )




(import (srfi 1))
(begin
 (gnu.kawa.io.PrettyWriter:lineLengthLoc:set 300)
 (iota 100)
 )

(import (lamu music))
(melody "do re mi fa")

(if #f 
    (begin
     (import (lamu notes))
     (import (lamu music))
     (import (lamu main))
     (source "./quasijazzer-band/init.scm" )
     (session-start)
     (putt (newt 'main 12))))
 

(if #f 
    (begin
     (remt  (list-tracks))
     (session-end)
     (close)))

(let ((a #f))
 (open 'hello )
 (open-input 'in )
 (open-output 'out )

 (putt (newt 'main 2 ))
 (list-tracks)
 (list-input)
 (putt (rect 'hello 'in 'out ) 's 'main 0 )
 (connect  "a2j:Xkey37 [28] (capture): Xkey37 MIDI 1" "pulsar:in" )
 (set-playing))

(let ((a #f))
  (define hello (car (remt 'hello)))
  ; (define hello (remt 'hello))
  (write hello )
  (newline)
  (close)
  (define m (reat hello)))
(define m #f)
(melody "do re mi ")
(putt (newt 'hp2 (cons (n type: 'len val: 60) m)) 'p 'main )
m

(call-with-output-file "recorded01.scm" 
                       (lambda(p)
                         (display (prettify m) p)))

(call-with-input-file "recorded01.scm" 
                      (lambda(p)
                        (set! m (read p))))


(let ((make (lambda(dry-snare dry-snare2)
              (n chan: 9 port: "h2"
                 (n note: inst-SB-Ride1Brush 
                    (rep length: 1 repeat: 4 offset: 0 pattern: 0 
                         velo:    * 1/8 2/8 1/8 3/8
                         ; pos:     + 5/384  0 
                          )
                    
                    (n enab: #f
                       (rep length: 1 repeat: 2 offset: (+ 5/12 0/384 ) pattern:   0 velo:    * 0.5 0.7 ))
                    )
                 (n note: (+ inst-Snare-Dry (* 5 (random )) )  enab: #f
                    (rep length: 1 repeat: 4 offset: 1/384 pattern: 
                         (n
                          (n type: 'note pos: 0/3 velo: 2/12 )
                          (n type: 'note pos: 1/3 velo: 2/12 )
                          (n type: 'note pos: 2/3 velo: 8/12 ))
                         
                         velo: * 1))
                 
                 (n note: inst-Snare-Dry enab: #t
                    (rep length: 1 repeat: 4 offset: 1/384 pattern: 
                         (n
                          (n type: 'note pos: 0/3 velo: 2/12 )
                          (n type: 'note pos: 1/3 velo: 2/12 )
                          (n type: 'note pos: 2/3 velo: (+ (random 4/12) 1/12) ))
                         
                         velo: * 1))
                 
                 (n note: inst-SB-HatBrushChk
                    (rep length: 1 repeat: 2 offset: (+ 1/4 -2/120)    pattern: 0 velo: * 2/8 3/8   ))
                 (n note: inst-Djembe2-Bass enab: #f
                    (rep length: 1 repeat: 1 offset: 1/4    pattern: 0 velo: * 2/4 ))
                 (n note: inst-Djembe1-Tone enab: #f
                    (rep length: 1 repeat: 1 offset: 3/4    pattern: 0 velo: * 2/4 )
                    (rep length: 1 repeat: 1 offset: 11/12  pattern: 0 velo: * 3/4 ))
                 )
              )))
  
  (putt (newt 'a  (make-song (list 
                                (make #f #f)
                                (make #f #f)
                                (make #f #f)
                                (make #t #f)
                                (make #f #f)
                                (make #f #f)
                                (make #f #f)
                                (make #f #t)
                              ))) 'p 'main 0)
  
  (let ((m (if #t 
               (melody "o 3 s 11/12 
                       fa  la, do' ti,  te,  te  ti'  ti 
                       do' re  ri  mi   fa   la, do'  ti, 
                       te te   re' re   ti,  ti  re'  re
                       do, do  te, te   la   ri' re,  si,
                       sol la' te' ti'  do   re  ri   mi
                       fa me,  re  si'  sol, di, do,  mi' 
                       ")
               (melody "o 3 s 11/12 
                       fa sol' le' do' di' ri' la' te, la, ti' do' 
                       ")
               )))
    (putt (newt 'ba
                (n port: "fluidsynth-bass" chan: 0 
                   pos:  (lambda (x) (+ x -5/384)  ) 
                   note: (lambda (x) (- x 12))
                   (ccons m)
                   (n  
                    note: (lambda (x) (- x 12))
                    velo: (lambda (x) (if (< (random) 0.5 ) (* x 2) 0 ) ) len: 1/128 
                    (tra! 1 (+ 1/384 -1/12) (ccons m)))
                   )
                ) 'p 'main (/ -2 120 ) ))
  )

(putt (newt 'count 
            (n port: "counter"  (make-counting-voice 4 4) ))
      'p 'main -1/12 )

(putt (newt 'count 
            (n port: "counter"  (make-counting-voice 6 1) ))
      'p 'main -1/12 )

(if #f (putt (newt 'a 
                   (make-song (list
                               'segno
                               (n port: "fluidsynth" chan: 1 
                                  (melody "do re mi fi")
                                  (n type: 'putt id: 'hello2 syty: 'i pos: 0 
                                     proc: (n port: "h2" chan: 0 (melody "do re mi")) )
                                  (n type: 'len val: 2))
                               (n port: "fluidsynth" chan: 1 
                                  (melody "do re mi fi")
                                  (n type: 'exec proc: (lambda() (display 'hello)(newline) )))
                               (song-from 'segno)
                               (n port: "fluidsynth" chan: 1 
                                  (melody "sol fi , mi , re , "))

                               (n (n type: 'remt id: 'hello   pos: 1 )
                                  (n type: 'remt id: 'hello2  pos: 1 )
                                  (n type: 'len val: 2)
                                  )
                               )))))

(putt (newt 'hello 
            (make-song (list
                        (song-reset)
                        (lambda args
                          (if (= (length args) 0)
                              (begin
                               (display 'hello)
                               (newline)
                               #f)
                              ))
                        'segno
                        (n chan: 9 port: "h2"
                           (n note: inst-Ride-Jazz
                              (rep length: 1 repeat: 4 offset: 0   pattern: 0  
                                   velo:    * 0.1 2/4 12/32 2/4 
                                   ; pos:     + 5/384  0 
                                   )
                              (rep length: 1 repeat: 2 offset: (+ 5/12 0/384 ) pattern:   0 velo:    * 0.5 0.9 )
                              )
                           (n note: inst-SB-HatBrushChk
                             (rep length: 1 repeat: 2 offset: 1/4    pattern: 0 velo: * 2/4 2/4   ))
                           (n note: inst-Djembe2-Bass enab: #f
                              (rep length: 1 repeat: 1 offset: 1/4    pattern: 0 velo: * 2/4 ))
                           (n note: inst-Djembe1-Tone
                              (rep length: 1 repeat: 1 offset: 3/4    pattern: 0 velo: * 2/4 )
                              (rep length: 1 repeat: 1 offset: 11/12  pattern: 0 velo: * 3/4 ))
                           )
                        (song-from 'segno 4)
                        (song-head)
                        ))
            ) 'serial 'main 1)

(list-tracks)


; (remt (list-tracks))
; (if #f (putt (newt 'a (n (n type: 'remt id: 'hello2  pos: 0 )))))
; (apply-track (first (gett 'main)) 'reset )



; (define a (newp "calfjackhost --client calf-reverb reverb" ))
; (define a (newp "calfjackhost --client calf-gm --load calf-gm.xml " ))

; (kilp a)

; (define a::java.lang.Process (run-process in-from: "/dev/null" out-to: "hello.txt" "zenity --info --text hello" ))
; (define aaa::java.lang.Process ((java.lang.ProcessBuilder "zenity" "--info" "--text" "hello" ):start))
; (a:is-alive)
; (kilp a)
; (aaa:destroy)
; (define h2-process (newp "hydrogen --song quasijazzer.h2song" ))

#|
(zyn fluidsynth counter h2) (#MetroTrack:ba# #MetroTrack:a#)
|#

