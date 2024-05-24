Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2186374DD;
	Fri, 24 May 2024 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716573174; cv=none; b=CekAuP8kOWJbsoXGQjbfeUPPKpiQimfh8pRZ8O/oE5Cjx5PDn+g6sOAk1L7k4NS/0dP9YRuQLWrZabyzGD/J1ZGP2Kk9TpGUZ230doMBtjibjZdCRPEPdBc9Uahsc0bfF7KrZ90PI8pQrknIeFKJ+XShFvwwvAJ7nAtEGXvecPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716573174; c=relaxed/simple;
	bh=gM2vmDf8dC9d9CUlhtB1ylpjcKUoGr0OcNgDb7+ltCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+c+fRTmFpuUnnppdgZaulqNE40iDxada2tCatd+XcT1rgzxS6wbQBhcQaI3BO65mSlYUNaZI43CtmwH0P+LncyJqtXV2ipwf8QceGbEiMiaMts9IaR70cXyCs/pPSBLefX/+5ay8i40KTBD8bbotDHzMHUQsRWaY3gZiXG3Kkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eE9w9sXi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eE9w9sXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716573173; x=1748109173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gM2vmDf8dC9d9CUlhtB1ylpjcKUoGr0OcNgDb7+ltCA=;
  b=eE9w9sXikYQdTG/VFrP/yfPk98RIdKQ9wdQyAcczEyblyy0LbAJaENSk
   Fo5X0zvfbOo8q/OeLQ29Tn1EAdNlMVdoN8ea78dd3vTZzgMgexa2YnhfO
   MCKxSXUKFxVWIoS/pxWYKXVxyc15gA+ikzxHwnHSzUWEAPnLuwRFdMS1U
   ZCtCvf8L73hg1snNc2geQG5FnCbROoYrhCCl0ZyoAImXU5gYaGZo1Pux9
   h3BRITpDdFRIGDQUuszM744hXqFRWQRrrDmSlP8E109JL2S2FzX+CyfGt
   h4p/Vdc3lF4t52JecHtT7CzmzmF6FVhxCrwgyDeKPdlZ88RjQ9WQJX+H1
   g==;
X-CSE-ConnectionGUID: dDMXb6/bT8yshn+xJQppEg==
X-CSE-MsgGUID: zZE6JD9KRG2KwpairZdtEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30470830"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="30470830"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 10:52:52 -0700
X-CSE-ConnectionGUID: /0HdwtZgR3K5l2RI74InQQ==
X-CSE-MsgGUID: r+8wEr3nSA2FVy6VCDgFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34189834"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 May 2024 10:52:51 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAZ60-0005l5-2W;
	Fri, 24 May 2024 17:52:48 +0000
Date: Sat, 25 May 2024 01:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] clocksource: hyper-v: Enable the tsc_page for a TDX
 VM in TD mode
Message-ID: <202405250153.PPZyw5w9-lkp@intel.com>
References: <20240523022441.20879-1-decui@microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523022441.20879-1-decui@microsoft.com>

Hi Dexuan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/tdx]
[also build test ERROR on tip/x86/mm tip/x86/core linus/master v6.9 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dexuan-Cui/clocksource-hyper-v-Enable-the-tsc_page-for-a-TDX-VM-in-TD-mode/20240523-102623
base:   tip/x86/tdx
patch link:    https://lore.kernel.org/r/20240523022441.20879-1-decui%40microsoft.com
patch subject: [RFC PATCH] clocksource: hyper-v: Enable the tsc_page for a TDX VM in TD mode
config: i386-buildonly-randconfig-004-20240524 (https://download.01.org/0day-ci/archive/20240525/202405250153.PPZyw5w9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250153.PPZyw5w9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250153.PPZyw5w9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __start_bss_decrypted
   >>> referenced by mshyperv.c
   >>>               arch/x86/kernel/cpu/mshyperv.o:(ms_hyperv_init_platform) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __end_bss_decrypted
   >>> referenced by mshyperv.c
   >>>               arch/x86/kernel/cpu/mshyperv.o:(ms_hyperv_init_platform) in archive vmlinux.a
   >>> referenced by mshyperv.c
   >>>               arch/x86/kernel/cpu/mshyperv.o:(ms_hyperv_init_platform) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
