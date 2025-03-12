Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF323A997;
	Wed, 12 Mar 2025 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741784737; cv=none; b=q4W1I7emvEX1Y9OtvNEKH/WC3MvO2BfWS3ioPjEoUgXfsW4P9OL5gghjxFyUurAm9hXhl1I0DA6RBcpoKalLWbjUAiHmPZ9bvd5YolZZcRQ31Z8zBp8YpVBY5htbtz/3hV8MuG1WB+5sQg+f2jME6LeKUEbNoJGrUteNNDFi2H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741784737; c=relaxed/simple;
	bh=he6E5lxxPq4VJewVuE2Tq6r8+u3GsIYxHcWak46mRMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMi96uYtkY3nN7DCuh5lA1+g/33sN7ye3c+vRh8AAyVLsvx6mu8f2wBvb+gFDfcXBFwcTEoMCIKGFQmKHOZE0Noxllv/kogzY5JrQl7H1HiYat0gAWf2GoMinCo4C6ePeD57kHYNPSlLKUhun1CRSLO401Ql9eF7RCv5eB4Q5vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyuV0sHC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyuV0sHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741784736; x=1773320736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=he6E5lxxPq4VJewVuE2Tq6r8+u3GsIYxHcWak46mRMs=;
  b=hyuV0sHC4dg2PyIBMQRi+wsEZ71w6Y3XkOYb1tBp80Z3q9Tv+tqxJszo
   636ijtfPKN1MrjJrCHCnBNCkAkKHc2QDQtWZE1d9uF5+4pLPTA17zqMs2
   fBV0UOBOhdtzX6HZ3E1Zg32woHV1tBvw3zDfUydjZRjkUHI+htlzwDquI
   4VOfx0qGxbH+8Y7MZzhDBiZup1fKe8e5cWYL0wwpyXrzZ/q5mb9jh8rVU
   xJpzVV5y8dhHx0amFOhQpDEzwDmi8jkAJ4XrdOBo+gLHaG97LSjS1CuV6
   Oa9Za5FhZ+cTmCVJiWoIW9s0Dk3HnjTSoSG7CLUSw1s7i+UvRDJu8XlHo
   g==;
X-CSE-ConnectionGUID: VCuqreqkQAOyv0XhvmOx/Q==
X-CSE-MsgGUID: kZY3iZSPR9m0ziR5TXtwBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53509711"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="53509711"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 06:05:35 -0700
X-CSE-ConnectionGUID: ffrp5yvPSHitAqDcRs8AKg==
X-CSE-MsgGUID: 1M7+j/vVQkym13iBdhFelQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125275316"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2025 06:05:33 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsLm7-0008Xj-2G;
	Wed, 12 Mar 2025 13:05:31 +0000
Date: Wed, 12 Mar 2025 21:05:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 26/53] kernel/irq/chip.c:1160:46: error:
 expected ')'
Message-ID: <202503122032.WuoV43mt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   369c4f7fd7564a8952129a147cacf88cb4697c79
commit: 51edc4f39fa21403ccdc03ba52f323ce6a7e3cd4 [26/53] genirq/chip: Rework handle_fasteoi_ack_irq()
config: x86_64-buildonly-randconfig-001-20250312 (https://download.01.org/0day-ci/archive/20250312/202503122032.WuoV43mt-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503122032.WuoV43mt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503122032.WuoV43mt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/irq/chip.c:1160:46: error: expected ')'
    1160 |         if (unlikely(!irq_can_handle_actions(desc)) {
         |                                                     ^
   kernel/irq/chip.c:1160:5: note: to match this '('
    1160 |         if (unlikely(!irq_can_handle_actions(desc)) {
         |            ^
   1 error generated.


vim +1160 kernel/irq/chip.c

  1138	
  1139	#ifdef CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS
  1140	/**
  1141	 * handle_fasteoi_ack_irq - irq handler for edge hierarchy stacked on
  1142	 *			    transparent controllers
  1143	 *
  1144	 * @desc:	the interrupt description structure for this irq
  1145	 *
  1146	 * Like handle_fasteoi_irq(), but for use with hierarchy where the irq_chip
  1147	 * also needs to have its ->irq_ack() function called.
  1148	 */
  1149	void handle_fasteoi_ack_irq(struct irq_desc *desc)
  1150	{
  1151		struct irq_chip *chip = desc->irq_data.chip;
  1152	
  1153		guard(raw_spinlock)(&desc->lock);
  1154	
  1155		if (!irq_can_handle_pm(desc)) {
  1156			cond_eoi_irq(chip, &desc->irq_data);
  1157			return;
  1158		}
  1159	
> 1160		if (unlikely(!irq_can_handle_actions(desc)) {
  1161			mask_irq(desc);
  1162			cond_eoi_irq(chip, &desc->irq_data);
  1163			return;
  1164		}
  1165	
  1166		kstat_incr_irqs_this_cpu(desc);
  1167		if (desc->istate & IRQS_ONESHOT)
  1168			mask_irq(desc);
  1169	
  1170		desc->irq_data.chip->irq_ack(&desc->irq_data);
  1171	
  1172		handle_irq_event(desc);
  1173	
  1174		cond_unmask_eoi_irq(desc, chip);
  1175	}
  1176	EXPORT_SYMBOL_GPL(handle_fasteoi_ack_irq);
  1177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
