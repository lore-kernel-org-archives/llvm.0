Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7934036A37B;
	Fri, 10 Jul 2026 17:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705089; cv=none; b=BNzMb9ZReyyULm+zDMapHeE5K4wEGCjlP0TG79Y09Zy6iC5GBk8+ao8bMaL4JDwMCB0NRlYuzmDeJ/ZmEhNIc6/uQ3j0JULZmRmfxd2RAhUhkmQiX+O/q4BN/kLeZzvVNA1KhO1x2mn6C0p1aO9B9Nt1/EpIvjqGxuXgWvmGZj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705089; c=relaxed/simple;
	bh=VJ3WyYE/W43/hF5UgHe91gyrNyWza08wu9OVUuzx0F4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dHbQ64SOFiPPB9Xj9Uayrx+Y9th5E8kzgbyfu6Gr/tTtBtr8zaBqTZ38zsHH7Z8yDq+WPm76ha/5uz9F7QNe+/NLFghw4RVr0OSFhe/quZ1+kpebWLncbeD+HwkgGti2FqI9vLh4cIoVUIY1URc6SyHZ0q+HoNSSjZbewSSCR0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8og5qZ+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8og5qZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783705088; x=1815241088;
  h=date:from:to:cc:subject:message-id;
  bh=VJ3WyYE/W43/hF5UgHe91gyrNyWza08wu9OVUuzx0F4=;
  b=F8og5qZ+OW2nRLhrhXk+yDaZ+PHDr8lcKzGCJqrNYbhm/e6FB8sRBEai
   riimX33yl+fMhs1gZj6PeaOixKFFtlobGgyeROJXz/OryzMuDeXJQ/7wv
   iGn/2yvdbGeGeufPmoYIuDGZclP93wuSQuDPZ0Uyp+KhnngrxvJahLEhR
   0aLzkOIZneimar+6raswssmuNzu7fsddOt7QuYYz3JMwp931L4Uxzpjdn
   ivsk+pAwG9lBvgkCqcSw5QslNqtqcgTBctAYPQnlJYtT5z7brSUfQwrCd
   pyV9zC0uY5AU7Qp/00WqJzKth3+gAEce/oKPsas5ETN3KQ6oiVz7De9Ud
   g==;
X-CSE-ConnectionGUID: yNn8YSk5ToGOcdRS2NFktA==
X-CSE-MsgGUID: VNzXKdCfTxyw6PvwS6knLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84187922"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84187922"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:38:05 -0700
X-CSE-ConnectionGUID: KhmuHTfrRwWmpMLHrOuZ4g==
X-CSE-MsgGUID: 77hjN/MfRyeQCa7SLzrkzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="293135000"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 10 Jul 2026 10:38:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiFAm-00000000JBv-2KFk;
	Fri, 10 Jul 2026 17:38:00 +0000
Date: Sat, 11 Jul 2026 01:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mahe Tardy <mahe.tardy@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>,
 Emil Tsalapatis <emil@etsalapatis.com>, Jordan Rife <jordan@jrife.io>
Subject: [linux-next:master 5404/5655] net/core/filter.c:12578:18:
 warning: unused variable 'nskb'
Message-ID: <202607110140.JeJZ6GIa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: f3603df9aebb2a2fe2f745bd71ca38aeca60e6e7 [5404/5655] bpf: Add bpf_icmp_send kfunc
config: i386-buildonly-randconfig-001-20260710 (https://download.01.org/0day-ci/archive/20260711/202607110140.JeJZ6GIa-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110140.JeJZ6GIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110140.JeJZ6GIa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/filter.c:12578:18: warning: unused variable 'nskb' [-Wunused-variable]
    12578 |         struct sk_buff *nskb;
          |                         ^~~~
   1 warning generated.


vim +/nskb +12578 net/core/filter.c

 12553	
 12554	/**
 12555	 * bpf_icmp_send - Send an ICMP control message
 12556	 * @skb_ctx: Packet that triggered the control message
 12557	 * @type: ICMP type (only ICMP_DEST_UNREACH/ICMPV6_DEST_UNREACH supported)
 12558	 * @code: ICMP code (0-15 except ICMP_FRAG_NEEDED for IPv4, 0-6 for IPv6)
 12559	 *
 12560	 * Sends an ICMP control message in response to the packet. The original packet
 12561	 * is cloned before sending the ICMP message, so the BPF program can still let
 12562	 * the packet pass if desired.
 12563	 *
 12564	 * Currently only ICMP_DEST_UNREACH (IPv4) and ICMPV6_DEST_UNREACH (IPv6) are
 12565	 * supported.
 12566	 *
 12567	 * Return: 0 on success (send attempt), negative error code on failure:
 12568	 *         -EBUSY: Recursion detected
 12569	 *         -EPROTONOSUPPORT: Non-IP protocol
 12570	 *         -EOPNOTSUPP: Unsupported ICMP type
 12571	 *         -EINVAL: Invalid code parameter
 12572	 *         -ENETUNREACH: No usable route/dst for the ICMP reply
 12573	 *         -ENOMEM: Memory allocation failed
 12574	 */
 12575	__bpf_kfunc int bpf_icmp_send(struct __sk_buff *skb_ctx, int type, int code)
 12576	{
 12577		struct sk_buff *skb = (struct sk_buff *)skb_ctx;
 12578		struct sk_buff *nskb;
 12579		struct sock *sk;
 12580	
 12581		sk = skb_to_full_sk(skb);
 12582		if (sk && sk->sk_kern_sock &&
 12583		    (sk->sk_protocol == IPPROTO_ICMP || sk->sk_protocol == IPPROTO_ICMPV6))
 12584			return -EBUSY;
 12585	
 12586		if (!skb_valid_dst(skb))
 12587			return -ENETUNREACH;
 12588	
 12589		switch (skb->protocol) {
 12590	#if IS_ENABLED(CONFIG_INET)
 12591		case htons(ETH_P_IP): {
 12592			if (type != ICMP_DEST_UNREACH)
 12593				return -EOPNOTSUPP;
 12594			if (code < 0 || code > NR_ICMP_UNREACH ||
 12595			    code == ICMP_FRAG_NEEDED) /* needs a valid next-hop MTU */
 12596				return -EINVAL;
 12597	
 12598			nskb = skb_clone(skb, GFP_ATOMIC);
 12599			if (!nskb)
 12600				return -ENOMEM;
 12601	
 12602			memset(IPCB(nskb), 0, sizeof(*IPCB(nskb)));
 12603			icmp_send(nskb, type, code, 0);
 12604			consume_skb(nskb);
 12605			break;
 12606		}
 12607	#endif
 12608	#if IS_ENABLED(CONFIG_IPV6)
 12609		case htons(ETH_P_IPV6):
 12610			if (type != ICMPV6_DEST_UNREACH)
 12611				return -EOPNOTSUPP;
 12612			if (code < 0 || code > ICMPV6_REJECT_ROUTE)
 12613				return -EINVAL;
 12614	
 12615			nskb = skb_clone(skb, GFP_ATOMIC);
 12616			if (!nskb)
 12617				return -ENOMEM;
 12618	
 12619			memset(IP6CB(nskb), 0, sizeof(*IP6CB(nskb)));
 12620			icmpv6_send(nskb, type, code, 0);
 12621			consume_skb(nskb);
 12622			break;
 12623	#endif
 12624		default:
 12625			return -EPROTONOSUPPORT;
 12626		}
 12627	
 12628		return 0;
 12629	}
 12630	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
