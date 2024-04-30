{
  services.kanata = {
    enable = true;
    keyboards.kbd.config = ''
      (defsrc
        esc              i
        caps        j    k    l
      )
      
      (deflayer default
        esc              i
        @caps       j    k    l
      ) 
      
      (deflayer nav
        grv              up
        _           left down rght
      )
      
      (defalias
        caps (tap-hold 200 200 (caps-word 2000) (layer-while-held nav))
      )
    '';
  };
}
