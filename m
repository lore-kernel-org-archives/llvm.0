Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1214155757;
	Sat, 31 Jan 2026 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769868317; cv=none; b=j+L/9VLEocdr0FXSz6SI0hCNsTcupEnMzpTOax/H2GxkMVEYuj894TRoUSC5tRaVEcvUYF0dCisF5GHy443lZe3/DYkPzk1+Hnk9Px+7IXG5Iq12neoaPoAEwr5LuhTTsIcJHPWMXaxd7ruj9ayGYH0DCq4u+xvDJyprFUkokoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769868317; c=relaxed/simple;
	bh=Ey+OJhVw2NerzqvbFClDP/9Nqjz+1edbvqlInSXNrUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVgzJjsRBIIAGXXuhXJmDY77kX8x9z1j/223Zc07j7AMN/Hz91U2dxGE5w9IGmlXGQs0Nd6TrCMLDoQzsUVkrg6umJrZTmRtfH6Y1OPcff8X8MeV3i3eXACXsdwO88RHPhkSbvDkVO7VjZCikJ3EK1hQVJ115bqPnHIaHMrVP/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbVdQdYE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbVdQdYE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769868316; x=1801404316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ey+OJhVw2NerzqvbFClDP/9Nqjz+1edbvqlInSXNrUs=;
  b=AbVdQdYEql2Ii9Xkf44oVz491v9CNG9987nI5rB/ZR0ue+EMSTMzvxeN
   UPRa3MSEZzkFF1fCHo8b2CZwrHH7UMvhiquSn4OSW8DfSLoW34U0vjstt
   +NeQMJZDBxA/l6t0qc86xj7kbpJifRF1UjbJAey+9yjfqTe+VsU/4iwnh
   cqocinTvCNZz1rQUPRP//4yrlQd99gbE4nnlVuAbSLGjVtUsO7BIUT+K7
   6JuBWUfWjDncBMQSXaY3igMjL4rofN/ty+9+ilo+Dy+8KTEadBqn9nGZb
   jUYvnCVo9/8QHvB9Djd4cS/2BtU0fSyRcNHRprKtQwD6V6pLt1x0ZTiZo
   g==;
X-CSE-ConnectionGUID: gKoLI8XbT2aGtMX+gqfk1A==
X-CSE-MsgGUID: HCxHjf9hRguR5oyk5vGG3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="81831487"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="81831487"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 06:05:15 -0800
X-CSE-ConnectionGUID: rQg+inflTGOkpxo1O2PwwQ==
X-CSE-MsgGUID: cocOB4sJTBSkIg7M3RhFlg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jan 2026 06:05:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmBb3-00000000e5A-3ndo;
	Sat, 31 Jan 2026 14:05:09 +0000
Date: Sat, 31 Jan 2026 22:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 3/8] irqchip/loongson-pch-lpc: extract non-ACPI-related
 code from ACPI init
Message-ID: <202601312251.S1bOvHGe-lkp@intel.com>
References: <20260131094547.455916-4-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131094547.455916-4-zhengxingda@iscas.ac.cn>

Hi Icenowy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on robh/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.19-rc7 next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/genirq-reserve-NR_IRQS_LEGACY-IRQs-in-dynirq-by-default/20260131-175403
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260131094547.455916-4-zhengxingda%40iscas.ac.cn
patch subject: [PATCH 3/8] irqchip/loongson-pch-lpc: extract non-ACPI-related code from ACPI init
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260131/202601312251.S1bOvHGe-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601312251.S1bOvHGe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601312251.S1bOvHGe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-loongson-pch-lpc.c:232:18: warning: unused variable 'priv' [-Wunused-variable]
     232 |         struct pch_lpc *priv;
         |                         ^~~~
   1 warning generated.


vim +/priv +232 drivers/irqchip/irq-loongson-pch-lpc.c

   227	
   228	int __init pch_lpc_acpi_init(struct irq_domain *parent,
   229						struct acpi_madt_lpc_pic *acpi_pchlpc)
   230	{
   231		int parent_irq;
 > 232		struct pch_lpc *priv;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
