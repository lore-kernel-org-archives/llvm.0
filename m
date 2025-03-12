Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4286E1482F5;
	Wed, 12 Mar 2025 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741787839; cv=none; b=Rv4bsHgLZGU20UFLQNGR92SaykDW03D6QeRH++KHJdgjjCC4j26elKAkVqgBByONqiRfpVvtqH64qvtBH1yd7NQuu9atfGHK1VeNv3dnGMq78PqAGSAkBrsb0GGFaDv7l3qvyGI0QJAqB7V5bfc7jqOfC966fpgaT7XuHn7Wjyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741787839; c=relaxed/simple;
	bh=z2CHrxP+H1YjDPOMGTILJbPTKopIUBZ4tby0luumJwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e1+tqsoaMwYAfpv1iORZqILiRkB/49SAakHsTmNo3tAtxu2UlCJDzTPuxZnQO/dIOsoAKmnqaLcUSUD7zQYZJssOeYZFvND2uXzrBjuRi9pK3JUsjtIuHyhhofMqHbr9UsIAv4CF07w19jFBGw4HlqbDqvT/zQWQCNrdzfGDaCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLiVPcOH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLiVPcOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741787838; x=1773323838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2CHrxP+H1YjDPOMGTILJbPTKopIUBZ4tby0luumJwE=;
  b=jLiVPcOHaJadqAU/WoQ3tk2UQn0fTa4uGd/1X7FG0jOV0uirqkQRJpEH
   lt/eMCtzRUON2mISO/pmu+aoqG9mD2mGrD4kEfhcILXMGVVjLaNnlGMg3
   LIEaIrttVBxq8hlS1ReJxyGGVOPlBsyrzn2PLVBOhtXNXH3Y1EAmsP1OM
   qAFAJg/lRMONpkq1DQvHmYZsslcfcCIO/BJ36WQWJHaZWFau/KOZ5uoXQ
   0YONWsgSkYNkkIkjBjEbl9eNwLH7HAp2RB+IVThfW0i78sCvKywsmZQ8L
   7KTvtQiy24RII90m8e1xT0ugK4mdfMLcX5uadMTwW22vk43ltIW5nRZU4
   A==;
X-CSE-ConnectionGUID: tQTIW4f5SnKlm2QZ2aAqiw==
X-CSE-MsgGUID: JNOxNFcnRaKe1glsR5QpgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53858352"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="53858352"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 06:57:17 -0700
X-CSE-ConnectionGUID: TDW3lLd0R+a6F1raQkak7w==
X-CSE-MsgGUID: KuYikaP1Qv+d5Zws7VjsAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="124803479"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Mar 2025 06:57:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsMa9-0008ao-0M;
	Wed, 12 Mar 2025 13:57:13 +0000
Date: Wed, 12 Mar 2025 21:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 6/53] drivers/irqchip/irq-tb10x.c:48:59: error:
 'im' undeclared; did you mean 'tm'?
Message-ID: <202503122110.ifAog2e2-lkp@intel.com>
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
commit: 75b5ef045115fe0f58281089aedd60cb2e79efcc [6/53] irqchip: Convert generic irqchip locking to guards
config: arc-randconfig-002-20250312 (https://download.01.org/0day-ci/archive/20250312/202503122110.ifAog2e2-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503122110.ifAog2e2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503122110.ifAog2e2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-tb10x.c: In function 'tb10x_irq_set_type':
>> drivers/irqchip/irq-tb10x.c:48:59: error: 'im' undeclared (first use in this function); did you mean 'tm'?
      48 |         mod = ab_irqctl_readreg(gc, AB_IRQCTL_SRC_MODE) | im;
         |                                                           ^~
         |                                                           tm
   drivers/irqchip/irq-tb10x.c:48:59: note: each undeclared identifier is reported only once for each function it appears in


vim +48 drivers/irqchip/irq-tb10x.c

b06eb0173ef1d93 Christian Ruppert 2013-06-25  40  
b06eb0173ef1d93 Christian Ruppert 2013-06-25  41  static int tb10x_irq_set_type(struct irq_data *data, unsigned int flow_type)
b06eb0173ef1d93 Christian Ruppert 2013-06-25  42  {
b06eb0173ef1d93 Christian Ruppert 2013-06-25  43  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
75b5ef045115fe0 Thomas Gleixner   2025-03-12  44  	uint32_t mod, pol = data->mask;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  45  
75b5ef045115fe0 Thomas Gleixner   2025-03-12  46  	guard(raw_spinlock)(&gc->lock);
b06eb0173ef1d93 Christian Ruppert 2013-06-25  47  
b06eb0173ef1d93 Christian Ruppert 2013-06-25 @48  	mod = ab_irqctl_readreg(gc, AB_IRQCTL_SRC_MODE) | im;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  49  	pol = ab_irqctl_readreg(gc, AB_IRQCTL_SRC_POLARITY) | im;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  50  
b06eb0173ef1d93 Christian Ruppert 2013-06-25  51  	switch (flow_type & IRQF_TRIGGER_MASK) {
b06eb0173ef1d93 Christian Ruppert 2013-06-25  52  	case IRQ_TYPE_EDGE_FALLING:
b06eb0173ef1d93 Christian Ruppert 2013-06-25  53  		pol ^= im;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  54  		break;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  55  	case IRQ_TYPE_LEVEL_HIGH:
b06eb0173ef1d93 Christian Ruppert 2013-06-25  56  		mod ^= im;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  57  		break;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  58  	case IRQ_TYPE_NONE:
b06eb0173ef1d93 Christian Ruppert 2013-06-25  59  		flow_type = IRQ_TYPE_LEVEL_LOW;
a6992bbe9774e04 Randy Dunlap      2021-04-21  60  		fallthrough;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  61  	case IRQ_TYPE_LEVEL_LOW:
b06eb0173ef1d93 Christian Ruppert 2013-06-25  62  		mod ^= im;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  63  		pol ^= im;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  64  		break;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  65  	case IRQ_TYPE_EDGE_RISING:
b06eb0173ef1d93 Christian Ruppert 2013-06-25  66  		break;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  67  	default:
75b5ef045115fe0 Thomas Gleixner   2025-03-12  68  		pr_err("%s: Cannot assign multiple trigger modes to IRQ %d.\n",	__func__, data->irq);
b06eb0173ef1d93 Christian Ruppert 2013-06-25  69  		return -EBADR;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  70  	}
b06eb0173ef1d93 Christian Ruppert 2013-06-25  71  
b06eb0173ef1d93 Christian Ruppert 2013-06-25  72  	irqd_set_trigger_type(data, flow_type);
b06eb0173ef1d93 Christian Ruppert 2013-06-25  73  	irq_setup_alt_chip(data, flow_type);
b06eb0173ef1d93 Christian Ruppert 2013-06-25  74  
b06eb0173ef1d93 Christian Ruppert 2013-06-25  75  	ab_irqctl_writereg(gc, AB_IRQCTL_SRC_MODE, mod);
b06eb0173ef1d93 Christian Ruppert 2013-06-25  76  	ab_irqctl_writereg(gc, AB_IRQCTL_SRC_POLARITY, pol);
b06eb0173ef1d93 Christian Ruppert 2013-06-25  77  	ab_irqctl_writereg(gc, AB_IRQCTL_INT_STATUS, im);
b06eb0173ef1d93 Christian Ruppert 2013-06-25  78  	return IRQ_SET_MASK_OK;
b06eb0173ef1d93 Christian Ruppert 2013-06-25  79  }
b06eb0173ef1d93 Christian Ruppert 2013-06-25  80  

:::::: The code at line 48 was first introduced by commit
:::::: b06eb0173ef1d9366d14b4ca3e8e38dc72b03e8b irqchip: Add TB10x interrupt controller driver

:::::: TO: Christian Ruppert <christian.ruppert@abilis.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
