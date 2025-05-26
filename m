Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385E281741;
	Mon, 26 May 2025 02:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748225991; cv=none; b=b00WLSykMvECx6HgPUu8t1JvleFOaGqklKOcnuXUFSy9rs9jtQcrjWXPHoreYf+NGwBil3vTUNq5fbgwgPH6W3ZYcdSpy0QumuOs/oC6T3PMU37CGe6xMsoS/+GgkqV6WmQi6UZiH5BpINrRp9KDmDJFtswsggHgjEVJOMskQr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748225991; c=relaxed/simple;
	bh=GVc5dxDRX0yqjt6/WPm0WwGy+XnILKQ+76BXNP6znE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bnAatnNElZAygID8fjJH/pIrmpWD8L14t2nIDXv1r0BoFDbYw1e9FalOtCebS9ikTnDX/KveBglDklXm/Pb5+Uy/77UDDI0nC1jp+al2g+GlZRJ2hJZY9Y0P8E9llKRlvKBQYJ4HcRGfE82O+qWPHvCx6Aq4xeqx+PVWrOa7/C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGv5OjbX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGv5OjbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748225990; x=1779761990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GVc5dxDRX0yqjt6/WPm0WwGy+XnILKQ+76BXNP6znE4=;
  b=JGv5OjbX9GylMWEtKa6Gx+G4iddnl5kK1bXqgzk6YhzzJ3h6j4YalwlN
   N0TkZOEv/QDGMqlWFHtedeGmY4D1cNaTtpaurJ7QI69cE9IP55f1DdYRg
   L4TElRINqRkc6QJaI2jOSHKzLRd3+y81bg9GnrkqX1pBuk6rrGlcszvgM
   XSrq5WfZ0BYk13RFGk1I2S/Ak97JB7ykCNR72JZ3xTXVRVT7QJTc5uU7e
   KZu1FbnwlIbrzC34QN6t/gh13sYYnM1+QMNLh458M1UlAV3qqJk+ED7+z
   qBBSLAFBhLtENGweiBOPSilPZSOZgW0DuPoUgbtyY4cjFllWOU3u+jnGw
   g==;
X-CSE-ConnectionGUID: C/LvwLauQ2eKZbOI+VFbJw==
X-CSE-MsgGUID: mQXBuZYDTZGvM6lcsAwG9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50189575"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="50189575"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 19:19:50 -0700
X-CSE-ConnectionGUID: 6pNlnsGSSnihBsCyJ2PvHA==
X-CSE-MsgGUID: 8OeHmIprQP6X8MK3oQ7nJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="165352601"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 May 2025 19:19:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJNRJ-000S5U-2H;
	Mon, 26 May 2025 02:19:45 +0000
Date: Mon, 26 May 2025 10:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [linux-next:master 10876/13331] ld.lld: error: Cannot export BSS
 symbol _ctype to startup code
Message-ID: <202505261019.OUlitN6m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   176e917e010cb7dcc605f11d2bc33f304292482b
commit: 90530521079eec58b574341032a77746838874ee [10876/13331] arm64/boot: Disallow BSS exports to startup code
config: arm64-randconfig-002-20250526 (https://download.01.org/0day-ci/archive/20250526/202505261019.OUlitN6m-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505261019.OUlitN6m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505261019.OUlitN6m-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
   ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
   ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
   ld.lld: error: Cannot export BSS symbol cavium_erratum_27456_cpus to startup code
>> ld.lld: error: Cannot export BSS symbol _ctype to startup code
>> ld.lld: error: Cannot export BSS symbol swapper_pg_dir to startup code
>> ld.lld: error: Cannot export BSS symbol _etext to startup code
>> ld.lld: error: Cannot export BSS symbol __start_rodata to startup code
>> ld.lld: error: Cannot export BSS symbol __inittext_begin to startup code
>> ld.lld: error: Cannot export BSS symbol __inittext_end to startup code
>> ld.lld: error: Cannot export BSS symbol __initdata_begin to startup code
   ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
   ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
   ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
