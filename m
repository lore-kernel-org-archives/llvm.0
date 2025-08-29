Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCD5322DC9;
	Fri, 29 Aug 2025 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756488479; cv=none; b=VdYQLHk0qekmKYiEnGHX91B4K3uFi86wW7Lupuz4kfGjWaX3NAal/afpBalevEHw2fjvATGTgcj0M054jTk3XFP/7xT6so5Ynr3zfHjVXwiRGYe1S+knL9KeQlgMdBMVsd67hq95LmU13P3mCBeJCJ756lfMTz3CwnPndFhiW9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756488479; c=relaxed/simple;
	bh=R3HhULHzDO/1Qyw2fqIqRc2MYGIqtU45lFz+5fYaK+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qO+tkY1yhbMvy4yjRSigjSIXdjAcui+YRpOSzRM0IzvnCsYNMZ1NEZT5AmLmCptJ3L8EiO4KnG7ZdDlCFoCgoy7e5OnLf3DQbY261PkjxiYQ5l9xYqDXAiFLKlZFw4NyYvMHwLh2YJOz40tlRGWYoD5pn14KX1JwH9BG6i/28OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5p5VWlB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5p5VWlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756488477; x=1788024477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R3HhULHzDO/1Qyw2fqIqRc2MYGIqtU45lFz+5fYaK+w=;
  b=j5p5VWlBHU11EwRT2vtfaGhEda8MGoB7X6d2u9hPVLFGvq1GJPYjlEf4
   jgOGdHW8nErfdSzhoDZHAtnXKyPyjdGCR9MHAkJEQG29cBpXEx4vFldY3
   4RLTnphKHJNHDuzn3ND/Z3Jr1d8UaaDOwdmk+V66m4qwqJD07E38Pc4Al
   nFUUoDstJcmDx7PgC2ezihWcMdZq2tmb0iFLfFCtF2Ocnt3cWX1EVrTCx
   qakdP+MHksbjjHtSkWiA7aLfh1iGFztMwFcimtuakeg5K+0k4vmrKmlQn
   YYZgUwv4PC2hzsQdi5wqJXbHvA2vugfILFPEf7xoKJiWUEFrUTUfkZKfD
   A==;
X-CSE-ConnectionGUID: CK8BGCgVQlakfyM/NjdZ1A==
X-CSE-MsgGUID: IIOLRcX+RVS4hNa3a42Juw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70213452"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="70213452"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 10:27:56 -0700
X-CSE-ConnectionGUID: vrzz8UvuRCmlJ7MKcWpKLw==
X-CSE-MsgGUID: fCs5g+I1Qsup19iJONtDiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="169960823"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Aug 2025 10:27:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us2tE-000UoJ-2h;
	Fri, 29 Aug 2025 17:27:52 +0000
Date: Sat, 30 Aug 2025 01:27:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Eckelmann <sven@narfation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sven Eckelmann <sven@narfation.org>,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [batman:batadv/net-next 2/4] net/batman-adv/send.c:65:22: warning:
 variable 'bat_priv' set but not used
Message-ID: <202508300123.g1JINmOD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.open-mesh.org/linux-merge.git batadv/net-next
head:   670a7f17dda79f68c1f8414f75368f122718d5b2
commit: db615ccdc9bd480fd632f16b9ff5dcf340430f44 [2/4] batman-adv: remove network coding support
config: hexagon-randconfig-002-20250829 (https://download.01.org/0day-ci/archive/20250830/202508300123.g1JINmOD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508300123.g1JINmOD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508300123.g1JINmOD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/batman-adv/send.c:65:22: warning: variable 'bat_priv' set but not used [-Wunused-but-set-variable]
      65 |         struct batadv_priv *bat_priv;
         |                             ^
   1 warning generated.


vim +/bat_priv +65 net/batman-adv/send.c

c6c8fea29769d99 Sven Eckelmann    2010-12-13   42  
95d392784dd0a51 Antonio Quartulli 2016-01-16   43  /**
7e9a8c2ce7c5f87 Sven Eckelmann    2017-12-02   44   * batadv_send_skb_packet() - send an already prepared packet
95d392784dd0a51 Antonio Quartulli 2016-01-16   45   * @skb: the packet to send
95d392784dd0a51 Antonio Quartulli 2016-01-16   46   * @hard_iface: the interface to use to send the broadcast packet
95d392784dd0a51 Antonio Quartulli 2016-01-16   47   * @dst_addr: the payload destination
95d392784dd0a51 Antonio Quartulli 2016-01-16   48   *
95d392784dd0a51 Antonio Quartulli 2016-01-16   49   * Send out an already prepared packet to the given neighbor or broadcast it
95d392784dd0a51 Antonio Quartulli 2016-01-16   50   * using the specified interface. Either hard_iface or neigh_node must be not
95d392784dd0a51 Antonio Quartulli 2016-01-16   51   * NULL.
95d392784dd0a51 Antonio Quartulli 2016-01-16   52   * If neigh_node is NULL, then the packet is broadcasted using hard_iface,
95d392784dd0a51 Antonio Quartulli 2016-01-16   53   * otherwise it is sent as unicast to the given neighbor.
95d392784dd0a51 Antonio Quartulli 2016-01-16   54   *
7d72d174c7b6e36 Sven Eckelmann    2016-07-17   55   * Regardless of the return value, the skb is consumed.
7d72d174c7b6e36 Sven Eckelmann    2016-07-17   56   *
7d72d174c7b6e36 Sven Eckelmann    2016-07-17   57   * Return: A negative errno code is returned on a failure. A success does not
7d72d174c7b6e36 Sven Eckelmann    2016-07-17   58   * guarantee the frame will be transmitted as it may be dropped due
7d72d174c7b6e36 Sven Eckelmann    2016-07-17   59   * to congestion or traffic shaping.
9cfc7bd608b9746 Sven Eckelmann    2012-05-12   60   */
56303d34a332be8 Sven Eckelmann    2012-06-05   61  int batadv_send_skb_packet(struct sk_buff *skb,
56303d34a332be8 Sven Eckelmann    2012-06-05   62  			   struct batadv_hard_iface *hard_iface,
6b5e971a282c0e7 Sven Eckelmann    2015-05-26   63  			   const u8 *dst_addr)
c6c8fea29769d99 Sven Eckelmann    2010-12-13   64  {
95d392784dd0a51 Antonio Quartulli 2016-01-16  @65  	struct batadv_priv *bat_priv;
c6c8fea29769d99 Sven Eckelmann    2010-12-13   66  	struct ethhdr *ethhdr;
7c946062b3ae2b7 Sven Eckelmann    2017-01-28   67  	int ret;
c6c8fea29769d99 Sven Eckelmann    2010-12-13   68  
94433355027db60 Sven Eckelmann    2025-02-02   69  	bat_priv = netdev_priv(hard_iface->mesh_iface);
95d392784dd0a51 Antonio Quartulli 2016-01-16   70  
e9a4f295ebe06b0 Sven Eckelmann    2012-06-03   71  	if (hard_iface->if_status != BATADV_IF_ACTIVE)
c6c8fea29769d99 Sven Eckelmann    2010-12-13   72  		goto send_skb_err;
c6c8fea29769d99 Sven Eckelmann    2010-12-13   73  
e6c10f433af9c98 Marek Lindner     2011-02-18   74  	if (unlikely(!hard_iface->net_dev))
c6c8fea29769d99 Sven Eckelmann    2010-12-13   75  		goto send_skb_err;
c6c8fea29769d99 Sven Eckelmann    2010-12-13   76  
e6c10f433af9c98 Marek Lindner     2011-02-18   77  	if (!(hard_iface->net_dev->flags & IFF_UP)) {
679695813c0e29e Sven Eckelmann    2012-03-26   78  		pr_warn("Interface %s is not up - can't send packet via that interface!\n",
86ceb360565d06f Sven Eckelmann    2012-03-07   79  			hard_iface->net_dev->name);
c6c8fea29769d99 Sven Eckelmann    2010-12-13   80  		goto send_skb_err;
c6c8fea29769d99 Sven Eckelmann    2010-12-13   81  	}
c6c8fea29769d99 Sven Eckelmann    2010-12-13   82  
c6c8fea29769d99 Sven Eckelmann    2010-12-13   83  	/* push to the ethernet header. */
04b482a21aaf22c Sven Eckelmann    2012-05-12   84  	if (batadv_skb_head_push(skb, ETH_HLEN) < 0)
c6c8fea29769d99 Sven Eckelmann    2010-12-13   85  		goto send_skb_err;
c6c8fea29769d99 Sven Eckelmann    2010-12-13   86  
c6c8fea29769d99 Sven Eckelmann    2010-12-13   87  	skb_reset_mac_header(skb);
c6c8fea29769d99 Sven Eckelmann    2010-12-13   88  
7ed4be9523455a0 Antonio Quartulli 2013-04-08   89  	ethhdr = eth_hdr(skb);
8fdd01530cda849 Antonio Quartulli 2014-01-22   90  	ether_addr_copy(ethhdr->h_source, hard_iface->net_dev->dev_addr);
8fdd01530cda849 Antonio Quartulli 2014-01-22   91  	ether_addr_copy(ethhdr->h_dest, dst_addr);
293e93385e024be Antonio Quartulli 2013-05-19   92  	ethhdr->h_proto = htons(ETH_P_BATMAN);
c6c8fea29769d99 Sven Eckelmann    2010-12-13   93  
c6c8fea29769d99 Sven Eckelmann    2010-12-13   94  	skb_set_network_header(skb, ETH_HLEN);
293e93385e024be Antonio Quartulli 2013-05-19   95  	skb->protocol = htons(ETH_P_BATMAN);
c6c8fea29769d99 Sven Eckelmann    2010-12-13   96  
e6c10f433af9c98 Marek Lindner     2011-02-18   97  	skb->dev = hard_iface->net_dev;
c6c8fea29769d99 Sven Eckelmann    2010-12-13   98  
c6c8fea29769d99 Sven Eckelmann    2010-12-13   99  	/* dev_queue_xmit() returns a negative result on error.	 However on
c6c8fea29769d99 Sven Eckelmann    2010-12-13  100  	 * congestion and traffic shaping, it drops and returns NET_XMIT_DROP
9cfc7bd608b9746 Sven Eckelmann    2012-05-12  101  	 * (which is > 0). This will not be treated as an error.
9cfc7bd608b9746 Sven Eckelmann    2012-05-12  102  	 */
7c946062b3ae2b7 Sven Eckelmann    2017-01-28  103  	ret = dev_queue_xmit(skb);
7c946062b3ae2b7 Sven Eckelmann    2017-01-28  104  	return net_xmit_eval(ret);
c6c8fea29769d99 Sven Eckelmann    2010-12-13  105  send_skb_err:
c6c8fea29769d99 Sven Eckelmann    2010-12-13  106  	kfree_skb(skb);
c6c8fea29769d99 Sven Eckelmann    2010-12-13  107  	return NET_XMIT_DROP;
c6c8fea29769d99 Sven Eckelmann    2010-12-13  108  }
c6c8fea29769d99 Sven Eckelmann    2010-12-13  109  

:::::: The code at line 65 was first introduced by commit
:::::: 95d392784dd0a51e4216e075f04a68c922745985 batman-adv: keep track of when unicast packets are sent

:::::: TO: Antonio Quartulli <antonio@open-mesh.com>
:::::: CC: Antonio Quartulli <a@unstable.cc>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
