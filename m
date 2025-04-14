Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01227188733;
	Mon, 14 Apr 2025 01:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744595257; cv=none; b=sxaFCXiCkIBxyvtn09pDJOFX66e2hTrHiZuXPZ9Uw4SXkDuxXqhxL1kM62xBozXPDHqgsWy16CSxwr2zCGBgke4MfWIQ1LMA2bes/KobdMd99eTmBEItCVOhSyaaEKKjZGwQldmeqdAn0pwWLXCmncf/7TxUkLJKoBxOQfstQUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744595257; c=relaxed/simple;
	bh=hGpZ4YnrqnNzyUzb6jHplwNVeEYL0W4lTdXfFPG1Ptg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W2ApeX2WWUhYVDsMIlkWZD6GnO4lnZI2hk7Dt7XnQRkVjXnvCsoSKSK/36RwBLZQqkabAtGvZ5lwrwOnPPNznz/kl2TAh9HFJ8jhZ4U6yWlPZixC9DpDMa9ExTxoNV51AIDUElkaOyS3QN57FmeFkKQWfpqF65o+L1MX3tU7MTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaDGR+qh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaDGR+qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744595255; x=1776131255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hGpZ4YnrqnNzyUzb6jHplwNVeEYL0W4lTdXfFPG1Ptg=;
  b=kaDGR+qhS/ZGDqV45yNNSp5HnPGdi708kYokkhfN8BwsERdUpmKWWl7i
   oEjyxuX7vykba5VXVE0y/IwcDNj5ErdTGZt4cOunUs/cSfPWLrV0jpe1f
   /fXgTrnvXEePs8bhlRcp+zEb3HWtcAwpB7M6q6XpYr21ef5z7R5crrffM
   sKYSoHClAFBQqDpOEhTANKYo1aBnwO/SCEOFjy4BplUAKAb0KTlA5QZTg
   hkSBblavJ4iK/scCzr/23mi3svqk9qqZqUhIeQIf+l7DCeArMZDmnHZsK
   4vACd1FO3Cfmq0rXRg1mBSQY7mv7c45TYFfLtgfXOtQ9ZH9eTjNR7kD3b
   Q==;
X-CSE-ConnectionGUID: +mJjz02lSoq5TZGg2pF4CA==
X-CSE-MsgGUID: bhqltXZOSRSbNEX6ovIf4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="71437245"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="71437245"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 18:47:32 -0700
X-CSE-ConnectionGUID: ++LQVuLDT6eJN3uQf5TOPA==
X-CSE-MsgGUID: FGU8yX97Sy6yfg/9g93khw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134756978"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Apr 2025 18:47:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u48v3-000D66-0m;
	Mon, 14 Apr 2025 01:47:29 +0000
Date: Mon, 14 Apr 2025 09:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 16/16] mm/compaction.c:126:8: error: no
 member named 'compact_considered' in 'struct zone'
Message-ID: <202504140934.caN63YOu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   07b1b56f4f50e3b2ce6818d9ca0fbdbcd138d66f
commit: 07b1b56f4f50e3b2ce6818d9ca0fbdbcd138d66f [16/16] tmp
config: powerpc64-randconfig-001-20250414 (https://download.01.org/0day-ci/archive/20250414/202504140934.caN63YOu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504140934.caN63YOu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140934.caN63YOu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/compaction.c:126:8: error: no member named 'compact_considered' in 'struct zone'
     126 |         zone->compact_considered = 0;
         |         ~~~~  ^
>> mm/compaction.c:127:8: error: no member named 'compact_defer_shift' in 'struct zone'
     127 |         zone->compact_defer_shift++;
         |         ~~~~  ^
>> mm/compaction.c:129:20: error: no member named 'compact_order_failed' in 'struct zone'
     129 |         if (order < zone->compact_order_failed)
         |                     ~~~~  ^
   mm/compaction.c:130:9: error: no member named 'compact_order_failed' in 'struct zone'
     130 |                 zone->compact_order_failed = order;
         |                 ~~~~  ^
   mm/compaction.c:132:12: error: no member named 'compact_defer_shift' in 'struct zone'
     132 |         if (zone->compact_defer_shift > COMPACT_MAX_DEFER_SHIFT)
         |             ~~~~  ^
   mm/compaction.c:133:9: error: no member named 'compact_defer_shift' in 'struct zone'
     133 |                 zone->compact_defer_shift = COMPACT_MAX_DEFER_SHIFT;
         |                 ~~~~  ^
>> mm/compaction.c:135:2: error: call to undeclared function 'trace_mm_compaction_defer_compaction'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     135 |         trace_mm_compaction_defer_compaction(zone, order);
         |         ^
   mm/compaction.c:141:43: error: no member named 'compact_defer_shift' in 'struct zone'
     141 |         unsigned long defer_limit = 1UL << zone->compact_defer_shift;
         |                                            ~~~~  ^
   mm/compaction.c:143:20: error: no member named 'compact_order_failed' in 'struct zone'
     143 |         if (order < zone->compact_order_failed)
         |                     ~~~~  ^
   mm/compaction.c:147:14: error: no member named 'compact_considered' in 'struct zone'
     147 |         if (++zone->compact_considered >= defer_limit) {
         |               ~~~~  ^
   mm/compaction.c:148:9: error: no member named 'compact_considered' in 'struct zone'
     148 |                 zone->compact_considered = defer_limit;
         |                 ~~~~  ^
>> mm/compaction.c:152:2: error: call to undeclared function 'trace_mm_compaction_deferred'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     152 |         trace_mm_compaction_deferred(zone, order);
         |         ^
   mm/compaction.c:152:2: note: did you mean 'compaction_deferred'?
   mm/compaction.c:139:13: note: 'compaction_deferred' declared here
     139 | static bool compaction_deferred(struct zone *zone, int order)
         |             ^
     140 | {
     141 |         unsigned long defer_limit = 1UL << zone->compact_defer_shift;
     142 | 
     143 |         if (order < zone->compact_order_failed)
     144 |                 return false;
     145 | 
     146 |         /* Avoid possible overflow */
     147 |         if (++zone->compact_considered >= defer_limit) {
     148 |                 zone->compact_considered = defer_limit;
     149 |                 return false;
     150 |         }
     151 | 
     152 |         trace_mm_compaction_deferred(zone, order);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         compaction_deferred
   mm/compaction.c:166:9: error: no member named 'compact_considered' in 'struct zone'
     166 |                 zone->compact_considered = 0;
         |                 ~~~~  ^
   mm/compaction.c:167:9: error: no member named 'compact_defer_shift' in 'struct zone'
     167 |                 zone->compact_defer_shift = 0;
         |                 ~~~~  ^
   mm/compaction.c:169:21: error: no member named 'compact_order_failed' in 'struct zone'
     169 |         if (order >= zone->compact_order_failed)
         |                      ~~~~  ^
   mm/compaction.c:170:9: error: no member named 'compact_order_failed' in 'struct zone'
     170 |                 zone->compact_order_failed = order + 1;
         |                 ~~~~  ^
>> mm/compaction.c:172:2: error: call to undeclared function 'trace_mm_compaction_defer_reset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     172 |         trace_mm_compaction_defer_reset(zone, order);
         |         ^
   mm/compaction.c:172:2: note: did you mean 'compaction_defer_reset'?
   mm/compaction.c:162:6: note: 'compaction_defer_reset' declared here
     162 | void compaction_defer_reset(struct zone *zone, int order,
         |      ^
     163 |                 bool alloc_success)
     164 | {
     165 |         if (alloc_success) {
     166 |                 zone->compact_considered = 0;
     167 |                 zone->compact_defer_shift = 0;
     168 |         }
     169 |         if (order >= zone->compact_order_failed)
     170 |                 zone->compact_order_failed = order + 1;
     171 | 
     172 |         trace_mm_compaction_defer_reset(zone, order);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         compaction_defer_reset
>> mm/compaction.c:162:6: warning: no previous prototype for function 'compaction_defer_reset' [-Wmissing-prototypes]
     162 | void compaction_defer_reset(struct zone *zone, int order,
         |      ^
   mm/compaction.c:162:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     162 | void compaction_defer_reset(struct zone *zone, int order,
         | ^
         | static 
   mm/compaction.c:178:20: error: no member named 'compact_order_failed' in 'struct zone'
     178 |         if (order < zone->compact_order_failed)
         |                     ~~~~  ^
   mm/compaction.c:181:15: error: no member named 'compact_defer_shift' in 'struct zone'
     181 |         return zone->compact_defer_shift == COMPACT_MAX_DEFER_SHIFT &&
         |                ~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +126 mm/compaction.c

24e2716f63e613 Joonsoo Kim   2015-02-11  118  
24e2716f63e613 Joonsoo Kim   2015-02-11  119  /*
24e2716f63e613 Joonsoo Kim   2015-02-11  120   * Compaction is deferred when compaction fails to result in a page
860b32729a21e0 Alex Shi      2020-08-11  121   * allocation success. 1 << compact_defer_shift, compactions are skipped up
24e2716f63e613 Joonsoo Kim   2015-02-11  122   * to a limit of 1 << COMPACT_MAX_DEFER_SHIFT
24e2716f63e613 Joonsoo Kim   2015-02-11  123   */
2271b016bf368d Hui Su        2020-12-14  124  static void defer_compaction(struct zone *zone, int order)
24e2716f63e613 Joonsoo Kim   2015-02-11  125  {
24e2716f63e613 Joonsoo Kim   2015-02-11 @126  	zone->compact_considered = 0;
24e2716f63e613 Joonsoo Kim   2015-02-11 @127  	zone->compact_defer_shift++;
24e2716f63e613 Joonsoo Kim   2015-02-11  128  
24e2716f63e613 Joonsoo Kim   2015-02-11 @129  	if (order < zone->compact_order_failed)
24e2716f63e613 Joonsoo Kim   2015-02-11  130  		zone->compact_order_failed = order;
24e2716f63e613 Joonsoo Kim   2015-02-11  131  
24e2716f63e613 Joonsoo Kim   2015-02-11  132  	if (zone->compact_defer_shift > COMPACT_MAX_DEFER_SHIFT)
24e2716f63e613 Joonsoo Kim   2015-02-11  133  		zone->compact_defer_shift = COMPACT_MAX_DEFER_SHIFT;
24e2716f63e613 Joonsoo Kim   2015-02-11  134  
24e2716f63e613 Joonsoo Kim   2015-02-11 @135  	trace_mm_compaction_defer_compaction(zone, order);
24e2716f63e613 Joonsoo Kim   2015-02-11  136  }
24e2716f63e613 Joonsoo Kim   2015-02-11  137  
24e2716f63e613 Joonsoo Kim   2015-02-11  138  /* Returns true if compaction should be skipped this time */
2271b016bf368d Hui Su        2020-12-14  139  static bool compaction_deferred(struct zone *zone, int order)
24e2716f63e613 Joonsoo Kim   2015-02-11  140  {
24e2716f63e613 Joonsoo Kim   2015-02-11  141  	unsigned long defer_limit = 1UL << zone->compact_defer_shift;
24e2716f63e613 Joonsoo Kim   2015-02-11  142  
24e2716f63e613 Joonsoo Kim   2015-02-11  143  	if (order < zone->compact_order_failed)
24e2716f63e613 Joonsoo Kim   2015-02-11  144  		return false;
24e2716f63e613 Joonsoo Kim   2015-02-11  145  
24e2716f63e613 Joonsoo Kim   2015-02-11  146  	/* Avoid possible overflow */
62b35fe0eba21b Mateusz Nosek 2020-10-13  147  	if (++zone->compact_considered >= defer_limit) {
24e2716f63e613 Joonsoo Kim   2015-02-11  148  		zone->compact_considered = defer_limit;
24e2716f63e613 Joonsoo Kim   2015-02-11  149  		return false;
62b35fe0eba21b Mateusz Nosek 2020-10-13  150  	}
24e2716f63e613 Joonsoo Kim   2015-02-11  151  
24e2716f63e613 Joonsoo Kim   2015-02-11 @152  	trace_mm_compaction_deferred(zone, order);
24e2716f63e613 Joonsoo Kim   2015-02-11  153  
24e2716f63e613 Joonsoo Kim   2015-02-11  154  	return true;
24e2716f63e613 Joonsoo Kim   2015-02-11  155  }
24e2716f63e613 Joonsoo Kim   2015-02-11  156  
24e2716f63e613 Joonsoo Kim   2015-02-11  157  /*
24e2716f63e613 Joonsoo Kim   2015-02-11  158   * Update defer tracking counters after successful compaction of given order,
24e2716f63e613 Joonsoo Kim   2015-02-11  159   * which means an allocation either succeeded (alloc_success == true) or is
24e2716f63e613 Joonsoo Kim   2015-02-11  160   * expected to succeed.
24e2716f63e613 Joonsoo Kim   2015-02-11  161   */
24e2716f63e613 Joonsoo Kim   2015-02-11 @162  void compaction_defer_reset(struct zone *zone, int order,
24e2716f63e613 Joonsoo Kim   2015-02-11  163  		bool alloc_success)
24e2716f63e613 Joonsoo Kim   2015-02-11  164  {
24e2716f63e613 Joonsoo Kim   2015-02-11  165  	if (alloc_success) {
24e2716f63e613 Joonsoo Kim   2015-02-11  166  		zone->compact_considered = 0;
24e2716f63e613 Joonsoo Kim   2015-02-11  167  		zone->compact_defer_shift = 0;
24e2716f63e613 Joonsoo Kim   2015-02-11  168  	}
24e2716f63e613 Joonsoo Kim   2015-02-11  169  	if (order >= zone->compact_order_failed)
24e2716f63e613 Joonsoo Kim   2015-02-11  170  		zone->compact_order_failed = order + 1;
24e2716f63e613 Joonsoo Kim   2015-02-11  171  
24e2716f63e613 Joonsoo Kim   2015-02-11 @172  	trace_mm_compaction_defer_reset(zone, order);
24e2716f63e613 Joonsoo Kim   2015-02-11  173  }
24e2716f63e613 Joonsoo Kim   2015-02-11  174  

:::::: The code at line 126 was first introduced by commit
:::::: 24e2716f63e613cf15d3beba3faa0711bcacc427 mm/compaction: add tracepoint to observe behaviour of compaction defer

:::::: TO: Joonsoo Kim <iamjoonsoo.kim@lge.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
