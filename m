Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A44AD4B;
	Sat, 10 May 2025 04:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746849698; cv=none; b=M2rIk5TwyCUD/tBzhog1GzxDsRpzHrqa2TRaLk2eKF9mEdycixiOaglrSNAOmdOQz0T9krO/+aLKcHhAdjMWimICN5IU6HA5MjQMVQUX21qVLR0xTzdMex/w6hylkijWQEaYfvpRZT1DOAgm4hEWPv8XVWMJwEqtTWTkV6UWxCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746849698; c=relaxed/simple;
	bh=hN/ueB/HP0xEVlHlwBdqdyWGAealcUReRlezlqDc3qI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvsmF99bkTBypzstbuuzpEZJdkSNeJLRByMZXzcFt+jzhtuzJk7d8amOar4Fh5858iPe+Vx5ezds9vABLMyjl6KcQd/50/1Z5tyX8mTGiyxtmIuHuAGw24K0imbyED9JA41FvO82y94TXYS/Oqpz8SDYrH/c4mlydj9OlefOECQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2xVwZL4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2xVwZL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746849697; x=1778385697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hN/ueB/HP0xEVlHlwBdqdyWGAealcUReRlezlqDc3qI=;
  b=c2xVwZL4TGgpAy5H6b2PFKOcako+sRXOQJWe3hN2rMT7UdRMM8v5uV24
   bP0ErKWGZFfZDJqpUdtkegiPOBB62MQnxb1uSKwFv1BDxjfylKg3fzkbF
   4pd1GrbRYoIUv/ORBDC3MkkrFuFIKaLCmYkNv6aHMyRKxWGWDb8pCObyc
   pRyVrNcEWFJyOtzSHHOlymBLPeZZYHI6BCtugcoFgIoKJ7kb2pU1J9hn4
   Cn39FPmmdYo/zZpzd40PDUVpDUsR5MPQKXIAVWJ+rXpiXYbCNGAUXbKBZ
   6ncJI/SDQ0vwG+NV+ngVRNM2g1PhCSSbGHyevrIkc+y6gafYylH6OkNQn
   A==;
X-CSE-ConnectionGUID: /gnvRizeRtS7zC2MfOI/vg==
X-CSE-MsgGUID: QfzqC0qQQ0Sic25Ad2yEbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59322527"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="59322527"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 21:01:34 -0700
X-CSE-ConnectionGUID: spLNKbEJQROlhz8yuex2Vw==
X-CSE-MsgGUID: SEGpIA1EQ/WYtNPQAQIWZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137296522"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2025 21:01:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDbP0-000Cm9-1j;
	Sat, 10 May 2025 04:01:30 +0000
Date: Sat, 10 May 2025 12:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-restrict-pi-bss-v3 3/3] ld.lld: error: Cannot export BSS
 symbol arm64_use_ng_mappings to startup code
Message-ID: <202505101127.pHhE89Tt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-restrict-pi-bss-v3
head:   479e663f2cdb5c7ea753bdb705630f6178622c36
commit: 479e663f2cdb5c7ea753bdb705630f6178622c36 [3/3] arm64/boot: Disallow BSS exports to startup code
config: arm64-randconfig-003-20250510 (https://download.01.org/0day-ci/archive/20250510/202505101127.pHhE89Tt-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101127.pHhE89Tt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101127.pHhE89Tt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
>> ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
>> ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
>> ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
>> ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
>> ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
