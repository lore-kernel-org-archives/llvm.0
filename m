Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C239D3783CA;
	Thu, 19 Mar 2026 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920726; cv=none; b=Utl7DK3yL6dHS+zCXWs2ZlswSDLz2yw94Fh/ouGSInusRnCJAwbyDVmsCAYseNvwWkrWtd2sfXpE2Q4OH2RR6IHna5nM2eMWYzpuEp1NpL/gphrxNwQRp7+t+ENC+1v5dJmaV3+J7oF1cIHbsEU1RPPCRFbxlr9gT4DHTSJQltE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920726; c=relaxed/simple;
	bh=V9PeQHG+J9/hfCBxtV3PFI1VLoNo23MIN/xtY1+w03U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krmJIEks89RZRw5389DgkujqXpuuQKL1EbCLy6eqFSp96o0fvlxq1p6UQwMde6VXM8/6YqXEq5N4MdlMqhdQQxjG6gI5YL3LlHnwaxhERP6C/rAxsfqBCbM6LSn1850TNJSyr88XQaBPEoux9v/dAczhXoD0Ai9f4lWAmSysiU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7U4UADd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7U4UADd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773920723; x=1805456723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V9PeQHG+J9/hfCBxtV3PFI1VLoNo23MIN/xtY1+w03U=;
  b=C7U4UADdaih0xq5LABlZbGG/xz5fjhgMytFo6YYZELMZXtYxApYHcd87
   AIVng7ByDwYgMYH8DJuANp6Ek0/D6qsBpU9DCGq9Rp5eZSBC7Mcwyle1z
   TABaOrOrOwF5QTKKA/kJrca9OEYkKplktpXkO+O1iN27o7HrN5yl4QOZl
   i2FBA3bJVGvH/67WPzyjJoZYbD9UtbWz19g57W8m9UU9Kf4Bj1VSYrz0r
   FvUdPQMhd+ylnyjcPmkRXOzBXeJT+gfBkn5LZEELEKtn+8bjF+ZYtyt83
   p6GnDWl9YQ6pgBQ4Q1nUZpLij2cvxo5WWwtSrsRHM81ObSFI1cMFbq9lR
   g==;
X-CSE-ConnectionGUID: WLgTRypySSSHSRFZwOAn1w==
X-CSE-MsgGUID: 3jIaSYmsQa+N1pYwn9piFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74874169"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74874169"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 04:45:23 -0700
X-CSE-ConnectionGUID: wbbZ3gjpTNqxjJxVG5x4oQ==
X-CSE-MsgGUID: Esg5765uRLSzoQtLgt5Ntw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="247246308"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Mar 2026 04:45:20 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3BoU-000000000tJ-0O1j;
	Thu, 19 Mar 2026 11:45:18 +0000
Date: Thu, 19 Mar 2026 19:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Eckert <fe@dev.tdt.de>, Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Florian Eckert <fe@dev.tdt.de>, Eckert.Florian@googlemail.com,
	ms@dev.tdt.de
Subject: Re: [PATCH 2/2] irqchip: Add Lightning Mountain irqchip support
Message-ID: <202603191903.MUNojwHX-lkp@intel.com>
References: <20260318-irq-intel-soc-msi-v1-2-0e8cdf844fa8@dev.tdt.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-irq-intel-soc-msi-v1-2-0e8cdf844fa8@dev.tdt.de>

Hi Florian,

kernel test robot noticed the following build errors:

[auto build test ERROR on f338e77383789c0cae23ca3d48adcc5e9e137e3c]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Eckert/dt-bindings-Add-Lightning-Mountain-MSI-interrupt-controller-bindings/20260319-033849
base:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
patch link:    https://lore.kernel.org/r/20260318-irq-intel-soc-msi-v1-2-0e8cdf844fa8%40dev.tdt.de
patch subject: [PATCH 2/2] irqchip: Add Lightning Mountain irqchip support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260319/202603191903.MUNojwHX-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191903.MUNojwHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191903.MUNojwHX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-intel-soc-msi.c:17:10: fatal error: 'asm/irqdomain.h' file not found
   #include <asm/irqdomain.h>
            ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +17 drivers/irqchip/irq-intel-soc-msi.c

    16	
  > 17	#include <asm/irqdomain.h>
    18	#include <asm/apic.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
