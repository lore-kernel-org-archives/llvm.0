Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E1F175A71;
	Thu, 12 Mar 2026 04:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773290981; cv=none; b=kGaLRV8K4eIZbFZOf8xRzokZhJKJ3xTzJK59H7v57MnuuvbdeUrn1MPb2iDWE9pJMULCT3571QGFRbIcH1kEq/uVN/FohOzkBnJUCIFjaB7DiIVdB+ygCpF79gYCCQo5FEZ6zaZfX/3LCo3k7fsFqj1JBWkY3hrLCcUl6oJSoao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773290981; c=relaxed/simple;
	bh=i4TXlCmn0lYhTWGBihj98YA9bwv9EGYxBBB3KFQ1WBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NM3uSipihXwDGUd7lkydMtOGdWs7xgpqpsC56xBt3W5mew1aiVeF6/JK4c82uglIP9v69ue64bu5cUMEKaNRrzw30zZmQA0w90YHuFT0PU+9p4A2tR9tZ/xNttetPDlfX2EM7SgTmscdU0Gwi28kmPq5f7SXOuZzvco2B8QY318=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dU4BBmYq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dU4BBmYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773290980; x=1804826980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i4TXlCmn0lYhTWGBihj98YA9bwv9EGYxBBB3KFQ1WBQ=;
  b=dU4BBmYqakv6+gHz2IHmvQov6lZSI9n6gKPGGsxidFPWiFUaQPbuOxO9
   R1i+SQGUAdnmmzVW0l9+xWrJEn/7sOzQIzEr/XOlJUNQ8ctzA7gM/vAH8
   ApfIBfh6Fo+mNldW3uSZKluMqtQ5ogsQuhCVeNKRBN6BdvUUAqHYZ+EVp
   WJQBxOyHKKl3w78xGfsRl7I/EolyZ48S0kQzgAOTMMDOkxtNY26lrFUGd
   rnOAYnG44l43a5PyIAE3laRxgXHV8drYMty3CZptVYM9nZMJQmsl4r5uu
   4du40Ebf+v6mBEW4cziYjvBx9nG7sAIYndPY0poFiyh06FrP+X4gVGsql
   w==;
X-CSE-ConnectionGUID: Edw10mkvS++xq/nU1tWH8w==
X-CSE-MsgGUID: g2jASaczRVW7/pVuGQN3SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85001056"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="85001056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:49:37 -0700
X-CSE-ConnectionGUID: RTo+VvXsQXycu/R/k6BrYQ==
X-CSE-MsgGUID: FFkjzUA7Teqs9xPFcVH7dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="251193608"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Mar 2026 21:49:35 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0XzJ-0000000025P-03rO;
	Thu, 12 Mar 2026 04:49:33 +0000
Date: Thu, 12 Mar 2026 12:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v2 1/2] hsr: Allow to send a specific port
 and with HSR header
Message-ID: <202603121242.HfstfgPv-lkp@intel.com>
References: <20260309-hsr_ptp-v2-1-798262aad3a4@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-hsr_ptp-v2-1-798262aad3a4@linutronix.de>

Hi Sebastian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 3daa4f5dc6cc1ac1ab2f95b5b4c16bc5fb87f48f]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Andrzej-Siewior/hsr-Allow-to-send-a-specific-port-and-with-HSR-header/20260310-001021
base:   3daa4f5dc6cc1ac1ab2f95b5b4c16bc5fb87f48f
patch link:    https://lore.kernel.org/r/20260309-hsr_ptp-v2-1-798262aad3a4%40linutronix.de
patch subject: [PATCH RFC net-next v2 1/2] hsr: Allow to send a specific port and with HSR header
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260312/202603121242.HfstfgPv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121242.HfstfgPv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121242.HfstfgPv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from net/dsa/dsa.c:12:
>> include/linux/if_hsr.h:54:46: warning: declaration of 'struct sk_buff' will not be visible outside of this function [-Wvisibility]
      54 | static inline bool hsr_skb_has_header(struct sk_buff *skb)
         |                                              ^
>> include/linux/if_hsr.h:58:12: error: call to undeclared function 'skb_ext_find'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      58 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                   ^
>> include/linux/if_hsr.h:58:30: error: use of undeclared identifier 'SKB_EXT_HSR'
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
>> include/linux/if_hsr.h:99:12: error: call to undeclared function 'skb_ext_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      99 |         ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
         |                   ^
   include/linux/if_hsr.h:99:29: error: use of undeclared identifier 'SKB_EXT_HSR'
      99 |         ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
         |                                    ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
--
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:141:3: note: expanded from macro '_SIG_SET_BINOP'
     141 |                 r->sig[2] = op(a2, b2);                                 \
         |                 ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:27: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:10: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:20: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:3: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
>> include/linux/skbuff.h:5034:7: error: conflicting types for 'skb_ext_add'
    5034 | void *skb_ext_add(struct sk_buff *skb, enum skb_ext_id id);
         |       ^
   include/linux/if_hsr.h:99:12: note: previous implicit declaration is here
      99 |         ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
         |                   ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
>> include/linux/skbuff.h:5079:21: error: conflicting types for 'skb_ext_find'
    5079 | static inline void *skb_ext_find(const struct sk_buff *skb, enum skb_ext_id id)
         |                     ^
   include/linux/if_hsr.h:58:12: note: previous implicit declaration is here
      58 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                   ^
   32 warnings and 10 errors generated.


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
  > 54	static inline bool hsr_skb_has_header(struct sk_buff *skb)
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
  > 85		ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
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
