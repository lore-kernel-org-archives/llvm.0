Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A95ECF
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 12:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655815355; x=1687351355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a3ITVFA7pxBXJGXl0Jy4pUo5eTmtVLr6fUn8i9W9U4M=;
  b=e7/k1ueXPIscA1FlCn0xBP72nVXEYOgOXWEk9zUIbxxIh8FJkhwTVarg
   tg5sl6/Ga6dqjdCv970PUtqWWSG5YrXoj7x+TfnwXy7tVAiQwvE52i3wq
   98EHGxUVImiRweyC4946u06qmBfvKEpQxpSP4OtySqD3wYGqchcjHxbH4
   NaRsCqQZarcrWT6Tg1H58VkIm5Q4+C2D8hKsJtb08/5QQq/vTKa05YhNP
   dOO3mv8KmB7+c9hPnD1y+11rU7/v2linXQG5zzCkDBLc8M4SIbtSUemZo
   3MwyzZjabEcHImjRRaV0xGJ/GWI/hr4Ic6y1aHFdgT0ljS6gGi4hIVi0E
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="341791843"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="341791843"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 05:42:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="676983477"
Received: from lkp-server02.sh.intel.com (HELO afd2e3565656) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2022 05:42:33 -0700
Received: from kbuild by afd2e3565656 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3dDE-00005n-Q8;
	Tue, 21 Jun 2022 12:42:32 +0000
Date: Tue, 21 Jun 2022 20:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3790/4834] net/ipv6/raw.c:338:33: warning:
 variable 'daddr' set but not used
Message-ID: <202206212033.3lgl72Fw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   34d1d36073ea4d4c532e8c8345627a9702be799e
commit: ba44f8182ec299c5d1c8a72fc0fde4ec127b5a6d [3790/4834] raw: use more conventional iterators
config: i386-randconfig-a012-20220620 (https://download.01.org/0day-ci/archive/20220621/202206212033.3lgl72Fw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ba44f8182ec299c5d1c8a72fc0fde4ec127b5a6d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ba44f8182ec299c5d1c8a72fc0fde4ec127b5a6d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/ipv6/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv6/raw.c:338:33: warning: variable 'daddr' set but not used [-Wunused-but-set-variable]
           const struct in6_addr *saddr, *daddr;
                                          ^
>> net/ipv6/raw.c:338:25: warning: variable 'saddr' set but not used [-Wunused-but-set-variable]
           const struct in6_addr *saddr, *daddr;
                                  ^
   2 warnings generated.


vim +/daddr +338 net/ipv6/raw.c

   334	
   335	void raw6_icmp_error(struct sk_buff *skb, int nexthdr,
   336			u8 type, u8 code, int inner_offset, __be32 info)
   337	{
 > 338		const struct in6_addr *saddr, *daddr;
   339		struct net *net = dev_net(skb->dev);
   340		struct hlist_head *head;
   341		struct sock *sk;
   342		int hash;
   343	
   344		hash = nexthdr & (RAW_HTABLE_SIZE - 1);
   345		head = &raw_v6_hashinfo.ht[hash];
   346		read_lock(&raw_v6_hashinfo.lock);
   347		sk_for_each(sk, head) {
   348			/* Note: ipv6_hdr(skb) != skb->data */
   349			const struct ipv6hdr *ip6h = (const struct ipv6hdr *)skb->data;
   350			saddr = &ip6h->saddr;
   351			daddr = &ip6h->daddr;
   352	
   353			if (!raw_v6_match(net, sk, nexthdr, &ip6h->saddr, &ip6h->daddr,
   354					  inet6_iif(skb), inet6_iif(skb)))
   355				continue;
   356			rawv6_err(sk, skb, NULL, type, code, inner_offset, info);
   357		}
   358		read_unlock(&raw_v6_hashinfo.lock);
   359	}
   360	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
