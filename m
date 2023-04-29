Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BCD193;
	Sat, 29 Apr 2023 00:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682726690; x=1714262690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5m7iicA5TdJ9z85/6x4Tz+YShtnH1DFmUfXGbYFi91s=;
  b=ipCOHHtbv+HfdLg/+xU609AQvHrJDNSQrvYM/LWfXnM15Yq4ZckVGKqT
   Fm/wjLgBKZaY7sTiyNrh8xLS30QRq+CQrtHN6Vmw3NJ4BpYhBnsu5jqj7
   dYhElci+jWWmEzGiisfctEeiQJkJel3uC5jrTRsutBBEcRSx6c8iYUja9
   enjjXJBGB7q3gOHCHeo52o1s/pxn3SPLVDZyvavEmqZMptk+tpWYuexl5
   /SLT9RKkMDqQ3KrXARrQoo9AQr6LTMFIVc7EvHo83wyskCVbWuRdh26pE
   jUFHAmAMpBmTvB8WaH8824XHA7MJ+tI/2IQZh3MFFiB6RPIpbNDo6CzmB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346657098"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="346657098"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 17:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="784430064"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="784430064"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Apr 2023 17:04:48 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psY51-0000lh-2E;
	Sat, 29 Apr 2023 00:04:47 +0000
Date: Sat, 29 Apr 2023 08:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Ahern <david@enfabrica.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dsahern:enfab-6.3 2/10] net/ipv4/tcp_offload.c:271:11: warning: use
 of bitwise '|' with boolean operands
Message-ID: <202304290757.ikOosSgq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dsahern/linux enfab-6.3
head:   a036626ebabac8cfa59cb5f2a4306b20e4006af6
commit: 58c2b79dea441adb10ca120def37057df53cd874 [2/10] skbuff: Add SKBFL_FIXED_FRAG flag and add checks in code
config: powerpc-randconfig-r006-20230428 (https://download.01.org/0day-ci/archive/20230429/202304290757.ikOosSgq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/dsahern/linux/commit/58c2b79dea441adb10ca120def37057df53cd874
        git remote add dsahern https://github.com/dsahern/linux
        git fetch --no-tags dsahern enfab-6.3
        git checkout 58c2b79dea441adb10ca120def37057df53cd874
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290757.ikOosSgq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_offload.c:271:11: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
           flush |= skb_fixed(p) | skb_fixed(skb);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                 ||
   net/ipv4/tcp_offload.c:271:11: note: cast one or both operands to int to silence this warning
   1 warning generated.


vim +271 net/ipv4/tcp_offload.c

   180	
   181	struct sk_buff *tcp_gro_receive(struct list_head *head, struct sk_buff *skb)
   182	{
   183		struct sk_buff *pp = NULL;
   184		struct sk_buff *p;
   185		struct tcphdr *th;
   186		struct tcphdr *th2;
   187		unsigned int len;
   188		unsigned int thlen;
   189		__be32 flags;
   190		unsigned int mss = 1;
   191		unsigned int hlen;
   192		unsigned int off;
   193		int flush = 1;
   194		int i;
   195	
   196		off = skb_gro_offset(skb);
   197		hlen = off + sizeof(*th);
   198		th = skb_gro_header(skb, hlen, off);
   199		if (unlikely(!th))
   200			goto out;
   201	
   202		thlen = th->doff * 4;
   203		if (thlen < sizeof(*th))
   204			goto out;
   205	
   206		hlen = off + thlen;
   207		if (skb_gro_header_hard(skb, hlen)) {
   208			th = skb_gro_header_slow(skb, hlen, off);
   209			if (unlikely(!th))
   210				goto out;
   211		}
   212	
   213		skb_gro_pull(skb, thlen);
   214	
   215		len = skb_gro_len(skb);
   216		flags = tcp_flag_word(th);
   217	
   218		list_for_each_entry(p, head, list) {
   219			if (!NAPI_GRO_CB(p)->same_flow)
   220				continue;
   221	
   222			th2 = tcp_hdr(p);
   223	
   224			if (*(u32 *)&th->source ^ *(u32 *)&th2->source) {
   225				NAPI_GRO_CB(p)->same_flow = 0;
   226				continue;
   227			}
   228	
   229			goto found;
   230		}
   231		p = NULL;
   232		goto out_check_final;
   233	
   234	found:
   235		/* Include the IP ID check below from the inner most IP hdr */
   236		flush = NAPI_GRO_CB(p)->flush;
   237		flush |= (__force int)(flags & TCP_FLAG_CWR);
   238		flush |= (__force int)((flags ^ tcp_flag_word(th2)) &
   239			  ~(TCP_FLAG_CWR | TCP_FLAG_FIN | TCP_FLAG_PSH));
   240		flush |= (__force int)(th->ack_seq ^ th2->ack_seq);
   241		for (i = sizeof(*th); i < thlen; i += 4)
   242			flush |= *(u32 *)((u8 *)th + i) ^
   243				 *(u32 *)((u8 *)th2 + i);
   244	
   245		/* When we receive our second frame we can made a decision on if we
   246		 * continue this flow as an atomic flow with a fixed ID or if we use
   247		 * an incrementing ID.
   248		 */
   249		if (NAPI_GRO_CB(p)->flush_id != 1 ||
   250		    NAPI_GRO_CB(p)->count != 1 ||
   251		    !NAPI_GRO_CB(p)->is_atomic)
   252			flush |= NAPI_GRO_CB(p)->flush_id;
   253		else
   254			NAPI_GRO_CB(p)->is_atomic = false;
   255	
   256		mss = skb_shinfo(p)->gso_size;
   257	
   258		/* If skb is a GRO packet, make sure its gso_size matches prior packet mss.
   259		 * If it is a single frame, do not aggregate it if its length
   260		 * is bigger than our mss.
   261		 */
   262		if (unlikely(skb_is_gso(skb)))
   263			flush |= (mss != skb_shinfo(skb)->gso_size);
   264		else
   265			flush |= (len - 1) >= mss;
   266	
   267		flush |= (ntohl(th2->seq) + skb_gro_len(p)) ^ ntohl(th->seq);
   268	#ifdef CONFIG_TLS_DEVICE
   269		flush |= p->decrypted ^ skb->decrypted;
   270	#endif
 > 271		flush |= skb_fixed(p) | skb_fixed(skb);
   272	
   273		if (flush || skb_gro_receive(p, skb)) {
   274			mss = 1;
   275			goto out_check_final;
   276		}
   277	
   278		tcp_flag_word(th2) |= flags & (TCP_FLAG_FIN | TCP_FLAG_PSH);
   279	
   280	out_check_final:
   281		/* Force a flush if last segment is smaller than mss. */
   282		if (unlikely(skb_is_gso(skb)))
   283			flush = len != NAPI_GRO_CB(skb)->count * skb_shinfo(skb)->gso_size;
   284		else
   285			flush = len < mss;
   286	
   287		flush |= (__force int)(flags & (TCP_FLAG_URG | TCP_FLAG_PSH |
   288						TCP_FLAG_RST | TCP_FLAG_SYN |
   289						TCP_FLAG_FIN));
   290	
   291		if (p && (!NAPI_GRO_CB(skb)->same_flow || flush))
   292			pp = p;
   293	
   294	out:
   295		NAPI_GRO_CB(skb)->flush |= (flush != 0);
   296	
   297		return pp;
   298	}
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
