Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F4D40C5C2;
	Tue, 26 May 2026 15:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807818; cv=none; b=jylE8phGjlrXiP1pFVYDF9LZ0BhO0GkdgYPIWbVduN1Q/C9JEk+nBrtMA9S4+L1UYtJoTaH9ZgE6EmcG5QAlS4S/zwPi6l2yqTHBhyPDCOeQ/pciSO4Y7s9ZVxTETRzM67n//kRO1WkYzLn4RcehM47RWpKluH4Mpm4otv4670w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807818; c=relaxed/simple;
	bh=sVXxW3rg8epmcslgNSJHknSNJtWiTXU5HTcczWM/NKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XPkUAFNYVaRmlyOxW5CN8kgBeBuCft+zi9tNytrGusw3Kyoyah2ktWUuM0izw0Na9CWLVrQVddshcH31GEXJ1n0rOI7f++lQsH3lcI9whOF6AzgM37nc5w71sxKNvpj3LSvzkCdFbw/rddrUOPdtx5XtciEXrq3a9wx86Reod0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSzdoW26; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSzdoW26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779807816; x=1811343816;
  h=date:from:to:cc:subject:message-id;
  bh=sVXxW3rg8epmcslgNSJHknSNJtWiTXU5HTcczWM/NKY=;
  b=gSzdoW26HeRSaGg1Pjwzeo1h7WJAx6ldEM+Es1dmqx81048uzfwbda0l
   QLvd4ymaKY7UfZeEftD5Sw9Hc2Tfya+PG2FoEyJwJ6ParcgNWKZLRa2yu
   SfnnmMDq3Uq7UzgyqUVuiSM253H4hO2UqYfS5v6CWyjcsQpeemfFy0MBw
   AZY7acK0vM7sa9HHyr/j6Qur6G9HgwQMNeKMdZSL/k9RkpB+4Rly7Nhw6
   yWrqabePCm+1+yQkX1DYJ5Zo20x8saZJGDn20PuJyuz2hZY6GArkeLW+R
   YVo38K5++Elndt5CPvDA3k5sRAzmQP+vGNR07KVCuBateRRsSaGmoExkt
   A==;
X-CSE-ConnectionGUID: LeJtMuskR5ex5Qih6964uw==
X-CSE-MsgGUID: g6sh4tUiRUWZu6FgZsv+Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="98047347"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="98047347"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 08:03:35 -0700
X-CSE-ConnectionGUID: g4Pnux27To2YPoNrXEBhqg==
X-CSE-MsgGUID: b0uz09/kRI+bOOACNjQ4qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="240895117"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 May 2026 08:03:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRtJa-00000000CQT-487j;
	Tue, 26 May 2026 15:03:30 +0000
Date: Tue, 26 May 2026 17:02:52 +0200
From: kernel test robot <lkp@intel.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: ./usr/include/fwctl/bnxt.h:9:10: fatal error:
 'linux/sizes.h' file not found
Message-ID: <202605261748.IIRSd9Bf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pavan-Chebbi/fwctl-Add-driver_data-field-to-fwctl_rpc/20260522-160839
head:   d6ce23e99fb2a6800a2af4ebb99cdcc9e6b06f4f
commit: d6ce23e99fb2a6800a2af4ebb99cdcc9e6b06f4f fwctl/bnxt: add DMA buffer support for HWRM commands
date:   4 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260526/202605261748.IIRSd9Bf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261748.IIRSd9Bf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261748.IIRSd9Bf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/fwctl/bnxt.h:9:10: fatal error: 'linux/sizes.h' file not found
       9 | #include <linux/sizes.h>
         |          ^~~~~~~~~~~~~~~
   1 error generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
