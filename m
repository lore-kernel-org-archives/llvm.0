Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4CB3A962E;
	Sun,  3 May 2026 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823761; cv=none; b=Z5KZ6mHtJ5J5rPsiF7UkIxM3K/a4I3TslO8tgpmbvWzuSYUXneR+QIhR5vsP6jrkIvFH0w65m4kTd6m+9VuYtvx0lY+TkD/SsbBHw47F0jJnndsp05gmuj/z4ddJ9CpwRU93rz7ZNVAshb9XaSNaVqEQ6+PmMZUUJ5/iqfxd5X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823761; c=relaxed/simple;
	bh=MWZqwsbHGr7j7GXaTkExAjOa2ACHcy8HNnr4E4WAbUw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oyojGeaHEVI0d/RRYXxp0VnSOTeVJN/hOXwU3BAxff4NesPcObMJCLWQJZ/bZWhmoYI9qRk0k8VuRtBfobDziduZXi6TgmqMMMCYQlsYZEvAkvtPgD6bUCEpMTkY7mjqfcBa5Q8CJlKDJDuAc4hyAF8AyGG3eVNBqCOGYy7itXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYaE6SpM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYaE6SpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777823760; x=1809359760;
  h=date:from:to:cc:subject:message-id;
  bh=MWZqwsbHGr7j7GXaTkExAjOa2ACHcy8HNnr4E4WAbUw=;
  b=gYaE6SpMSXVmLBAds/uWE2MMGn5xPsMOCl2zkEvS4r9IMl6H22BFnfQd
   /oWhHEAnSQz68w2dvNXFM35XuJBo7zdjRwiSSbnEmeX4HJr21JHc8B5+x
   JhFA/BK5n2nTuajt5nuyleDIXqBWI9iUJVcM1K4AVNgCQF/YcBNc41nfw
   OlvA6ieob4OrD6Gff/sFpi3vncqYflgcDuRhOEdIHD1O+hyrYVu38rwkY
   uZ6WbjjFaXNYCESjA3QA6N8QmLf5+e2UXRpeS9pX5eNbmNtOtcbnBg+tf
   a1Og7h6FdCUv2Gx021Ad8uCJp0v3cInTU6Ol0MW5ZZ8BCKOyWnzHmr974
   g==;
X-CSE-ConnectionGUID: wSp0R+YLSEKWPVGUenrBnA==
X-CSE-MsgGUID: Isf/0s23Sx211Pv0kvPCQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78565068"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78565068"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 08:55:58 -0700
X-CSE-ConnectionGUID: iPECDDK0RUWeVYm0ieKRtw==
X-CSE-MsgGUID: p6zeGrGnTumiCuYNVVHmCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="237089367"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 May 2026 08:55:56 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJZAg-000000002hZ-05Bp;
	Sun, 03 May 2026 15:55:54 +0000
Date: Sun, 03 May 2026 23:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 MD Danish Anwar <danishanwar@ti.com>
Subject: [mda-next:icssg-dev 1/8] include/linux/if_hsr.h:54:46:
 warning: declaration of 'struct sk_buff' will not be visible outside of this
 function
Message-ID: <202605032345.yoOw2A1g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mda/linux-next.git icssg-dev
head:   a5d36e904451db02a17787219fd06b6d2ba16f1b
commit: 756ed4bc4a527cdddc3f9f09240637ceb3408645 [1/8] hsr: Allow to send a specific port and with HSR header
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605032345.yoOw2A1g-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605032345.yoOw2A1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605032345.yoOw2A1g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/dsa/dsa.c:12:
>> include/linux/if_hsr.h:54:46: warning: declaration of 'struct sk_buff' will not be visible outside of this function [-Wvisibility]
      54 | static inline bool hsr_skb_has_header(struct sk_buff *skb)
         |                                              ^
   include/linux/if_hsr.h:58:12: error: call to undeclared function 'skb_ext_find'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      58 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                   ^
   include/linux/if_hsr.h:58:30: error: use of undeclared identifier 'SKB_EXT_HSR'
      58 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                                     ^
   include/linux/if_hsr.h:64:52: warning: declaration of 'struct sk_buff' will not be visible outside of this function [-Wvisibility]
      64 | static inline unsigned int hsr_skb_has_port(struct sk_buff *skb)
         |                                                    ^
   include/linux/if_hsr.h:71:12: error: call to undeclared function 'skb_ext_find'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      71 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                   ^
   include/linux/if_hsr.h:71:30: error: use of undeclared identifier 'SKB_EXT_HSR'
      71 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                                     ^
   include/linux/if_hsr.h:77:51: warning: declaration of 'struct sk_buff' will not be visible outside of this function [-Wvisibility]
      77 | static inline bool hsr_skb_get_header_port(struct sk_buff *skb, bool *header,
         |                                                   ^
   include/linux/if_hsr.h:85:12: error: call to undeclared function 'skb_ext_find'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      85 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                   ^
   include/linux/if_hsr.h:85:30: error: use of undeclared identifier 'SKB_EXT_HSR'
      85 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                                     ^
   include/linux/if_hsr.h:94:51: warning: declaration of 'struct sk_buff' will not be visible outside of this function [-Wvisibility]
      94 | static inline bool hsr_skb_add_header_port(struct sk_buff *skb, bool header,
         |                                                   ^
   include/linux/if_hsr.h:99:12: error: call to undeclared function 'skb_ext_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      99 |         ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
         |                   ^
   include/linux/if_hsr.h:99:29: error: use of undeclared identifier 'SKB_EXT_HSR'
      99 |         ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
         |                                    ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   include/linux/skbuff.h:5060:7: error: conflicting types for 'skb_ext_add'
    5060 | void *skb_ext_add(struct sk_buff *skb, enum skb_ext_id id);
         |       ^
   include/linux/if_hsr.h:99:12: note: previous implicit declaration is here
      99 |         ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
         |                   ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   include/linux/skbuff.h:5105:21: error: conflicting types for 'skb_ext_find'
    5105 | static inline void *skb_ext_find(const struct sk_buff *skb, enum skb_ext_id id)
         |                     ^
   include/linux/if_hsr.h:58:12: note: previous implicit declaration is here
      58 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                   ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:44:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:44:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:44:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];


vim +54 include/linux/if_hsr.h

    45	
    46	#if IS_ENABLED(CONFIG_HSR)
    47	extern bool is_hsr_master(struct net_device *dev);
    48	extern int hsr_get_version(struct net_device *dev, enum hsr_version *ver);
    49	struct net_device *hsr_get_port_ndev(struct net_device *ndev,
    50					     enum hsr_port_type pt);
    51	int hsr_get_port_type(struct net_device *hsr_dev, struct net_device *dev,
    52			      enum hsr_port_type *type);
    53	
  > 54	static inline bool hsr_skb_has_header(struct sk_buff *skb)
    55	{
    56		struct hsr_ptp_ext *ptp_ext;
    57	
    58		ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
    59		if (!ptp_ext)
    60			return false;
    61		return ptp_ext->header;
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
