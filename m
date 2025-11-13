Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C27261B6D;
	Thu, 13 Nov 2025 21:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068932; cv=none; b=igyMtvvDY+GJWmyMvoMNPgC9w43ZomVvTv3SSZApQkaKa+G0o23F8cnbrOpSoC61S8YwXMUs6bxXAodc6W8udJ42NdVMkYXOCc25qWsUzBhRyJwqzrMbCrmeCXOxysMGEqJagsXt766KKl2wCeuGdtQji3Ee8QoHdpWCseNjKSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068932; c=relaxed/simple;
	bh=LmNIDg1AWpkxOoFj/PX48gObD5uAmkC3rTGxEv94XC0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dnx1FYPSEQvLnhY0WOUY5GSpEcTfe3//oPL3N9oCw2ahzfLaoFvql/zlFZ6vpROZYirqERVO/2s7m8WTAEbIhDorCGVXvOVfXFKk/ouCkrlm8z/ZxD/gf6nhsBaXUnqiLBgSzlZQgmfY1DDjKncRYJFmy/PGe21Kt8GEwBGdxBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1nWjIQB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1nWjIQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763068931; x=1794604931;
  h=date:from:cc:subject:message-id:mime-version;
  bh=LmNIDg1AWpkxOoFj/PX48gObD5uAmkC3rTGxEv94XC0=;
  b=R1nWjIQBnXmxecszYSl+apMgX8z9p/qh3UrbNVcB0zd2B4yUWngF+p8K
   59kC9XVghxJ4+ttzAOGxIBJF/qudJaQe6qu9WFTSSptgYl5+MiHMJ12uS
   HgVb/tRuKEBuJXBa/22Y8x0tHDQ1ZbWEAl7FTlQa+fXBCOjOEi9l4XrJ0
   TFBHQC91wxRZfZmXjP0WUonsDGcEwyxWsPXKgmG7DC7PkW8y5uvu843Kp
   HjaEn7viobkCskF88p7X06Y/qRnMnct8wH47FHf6akx3nJUkL8GeWrAPn
   zByucEa6GJcZWb9O0E+4vWB0uq9vEfQSVR/gPdI0ck06+mBWzqgwXkPkK
   g==;
X-CSE-ConnectionGUID: 9ebqwWtYTmC28MQh383xAQ==
X-CSE-MsgGUID: +MSFrJ9IT4aOxqxkRSBDZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65192905"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="65192905"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:22:11 -0800
X-CSE-ConnectionGUID: CvChm8M1TqOUrxji2AoShQ==
X-CSE-MsgGUID: becS0EHHSAix3Ml/kAxDag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="220240289"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2025 13:22:09 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJela-0005sp-0D;
	Thu, 13 Nov 2025 21:22:06 +0000
Date: Fri, 14 Nov 2025 05:21:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v3 1/3] dt-bindings: remoteproc: qcom: adsp: Add missing
 constrains for SDM660 ADSP
Message-ID: <202511140558.aJm7knAJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20251110-qcom-sdm660-cdsp-v3-1-cc3c37287e72@mainlining.org>
References: <20251110-qcom-sdm660-cdsp-v3-1-cc3c37287e72@mainlining.org>
TO: Nickolay Goppen <setotau@mainlining.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-remoteproc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: linux@mainlining.org
CC: Nickolay Goppen <setotau@mainlining.org>

Hi Nickolay,

kernel test robot noticed the following build errors:

[auto build test ERROR on 93f3bab4310d4ff73027cc4f87174284d4977acf]

url:    https://github.com/intel-lab-lkp/linux/commits/Nickolay-Goppen/dt-bindings-remoteproc-qcom-adsp-Add-missing-constrains-for-SDM660-ADSP/20251111-023908
base:   93f3bab4310d4ff73027cc4f87174284d4977acf
patch link:    https://lore.kernel.org/r/20251110-qcom-sdm660-cdsp-v3-1-cc3c37287e72%40mainlining.org
patch subject: [PATCH v3 1/3] dt-bindings: remoteproc: qcom: adsp: Add missing constrains for SDM660 ADSP
config: riscv-randconfig-002-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140558.aJm7knAJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140558.aJm7knAJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140558.aJm7knAJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(drivers/pinctrl/pinconf-generic.o):(function pinconf_generic_dump_pins: .text+0x48): relocation R_RISCV_HI20 out of range: 531972 is not in [-524288, 524287]; references 'conf_items'
   >>> referenced by pinconf-generic.c
   >>> defined in vmlinux.a(drivers/pinctrl/pinconf-generic.o)
--
>> ld.lld: error: vmlinux.a(drivers/pinctrl/pinconf-generic.o):(function pinconf_generic_dump_pins: .text+0xac): relocation R_RISCV_HI20 out of range: 538219 is not in [-524288, 524287]; references '.L__unnamed_1'
   >>> referenced by pinconf-generic.c
   >>> defined in vmlinux.a(drivers/pinctrl/pinconf-generic.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
