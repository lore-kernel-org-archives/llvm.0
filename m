Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5E118FC61;
	Mon, 29 Jul 2024 22:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722293532; cv=none; b=RYdBQuiUxjHr56A/lEx4jNQYZIbDkbGMImF9NaAMWAeV2n/FgupjpNt2W8d6pWpIqLo52po6A2u59ByJIW2XVLn9aTJC/ZeQaADMiPT6XqRNwi6RgYD0T7edYO563k/23i9nZBpnwXPqXCHgN74w9ekqtK9O6bghaE0sOeVDb0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722293532; c=relaxed/simple;
	bh=ancUfdbymKu5ygqur2XdPXpMNAsblcqDSvNTOQNnBeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EAK9VGdtqV7UcTYftUeV7SsucIbQwiSjLdVWeR3MgjSdNWFtdW+urztVr7ALoR3W5dfchOFGGAsyl3t4ViVfORGi0KQ/U9ZIsx1GHomfOVsI5G0VndlheC3vYYYBMZXpovJIgVhMqbCZYCfEbXDCG4e3cS3TgpCtxkQwlgkPI+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zt2C0LJF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zt2C0LJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722293531; x=1753829531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ancUfdbymKu5ygqur2XdPXpMNAsblcqDSvNTOQNnBeE=;
  b=Zt2C0LJFaq5Ergkk+pOo4I0F74pLz8RhT0c2+Vwbq2OmN5LVHJL+2iFW
   tZKWYqn6aUY5rcceGzDwsi8NMiSrrLJaSLvx/EKMmlBEnfuJ75P8ACqW8
   6BqdO8qGkp66NpmTTyng7/iIvWHI1/FHkabInqGYMnw6VszsE9EkRedYe
   OHOJeD+12wyOTNeeX82GMe2EvYwjofDttsOMmVGgS4fccxRBx1RM+A53I
   i+6HZvlr5ZFiLAUYRxvi6//84NGLJfMhbgVK33PEI0t2pd4r0O4r/bEa4
   OBd2WhZFaMGeDow7WdBvWNUWOxL9UFxihjwbbdWDdA3K3JkQ3NIziJ8Cr
   w==;
X-CSE-ConnectionGUID: 3g6Nu6huTHGaqTL3CyNp6Q==
X-CSE-MsgGUID: etD/MOoQR1SQBjy3TFyzyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20228992"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20228992"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 15:52:08 -0700
X-CSE-ConnectionGUID: FPzRSpk3Ssur722Q8WBs3Q==
X-CSE-MsgGUID: j/maIhMDQ6CnZJZm4LxmBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54925186"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jul 2024 15:52:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYZDn-000s9i-2I;
	Mon, 29 Jul 2024 22:52:03 +0000
Date: Tue, 30 Jul 2024 06:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:irq/core 23/30] drivers/irqchip/irq-armada-370-xp.c:263:37:
 error: use of undeclared identifier 'd'
Message-ID: <202407300645.8EAO5dys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marek,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
head:   e626fcbaa9b67e4488ea437e0e8a5657e707d5f8
commit: f72976cd7f0e16639f29398d5fe5ab1b03789b42 [23/30] irqchip/armada-370-xp: Use consistent name for struct irq_data variables
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240730/202407300645.8EAO5dys-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300645.8EAO5dys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300645.8EAO5dys-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-armada-370-xp.c:263:37: error: use of undeclared identifier 'd'
           irq_data_update_effective_affinity(d, cpumask_of(cpu));
                                              ^
   1 error generated.


vim +/d +263 drivers/irqchip/irq-armada-370-xp.c

   250	
   251	static int mpic_msi_set_affinity(struct irq_data *irq_data, const struct cpumask *mask, bool force)
   252	{
   253		unsigned int cpu;
   254	
   255		if (!force)
   256			cpu = cpumask_any_and(mask, cpu_online_mask);
   257		else
   258			cpu = cpumask_first(mask);
   259	
   260		if (cpu >= nr_cpu_ids)
   261			return -EINVAL;
   262	
 > 263		irq_data_update_effective_affinity(d, cpumask_of(cpu));
   264	
   265		return IRQ_SET_MASK_OK;
   266	}
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
