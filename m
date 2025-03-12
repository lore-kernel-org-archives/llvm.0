Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA5F24FC1F;
	Wed, 12 Mar 2025 18:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741803279; cv=none; b=fLS7haICI/i+CdjqUQTV8La8QNngezjJ5NI+046zhMMZdmSASfkU1dW6PBe9Qpf90bkZH1I/p4fmrSdEZW7b+/tvVuDIVSkGuY3kHtrBAb6kJFLHV60GRAnV2D+aomsJ4qd35oitYRcsOirO9zi1bWjSK9j5cbVYorxKMLGVqSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741803279; c=relaxed/simple;
	bh=gk+7YvwSkCezDc01j33+ePoXK7tXNnjunpjM1DSIigg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YO1LEzYb/6YvP07SKPTeK3LhNZrebJ5bdsXyP83Af5AJZQkAOqGA8O1ptaAw3l6oQI8sBa0ODPNohddNYgn3LFzjW87qXT5WsBHXcs2r6Nj2SjEswnWo8bh4F3XLtvw/a2TZ9OXoNmfLL9odGzLrblOerWQa0+9S+eBqDbifDyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdjK0PZQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdjK0PZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741803278; x=1773339278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gk+7YvwSkCezDc01j33+ePoXK7tXNnjunpjM1DSIigg=;
  b=RdjK0PZQ+VJ29m2nd3l1TJ0VpYUsh4WmTPxjSv9hJrUlxKZlEZ9UdE9/
   dF9FwBiY0AxKGzR4G3x3OpP/GAcqC3n6Yjih2BFflP67TY5e8HGRHlTlG
   +zzIE3WG+of9lZbRntYevPhfGmCj0/4CuOs3ckyABPxrOfXFkeGrYkOr7
   GRNf4AbnYGcBLbQ8+0bEqwzEgScSuti36Y7YiCCfShWEJKOL5gU+ARIvI
   c5LtUEOGmmPZuFC5JgG9GcG7IHnAtShaTtYaLEybnEXwwnQ7ETr6pzWEL
   vC8hkrxTXtXVqHYdRV2JxvfdCHqr2vGKQv9PIIFKRAUH84n3wOI0cZwpz
   A==;
X-CSE-ConnectionGUID: 0u7QSn5GQZuIcD0bTtAYWQ==
X-CSE-MsgGUID: EAixNe9YRWu9WH9JMTht6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42758714"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="42758714"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 11:14:38 -0700
X-CSE-ConnectionGUID: mp+57j2oRZyHmvcco/+Amg==
X-CSE-MsgGUID: ZBKf8pHxQB+aTa4HuKj2vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="143906825"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2025 11:14:36 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsQbC-0008nU-0l;
	Wed, 12 Mar 2025 18:14:34 +0000
Date: Thu, 13 Mar 2025 02:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 6/53] drivers/irqchip/irq-bcm7120-l2.c:65:86:
 error: 'base' undeclared
Message-ID: <202503130259.FuwlJ8l6-lkp@intel.com>
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
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250313/202503130259.FuwlJ8l6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130259.FuwlJ8l6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130259.FuwlJ8l6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-bcm7120-l2.c: In function 'bcm7120_l2_intc_irq_handle':
>> drivers/irqchip/irq-bcm7120-l2.c:65:86: error: 'base' undeclared (first use in this function)
      65 |                 struct irq_chip_generic *gc = irq_get_domain_generic_chip(b->domain, base);
         |                                                                                      ^~~~
   drivers/irqchip/irq-bcm7120-l2.c:65:86: note: each undeclared identifier is reported only once for each function it appears in


vim +/base +65 drivers/irqchip/irq-bcm7120-l2.c

    54	
    55	static void bcm7120_l2_intc_irq_handle(struct irq_desc *desc)
    56	{
    57		struct bcm7120_l1_intc_data *data = irq_desc_get_handler_data(desc);
    58		struct bcm7120_l2_intc_data *b = data->b;
    59		struct irq_chip *chip = irq_desc_get_chip(desc);
    60		unsigned int idx;
    61	
    62		chained_irq_enter(chip, desc);
    63	
    64		for (idx = 0; idx < b->n_words; idx++) {
  > 65			struct irq_chip_generic *gc = irq_get_domain_generic_chip(b->domain, base);
    66			int base = idx * IRQS_PER_WORD;
    67			unsigned long pending;
    68			int hwirq;
    69	
    70			scoped_guard (raw_spinlock, &gc->lock) {
    71				pending = irq_reg_readl(gc, b->stat_offset[idx]) & gc->mask_cache &
    72					data->irq_map_mask[idx];
    73			}
    74	
    75			for_each_set_bit(hwirq, &pending, IRQS_PER_WORD)
    76				generic_handle_domain_irq(b->domain, base + hwirq);
    77		}
    78	
    79		chained_irq_exit(chip, desc);
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
