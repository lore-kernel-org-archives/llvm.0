Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D6C7F5;
	Wed,  5 Apr 2023 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680684137; x=1712220137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t4BaMUiTkU0pdzyvrf41Opnz45/wmLzXd9LPpa7ro0Y=;
  b=HHPlWXLNtS1Pfno5zt29YMT/I+S/ccgNba0QXTzkUCCOCXd7cK+HdUdx
   IewPIOyfu2GJ+jkHQFnZuyBV3n8yJjtq8wytuRYzZ5Ys1j72TRXjAjppW
   inWCIMc57jp5mMX9VK/yydpXa7TvA5XR19gnHQfXmjafwRmYrdU9X/FJT
   ayNJcf4lWMC478sNJJQtm6hGBeEQKLQWqvJvyMFz7ckkjtxY9UvXJT8Mh
   G1AtysLRj7ysf21qxymckz6f+/e8BgssoX6lXnzS59/wVMZE7MKGypt4g
   4q8MFZKBz0f1LqlmozAf/bsLxn0ELTMmYZpikaLJYlxEy4iGCIMpMvP6A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="342419484"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="342419484"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 01:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="716957252"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="716957252"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Apr 2023 01:42:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjyiU-000QQa-1N;
	Wed, 05 Apr 2023 08:42:06 +0000
Date: Wed, 5 Apr 2023 16:42:01 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [pablo-gtp:main 5/5] drivers/net/gtp.c:1094:14: warning: variable
 'dst' is uninitialized when used here
Message-ID: <202304051650.VGVowXih-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git main
head:   8257a77aa7bbdcdbc7cb8bf48e4b065dccbb8ec4
commit: 8257a77aa7bbdcdbc7cb8bf48e4b065dccbb8ec4 [5/5] gtp: add IPv6 support
config: x86_64-randconfig-r033-20230403 (https://download.01.org/0day-ci/archive/20230405/202304051650.VGVowXih-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git/commit/?id=8257a77aa7bbdcdbc7cb8bf48e4b065dccbb8ec4
        git remote add pablo-gtp https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git
        git fetch --no-tags pablo-gtp main
        git checkout 8257a77aa7bbdcdbc7cb8bf48e4b065dccbb8ec4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051650.VGVowXih-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/gtp.c:1094:14: warning: variable 'dst' is uninitialized when used here [-Wuninitialized]
           dst_release(dst);
                       ^~~
   drivers/net/gtp.c:1030:23: note: initialize the variable 'dst' to silence this warning
           struct dst_entry *dst;
                                ^
                                 = NULL
   1 warning generated.


vim +/dst +1094 drivers/net/gtp.c

  1024	
  1025	static int gtp_build_skb_ip6(struct sk_buff *skb, struct net_device *dev,
  1026				     struct gtp_pktinfo *pktinfo)
  1027	{
  1028		struct gtp_dev *gtp = netdev_priv(dev);
  1029		struct net *net = gtp->net;
  1030		struct dst_entry *dst;
  1031		struct pdp_ctx *pctx;
  1032		struct ipv6hdr *ip6h;
  1033		struct rt6_info *rt;
  1034		struct flowi6 fl6;
  1035		int mtu;
  1036	
  1037		/* Read the IP destination address and resolve the PDP context.
  1038		 * Prepend PDP header with TEI/TID from PDP ctx.
  1039		 */
  1040		ip6h = ipv6_hdr(skb);
  1041		if (gtp->role == GTP_ROLE_SGSN)
  1042			pctx = ipv6_pdp_find(gtp, &ip6h->saddr);
  1043		else
  1044			pctx = ipv6_pdp_find(gtp, &ip6h->daddr);
  1045	
  1046		if (!pctx) {
  1047			netdev_dbg(dev, "no PDP ctx found for %pI6, skip\n",
  1048				   &ip6h->daddr);
  1049			return -ENOENT;
  1050		}
  1051		netdev_dbg(dev, "found PDP context %p\n", pctx);
  1052	
  1053		rt = ip6_route_output_gtp(net, &fl6, pctx->sk, &pctx->ip6.peer_addr,
  1054					  &inet6_sk(pctx->sk)->saddr);
  1055		if (IS_ERR(rt)) {
  1056			netdev_dbg(dev, "no route to SSGN %pI6\n",
  1057				   &pctx->ip6.peer_addr);
  1058			dev->stats.tx_carrier_errors++;
  1059			goto err;
  1060		}
  1061	
  1062		if (rt->dst.dev == dev) {
  1063			netdev_dbg(dev, "circular route to SSGN %pI6\n",
  1064				   &pctx->ip6.peer_addr);
  1065			dev->stats.collisions++;
  1066			goto err_rt;
  1067		}
  1068	
  1069		mtu = dst_mtu(&rt->dst) - dev->hard_header_len -
  1070			sizeof(struct ipv6hdr) - sizeof(struct udphdr);
  1071		switch (pctx->gtp_version) {
  1072		case GTP_V0:
  1073			mtu -= sizeof(struct gtp0_header);
  1074			break;
  1075		case GTP_V1:
  1076			mtu -= sizeof(struct gtp1_header);
  1077			break;
  1078		}
  1079	
  1080		skb_dst_update_pmtu_no_confirm(skb, mtu);
  1081	
  1082		if ((!skb_is_gso(skb) && skb->len > mtu) ||
  1083		    (skb_is_gso(skb) && !skb_gso_validate_network_len(skb, mtu))) {
  1084			netdev_dbg(dev, "packet too big, fragmentation needed\n");
  1085			icmpv6_ndo_send(skb, ICMPV6_PKT_TOOBIG, 0, mtu);
  1086			goto err_rt;
  1087		}
  1088	
  1089		gtp_set_pktinfo_ipv6(pktinfo, pctx->sk, ip6h, pctx, rt, &fl6, dev);
  1090		gtp_push_header(skb, pktinfo);
  1091	
  1092		return 0;
  1093	err_rt:
> 1094		dst_release(dst);
  1095	err:
  1096		return -EBADMSG;
  1097	}
  1098	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
