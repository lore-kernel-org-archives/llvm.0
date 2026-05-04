Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4547B3DE44C;
	Mon,  4 May 2026 23:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938697; cv=none; b=FxjDZBuVRKqEsbuky3/nPUVJiqpsEHmj88jwIu0d+UjGpDM3b31YTa4ru1aFYiwgrgMntm/MiqffJ2CBm3lxAo6wfWVoARoZTiMWj+LoH6IPhDrpsOo1ewFMyFAXZU3PQMna0nxfWYqhXYvDoSW45AfI9tQVd5PSK9GqNHiiR6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938697; c=relaxed/simple;
	bh=OzNt4t1E1lWvuEosz42yQrrNtCy7qj3PJo/0Iqh5IKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fKNvhpa6gsrYIMVmMlNWrUJU7Br+3QJtfNtwEPjDjlcfjakFKzr4NWtgTQlI1mIsFN4/vw7KgcZxoGG1Kq+T4+ksbPHAbD+z3nO8IA1c8jTRdNv/A6qyQVFp45mjYqyR7VnL2MTy1YnNcdW6qywVR5M6gPgs7vwODv7eayJcUOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QX4oIrZJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QX4oIrZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777938696; x=1809474696;
  h=date:from:to:cc:subject:message-id;
  bh=OzNt4t1E1lWvuEosz42yQrrNtCy7qj3PJo/0Iqh5IKY=;
  b=QX4oIrZJwlBA8PHVuOoAUsP+j62ncxwv3XG4u9PjykmFufGgcLby2fUI
   /69iN97DHHcBBKOIJCLgs78K/LOgujL7RW/9gTkr2yvK0hNQyBDZCzaGK
   VbEIKD33Cb9TfLvoqrE1Bqj0nFRGAzVtGP1dqU5pM1OzussomKS9wPKDG
   jzjTlhelAM29I+gPasxQd1hYkRvOrZ66rGG6EVqgkROaIxgz/ueZsH4nW
   rvLxL+R4FZfrtGHjqQalFTho4lybok2Xjl9a1YZP0ltVEN1i9jYhEoD2B
   Wic2wlOGlZ8lfP98tDBQpSdHPrNVLNR8kKGa6i/sbbiDz2T928UExvpp1
   Q==;
X-CSE-ConnectionGUID: ERTy7cG4SZW6EAv1esOZ0A==
X-CSE-MsgGUID: WVy1Pd3PSUOTwwlprGYnYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82654441"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="82654441"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 16:51:35 -0700
X-CSE-ConnectionGUID: wHqg7XrnQYixtw+TlLyy6w==
X-CSE-MsgGUID: I/YGVSvTQEWdMV2/M8ubUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="231057872"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 May 2026 16:51:33 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK34N-00000000449-31nv;
	Mon, 04 May 2026 23:51:26 +0000
Date: Tue, 05 May 2026 07:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 MD Danish Anwar <danishanwar@ti.com>
Subject: [mda-next:icssg-dev 1/8] include/linux/if_hsr.h:58:12:
 error: call to undeclared function 'skb_ext_find'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202605050742.bDIpymJB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mda/linux-next.git icssg-dev
head:   a5d36e904451db02a17787219fd06b6d2ba16f1b
commit: 756ed4bc4a527cdddc3f9f09240637ceb3408645 [1/8] hsr: Allow to send a specific port and with HSR header
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260505/202605050742.bDIpymJB-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050742.bDIpymJB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605050742.bDIpymJB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/dsa/dsa.c:12:
>> include/linux/if_hsr.h:58:12: error: call to undeclared function 'skb_ext_find'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
                     ^
>> include/linux/if_hsr.h:58:30: error: use of undeclared identifier 'SKB_EXT_HSR'
           ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
                                       ^
   include/linux/if_hsr.h:71:12: error: call to undeclared function 'skb_ext_find'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
                     ^
   include/linux/if_hsr.h:71:30: error: use of undeclared identifier 'SKB_EXT_HSR'
           ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
                                       ^
   include/linux/if_hsr.h:85:12: error: call to undeclared function 'skb_ext_find'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
                     ^
   include/linux/if_hsr.h:85:30: error: use of undeclared identifier 'SKB_EXT_HSR'
           ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
                                       ^
>> include/linux/if_hsr.h:99:12: error: call to undeclared function 'skb_ext_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
                     ^
   include/linux/if_hsr.h:99:29: error: use of undeclared identifier 'SKB_EXT_HSR'
           ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
                                      ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
>> include/linux/skbuff.h:5060:7: error: conflicting types for 'skb_ext_add'
   void *skb_ext_add(struct sk_buff *skb, enum skb_ext_id id);
         ^
   include/linux/if_hsr.h:99:12: note: previous implicit declaration is here
           ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
                     ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
>> include/linux/skbuff.h:5105:21: error: conflicting types for 'skb_ext_find'
   static inline void *skb_ext_find(const struct sk_buff *skb, enum skb_ext_id id)
                       ^
   include/linux/if_hsr.h:58:12: note: previous implicit declaration is here
           ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
                     ^
   10 errors generated.


vim +/skb_ext_find +58 include/linux/if_hsr.h

    45	
    46	#if IS_ENABLED(CONFIG_HSR)
    47	extern bool is_hsr_master(struct net_device *dev);
    48	extern int hsr_get_version(struct net_device *dev, enum hsr_version *ver);
    49	struct net_device *hsr_get_port_ndev(struct net_device *ndev,
    50					     enum hsr_port_type pt);
    51	int hsr_get_port_type(struct net_device *hsr_dev, struct net_device *dev,
    52			      enum hsr_port_type *type);
    53	
    54	static inline bool hsr_skb_has_header(struct sk_buff *skb)
    55	{
    56		struct hsr_ptp_ext *ptp_ext;
    57	
  > 58		ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
    59		if (!ptp_ext)
    60			return false;
    61		return ptp_ext->header;
    62	}
    63	
    64	static inline unsigned int hsr_skb_has_port(struct sk_buff *skb)
    65	{
    66		struct hsr_ptp_ext *ptp_ext;
    67	
    68		if (!skb)
    69			return 0;
    70	
    71		ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
    72		if (!ptp_ext)
    73			return 0;
    74		return ptp_ext->port;
    75	}
    76	
    77	static inline bool hsr_skb_get_header_port(struct sk_buff *skb, bool *header,
    78						   enum hsr_port_type *port_type)
    79	{
    80		struct hsr_ptp_ext *ptp_ext;
    81	
    82		*port_type = HSR_PT_NONE;
    83		*header = false;
    84	
    85		ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
    86		if (!ptp_ext)
    87			return false;
    88	
    89		*port_type = ptp_ext->port;
    90		*header = ptp_ext->header;
    91		return true;
    92	}
    93	
    94	static inline bool hsr_skb_add_header_port(struct sk_buff *skb, bool header,
    95						   enum hsr_port_type port)
    96	{
    97		struct hsr_ptp_ext *ptp_ext;
    98	
  > 99		ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
   100		if (!ptp_ext)
   101			return false;
   102		ptp_ext->port = port;
   103		ptp_ext->header = header;
   104		return true;
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
