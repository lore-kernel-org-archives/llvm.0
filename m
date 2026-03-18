Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6613E33C18B;
	Wed, 18 Mar 2026 14:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843728; cv=none; b=fLPFc6IvuxgK8qQ93Ik4lljZcT6KtwJmAEQ4VaxshnDtqXIw4i8hgTFnlDn0pdZAGY0fYZnqQu+a0EemsfLAOl8zFqI6t2crb6Ev+NkLdOFjUx5kBiZvPyRRAyPrbh+c5TLrjugd4AJnCgd8MH/Q83H66R+z/k6CnL+I0va1DWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843728; c=relaxed/simple;
	bh=K0v5psOGTO05qgv6SffVuoO62hIETIQc7KL7+qgPRNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIyqSeXE8gurAZROeFiL/8FDsLo38Tv1zYD2NwsTRWELEokx+jIXJlRnE1vUE/bY6pyLXA+eppbPDj1KQgfWJp6TMOptmsdIlSh52puyYPN1IJ85zyMHKeopM+WpwpUTny82wGcVjgacurD0U1kAQgYCxba9DJlYYR2WtkCuEiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8Q5kjaq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8Q5kjaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773843728; x=1805379728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K0v5psOGTO05qgv6SffVuoO62hIETIQc7KL7+qgPRNY=;
  b=J8Q5kjaqpX9hK4hVLCZ9gGFnGcfjz8qO8IlGrYBINPBDe+oiCFReorRB
   MbXib9v6uPeRhyHmIiq6MUHmc2l+uGd9RBoKYk5184OeP3wSwl5GFtB4y
   fLMsVjPONqIi66MEwt7zUSuShqZbAW1Sb3BezRG8i9YcJOUy99fSV2SRZ
   NWfjef024xCMrt2AowCGsn5sH/H8UZP3qoTZY/+uFiLmq6JUdth/FSEaM
   o62Mrinrupka7hSEiAonTZGy4C40ezpgvRkPvITWRHTbimhHzaDm5WSiw
   zfqcJfR04bGTLPzACbBTcP9r0fUxv3pQA+dbO+Sn+gn1S9vzCIu2kENYo
   g==;
X-CSE-ConnectionGUID: CVJ1wInjTKCy444tlW6xxg==
X-CSE-MsgGUID: DOXBrq7OQiiaGRtJmcdaQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74786173"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74786173"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 07:22:07 -0700
X-CSE-ConnectionGUID: 5M2NYB78TyuWX1svxXTnfg==
X-CSE-MsgGUID: SeyISUm4SRyZV1WnIohN6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="245666296"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2026 07:22:03 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2rmZ-000000002zh-3swR;
	Wed, 18 Mar 2026 14:21:59 +0000
Date: Wed, 18 Mar 2026 22:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	vwadekar@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/8] firmware: smccc: lfa: Register DT interrupt
Message-ID: <202603182205.TOBMcP5F-lkp@intel.com>
References: <20260317103336.1273582-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317103336.1273582-8-andre.przywara@arm.com>

Hi Andre,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master nferre-at91/at91-next v7.0-rc4 next-20260317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Przywara/dt-bindings-arm-Add-Live-Firmware-Activation-binding/20260318-082717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260317103336.1273582-8-andre.przywara%40arm.com
patch subject: [PATCH v2 7/8] firmware: smccc: lfa: Register DT interrupt
config: arm64-randconfig-003-20260318 (https://download.01.org/0day-ci/archive/20260318/202603182205.TOBMcP5F-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182205.TOBMcP5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182205.TOBMcP5F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/lfa_fw.c:878:9: error: call to undeclared function 'devm_request_threaded_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     878 |         return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
         |                ^
>> drivers/firmware/smccc/lfa_fw.c:880:7: error: use of undeclared identifier 'IRQF_COND_ONESHOT'
     880 |                                          IRQF_COND_ONESHOT, NULL, NULL);
         |                                          ^~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/devm_request_threaded_irq +878 drivers/firmware/smccc/lfa_fw.c

   863	
   864	static int lfa_register_dt(struct device *dev)
   865	{
   866		struct device_node *np;
   867		unsigned int irq;
   868	
   869		np = of_find_compatible_node(NULL, NULL, "arm,lfa");
   870		if (!np)
   871			return -ENODEV;
   872	
   873		irq = irq_of_parse_and_map(np, 0);
   874		of_node_put(np);
   875		if (!irq)
   876			return -ENODEV;
   877	
 > 878		return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
   879						 lfa_irq_handler_thread,
 > 880						 IRQF_COND_ONESHOT, NULL, NULL);
   881	}
   882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
