Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4726C23FC40;
	Wed, 12 Mar 2025 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741785985; cv=none; b=uUqlhruboxYbs+RJHrGb3jJXerdIMq6goa47yoCpdsfcNWn+a5K3vVUV0EjbQyFoBCEP9980iwgWJJ2Z7ubWQQyUt9wJGd0epVoQHOoacCm2N+1JsnIv2GHygFZdA747emrimmYjogVMhxrtXZlcHo8P/RncbAv1MhLn/Bz2J7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741785985; c=relaxed/simple;
	bh=9tUI7Rty5kVBQ8qCfzgsAMGpw1I1k7z0l9supDKSf1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pVEEG9sUHPwCdI7FEZPSfKHxG0yRJSMMTJl9ZmlT6JpsSm3IFz+Xb/xG7OjX/RFRil5NZtnOtbyZDA6hsgBCuazuAFESnDN6H7j7kzqo9ciDF+yHE92BdQ9nv19M4ZAS2qIVcmIsQk9KgplQYJDYUwc30lSDl1yoX5H4VxkTlXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBQo/C3T; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBQo/C3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741785985; x=1773321985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9tUI7Rty5kVBQ8qCfzgsAMGpw1I1k7z0l9supDKSf1c=;
  b=DBQo/C3TVxaGjdNQb3ykCwJk/p9/5+X5X7Ic+zaE7k7d9JkECcNt/Qky
   R0omKTQu51eRXRGbAe17lR3dyW+GEyh3Y4gnpJJL1D9giPLOO5VvhYKOm
   gLNTsOeSJuCKeb3X67f0U+Q2pAqzE6wnZuQKA1BgKp86jAfWowYbmCQAN
   gGzBX4ezLfU+HxwMU3dFelczWiWfpM1+uR5qUl6QAkcjGOInMS26jh7EC
   4RSDoUTg5RSQTDKn/qONE/4w4Nm6eVbL71XT+9pyIB5OpbqMHUfd0W7i/
   x2bX0xXzvYQVUV2TUCpdQFuS1k1hWfVGX/ElVrF/BipKIfae5lDnMvZp3
   g==;
X-CSE-ConnectionGUID: gmeDZfJURe650K9t//qpiQ==
X-CSE-MsgGUID: 5Cn7bx3DQ4u9lSqR/aCViA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53067976"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="53067976"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 06:26:22 -0700
X-CSE-ConnectionGUID: Q70T3im0QiWt5iWuypwj2g==
X-CSE-MsgGUID: 7+wfwTEPQfCexR8eSNVCrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="121545054"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 12 Mar 2025 06:26:20 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsM6D-0008Z3-22;
	Wed, 12 Mar 2025 13:26:17 +0000
Date: Wed, 12 Mar 2025 21:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 26/53] kernel/irq/chip.c:1160:53: error:
 expected ')' before '{' token
Message-ID: <202503122110.hmJXuTR5-lkp@intel.com>
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
config: csky-randconfig-002-20250312 (https://download.01.org/0day-ci/archive/20250312/202503122110.hmJXuTR5-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503122110.hmJXuTR5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503122110.hmJXuTR5-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq/chip.c: In function 'handle_fasteoi_ack_irq':
>> kernel/irq/chip.c:1160:53: error: expected ')' before '{' token
    1160 |         if (unlikely(!irq_can_handle_actions(desc)) {
         |            ~                                        ^
>> kernel/irq/chip.c:1175:1: error: expected expression before '}' token
    1175 | }
         | ^


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
> 1175	}
  1176	EXPORT_SYMBOL_GPL(handle_fasteoi_ack_irq);
  1177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
