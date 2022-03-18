Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342DF5388
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 22:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647640920; x=1679176920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mzjsMglok38vJxdOChT3UF3b5/Ogv2X64UXDT0W6InE=;
  b=LGZLKDKQCz1PcZKjdK/3IrOohDYtU1h/13/FXgbrakONUht2djHNNn9K
   4Nn05xqwQ5EZmUVXa7guOk1LPjP6s46WubZQVHGq8Csegx1QGiD30wvlF
   z0oCOAVe8iHp71OJPbQzS9oWBGvKp9ogzaQNXo0KKVvubV+z1S3rcHt1p
   scvqmP1F9Zbt7fGwfcoI+FAQQ0PmC4wTDCNtTivHKNyWu66rpX2QpkcYC
   021CtMLw6lAhmsEsJDQxnW2lYgQsM9EWiMSKzoJIvh2BCkX2NuatQbpwD
   q0TymWQ0UbEZdrxSMMY3Fur0dCB2VrEFWxpeXSo3sTzm4vetLf4CRtVnZ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="237845174"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="237845174"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 15:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="581919035"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 18 Mar 2022 15:01:50 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVKfN-000FBl-Gr; Fri, 18 Mar 2022 22:01:49 +0000
Date: Sat, 19 Mar 2022 06:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Iurman <justin.iurman@uliege.be>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC net] Discuss seg6 potential wrong behavior
Message-ID: <202203190555.sLM83GRv-lkp@intel.com>
References: <20220318202138.37161-1-justin.iurman@uliege.be>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318202138.37161-1-justin.iurman@uliege.be>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Justin,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net/master]

url:    https://github.com/0day-ci/linux/commits/Justin-Iurman/Discuss-seg6-potential-wrong-behavior/20220319-042938
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 6bd0c76bd70447aedfeafa9e1fcc249991d6c678
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220319/202203190555.sLM83GRv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/92248dc32f87d0aae6c02a08f29376a32f57b669
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Justin-Iurman/Discuss-seg6-potential-wrong-behavior/20220319-042938
        git checkout 92248dc32f87d0aae6c02a08f29376a32f57b669
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/ipv6/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv6/exthdrs.c:394:8: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
                           int offset = (hdr->hdrlen + 1) << 3;
                               ^
   1 warning generated.


vim +394 net/ipv6/exthdrs.c

9baee83406d6a4b David Lebrun       2016-11-08  385  
1ababeba4a21f3d David Lebrun       2016-11-08  386  looped_back:
013e8167899d389 David Lebrun       2017-02-02  387  	if (hdr->segments_left == 0) {
ee90c6ba341f7f7 Julien Massonneau  2021-03-11  388  		if (hdr->nexthdr == NEXTHDR_IPV6 || hdr->nexthdr == NEXTHDR_IPV4) {
92248dc32f87d0a Justin Iurman      2022-03-18  389  			if (!accept_seg6) {
92248dc32f87d0a Justin Iurman      2022-03-18  390  				kfree_skb(skb);
92248dc32f87d0a Justin Iurman      2022-03-18  391  				return -1;
92248dc32f87d0a Justin Iurman      2022-03-18  392  			}
92248dc32f87d0a Justin Iurman      2022-03-18  393  
1ababeba4a21f3d David Lebrun       2016-11-08 @394  			int offset = (hdr->hdrlen + 1) << 3;
1ababeba4a21f3d David Lebrun       2016-11-08  395  
1ababeba4a21f3d David Lebrun       2016-11-08  396  			skb_postpull_rcsum(skb, skb_network_header(skb),
1ababeba4a21f3d David Lebrun       2016-11-08  397  					   skb_network_header_len(skb));
1ababeba4a21f3d David Lebrun       2016-11-08  398  
1ababeba4a21f3d David Lebrun       2016-11-08  399  			if (!pskb_pull(skb, offset)) {
1ababeba4a21f3d David Lebrun       2016-11-08  400  				kfree_skb(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  401  				return -1;
1ababeba4a21f3d David Lebrun       2016-11-08  402  			}
1ababeba4a21f3d David Lebrun       2016-11-08  403  			skb_postpull_rcsum(skb, skb_transport_header(skb),
1ababeba4a21f3d David Lebrun       2016-11-08  404  					   offset);
1ababeba4a21f3d David Lebrun       2016-11-08  405  
1ababeba4a21f3d David Lebrun       2016-11-08  406  			skb_reset_network_header(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  407  			skb_reset_transport_header(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  408  			skb->encapsulation = 0;
ee90c6ba341f7f7 Julien Massonneau  2021-03-11  409  			if (hdr->nexthdr == NEXTHDR_IPV4)
ee90c6ba341f7f7 Julien Massonneau  2021-03-11  410  				skb->protocol = htons(ETH_P_IP);
1ababeba4a21f3d David Lebrun       2016-11-08  411  			__skb_tunnel_rx(skb, skb->dev, net);
1ababeba4a21f3d David Lebrun       2016-11-08  412  
1ababeba4a21f3d David Lebrun       2016-11-08  413  			netif_rx(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  414  			return -1;
1ababeba4a21f3d David Lebrun       2016-11-08  415  		}
1ababeba4a21f3d David Lebrun       2016-11-08  416  
1ababeba4a21f3d David Lebrun       2016-11-08  417  		opt->srcrt = skb_network_header_len(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  418  		opt->lastopt = opt->srcrt;
1ababeba4a21f3d David Lebrun       2016-11-08  419  		skb->transport_header += (hdr->hdrlen + 1) << 3;
1ababeba4a21f3d David Lebrun       2016-11-08  420  		opt->nhoff = (&hdr->nexthdr) - skb_network_header(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  421  
1ababeba4a21f3d David Lebrun       2016-11-08  422  		return 1;
1ababeba4a21f3d David Lebrun       2016-11-08  423  	}
1ababeba4a21f3d David Lebrun       2016-11-08  424  
1ababeba4a21f3d David Lebrun       2016-11-08  425  	if (hdr->segments_left >= (hdr->hdrlen >> 1)) {
bdb7cc643fc9db8 Stephen Suryaputra 2018-04-16  426  		__IP6_INC_STATS(net, idev, IPSTATS_MIB_INHDRERRORS);
1ababeba4a21f3d David Lebrun       2016-11-08  427  		icmpv6_param_prob(skb, ICMPV6_HDR_FIELD,
1ababeba4a21f3d David Lebrun       2016-11-08  428  				  ((&hdr->segments_left) -
1ababeba4a21f3d David Lebrun       2016-11-08  429  				   skb_network_header(skb)));
92248dc32f87d0a Justin Iurman      2022-03-18  430  		return -1;
92248dc32f87d0a Justin Iurman      2022-03-18  431  	}
92248dc32f87d0a Justin Iurman      2022-03-18  432  
92248dc32f87d0a Justin Iurman      2022-03-18  433  	if (!accept_seg6) {
92248dc32f87d0a Justin Iurman      2022-03-18  434  		kfree_skb(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  435  		return -1;
1ababeba4a21f3d David Lebrun       2016-11-08  436  	}
1ababeba4a21f3d David Lebrun       2016-11-08  437  
1ababeba4a21f3d David Lebrun       2016-11-08  438  	if (skb_cloned(skb)) {
1ababeba4a21f3d David Lebrun       2016-11-08  439  		if (pskb_expand_head(skb, 0, 0, GFP_ATOMIC)) {
1ababeba4a21f3d David Lebrun       2016-11-08  440  			__IP6_INC_STATS(net, ip6_dst_idev(skb_dst(skb)),
1ababeba4a21f3d David Lebrun       2016-11-08  441  					IPSTATS_MIB_OUTDISCARDS);
1ababeba4a21f3d David Lebrun       2016-11-08  442  			kfree_skb(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  443  			return -1;
1ababeba4a21f3d David Lebrun       2016-11-08  444  		}
1ababeba4a21f3d David Lebrun       2016-11-08  445  	}
1ababeba4a21f3d David Lebrun       2016-11-08  446  
1ababeba4a21f3d David Lebrun       2016-11-08  447  	hdr = (struct ipv6_sr_hdr *)skb_transport_header(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  448  
1ababeba4a21f3d David Lebrun       2016-11-08  449  	hdr->segments_left--;
1ababeba4a21f3d David Lebrun       2016-11-08  450  	addr = hdr->segments + hdr->segments_left;
1ababeba4a21f3d David Lebrun       2016-11-08  451  
1ababeba4a21f3d David Lebrun       2016-11-08  452  	skb_push(skb, sizeof(struct ipv6hdr));
1ababeba4a21f3d David Lebrun       2016-11-08  453  
1ababeba4a21f3d David Lebrun       2016-11-08  454  	if (skb->ip_summed == CHECKSUM_COMPLETE)
1ababeba4a21f3d David Lebrun       2016-11-08  455  		seg6_update_csum(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  456  
1ababeba4a21f3d David Lebrun       2016-11-08  457  	ipv6_hdr(skb)->daddr = *addr;
1ababeba4a21f3d David Lebrun       2016-11-08  458  
1ababeba4a21f3d David Lebrun       2016-11-08  459  	skb_dst_drop(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  460  
1ababeba4a21f3d David Lebrun       2016-11-08  461  	ip6_route_input(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  462  
1ababeba4a21f3d David Lebrun       2016-11-08  463  	if (skb_dst(skb)->error) {
1ababeba4a21f3d David Lebrun       2016-11-08  464  		dst_input(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  465  		return -1;
1ababeba4a21f3d David Lebrun       2016-11-08  466  	}
1ababeba4a21f3d David Lebrun       2016-11-08  467  
1ababeba4a21f3d David Lebrun       2016-11-08  468  	if (skb_dst(skb)->dev->flags & IFF_LOOPBACK) {
1ababeba4a21f3d David Lebrun       2016-11-08  469  		if (ipv6_hdr(skb)->hop_limit <= 1) {
bdb7cc643fc9db8 Stephen Suryaputra 2018-04-16  470  			__IP6_INC_STATS(net, idev, IPSTATS_MIB_INHDRERRORS);
1ababeba4a21f3d David Lebrun       2016-11-08  471  			icmpv6_send(skb, ICMPV6_TIME_EXCEED,
1ababeba4a21f3d David Lebrun       2016-11-08  472  				    ICMPV6_EXC_HOPLIMIT, 0);
1ababeba4a21f3d David Lebrun       2016-11-08  473  			kfree_skb(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  474  			return -1;
1ababeba4a21f3d David Lebrun       2016-11-08  475  		}
1ababeba4a21f3d David Lebrun       2016-11-08  476  		ipv6_hdr(skb)->hop_limit--;
1ababeba4a21f3d David Lebrun       2016-11-08  477  
1ababeba4a21f3d David Lebrun       2016-11-08  478  		skb_pull(skb, sizeof(struct ipv6hdr));
1ababeba4a21f3d David Lebrun       2016-11-08  479  		goto looped_back;
1ababeba4a21f3d David Lebrun       2016-11-08  480  	}
1ababeba4a21f3d David Lebrun       2016-11-08  481  
1ababeba4a21f3d David Lebrun       2016-11-08  482  	dst_input(skb);
1ababeba4a21f3d David Lebrun       2016-11-08  483  
1ababeba4a21f3d David Lebrun       2016-11-08  484  	return -1;
1ababeba4a21f3d David Lebrun       2016-11-08  485  }
1ababeba4a21f3d David Lebrun       2016-11-08  486  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
