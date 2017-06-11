require 'prime'
require 'set'
require 'tsort'
include Math
def max(a,b);              a > b ? a : b                              end
def min(a,b);              a < b ?  a : b                             end
def swap(a,b);             a, b = b, a                                end
def gif;                   gets.to_i                                  end
def gff;                   gets.to_f                                  end
def gsf;                   gets.chomp                                 end
def gi;                    gets.split.map(&:to_i)                     end
def gf;                    gets.split.map(&:to_f)                     end
def gs;                    gets.chomp.split.map(&:to_s)               end
def gc;                    gets.chomp.split('')                       end
def pr(num);               num.prime_division                         end
def digit(num);            num.to_s.length                            end
def array(s,ini=nil);      Array.new(s){ini}                          end
def darray(s1,s2,ini=nil); Array.new(s1){Array.new(s2){ini}}          end
def rep(num);              num.times{|i|yield(i)}                     end
def repl(st,en,n=1);       st.step(en,n){|i|yield(i)}                 end


ans = []
loop {
  n = gif
  break if n == 0
  st = []
  en = []
  rep n do
    s,e = gs
    stt = s.split(':').map(&:to_i)
    enn = e.split(':').map(&:to_i)
    st << stt[0]*60*60 + stt[1]*60 + stt[2]
    en << enn[0]*60*60 + enn[1]*60 + enn[2]
  end
  max = 0
  st.sort!
  en.sort!
  rep n do |i|
    tmp = 0
    repl i, n-1 do |j|
      if en[i] > st[j] && en[i] <= en[j]
        tmp += 1
        max = tmp if tmp > max
      end
    end
  end
  ans << max
}

puts ans
