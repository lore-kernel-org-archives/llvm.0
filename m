Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795243231;
	b=ByEVmxs664DgV1SqJZyhb/1KwYaGPFNbwRDj1OmWO9r2GCS4UAux+zXw94IquyVOWarf
	 wuxEiAMCB0xDQqWLC1dyJV846KjvcEKHC9awtHQGiDxBV2hCsWtfFSRfs0O19VIXdgcjm
	 YawtnFOYhbQM0KhjEZ80HVN+eU97zPWaLYalnJz8fOeoySnh+JfO7PnibMdEElEXBsF1U
	 2M5K10zLQ5qeiDkq85GzIbqHBlcQbMbbtMcpu83DrIaC17m+uttnv1INEBzFneIPtLLpK
	 HAU+KggGF5mothsIkK3qho2OI6zGRxSBCsWLZdvzmEraQOcfC20q9APObxm8XqqHcsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795243231;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GfR2v1fGSa9v9se/HJxCvFiuQY7pRfOaUALW8dMW5xo=;
	b=bBADndbdO92Ah0cWVr+KStOKBWTGv8GdnnbEBnUrN2St+7Dfhe1LaZllx3mhpVSyj0oC
	 tbzIQXeeDw/HM5+7a90IqHcqkiitXPJDCFH3tKQf6Gso7Xvkq88Y9tVeowF53s9Y8TmWR
	 lw0qBJGuljdXbPhhjxtFq8qE+EFmLyBxz+ui2PpNf88tj5TxdsB/+b1w+12WbGyAiz8oy
	 +fkwaHUjy1w8x96OaBc2/ku+OUbSEFk9UkeKQZcARONVEJe1keu3Y4bAiT4ZBfMwDchhC
	 fedLMcjuJd1hejsgiTR9Jt0x+9er7hgc5r7yCTu5NHHcfRJVod5WcruzzhQ+El1dToQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=He3RIGn2;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8399606A336;
	Sat, 21 Nov 2026 06:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8399606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=He3RIGn2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795243229; x=1826779229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lXqQdPnha4TO9CYwKKw9/ZJtLWkYLbTSMEZ5e1gH13o=;
  b=He3RIGn2aGmSHOWCHUAoO+gDKSlBS3nJkwjBNcI1yf9D949EtM5nNRMN
   cogNbx5gpUZrHapUQw4BGcxbLu13OvwZ35Y3yDRNuO/trHngRuNY7Mbgk
   Qbp9gj7CQOUZYgxl+JPQYBEgvccCgI8XU/kNQmMPKLyg81fu0KfY3ZL50
   zAw5oAVJbOJyCgPRuklsmFIdgsky57jigJuF4uB+04BqB8yS6b72cOSjf
   h0Cq1IsmDmTu2U16ZIx5PxBOvTAg1/oNL6qhz7aq7dO0rtuDrab9PZ2bn
   yvA1Z4NeG1dIpQdhdWd1RVfOPv0msR2LsuEolnpspYIQKGA8hPTTpjTYX
   g==;
X-CSE-ConnectionGUID: KNTcBb0JTrupmGnVD896lg==
X-CSE-MsgGUID: yfCZdcdqRNa7I58FUoTgfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4008326"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4008326"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 22:40:28 -0800
X-CSE-ConnectionGUID: rlxJwrqURMesiLu8HC9kqA==
X-CSE-MsgGUID: uUviNHEoS22qRMv20VKWrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10948120"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Nov 2026 22:40:26 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUelq-00000001Jel-3uGH;
	Sat, 21 Nov 2026 06:40:22 +0000
Date: Sat, 21 Nov 2026 14:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: tumic@gpxsee.org, Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <monstr@monstr.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
Message-ID: <202611211451.jgdt0UvZ-lkp@intel.com>
References: <20261120172356.5858-2-tumic@gpxsee.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120172356.5858-2-tumic@gpxsee.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 65e4fd942f72a9dba0e4e257290c4fa1aa756854]

url:    https://github.com/intel-lab-lkp/linux/commits/tumic-gpxsee-org/dmaengine-xilinx-xdma-Fix-broken-PM-suspend-resume/20261120-182356
base:   65e4fd942f72a9dba0e4e257290c4fa1aa756854
patch link:    https://lore.kernel.org/r/20261120172356.5858-2-tumic%40gpxsee.org
patch subject: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM suspend/resume
config: i386-randconfig-1000-20261121 (https://download.01.org/0day-ci/archive/20261121/202611211451.jgdt0UvZ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611211451.jgdt0UvZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611211451.jgdt0UvZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma/xilinx/xdma.c:410 Excess function parameter 'xdev' description in 'xdma_reconfig_channels'
>> Warning: drivers/dma/xilinx/xdma.c:410 Excess function parameter 'xdev' description in 'xdma_reconfig_channels'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
