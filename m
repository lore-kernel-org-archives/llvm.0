Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7D82DB794;
	Fri,  2 Oct 2026 17:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960906; cv=none; b=J+Cbmw+jbjInCTtgg6HkEb51DYzat/i9A7PFGwWkARcb20KAuWSHB0tyuZb4kBjSNQe+53Jx9AfZQRPjCKdEm+XIAZjtBBGxG+UbJvRDOGlGgiMItyby0888OA58NmOmm6I8PtUSwaPELiVBeHV+cMusHEhWBVIrB64yWZLD6zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960906; c=relaxed/simple;
	bh=uK+S9GR56VZVhB3ydIynhat7yKHKCnbHDRJZu3kJH3w=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+sFgEopo4B8ZDpwZ1SaAaXwDYWZ6ydXB1E038VKqwbM1nF7UxsFwjHJYHzJRiFGv9RYNrpT7RJ1I0zcLHNHGPjcHxKqh44ZxXaMDEixTimzaPEklUDPeXz982QtnrPhvW8jSzvZgG/UUvKxA7GBht34v6Y4JBSVsz3SgiMLmJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqXbnB+Y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqXbnB+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790960904; x=1822496904;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=uK+S9GR56VZVhB3ydIynhat7yKHKCnbHDRJZu3kJH3w=;
  b=fqXbnB+YJc4RTcCBnDwtGYSzbSvfQmKHs9LdEQfAyl98beGci3hgYayh
   2Ymhp8dZKUOIUp1C/pCQCN2OYfXnPcoVUY9C2mOt+iysn8GJbmJvhghgk
   r43rMtNRbvxzJuWOb7f/MpdkwSGbY5mTSE2Spr7w8FHEx1qx6qf15zAir
   gsriJY3bODQurMsMPCkj/FgHJkry9dJfIFcWZYLjeEhK/o/Uzs9271RUH
   cba5tMQZiu5UOV7MP5uBnGqT6OlIqGHZYUQmflX/szPotFH7bcYTvPQbW
   if/KnhTIuhwEX5ATclQCZRXJwu7BcI8fXxaYnGutthQwThhdSE+ui10pr
   w==;
X-CSE-ConnectionGUID: 0e+e9uH/R8qDrZNl7OyiFw==
X-CSE-MsgGUID: UBmIwGU5RWWhIpKUSjDzQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="101893303"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="101893303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 10:08:22 -0700
X-CSE-ConnectionGUID: lyWMn0O/QAihQ/2VV+xAUQ==
X-CSE-MsgGUID: KVcssg65QweA7cLHmItqPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275838642"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2026 10:08:21 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCgk6-00000000TI1-2Vgy;
	Fri, 02 Oct 2026 17:08:18 +0000
Date: Sat, 3 Oct 2026 01:07:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: net/sched: cap the accounted backlog before it can wrap
Message-ID: <202610030129.hEQ6QJF9-lkp@intel.com>
References: <202610030129.hEQ6QJF9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610030129.hEQ6QJF9-lkp@intel.com>

Hi Jamal,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-cap-the-accounted-backlog-before-it-can-wrap/20261002-034431
base:   
patch link:    https://lore.kernel.org/r/202610030129.hEQ6QJF9-lkp%40intel.com
config: hexagon-randconfig-1001-20261002 (https://download.01.org/0day-ci/archive/20261003/202610030129.hEQ6QJF9-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030129.hEQ6QJF9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610030129.hEQ6QJF9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/sched/sch_cake.c:1742:66: warning: '/*' within block comment [-Wcomment]
    1742 |  * consumed by a terminal TC action (reason in *qerr); else *flow/*host
         |                                                                  ^
   1 warning generated.


vim +1742 net/sched/sch_cake.c

  1740	
  1741	/* Run the optional external classifier. Returns true when the packet was
> 1742	 * consumed by a terminal TC action (reason in *qerr); else *flow/*host
  1743	 * hold the filter's overrides (0 if none).
  1744	 */
  1745	static bool cake_tcf_classify(struct Qdisc *sch, struct sk_buff *skb,
  1746				      u16 *flow, u16 *host, int *qerr)
  1747	{
  1748		struct cake_sched_data *q = qdisc_priv(sch);
  1749		struct tcf_proto *filter;
  1750		struct tcf_result res;
  1751		int result;
  1752	
  1753		*flow = 0;
  1754		*host = 0;
  1755	
  1756		filter = rcu_dereference_bh(q->filter_list);
  1757		if (!filter)
  1758			return false;
  1759	
  1760		*qerr = NET_XMIT_SUCCESS | __NET_XMIT_BYPASS;
  1761		result = tcf_classify_qdisc(skb, filter, &res, false);
  1762	
  1763		if (result >= 0) {
  1764	#ifdef CONFIG_NET_CLS_ACT
  1765			switch (result) {
  1766			case TC_ACT_STOLEN:
  1767			case TC_ACT_QUEUED:
  1768			case TC_ACT_TRAP:
  1769				*qerr = NET_XMIT_SUCCESS | __NET_XMIT_STOLEN;
  1770				fallthrough;
  1771			case TC_ACT_SHOT:
  1772				return true;
  1773			}
  1774	#endif
  1775			if (TC_H_MIN(res.classid) <= CAKE_QUEUES)
  1776				*flow = TC_H_MIN(res.classid);
  1777			if (TC_H_MAJ(res.classid) <= (CAKE_QUEUES << 16))
  1778				*host = TC_H_MAJ(res.classid) >> 16;
  1779		}
  1780		return false;
  1781	}
  1782	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
