Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DF272615;
	Sun, 25 May 2025 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748184658; cv=none; b=R10imW6RWqxNzE/BO+MQIZp2qjcKofoOpt/9HsJZmPQ1KkYLSEUAb9X002OC9rSz8lIcsx7rD2siR8k9AaSdDL+hhjz1iM53w5P7txFaaz2Zk+DCg6FVSQKy/DKkGDCw9wO7i/bC4dcUpz2/0hhADWh16rGLc5SCMxlLU23bXHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748184658; c=relaxed/simple;
	bh=05ZyPoMTwyo/bQ398sMbaCNOss044Kv8T9hXRIxMJYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dv9rzSabGPrxIg26GadVkkdqnE9c/7TK1dTiHFJdvnluMIyKzAzthmLhUGnTDI2XDU5bclKoRNoFF0GpMh86rm+nKx45MnkRuXqiHQ/9/gPsWyRrh17c1Aq1kpUE2E/KGWlHMqlHDsUQs8WcRZohscY4KySj92NP6mfhvEFOSfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QkeWErxN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QkeWErxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748184656; x=1779720656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=05ZyPoMTwyo/bQ398sMbaCNOss044Kv8T9hXRIxMJYU=;
  b=QkeWErxN/snOPHQiCnhd/Wrq+U8Uh6ENzuqpERNmXESy96rbmel9jHM1
   pZUprag1VOWsYREvMS2e1mHlXq3nUmTdq74KfjFIDOPZnjMWh5G3QG1P9
   1VVq60tqbtNP4Py83j0nftKotDDRL7O0gA2msgpX0bRqIUAxqYfOiK3yi
   aCrs0+01UbQicta/9zW5lwJUMpXpxgx3gZjXX69Ucnhhdk4m7GW4PmzpG
   QNlhqokS5EEkHHzGdyxBVV0gxROhSTBDC/TvmPSY9szUP1eEi7SHYs2dm
   RSbpHC3mTBfRC5uTsTlr0sUj6CNcqO6al75hkrdfZniej5dBC5yG8l9vh
   A==;
X-CSE-ConnectionGUID: bDyBQoNBQD+k28NxV9Sr6w==
X-CSE-MsgGUID: ULqTx+WjTtuMIoK8YOmr6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="72697120"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="72697120"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 07:50:56 -0700
X-CSE-ConnectionGUID: 4KKqQ3r0SnicQUBUlIfw9Q==
X-CSE-MsgGUID: wjRvK1UmS+ytvTdlYqXJ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="172900964"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 May 2025 07:50:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJCge-000RrU-2Q;
	Sun, 25 May 2025 14:50:52 +0000
Date: Sun, 25 May 2025 22:50:52 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_raid6_rvv_v5 71/73]
 drivers/acpi/apei/apei-base.c:578: warning: Function parameter or struct
 member 'access_bit_width' not described in 'arch_apei_ffh_read'
Message-ID: <202505252252.IrLUtlFg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_raid6_rvv_v5
head:   43edddc0c506de31b78ddf9074e7b2c057e668a7
commit: bbd0c6fe3c7a582057ffa9bb1366c7f699dcd006 [71/73] ACPI: APEI: add FFP support for APEI register access
config: i386-buildonly-randconfig-002-20250525 (https://download.01.org/0day-ci/archive/20250525/202505252252.IrLUtlFg-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505252252.IrLUtlFg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505252252.IrLUtlFg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/apei/apei-base.c:578: warning: Function parameter or struct member 'access_bit_width' not described in 'arch_apei_ffh_read'
>> drivers/acpi/apei/apei-base.c:592: warning: Function parameter or struct member 'access_bit_width' not described in 'arch_apei_ffh_write'


vim +578 drivers/acpi/apei/apei-base.c

   567	
   568	/**
   569	 * arch_apei_ffh_read() - Read FFH register
   570	 * @reg:	FFH encoded register information
   571	 * @val:	place holder for return value
   572	 *
   573	 * Read value from a specified encoded address
   574	 *
   575	 * Return: 0 for success and error code
   576	 */
   577	int __weak arch_apei_ffh_read(u64 reg, u64 *val, u32 access_bit_width)
 > 578	{
   579		return -ENOTSUPP;
   580	}
   581	
   582	/**
   583	 * arch_apei_ffh_write() - Write FFH register
   584	 * @reg:	FFH encoded register information
   585	 * @val:	value to write
   586	 *
   587	 * Write value to a specified address.
   588	 *
   589	 * Return: 0 for success and error code
   590	 */
   591	int __weak arch_apei_ffh_write(u64 reg, u64 val, u32 access_bit_width)
 > 592	{
   593		return -ENOTSUPP;
   594	}
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
