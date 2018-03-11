#include <bits/stdc++.h>
using namespace std;

typedef long long ll;
typedef unsigned long long ull;
typedef pair<ll,ll> P;
typedef pair<ll,P>  PP;
typedef vector<ll> Vector;
typedef vector<Vector> DVector;
typedef priority_queue<P, vector<P>, greater<P>> PQueue;

#define fi          first
#define se          second
#define sfi         se.fi
#define sse         se.se
#define pb          push_back
#define INF         INT_MAX
#define MOD         1000000007
#define bcnt        __builtin_popcount
#define all(x)      (x).begin(),(x).end()
#define uni(x)      x.erase(unique(all(x)),x.end())
#define ub(x,y)     (upper_bound(all(x),y)-x.begin())
#define lb(x,y)     (lower_bound(all(x),y)-x.begin())
#define rep(i,n)    repl(i,0,n-1)
#define usort(x)    sort(all(x))
#define dsort(x)    sort(all(x),greater<ll>())
#define mkp(x,y)    make_pair(x,y)
#define mmax(x,y)   (x>y?x:y)
#define mmin(x,y)   (x<y?x:y)
#define maxch(x,y)  x=mmax(x,y)
#define minch(x,y)  x=mmin(x,y)
#define exist(x,y)  (find(all(x),y)!=x.end())
#define each(itr,v) for(auto itr:v)
#define repl(i,a,b) for(ll i=(ll)(a);i<=(ll)(b);i++)
vector<vector<P>> costs;
ll n;
Vector mincost;
void djk(ll start){
  PQueue pq;
  mincost.resize(n,INF);
  mincost[start] = 0;
  pq.push({0,start});
  while(pq.size()){
    P state = pq.top();pq.pop();
    if(mincost[state.se] < state.fi)continue;
    each(itr,costs[state.se])if(mincost[itr.fi] > mincost[state.se] + itr.se){
      mincost[itr.fi] = mincost[state.se] + itr.se;
      pq.push({mincost[itr.fi],itr.fi});
    }
  }
}

int main(){
  cin.sync_with_stdio(false);
  cin >> n;
  costs.resize(n);
  rep(i,n){
    ll u,k;
    cin >> u >> k;
    rep(j,k){
      ll v,c;
      cin >> v >> c;
      costs[u].pb({v,c});
    }
  }
  djk(0);
  rep(i,n)cout << i << " " << mincost[i] << endl;
}
