Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D652387364;
	Tue, 17 Mar 2026 20:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773779503; cv=none; b=ul2GdrLoT833vC4Xc0prLar5uLa4EdyHAGgRjjHB/TIIiwTCy8Pm29/kHycTMv0E0KOWhtzNniV0h8XiU33FbMsd+bEY/ncL+obmD2z0qQX/dgafq2DpQZQo+JFG71RAehBnuBhzXNVXbzRwQUgk2ViQpptvH+IyS0sdTnZnp/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773779503; c=relaxed/simple;
	bh=VE7Tb+bM7zGpB8HtR3p1/Sc+swRpMb3N7112NEZT4hk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UZ9+Rnsy3bIv+0yB0njOHfz728KWiDAQqjDx/SqJFi1OP0Pf2Ueptrirp6bK/WcorMlIL6VFASCKX6TCpYPf0PiIUNLuA+t9LngOilHIUQOuFaot0cHb+uTiE1bc6wZblXFVmCgZWmoqmMCPWb95IxtvCAROuGyS6n07n55SGUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOTod7o+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOTod7o+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773779502; x=1805315502;
  h=date:from:to:cc:subject:message-id;
  bh=VE7Tb+bM7zGpB8HtR3p1/Sc+swRpMb3N7112NEZT4hk=;
  b=nOTod7o+wyZekX6Eu3R1/t6S0cQG1LbInFUOLYx5NaDWcjzYierPq5s3
   qAitvRalE6wfNsQYWSCx4R2iVJRceyxzGwUeJISD5OCUpDewjIJ3nihDP
   lkpNjqQBupeXEa8tz+BBPwUi4rMPmj07q0F0iC7tpeB/nchA+gvgqLVeQ
   O8htgJaGNzyenXJixhzU6FLEhBG1hJ/hYMmPHjGskFB9MRGkVya6zNT58
   fNEppKPXbKp6WkzsBVM3tK56YH6VGykc9g7769qJ1jPCJeuBUuS/oCrfB
   DESfU6N714DBjU6RDRDvoVww1T8rv+MP4J0E2jEC8ecPIvNDAcruu1CkX
   g==;
X-CSE-ConnectionGUID: AaRmmbQdTBmUQzExjEM8Qg==
X-CSE-MsgGUID: KCuBF/S+QHuOgb2L/RQClA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85456534"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85456534"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 13:31:41 -0700
X-CSE-ConnectionGUID: L/J+OV/9REiJ9xZ1r10a9A==
X-CSE-MsgGUID: sa307hSwS7e9tDOkddtuog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="227058430"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2026 13:31:40 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2b4j-000000001xd-2dRn;
	Tue, 17 Mar 2026 20:31:37 +0000
Date: Wed, 18 Mar 2026 04:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 2/8]
 drivers/ptp/ptp_mock.c:142:11: warning: shift count >= width of type
Message-ID: <202603180414.SMx5OgLj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   226e6782e81c88b9263e006a356f58dd8c15bef5
commit: 2ace2e1df2b9de73d65c1a11bbb4183c42ba5752 [2/8] futex: Move futex related mm_struct data into a struct
config: powerpc64-randconfig-002-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180414.SMx5OgLj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180414.SMx5OgLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180414.SMx5OgLj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:27: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                                  ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/ptp/ptp_mock.c:11:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:10: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/ptp/ptp_mock.c:11:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     198 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/ptp/ptp_mock.c:11:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     211 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/ptp/ptp_mock.c:11:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     242 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/ptp/ptp_mock.c:11:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     255 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
>> drivers/ptp/ptp_mock.c:142:11: warning: shift count >= width of type [-Wshift-count-overflow]
     142 |                 .mask   = CYCLECOUNTER_MASK(64),
         |                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/timecounter.h:14:59: note: expanded from macro 'CYCLECOUNTER_MASK'
      14 | #define CYCLECOUNTER_MASK(bits) (u64)((bits) < 64 ? ((1ULL<<(bits))-1) : -1)
         |                                                           ^ ~~~~~~
   50 warnings and 1 error generated.


vim +142 drivers/ptp/ptp_mock.c

40b0425f8ba17c Vladimir Oltean 2023-08-07  117  
40b0425f8ba17c Vladimir Oltean 2023-08-07  118  struct mock_phc *mock_phc_create(struct device *dev)
40b0425f8ba17c Vladimir Oltean 2023-08-07  119  {
40b0425f8ba17c Vladimir Oltean 2023-08-07  120  	struct mock_phc *phc;
40b0425f8ba17c Vladimir Oltean 2023-08-07  121  	int err;
40b0425f8ba17c Vladimir Oltean 2023-08-07  122  
bf4afc53b77aea Linus Torvalds  2026-02-21  123  	phc = kzalloc_obj(*phc);
40b0425f8ba17c Vladimir Oltean 2023-08-07  124  	if (!phc) {
40b0425f8ba17c Vladimir Oltean 2023-08-07  125  		err = -ENOMEM;
40b0425f8ba17c Vladimir Oltean 2023-08-07  126  		goto out;
40b0425f8ba17c Vladimir Oltean 2023-08-07  127  	}
40b0425f8ba17c Vladimir Oltean 2023-08-07  128  
40b0425f8ba17c Vladimir Oltean 2023-08-07  129  	phc->info = (struct ptp_clock_info) {
40b0425f8ba17c Vladimir Oltean 2023-08-07  130  		.owner		= THIS_MODULE,
40b0425f8ba17c Vladimir Oltean 2023-08-07  131  		.name		= "Mock-up PTP clock",
40b0425f8ba17c Vladimir Oltean 2023-08-07  132  		.max_adj	= MOCK_PHC_MAX_ADJ_PPB,
40b0425f8ba17c Vladimir Oltean 2023-08-07  133  		.adjfine	= mock_phc_adjfine,
40b0425f8ba17c Vladimir Oltean 2023-08-07  134  		.adjtime	= mock_phc_adjtime,
40b0425f8ba17c Vladimir Oltean 2023-08-07  135  		.gettime64	= mock_phc_gettime64,
40b0425f8ba17c Vladimir Oltean 2023-08-07  136  		.settime64	= mock_phc_settime64,
40b0425f8ba17c Vladimir Oltean 2023-08-07  137  		.do_aux_work	= mock_phc_refresh,
40b0425f8ba17c Vladimir Oltean 2023-08-07  138  	};
40b0425f8ba17c Vladimir Oltean 2023-08-07  139  
40b0425f8ba17c Vladimir Oltean 2023-08-07  140  	phc->cc = (struct cyclecounter) {
40b0425f8ba17c Vladimir Oltean 2023-08-07  141  		.read	= mock_phc_cc_read,
40b0425f8ba17c Vladimir Oltean 2023-08-07 @142  		.mask	= CYCLECOUNTER_MASK(64),
40b0425f8ba17c Vladimir Oltean 2023-08-07  143  		.mult	= MOCK_PHC_CC_MULT,
40b0425f8ba17c Vladimir Oltean 2023-08-07  144  		.shift	= MOCK_PHC_CC_SHIFT,
40b0425f8ba17c Vladimir Oltean 2023-08-07  145  	};
40b0425f8ba17c Vladimir Oltean 2023-08-07  146  
40b0425f8ba17c Vladimir Oltean 2023-08-07  147  	spin_lock_init(&phc->lock);
40b0425f8ba17c Vladimir Oltean 2023-08-07  148  	timecounter_init(&phc->tc, &phc->cc, 0);
40b0425f8ba17c Vladimir Oltean 2023-08-07  149  
40b0425f8ba17c Vladimir Oltean 2023-08-07  150  	phc->clock = ptp_clock_register(&phc->info, dev);
40b0425f8ba17c Vladimir Oltean 2023-08-07  151  	if (IS_ERR(phc->clock)) {
40b0425f8ba17c Vladimir Oltean 2023-08-07  152  		err = PTR_ERR(phc->clock);
40b0425f8ba17c Vladimir Oltean 2023-08-07  153  		goto out_free_phc;
40b0425f8ba17c Vladimir Oltean 2023-08-07  154  	}
40b0425f8ba17c Vladimir Oltean 2023-08-07  155  
40b0425f8ba17c Vladimir Oltean 2023-08-07  156  	ptp_schedule_worker(phc->clock, MOCK_PHC_REFRESH_INTERVAL);
40b0425f8ba17c Vladimir Oltean 2023-08-07  157  
40b0425f8ba17c Vladimir Oltean 2023-08-07  158  	return phc;
40b0425f8ba17c Vladimir Oltean 2023-08-07  159  
40b0425f8ba17c Vladimir Oltean 2023-08-07  160  out_free_phc:
40b0425f8ba17c Vladimir Oltean 2023-08-07  161  	kfree(phc);
40b0425f8ba17c Vladimir Oltean 2023-08-07  162  out:
40b0425f8ba17c Vladimir Oltean 2023-08-07  163  	return ERR_PTR(err);
40b0425f8ba17c Vladimir Oltean 2023-08-07  164  }
40b0425f8ba17c Vladimir Oltean 2023-08-07  165  EXPORT_SYMBOL_GPL(mock_phc_create);
40b0425f8ba17c Vladimir Oltean 2023-08-07  166  

:::::: The code at line 142 was first introduced by commit
:::::: 40b0425f8ba17c32cf7182975032a3999c364dfc net: ptp: create a mock-up PTP Hardware Clock driver

:::::: TO: Vladimir Oltean <vladimir.oltean@nxp.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
