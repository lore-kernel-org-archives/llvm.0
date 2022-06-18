Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5907B
	for <llvm@lists.linux.dev>; Sat, 18 Jun 2022 00:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655513883; x=1687049883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+KN9gez3gxQswyoKt22AOTbDHVUxQmSEnDp+s0L0DBA=;
  b=VedVy1+TTva69w4ZOcNF8ztKBdokv9R0blRC1uiXP2aU7/B2hZxgUf0o
   jrwu6ulW1b+PKDH7P6BHNvviZ5eMXDsoP6DjuBkPxvFtmbajCzqgRkA5C
   b4+XsN+W5vDN27S/Bd1kYiMt/fkzb6Jf0O8c2991hpLZ9OAE4kzzr8t1n
   W8DqObS8N7epva1ALjrQfIHmgNMVImocagrhhG/We40tIeNc+k7Q/ZZWh
   dXIWQE8FwIBJkljrdq8ocDKR1Ag0wf3yxHtTPpXz7b4TE71Jj6d2O9V0C
   aSKIPJdtbQ1VTIiOKlOFZXd24yIGNjy2EoDvQ04G/GTogysyBGyknBcST
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341299700"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="341299700"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 17:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="619440733"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jun 2022 17:58:00 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2Mmm-000Ptx-3y;
	Sat, 18 Jun 2022 00:58:00 +0000
Date: Sat, 18 Jun 2022 08:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <eric.dumazet@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	netdev <netdev@vger.kernel.org>, Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next 1/2] raw: use more conventional iterators
Message-ID: <202206180819.fn7MTnwO-lkp@intel.com>
References: <20220617201045.2659460-2-eric.dumazet@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617201045.2659460-2-eric.dumazet@gmail.com>

Hi Eric,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/raw-RCU-conversion/20220618-041145
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 4875d94c69d5a4836c4225b51429d277c297aae8
config: hexagon-randconfig-r045-20220617 (https://download.01.org/0day-ci/archive/20220618/202206180819.fn7MTnwO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6862039427583c2b85bdda50f45ece5b79ed5fa5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eric-Dumazet/raw-RCU-conversion/20220618-041145
        git checkout 6862039427583c2b85bdda50f45ece5b79ed5fa5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv4/raw.c:167:6: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           int sdif = inet_sdif(skb);
               ^
   net/ipv4/raw.c:268:6: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           int dif = skb->dev->ifindex;
               ^
   2 warnings generated.


vim +167 net/ipv4/raw.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  157  
^1da177e4c3f41 Linus Torvalds   2005-04-16  158  /* IP input processing comes here for RAW socket delivery.
^1da177e4c3f41 Linus Torvalds   2005-04-16  159   * Caller owns SKB, so we must make clones.
^1da177e4c3f41 Linus Torvalds   2005-04-16  160   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  161   * RFC 1122: SHOULD pass TOS value up to the transport layer.
^1da177e4c3f41 Linus Torvalds   2005-04-16  162   * -> It does. And not only TOS, but all IP header.
^1da177e4c3f41 Linus Torvalds   2005-04-16  163   */
b71d1d426d263b Eric Dumazet     2011-04-22  164  static int raw_v4_input(struct sk_buff *skb, const struct iphdr *iph, int hash)
^1da177e4c3f41 Linus Torvalds   2005-04-16  165  {
6862039427583c Eric Dumazet     2022-06-17  166  	struct net *net = dev_net(skb->dev);;
67359930e185c4 David Ahern      2017-08-07 @167  	int sdif = inet_sdif(skb);
19e4e768064a87 David Ahern      2019-05-07  168  	int dif = inet_iif(skb);
^1da177e4c3f41 Linus Torvalds   2005-04-16  169  	struct hlist_head *head;
d13964f4490157 Patrick McHardy  2005-08-09  170  	int delivered = 0;
6862039427583c Eric Dumazet     2022-06-17  171  	struct sock *sk;
^1da177e4c3f41 Linus Torvalds   2005-04-16  172  
b673e4dfc8f29e Pavel Emelyanov  2007-11-19  173  	head = &raw_v4_hashinfo.ht[hash];
^1da177e4c3f41 Linus Torvalds   2005-04-16  174  	if (hlist_empty(head))
6862039427583c Eric Dumazet     2022-06-17  175  		return 0;
6862039427583c Eric Dumazet     2022-06-17  176  	read_lock(&raw_v4_hashinfo.lock);
6862039427583c Eric Dumazet     2022-06-17  177  	sk_for_each(sk, head) {
6862039427583c Eric Dumazet     2022-06-17  178  		if (!raw_v4_match(net, sk, iph->protocol,
6862039427583c Eric Dumazet     2022-06-17  179  				  iph->saddr, iph->daddr, dif, sdif))
6862039427583c Eric Dumazet     2022-06-17  180  			continue;
d13964f4490157 Patrick McHardy  2005-08-09  181  		delivered = 1;
f5220d63991f3f Quentin Armitage 2014-07-23  182  		if ((iph->protocol != IPPROTO_ICMP || !icmp_filter(sk, skb)) &&
f5220d63991f3f Quentin Armitage 2014-07-23  183  		    ip_mc_sf_allow(sk, iph->daddr, iph->saddr,
60d9b031412435 David Ahern      2017-08-07  184  				   skb->dev->ifindex, sdif)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  185  			struct sk_buff *clone = skb_clone(skb, GFP_ATOMIC);
^1da177e4c3f41 Linus Torvalds   2005-04-16  186  
^1da177e4c3f41 Linus Torvalds   2005-04-16  187  			/* Not releasing hash table! */
^1da177e4c3f41 Linus Torvalds   2005-04-16  188  			if (clone)
^1da177e4c3f41 Linus Torvalds   2005-04-16  189  				raw_rcv(sk, clone);
^1da177e4c3f41 Linus Torvalds   2005-04-16  190  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  191  	}
b673e4dfc8f29e Pavel Emelyanov  2007-11-19  192  	read_unlock(&raw_v4_hashinfo.lock);
d13964f4490157 Patrick McHardy  2005-08-09  193  	return delivered;
^1da177e4c3f41 Linus Torvalds   2005-04-16  194  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  195  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
