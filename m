Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575803;
	b=KW4yOLl0M//ute/D79lZNUBpwf8Z2JkCYK4zs1XEATnFVEVwxzft7g0gNY02Yv7wDaiq
	 nSk3+R2af2CIrNPPXNsgW4K320P6AaBTaTsAitzEvMj2rLj6fxM5ERW6WciGBUs2/kfh5
	 FYO4gMMmLeqmKW+yuYZcfWJLii9Pl4TL81ulmxtHSEE7w4dTobeO63aGOqFLdM1/HDs+4
	 TyqK+/pPxtmU35prWbzX0tTj6a+tPYM/y1gSJMIThPbUJhMq5U5Gs0KzKchDYdzwqE8CG
	 5TfGdbEKhn+ZzhPIEPsWk2xFRmCluCVm9nBhIhRqdE5nn8Zko4OPa5qpByXqH/hb9Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575803;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=s8Rt0SF/fNNTpqXAX0WN3xXQDCkJmIA79/iXvuM4bCU=;
	b=cI9K+MBC634OGeSk/NIprU5u+CIxuwWlVM4ScGy+B8MWH9mPWhO0OL0+Fk+l6J8NzhXw
	 VlKLt1xxC8L1gDJ4ooZv9uiUh+jmbXabBrG8QLdNGkflpoulvx+Y1ssFTuPx5CZK5fDUp
	 ttikTsJKqIyueoUtLjiYa9gTcWN39AQf/ANbhZdQOMMrWDMYQpn175Opem65Mp4LqQaK3
	 B4JOwTVqb1OjPqHgpPWeBxQirgjy6WB5OTiHiz1XC05CqOqBf0vPnOuP66vLfpz3x5NsR
	 BcxeT9Y4YaQUNTS/u7ropD65IwaLvXm4YHkLcYfUPzckXSghkKyEMRuxD82sVqjReMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CCwpmGSJ;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC454606A327;
	Fri, 13 Nov 2026 13:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC454606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CCwpmGSJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794575803; x=1826111803;
  h=date:from:to:cc:subject:message-id;
  bh=jXKx0gj+9jm0D+ipZOi0B0+MjGtWnNetKjhX1J66S+w=;
  b=CCwpmGSJ2GGXWEHfX3hGE1+AwHjhZn5yZ1FuxM/+e/V6j7nSn4vBT/a2
   9KkyTfZV0B4QLzZgXQ/AA1VtncGhwS9a/NApgLhxfR1fQpqHfkPZV0EVZ
   ebQq4VK+RqeEBKBA5tE8UIDsvs8KhIhyjAKdjXfbCmAu/CPHrPrwm+iEy
   rUPrvMzrqMAf6/cSwdvqNPr1rDpYQrvm0ZVJI31nws9tFj3O4ThEpFU3Z
   rcxL8dA1DOBAWUmYNLb0tfZcLWl+xBbxzvMxpo1Tbr6H/eYGBDKbvtZ1s
   IOaRIi1G1uQpNSxmAKm6M4FOQ6K8p40+Dtxp82SMTn6zV4gP1G3fAIAci
   w==;
X-CSE-ConnectionGUID: gDYTTnQMSVWzXm63JwoEZQ==
X-CSE-MsgGUID: /8xplpeERbK6k1actCoLFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3379607"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3379607"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 05:16:42 -0800
X-CSE-ConnectionGUID: HZKg4TwpT+COU6lT0YFbNw==
X-CSE-MsgGUID: gZraV1s+QNChwp9yTo+E0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9240530"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2026 05:16:40 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRr8v-000000012rt-2CkW;
	Fri, 13 Nov 2026 13:16:37 +0000
Date: Fri, 13 Nov 2026 21:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Anastasov <ja@ssi.bg>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [netfilter-nf:for-netdev-nf-26-11-13 27/27]
 net/netfilter/ipvs/ip_vs_conn.c:1060:21: error: use of undeclared identifier
 'ip_vs_null_xmit_v6'; did you mean 'ip_vs_null_xmit'?
Message-ID: <202611132104.o3SOWZkn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git for-netdev-nf-26-11-13
head:   937b060406a547e4d931525e600540726ea26532
commit: 937b060406a547e4d931525e600540726ea26532 [27/27] ipvs: pass correct sk to update_pmtu and on tunneling
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20261113/202611132104.o3SOWZkn-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1b1fed44d3dcca649a9877915d57c3357a98124e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611132104.o3SOWZkn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611132104.o3SOWZkn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/netfilter/ipvs/ip_vs_conn.c:1060:21: error: use of undeclared identifier 'ip_vs_null_xmit_v6'; did you mean 'ip_vs_null_xmit'?
    1060 |                 cp->packet_xmit = ip_vs_null_xmit_v6;
         |                                   ^~~~~~~~~~~~~~~~~~
         |                                   ip_vs_null_xmit
   include/net/ip_vs.h:1992:5: note: 'ip_vs_null_xmit' declared here
    1992 | int ip_vs_null_xmit(struct sk_buff *skb, struct ip_vs_conn *cp,
         |     ^
   1 error generated.


vim +1060 net/netfilter/ipvs/ip_vs_conn.c

  1034	
  1035	/*
  1036	 *	Bind a connection entry with the corresponding packet_xmit.
  1037	 *	Called by ip_vs_conn_new.
  1038	 */
  1039	static inline void ip_vs_bind_xmit(struct ip_vs_conn *cp)
  1040	{
  1041		switch (IP_VS_FWD_METHOD(cp)) {
  1042		case IP_VS_CONN_F_MASQ:
  1043			cp->packet_xmit = ip_vs_nat_xmit;
  1044			break;
  1045	
  1046		case IP_VS_CONN_F_TUNNEL:
  1047	#ifdef CONFIG_IP_VS_IPV6
  1048			if (cp->daf == AF_INET6)
  1049				cp->packet_xmit = ip_vs_tunnel_xmit_v6;
  1050			else
  1051	#endif
  1052				cp->packet_xmit = ip_vs_tunnel_xmit;
  1053			break;
  1054	
  1055		case IP_VS_CONN_F_DROUTE:
  1056			cp->packet_xmit = ip_vs_dr_xmit;
  1057			break;
  1058	
  1059		case IP_VS_CONN_F_LOCALNODE:
> 1060			cp->packet_xmit = ip_vs_null_xmit_v6;
  1061			break;
  1062	
  1063		case IP_VS_CONN_F_BYPASS:
  1064			cp->packet_xmit = ip_vs_bypass_xmit;
  1065			break;
  1066		}
  1067	}
  1068	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
