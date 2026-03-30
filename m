Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197140DFAE;
	Mon, 30 Mar 2026 00:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774829113; cv=none; b=Ynw0qBLf6TIunNrKqBqVUfAWd43gg1TAo17KvoXEFHMEf1373mCpdgLNLqe8vpsdr0E6fp8TPmP7OiJ6pZAHMOnYtKrWJ+Cs4zh+8LwHtuCdO/zG3eTyHDXMz9RdesFJSNIGJqfcIXdvK/1q+Drup0UqyP+/6NFI3yQ6C5Ky/Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774829113; c=relaxed/simple;
	bh=10jKwDYbPp2OkY7meanyQGBSjTWID7IQJ58RZhOSqrI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mGpILmEZLMJh4gnIFx3vWIha1lNG+JQpTy81x2yH82Rv3VaQ3mWArbi9Yzg7uTO8mGpPnb41b8+xB5KWUDbknRGZZVjKCkCe8P9T2sk6GjkMzIzNuv9Fj/vb+DYCNPfrmZGsY5V8JZDVP6MUAOJO4cRBQBUMydZ9YC1kZK5e8O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMbtj/OC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMbtj/OC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774829110; x=1806365110;
  h=date:from:to:cc:subject:message-id;
  bh=10jKwDYbPp2OkY7meanyQGBSjTWID7IQJ58RZhOSqrI=;
  b=SMbtj/OCxfvSoiCwtytv9E3/GUhtpo/mthYAN644Eegc0RzFkDsrfLuj
   rnrufFM5ZzzdDmTHFv9TJO2hCU1moGDlkgJnzou8pW+TH48OdfpVU/IDY
   ZfLGyNbG0zLWbexTnQWFZiQ4k5RfMs89P++H3QulNZwQsrqqcYmqwFHV0
   hbr8++FzLgNrDqYtPiaCkd3XDrHyvwYNs8gwFT3eP4rnqtaAwP/z9PYnB
   uKA9x5bGzQgtszWlBI1jyAdz2Vpt+/2ZAJA0rJEpLeix4bGbL8DzE5qEQ
   E6ixQzwpam4zOAxThHybA1PMvjoqmEWQn9x1BdLhY7ckVqeqWt5CKhaWt
   A==;
X-CSE-ConnectionGUID: D0qkzgmyQCCmMUiXNZs7EA==
X-CSE-MsgGUID: VAbPm1xbR/qNUoklMG57nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75705457"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="75705457"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 17:05:09 -0700
X-CSE-ConnectionGUID: ziHHrhLXRQqWInF2bQOcpA==
X-CSE-MsgGUID: 9QeghE2nRs2mle7He3igTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="256395421"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Mar 2026 17:05:07 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w707s-000000000Pv-2LBj;
	Mon, 30 Mar 2026 00:05:04 +0000
Date: Mon, 30 Mar 2026 08:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>
Subject: arch/um/os-Linux/skas/process.c:551:12: warning: variable
 'unscheduled_userspace_iterations' set but not used
Message-ID: <202603300736.r12I6Pmp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 159e76514b9565f92ca5beebc1f92faed21a03aa um: Make unscheduled_userspace_iterations static
date:   9 months ago
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260330/202603300736.r12I6Pmp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300736.r12I6Pmp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603300736.r12I6Pmp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/um/os-Linux/skas/process.c:551:12: warning: variable 'unscheduled_userspace_iterations' set but not used [-Wunused-but-set-global]
     551 | static int unscheduled_userspace_iterations;
         |            ^
   1 warning generated.


vim +/unscheduled_userspace_iterations +551 arch/um/os-Linux/skas/process.c

   550	
 > 551	static int unscheduled_userspace_iterations;
   552	extern unsigned long tt_extra_sched_jiffies;
   553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
