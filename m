Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298363B5851;
	Tue, 26 May 2026 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797916; cv=none; b=Ch31mjgSphObR4g6FB1ksEy6Sv0Ln0kd69PF1mxi/a8VbapNTlxHTALFw1fh+recLA5TtJ7acAuXHgz3/b4j0WDfX5DRzQUvEQCCgNGrPNB9L+I5zeBggv9WpKp+lVCtUtoY5+p3Ie2eGNA0Fu9a2ze9JQiQLyTG4updwiimLIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797916; c=relaxed/simple;
	bh=WOqZe4QVfO/JR6rizSDRmpDUpJEdblaFAOMUZpSaItg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sThjjHNHgTtmC4/MDfX8pGEkAojePEWhXQJiHNnMS/j89wUtqlt67L+O1Y539kZM/mtKb12B0ziNdBkslUkdD3gS1K1qXvzPp95c9Gu4jAKxIBDGbAlYeAog4mtcX73jflw7tGo9I7InE4laok7x28AQXAv9iR8jtovAzXonp4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHJoo3Hd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHJoo3Hd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779797914; x=1811333914;
  h=date:from:to:cc:subject:message-id;
  bh=WOqZe4QVfO/JR6rizSDRmpDUpJEdblaFAOMUZpSaItg=;
  b=BHJoo3Hd96lY9Lj6GUnUgRnkhS9lcIRNVf55LEBvRdi82EkOSUbtZiNV
   NUawbdQ6SPLNBuNnBPGPyuN0g17vWVdDRlu/afNyRMHywm6h3iyFAJwFQ
   fal3ZqCWM24ZWqLAV3BlSAxIlC/z06MgD9m+6ncKVJhZk7GsANXwE6e+8
   XjmurmOfe21oMXPSeoY5rKBkIXLIfmygN58p9jy0zQLI4yPx0c0KhOekR
   GlIvf80gllC/9fFMS4CkfpPMs/fd6Ud6WNz7RK/9Mm3uesWR+W7W5t6ed
   iNJuQmKSeCWlZddvSEShb5ezhSf5/Zhs0WzEg8hK+dJTqpmZlrn6lD4os
   Q==;
X-CSE-ConnectionGUID: /Ba7ZNuBThyTxneXB1P9pA==
X-CSE-MsgGUID: HP3+ypeJQjieqxfWikiHyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="79642116"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="79642116"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 05:18:33 -0700
X-CSE-ConnectionGUID: BTi3HVRcQNOWFpYP5gr1zw==
X-CSE-MsgGUID: Ao/8eW+eSVmidoLjFcj9wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="246991495"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 May 2026 05:18:31 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRqjt-00000000COz-2kvC;
	Tue, 26 May 2026 12:18:29 +0000
Date: Tue, 26 May 2026 14:17:50 +0200
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: net/netfilter/nf_conntrack_ovs.c:31:14: error: no member
 named 'tuple' in 'struct nf_conntrack_helper'
Message-ID: <202605261426.RWlvhMj8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/netfilter-nf_conntrack_helper-do-not-hash-by-tuple/20260522-130418
head:   883ccf421e36cd870e2b18fa94755528a668d3b9
commit: 4dc863a09204f9be74df2cfcc7568f4997ac6ec4 netfilter: conntrack: get rid of tuple in helper definitions
date:   4 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260526/202605261426.RWlvhMj8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261426.RWlvhMj8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261426.RWlvhMj8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/netfilter/nf_conntrack_ovs.c:31:14: error: no member named 'tuple' in 'struct nf_conntrack_helper'
      31 |         if (helper->tuple.src.l3num != NFPROTO_UNSPEC &&
         |             ~~~~~~  ^
   net/netfilter/nf_conntrack_ovs.c:32:14: error: no member named 'tuple' in 'struct nf_conntrack_helper'
      32 |             helper->tuple.src.l3num != proto)
         |             ~~~~~~  ^
   net/netfilter/nf_conntrack_ovs.c:60:14: error: no member named 'tuple' in 'struct nf_conntrack_helper'
      60 |         if (helper->tuple.dst.protonum != proto)
         |             ~~~~~~  ^
   3 errors generated.
--
>> net/sched/act_ct.c:1527:52: error: no member named 'tuple' in 'struct nf_conntrack_helper'
    1527 |             nla_put_u8(skb, TCA_CT_HELPER_FAMILY, helper->tuple.src.l3num) ||
         |                                                   ~~~~~~  ^
   net/sched/act_ct.c:1528:51: error: no member named 'tuple' in 'struct nf_conntrack_helper'
    1528 |             nla_put_u8(skb, TCA_CT_HELPER_PROTO, helper->tuple.dst.protonum))
         |                                                  ~~~~~~  ^
   2 errors generated.


vim +31 net/netfilter/nf_conntrack_ovs.c

c0c3ab63de603b Xin Long 2023-02-07  10  
c0c3ab63de603b Xin Long 2023-02-07  11  /* 'skb' should already be pulled to nh_ofs. */
c0c3ab63de603b Xin Long 2023-02-07  12  int nf_ct_helper(struct sk_buff *skb, struct nf_conn *ct,
c0c3ab63de603b Xin Long 2023-02-07  13  		 enum ip_conntrack_info ctinfo, u16 proto)
c0c3ab63de603b Xin Long 2023-02-07  14  {
c0c3ab63de603b Xin Long 2023-02-07  15  	const struct nf_conntrack_helper *helper;
c0c3ab63de603b Xin Long 2023-02-07  16  	const struct nf_conn_help *help;
c0c3ab63de603b Xin Long 2023-02-07  17  	unsigned int protoff;
c0c3ab63de603b Xin Long 2023-02-07  18  	int err;
c0c3ab63de603b Xin Long 2023-02-07  19  
c0c3ab63de603b Xin Long 2023-02-07  20  	if (ctinfo == IP_CT_RELATED_REPLY)
c0c3ab63de603b Xin Long 2023-02-07  21  		return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  22  
c0c3ab63de603b Xin Long 2023-02-07  23  	help = nfct_help(ct);
c0c3ab63de603b Xin Long 2023-02-07  24  	if (!help)
c0c3ab63de603b Xin Long 2023-02-07  25  		return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  26  
c0c3ab63de603b Xin Long 2023-02-07  27  	helper = rcu_dereference(help->helper);
c0c3ab63de603b Xin Long 2023-02-07  28  	if (!helper)
c0c3ab63de603b Xin Long 2023-02-07  29  		return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  30  
c0c3ab63de603b Xin Long 2023-02-07 @31  	if (helper->tuple.src.l3num != NFPROTO_UNSPEC &&
c0c3ab63de603b Xin Long 2023-02-07  32  	    helper->tuple.src.l3num != proto)
c0c3ab63de603b Xin Long 2023-02-07  33  		return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  34  
c0c3ab63de603b Xin Long 2023-02-07  35  	switch (proto) {
c0c3ab63de603b Xin Long 2023-02-07  36  	case NFPROTO_IPV4:
c0c3ab63de603b Xin Long 2023-02-07  37  		protoff = ip_hdrlen(skb);
c0c3ab63de603b Xin Long 2023-02-07  38  		proto = ip_hdr(skb)->protocol;
c0c3ab63de603b Xin Long 2023-02-07  39  		break;
c0c3ab63de603b Xin Long 2023-02-07  40  	case NFPROTO_IPV6: {
c0c3ab63de603b Xin Long 2023-02-07  41  		u8 nexthdr = ipv6_hdr(skb)->nexthdr;
c0c3ab63de603b Xin Long 2023-02-07  42  		__be16 frag_off;
c0c3ab63de603b Xin Long 2023-02-07  43  		int ofs;
c0c3ab63de603b Xin Long 2023-02-07  44  
c0c3ab63de603b Xin Long 2023-02-07  45  		ofs = ipv6_skip_exthdr(skb, sizeof(struct ipv6hdr), &nexthdr,
c0c3ab63de603b Xin Long 2023-02-07  46  				       &frag_off);
c0c3ab63de603b Xin Long 2023-02-07  47  		if (ofs < 0 || (frag_off & htons(~0x7)) != 0) {
c0c3ab63de603b Xin Long 2023-02-07  48  			pr_debug("proto header not found\n");
c0c3ab63de603b Xin Long 2023-02-07  49  			return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  50  		}
c0c3ab63de603b Xin Long 2023-02-07  51  		protoff = ofs;
c0c3ab63de603b Xin Long 2023-02-07  52  		proto = nexthdr;
c0c3ab63de603b Xin Long 2023-02-07  53  		break;
c0c3ab63de603b Xin Long 2023-02-07  54  	}
c0c3ab63de603b Xin Long 2023-02-07  55  	default:
c0c3ab63de603b Xin Long 2023-02-07  56  		WARN_ONCE(1, "helper invoked on non-IP family!");
c0c3ab63de603b Xin Long 2023-02-07  57  		return NF_DROP;
c0c3ab63de603b Xin Long 2023-02-07  58  	}
c0c3ab63de603b Xin Long 2023-02-07  59  
c0c3ab63de603b Xin Long 2023-02-07  60  	if (helper->tuple.dst.protonum != proto)
c0c3ab63de603b Xin Long 2023-02-07  61  		return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  62  
c0c3ab63de603b Xin Long 2023-02-07  63  	err = helper->help(skb, protoff, ct, ctinfo);
c0c3ab63de603b Xin Long 2023-02-07  64  	if (err != NF_ACCEPT)
c0c3ab63de603b Xin Long 2023-02-07  65  		return err;
c0c3ab63de603b Xin Long 2023-02-07  66  
c0c3ab63de603b Xin Long 2023-02-07  67  	/* Adjust seqs after helper.  This is needed due to some helpers (e.g.,
c0c3ab63de603b Xin Long 2023-02-07  68  	 * FTP with NAT) adusting the TCP payload size when mangling IP
c0c3ab63de603b Xin Long 2023-02-07  69  	 * addresses and/or port numbers in the text-based control connection.
c0c3ab63de603b Xin Long 2023-02-07  70  	 */
c0c3ab63de603b Xin Long 2023-02-07  71  	if (test_bit(IPS_SEQ_ADJUST_BIT, &ct->status) &&
c0c3ab63de603b Xin Long 2023-02-07  72  	    !nf_ct_seq_adjust(skb, ct, ctinfo, protoff))
c0c3ab63de603b Xin Long 2023-02-07  73  		return NF_DROP;
c0c3ab63de603b Xin Long 2023-02-07  74  	return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  75  }
c0c3ab63de603b Xin Long 2023-02-07  76  EXPORT_SYMBOL_GPL(nf_ct_helper);
c0c3ab63de603b Xin Long 2023-02-07  77  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
