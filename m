Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF4F425CDB;
	Tue, 28 Apr 2026 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379236; cv=none; b=cNUqGdOEii69/YuifKxETiCRZXPPkCh0o03nb+lfMk9Iya/ZraWlQkRytw6e+r4Jz17pIbRLXkBkxwGrnEmNVsll/ZEWayuRXTSSlXejpCHf7lUwOjuI2PknfY+3TnTIUDNdUh2jLN5W12yUPPZMkq6ul8zSNBGqds/LN1vILpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379236; c=relaxed/simple;
	bh=GjbDTjmNGRsH7M1fx+PTA5amLY16fGZA0VtSZlnhkHY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ezLfhBZ//aIfFNP0rc0J54iJgbotTMrcGDVrfEIHDJBkDpCkfO7YGtAw4ZZFPtMe5OtC2bnFUKBGTssor3w6AHJ6Ie/2cqOK0ylrVWxb8tf45f3S6wfMWIzt3uu7EyQ8LvU24qPODVMDySmJh831iVxgHJ9tZOVVlcmBfdYiYLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVOqqm8w; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVOqqm8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777379231; x=1808915231;
  h=date:from:to:cc:subject:message-id;
  bh=GjbDTjmNGRsH7M1fx+PTA5amLY16fGZA0VtSZlnhkHY=;
  b=NVOqqm8wTyp0YFAoFE/9787eRpDspFyJsnBcYDwpBHL7h7f0kmVPwsPk
   oxO+oRTNeocNOXv0iKbXzgwmdEk6fOuOTnrMOPt4Hc3GR2MXlQ+S1IFyl
   u6VEyVzla0gbmzU2HTvpitjM6JCsNVe0v6zp8IWi4cJLEj+jC5fo1pUUx
   Waf2VgLTPjaxTLzYy3vBJgG65J7WS1X9+yzGz4RqpFbEJ1PYJm2kOwk0v
   XJEKc7WOVMQe+X5oqFUQS1jip88fVOulWkZ11DanWQqFFAAjFBAGQi110
   sHRJ4Pzl6NQd0/dXlMTYhCxlw7X+8D0yZeMr8ECVabt7moEIE834IREbE
   g==;
X-CSE-ConnectionGUID: K4reWBZVQqCjnEWrRi7cqQ==
X-CSE-MsgGUID: K8B5vSsgSVKYthrsMWCJMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78201254"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="78201254"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 05:26:59 -0700
X-CSE-ConnectionGUID: RI7Ytv8dS3KrSQosCU6GfA==
X-CSE-MsgGUID: 8xu2PbubRh+NyajcZIRh9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="257260229"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 28 Apr 2026 05:26:57 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHhWg-000000004G5-40nK;
	Tue, 28 Apr 2026 12:26:54 +0000
Date: Tue, 28 Apr 2026 14:26:21 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/v6fix3 1/1] net/ipv6/exthdrs_core.c:77:38: error:
 no member named 'ipv6' in 'struct net'
Message-ID: <202604281446.TAY5yRhq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/v6fix3
head:   ae5e2d11c1576aabfe7b9ac6d4e340908c652813
commit: ae5e2d11c1576aabfe7b9ac6d4e340908c652813 [1/1] ipv6: Implement limits on extension header parsing
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260428/202604281446.TAY5yRhq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604281446.TAY5yRhq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604281446.TAY5yRhq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ipv6/exthdrs_core.c:77:38: error: no member named 'ipv6' in 'struct net'
      77 |         int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                    ~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:660:10: note: expanded from macro '__native_word'
     660 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> net/ipv6/exthdrs_core.c:77:38: error: no member named 'ipv6' in 'struct net'
      77 |         int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                    ~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:660:39: note: expanded from macro '__native_word'
     660 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> net/ipv6/exthdrs_core.c:77:38: error: no member named 'ipv6' in 'struct net'
      77 |         int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                    ~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:661:10: note: expanded from macro '__native_word'
     661 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> net/ipv6/exthdrs_core.c:77:38: error: no member named 'ipv6' in 'struct net'
      77 |         int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                    ~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:661:38: note: expanded from macro '__native_word'
     661 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> net/ipv6/exthdrs_core.c:77:38: error: no member named 'ipv6' in 'struct net'
      77 |         int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                    ~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> net/ipv6/exthdrs_core.c:77:38: error: no member named 'ipv6' in 'struct net'
      77 |         int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                    ~~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:635:53: note: expanded from macro '__unqual_scalar_typeof'
     635 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
>> net/ipv6/exthdrs_core.c:77:38: error: no member named 'ipv6' in 'struct net'
      77 |         int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                    ~~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   net/ipv6/exthdrs_core.c:197:38: error: no member named 'ipv6' in 'struct net'
     197 |         int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                    ~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:660:10: note: expanded from macro '__native_word'
     660 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   net/ipv6/exthdrs_core.c:197:38: error: no member named 'ipv6' in 'struct net'
     197 |         int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                    ~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:660:39: note: expanded from macro '__native_word'
     660 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   net/ipv6/exthdrs_core.c:197:38: error: no member named 'ipv6' in 'struct net'
     197 |         int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                    ~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:661:10: note: expanded from macro '__native_word'
     661 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   net/ipv6/exthdrs_core.c:197:38: error: no member named 'ipv6' in 'struct net'
     197 |         int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                    ~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:661:38: note: expanded from macro '__native_word'
     661 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   net/ipv6/exthdrs_core.c:197:38: error: no member named 'ipv6' in 'struct net'
     197 |         int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                    ~~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \


vim +77 net/ipv6/exthdrs_core.c

    28	
    29	/*
    30	 * Skip any extension headers. This is used by the ICMP module.
    31	 *
    32	 * Note that strictly speaking this conflicts with RFC 2460 4.0:
    33	 * ...The contents and semantics of each extension header determine whether
    34	 * or not to proceed to the next header.  Therefore, extension headers must
    35	 * be processed strictly in the order they appear in the packet; a
    36	 * receiver must not, for example, scan through a packet looking for a
    37	 * particular kind of extension header and process that header prior to
    38	 * processing all preceding ones.
    39	 *
    40	 * We do exactly this. This is a protocol bug. We can't decide after a
    41	 * seeing an unknown discard-with-error flavour TLV option if it's a
    42	 * ICMP error message or not (errors should never be send in reply to
    43	 * ICMP error messages).
    44	 *
    45	 * But I see no other way to do this. This might need to be reexamined
    46	 * when Linux implements ESP (and maybe AUTH) headers.
    47	 * --AK
    48	 *
    49	 * This function parses (probably truncated) exthdr set "hdr".
    50	 * "nexthdrp" initially points to some place,
    51	 * where type of the first header can be found.
    52	 *
    53	 * It skips all well-known exthdrs, and returns pointer to the start
    54	 * of unparsable area i.e. the first header with unknown type.
    55	 * If it is not NULL *nexthdr is updated by type/protocol of this header.
    56	 *
    57	 * NOTES: - if packet terminated with NEXTHDR_NONE it returns NULL.
    58	 *        - it may return pointer pointing beyond end of packet,
    59	 *	    if the last recognized header is truncated in the middle.
    60	 *        - if packet is truncated, so that all parsed headers are skipped,
    61	 *	    it returns NULL.
    62	 *	  - First fragment header is skipped, not-first ones
    63	 *	    are considered as unparsable.
    64	 *	  - Reports the offset field of the final fragment header so it is
    65	 *	    possible to tell whether this is a first fragment, later fragment,
    66	 *	    or not fragmented.
    67	 *	  - ESP is unparsable for now and considered like
    68	 *	    normal payload protocol.
    69	 *	  - Note also special handling of AUTH header. Thanks to IPsec wizards.
    70	 *
    71	 * --ANK (980726)
    72	 */
    73	
    74	int ipv6_skip_exthdr(const struct sk_buff *skb, int start, u8 *nexthdrp,
    75			     __be16 *frag_offp)
    76	{
  > 77		int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
    78		u8 nexthdr = *nexthdrp;
    79		int exthdr_cnt = 0;
    80	
    81		*frag_offp = 0;
    82	
    83		while (ipv6_ext_hdr(nexthdr)) {
    84			struct ipv6_opt_hdr _hdr, *hp;
    85			int hdrlen;
    86	
    87			if (nexthdr == NEXTHDR_NONE)
    88				return -1;
    89			if (unlikely(exthdr_cnt++ >= exthdr_max))
    90				return -1;
    91			hp = skb_header_pointer(skb, start, sizeof(_hdr), &_hdr);
    92			if (!hp)
    93				return -1;
    94			if (nexthdr == NEXTHDR_FRAGMENT) {
    95				__be16 _frag_off, *fp;
    96				fp = skb_header_pointer(skb,
    97							start+offsetof(struct frag_hdr,
    98								       frag_off),
    99							sizeof(_frag_off),
   100							&_frag_off);
   101				if (!fp)
   102					return -1;
   103	
   104				*frag_offp = *fp;
   105				if (ntohs(*frag_offp) & ~0x7)
   106					break;
   107				hdrlen = 8;
   108			} else if (nexthdr == NEXTHDR_AUTH)
   109				hdrlen = ipv6_authlen(hp);
   110			else
   111				hdrlen = ipv6_optlen(hp);
   112	
   113			nexthdr = hp->nexthdr;
   114			start += hdrlen;
   115		}
   116	
   117		*nexthdrp = nexthdr;
   118		return start;
   119	}
   120	EXPORT_SYMBOL(ipv6_skip_exthdr);
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
