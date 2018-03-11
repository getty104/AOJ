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
class UnionFindTree

  class ParArray < Hash
    def [] key
      self[key] = key if super(key).nil?
      super(key)
    end
  end

  class SizeArray < Hash
    def [] key
      self[key] = 1 if super(key).nil?
      super(key)
    end
  end

  def initialize()
    @par = ParArray.new
    @size = SizeArray.new
  end

  private

  def find(x)
    return x if x == @par[x]
    return @par[x] = find(@par[x])
  end

  public

  def unite(x, y)
    x = find(x)
    y = find(y)

    return nil if x == y
    x, y = y, x if @size[x] < @size[y]

    @par[y] = x
    @size[x] += @size[y]
  end

  def same?(x, y)
    return find(x) == find(y)
  end

  def size(x)
    return @size[find(x)]
  end

end

def cost l1,l2
  len = sqrt((l1[0]-l2[0])**2+(l1[1]-l2[1])**2+(l1[2]-l2[2])**2)-l1[3]-l2[3]
  if len <= 0
    return 0
  else
    return len
  end
end

ans = []
loop{
  n = gif
  break if n == 0
  l = []
  c = []
  un = UnionFindTree.new
  rep n do |i|
   ll = gf
   rep l.size do |j|
    c << [cost(l[j],ll),[i,j]]
  end
  l << ll
end
c.sort!
sum = 0
c.each do |cc|
  unless un.same? cc[1][0],cc[1][1]
    sum += cc[0]
    un.unite cc[1][0],cc[1][1]
  end
end
ans <<  format("%.3f", sum)
}

puts ans