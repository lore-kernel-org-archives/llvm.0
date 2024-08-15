Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865083CF58;
	Thu, 15 Aug 2024 04:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723696201; cv=none; b=jOD5s4EIVRGi3SMDumHu1Afd3asS+2Xxmv0xATtUUD6gTQHldeBQmcD7UXEd+qxgefu/Y2e5XvGSxkBAqUgoFLqHAFqBergy/4PUWuhTlbUtjoqJM848mrgACG9ZnF+agOhy6/YM7yDgAkPvyLl1lMdF+9/vQ5fylAIJrEoW/Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723696201; c=relaxed/simple;
	bh=CPDaoJ64MA8oja2aEn10Ppdbuz5HP6TspRNHi2lAS8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbvspqfKacTR9Q13TLY6X26+OaILQEiM+rtlOIUX3bOWql24hy2oAfM0yUX+u9CmULob6I5azm2qw9lkSmHE9+iwTn7pPEWur1w/qip3TQpZ9vgl2O5lLj7n2d5FNkGrArAkRNfNO/k31N1UNgFX4gDttwwZmjxc5lq5n2ddEbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=do8+ZP8E; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="do8+ZP8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723696199; x=1755232199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CPDaoJ64MA8oja2aEn10Ppdbuz5HP6TspRNHi2lAS8U=;
  b=do8+ZP8EqkO8T7wHb59wic7xPCeqo+Z0w2AOutziohIabc8Xg9/771K1
   VP8iIpK7W8teiZ+82v9eZN6ijJdncl+bZzIZ45iVxG9B/AYpJgVMTe5LH
   GPEMamacCeIj4EsmtmHJ/C9iAs4iAGOvqDrJbwqSTVRiaGODV+6rywFX9
   rTuD6QfK14Oe7lekbaj1ALkHBl3CDB6QQpJqR8UQ3IXgf/sdPVK5cLJ9z
   LjD4rMXsnoYoM4qfRxJ1U8LJyjECr5tEOB1qj17Em0ewvqla8023/Ttb6
   mSfIx3UStixYQ+JSITwWpPUcm+GviopHAQ7X9uGkUZtSipbPizAk8GjfS
   A==;
X-CSE-ConnectionGUID: SaXJdaCyRlGGju+MjWLSaA==
X-CSE-MsgGUID: 3tf8+nKfR3+kDMACETGI0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22092476"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="22092476"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 21:29:57 -0700
X-CSE-ConnectionGUID: LoD3C6ZFSrWtdm3hdSgkOg==
X-CSE-MsgGUID: s3Oumv5gQ420Qx5fMd49xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="63394766"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Aug 2024 21:29:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seS7U-0003Bu-2y;
	Thu, 15 Aug 2024 04:29:52 +0000
Date: Thu, 15 Aug 2024 12:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shanker Donthineni <sdonthineni@nvidia.com>
Subject: Re: [PATCH] irqchip/gic-v3: Allow unused SGIs for drivers/modules
Message-ID: <202408151208.vuvL1AtV-lkp@intel.com>
References: <20240813033925.925947-1-sdonthineni@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813033925.925947-1-sdonthineni@nvidia.com>

Hi Shanker,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on tip/irq/core soc/for-next linus/master v6.11-rc3 next-20240814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shanker-Donthineni/irqchip-gic-v3-Allow-unused-SGIs-for-drivers-modules/20240814-221122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20240813033925.925947-1-sdonthineni%40nvidia.com
patch subject: [PATCH] irqchip/gic-v3: Allow unused SGIs for drivers/modules
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240815/202408151208.vuvL1AtV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151208.vuvL1AtV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151208.vuvL1AtV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:1658:26: error: use of undeclared identifier 'MAX_IPI'
                   if (fwspec->param[0] < MAX_IPI) {
                                          ^
   1 error generated.


vim +/MAX_IPI +1658 drivers/irqchip/irq-gic-v3.c

  1600	
  1601	static int gic_irq_domain_translate(struct irq_domain *d,
  1602					    struct irq_fwspec *fwspec,
  1603					    unsigned long *hwirq,
  1604					    unsigned int *type)
  1605	{
  1606		if (fwspec->param_count == 1 && fwspec->param[0] < 16) {
  1607			*hwirq = fwspec->param[0];
  1608			*type = IRQ_TYPE_EDGE_RISING;
  1609			return 0;
  1610		}
  1611	
  1612		if (is_of_node(fwspec->fwnode)) {
  1613			if (fwspec->param_count < 3)
  1614				return -EINVAL;
  1615	
  1616			switch (fwspec->param[0]) {
  1617			case 0:			/* SPI */
  1618				*hwirq = fwspec->param[1] + 32;
  1619				break;
  1620			case 1:			/* PPI */
  1621				*hwirq = fwspec->param[1] + 16;
  1622				break;
  1623			case 2:			/* ESPI */
  1624				*hwirq = fwspec->param[1] + ESPI_BASE_INTID;
  1625				break;
  1626			case 3:			/* EPPI */
  1627				*hwirq = fwspec->param[1] + EPPI_BASE_INTID;
  1628				break;
  1629			case GIC_IRQ_TYPE_LPI:	/* LPI */
  1630				*hwirq = fwspec->param[1];
  1631				break;
  1632			case GIC_IRQ_TYPE_PARTITION:
  1633				*hwirq = fwspec->param[1];
  1634				if (fwspec->param[1] >= 16)
  1635					*hwirq += EPPI_BASE_INTID - 16;
  1636				else
  1637					*hwirq += 16;
  1638				break;
  1639			default:
  1640				return -EINVAL;
  1641			}
  1642	
  1643			*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
  1644	
  1645			/*
  1646			 * Make it clear that broken DTs are... broken.
  1647			 * Partitioned PPIs are an unfortunate exception.
  1648			 */
  1649			WARN_ON(*type == IRQ_TYPE_NONE &&
  1650				fwspec->param[0] != GIC_IRQ_TYPE_PARTITION);
  1651			return 0;
  1652		}
  1653	
  1654		if (is_fwnode_irqchip(fwspec->fwnode)) {
  1655			if(fwspec->param_count != 2)
  1656				return -EINVAL;
  1657	
> 1658			if (fwspec->param[0] < MAX_IPI) {
  1659				pr_err(FW_BUG "Illegal GSI%d translation request\n",
  1660				       fwspec->param[0]);
  1661				return -EINVAL;
  1662			}
  1663	
  1664			*hwirq = fwspec->param[0];
  1665			*type = fwspec->param[1];
  1666	
  1667			WARN_ON(*type == IRQ_TYPE_NONE);
  1668			return 0;
  1669		}
  1670	
  1671		return -EINVAL;
  1672	}
  1673	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
