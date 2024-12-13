Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E4E42A92;
	Fri, 13 Dec 2024 20:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734120763; cv=none; b=gTzNMJqPXGLG+6jmMRNrdsm4fIbfa8/s0MvCT6QnLWG5csZ4oGgZg4qcgS5H2mdUM+xvS+f1IpMylP14G7/ejPB/IwTuQFp7kujZL10+IC1lXgzhuyVLuV55+JQIDd/g7650on+zc+RGS/hjPpXkYfCYZja9m1B42nIEFEwxhCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734120763; c=relaxed/simple;
	bh=aTFuszXBB0a1HtdsFMWXGLwXjmWEeKAlUhNpsl2r6lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cMwdBymWVSr/T5/oHlTLqZVwgEU4L5bWI/FAZokKlgN1FbqlDET0+gZX/nj3GxBh+w9AGRpcVK4szNcJlVxnt6kmMiIppO2ZEvz9m1bmjXX6pH2p1XudGblSldSOnk+RCRyp2c1PlkWr7mwNENEPuWoGPOyzatZ0UeSxqgu3CDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtkxEwR2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtkxEwR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734120760; x=1765656760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aTFuszXBB0a1HtdsFMWXGLwXjmWEeKAlUhNpsl2r6lw=;
  b=BtkxEwR2kAoiZ8NY8PA/aiIlGD1HgsqOQO3DGAnkNzsGj2kj/FbL4RNB
   PIJKBCJhcDfuQcbHN1B0QEOg0Thl6ulyCIhS+OIKcqHsQLBcCjxVw0MgL
   D54k2E4gpJ4H8hRDiLBnT8aZ/hYE8AUaVkU/gNLIDFgX74X0/6uO+qUpF
   +r7HFCPaiZxRHynAzIizvpXt+cthvOy0yvfBkvQBxRZRXhQbDq2ZRU8Oi
   whKfXnVx023UU9ZUtWxfeSU+dFRRdumLgzHGJ+g252Oj3d3BDQ87JanVN
   pG5gl4ZQMYij5mKKNQ6HKzNLF9hGInV6HwlTYcIsdwAUHrpV3FN9KasMc
   w==;
X-CSE-ConnectionGUID: 6B2S7Pl1Q8WMuszr6kBmIQ==
X-CSE-MsgGUID: gQaLhPCHSJWn889Fii2Xzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34494150"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="34494150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 12:12:40 -0800
X-CSE-ConnectionGUID: SxoTImsPSCKBpyYdPsQnjA==
X-CSE-MsgGUID: 5286HLsBSvi3cZLgM+mSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101593107"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2024 12:12:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMC1c-000CON-1J;
	Fri, 13 Dec 2024 20:12:36 +0000
Date: Sat, 14 Dec 2024 04:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2603/3192] drivers/gpu/drm/xe/xe_irq.c:303:22:
 error: static assertion expression is not an integral constant expression
Message-ID: <202412140429.jB3uBYPX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4176cf5c5651c33769de83bb61b0287f4ec7719f
commit: 87ae2755f0b3171fc50a001ebf4ac1b38c7950f4 [2603/3192] build_bug.h: more user friendly error messages in BUILD_BUG_ON_ZERO()
config: arm-randconfig-002-20241214 (https://download.01.org/0day-ci/archive/20241214/202412140429.jB3uBYPX-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140429.jB3uBYPX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140429.jB3uBYPX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_irq.c:303:22: error: static assertion expression is not an integral constant expression
                   if (!(master_ctl & GT_DW_IRQ(bank)))
                                      ^~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/regs/xe_irq_regs.h:22:27: note: expanded from macro 'GT_DW_IRQ'
   #define   GT_DW_IRQ(x)                          REG_BIT(x)
                                                   ^~~~~~~~~~
   drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
                  BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
   #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
   #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                               ^~~~
   drivers/gpu/drm/xe/xe_irq.c:436:26: error: static assertion expression is not an integral constant expression
                   if ((master_tile_ctl & DG1_MSTR_TILE(tile->id)) == 0)
                                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/regs/xe_irq_regs.h:16:30: note: expanded from macro 'DG1_MSTR_TILE'
   #define   DG1_MSTR_TILE(t)                      REG_BIT(t)
                                                   ^~~~~~~~~~
   drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
                  BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
   #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
   #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                               ^~~~
   2 errors generated.
--
>> drivers/gpu/drm/xe/xe_reg_whitelist.c:139:22: error: static assertion expression is not an integral constant expression
           range_start = reg & REG_GENMASK(25, range_bit);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:49:9: note: expanded from macro 'REG_GENMASK'
                  BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
   #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
   #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                               ^~~~
   drivers/gpu/drm/xe/xe_reg_whitelist.c:140:28: error: static assertion expression is not an integral constant expression
           range_end = range_start | REG_GENMASK(range_bit, 0);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:49:9: note: expanded from macro 'REG_GENMASK'
                  BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
   #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
   #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                               ^~~~
   2 errors generated.
--
>> drivers/gpu/drm/xe/xe_gt_idle.c:127:33: error: static assertion expression is not an integral constant expression
                           gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/regs/xe_gt_regs.h:342:40: note: expanded from macro 'VDN_HCP_POWERGATE_ENABLE'
   #define   VDN_HCP_POWERGATE_ENABLE(n)           REG_BIT(3 + 2 * (n))
                                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
                  BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
   #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
   #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                               ^~~~
   drivers/gpu/drm/xe/xe_gt_idle.c:128:12: error: static assertion expression is not an integral constant expression
                                                        VDN_MFXVDENC_POWERGATE_ENABLE(j));
                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/regs/xe_gt_regs.h:343:44: note: expanded from macro 'VDN_MFXVDENC_POWERGATE_ENABLE'
   #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)      REG_BIT(4 + 2 * (n))
                                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
                  BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
   #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
   #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                               ^~~~
   2 errors generated.


vim +303 drivers/gpu/drm/xe/xe_irq.c

7e485d9816c134c Matt Roper             2023-06-01  288  
7e485d9816c134c Matt Roper             2023-06-01  289  static void gt_irq_handler(struct xe_tile *tile,
3e8e7ee6a375217 Francois Dugast        2023-07-17  290  			   u32 master_ctl, unsigned long *intr_dw,
dd08ebf6c3525a7 Matthew Brost          2023-03-30  291  			   u32 *identity)
dd08ebf6c3525a7 Matthew Brost          2023-03-30  292  {
7e485d9816c134c Matt Roper             2023-06-01  293  	struct xe_device *xe = tile_to_xe(tile);
a7945ef770dbabe Matt Roper             2024-09-10  294  	struct xe_mmio *mmio = &tile->mmio;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  295  	unsigned int bank, bit;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  296  	u16 instance, intr_vec;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  297  	enum xe_engine_class class;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  298  	struct xe_hw_engine *hwe;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  299  
dd08ebf6c3525a7 Matthew Brost          2023-03-30  300  	spin_lock(&xe->irq.lock);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  301  
dd08ebf6c3525a7 Matthew Brost          2023-03-30  302  	for (bank = 0; bank < 2; bank++) {
6b7ece97dd21d2b Matt Roper             2023-03-31 @303  		if (!(master_ctl & GT_DW_IRQ(bank)))
dd08ebf6c3525a7 Matthew Brost          2023-03-30  304  			continue;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  305  
7e485d9816c134c Matt Roper             2023-06-01  306  		intr_dw[bank] = xe_mmio_read32(mmio, GT_INTR_DW(bank));
dd08ebf6c3525a7 Matthew Brost          2023-03-30  307  		for_each_set_bit(bit, intr_dw + bank, 32)
7e485d9816c134c Matt Roper             2023-06-01  308  			identity[bit] = gt_engine_identity(xe, mmio, bank, bit);
7e485d9816c134c Matt Roper             2023-06-01  309  		xe_mmio_write32(mmio, GT_INTR_DW(bank), intr_dw[bank]);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  310  
dd08ebf6c3525a7 Matthew Brost          2023-03-30  311  		for_each_set_bit(bit, intr_dw + bank, 32) {
7e485d9816c134c Matt Roper             2023-06-01  312  			struct xe_gt *engine_gt;
7e485d9816c134c Matt Roper             2023-06-01  313  
6b7ece97dd21d2b Matt Roper             2023-03-31  314  			class = INTR_ENGINE_CLASS(identity[bit]);
6b7ece97dd21d2b Matt Roper             2023-03-31  315  			instance = INTR_ENGINE_INSTANCE(identity[bit]);
6b7ece97dd21d2b Matt Roper             2023-03-31  316  			intr_vec = INTR_ENGINE_INTR(identity[bit]);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  317  
7e485d9816c134c Matt Roper             2023-06-01  318  			engine_gt = pick_engine_gt(tile, class, instance);
7e485d9816c134c Matt Roper             2023-06-01  319  
3d2b5d4e28d9c58 Daniele Ceraolo Spurio 2023-08-17  320  			hwe = xe_gt_hw_engine(engine_gt, class, instance, false);
3d2b5d4e28d9c58 Daniele Ceraolo Spurio 2023-08-17  321  			if (hwe) {
3d2b5d4e28d9c58 Daniele Ceraolo Spurio 2023-08-17  322  				xe_hw_engine_handle_irq(hwe, intr_vec);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  323  				continue;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  324  			}
dd08ebf6c3525a7 Matthew Brost          2023-03-30  325  
3d2b5d4e28d9c58 Daniele Ceraolo Spurio 2023-08-17  326  			if (class == XE_ENGINE_CLASS_OTHER) {
87a4c85d3a3ed57 Vitaly Lubart          2023-08-28  327  				/* HECI GSCFI interrupts come from outside of GT */
87a4c85d3a3ed57 Vitaly Lubart          2023-08-28  328  				if (HAS_HECI_GSCFI(xe) && instance == OTHER_GSC_INSTANCE)
87a4c85d3a3ed57 Vitaly Lubart          2023-08-28  329  					xe_heci_gsc_irq_handler(xe, intr_vec);
87a4c85d3a3ed57 Vitaly Lubart          2023-08-28  330  				else
3d2b5d4e28d9c58 Daniele Ceraolo Spurio 2023-08-17  331  					gt_other_irq_handler(engine_gt, instance, intr_vec);
3d2b5d4e28d9c58 Daniele Ceraolo Spurio 2023-08-17  332  			}
dd08ebf6c3525a7 Matthew Brost          2023-03-30  333  		}
dd08ebf6c3525a7 Matthew Brost          2023-03-30  334  	}
dd08ebf6c3525a7 Matthew Brost          2023-03-30  335  
dd08ebf6c3525a7 Matthew Brost          2023-03-30  336  	spin_unlock(&xe->irq.lock);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  337  }
dd08ebf6c3525a7 Matthew Brost          2023-03-30  338  

:::::: The code at line 303 was first introduced by commit
:::::: 6b7ece97dd21d2b80a41f6192f89f8848c3b1d76 drm/xe/irq: Drop unnecessary GEN11_ and GEN12_ register prefixes

:::::: TO: Matt Roper <matthew.d.roper@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
