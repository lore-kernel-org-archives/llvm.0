Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822711C461A;
	Thu, 28 Nov 2024 22:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732834257; cv=none; b=aJ/T5eSEGXBg/q6w9zQdcOUnDPYqwunyY5LMMNpzzTRZgSpxN23JDCPWoFTw21tYIeINtDf5Q1mUn46af/HJjjysyea6AsUMgRXFst9YAARHME6wI7aNjrRl61c+GXst8C4U9RzQBfbgIJoT/7tSMV38gCAO9gARr775lyUfOp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732834257; c=relaxed/simple;
	bh=JQGXWx/MbTuI7LhOT/PPP5PRddhZiEd0MYYaEvBLCcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b/N7a3x4a6keI6X+Z/jxfCDGwiPm4llDJhqx4VNlPLklsn+Tik6r6De2OwX0i+Vn2ufB/VakH1oku6Wu7x2UiTMV3/xw78EZ+6BD47Gt8EmSuf5VwWexdfZoaPmP8nwn7E8vfSQEwwRzm+i+KuXbvNb4Fqf/m0KAMLowog3bidE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fz8o18ls; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fz8o18ls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732834255; x=1764370255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JQGXWx/MbTuI7LhOT/PPP5PRddhZiEd0MYYaEvBLCcg=;
  b=Fz8o18lsoqPeDA2j/5jYA7i/UXBh0XECQRTaKVTLmqCJyp7qVIe4v9u6
   dSPQ5BhqeC0bnZPXAc1oz++3SBjb/MJMl+tWMWRi692NzSDK8tR+Hp3Pf
   cuD6S9dy+wmWMoOKjJ5nAlRpf7Xqtb/uDj9IIBoommUPz9rUsVTyX5d/2
   HDXbn2Ul2AhWnjjUET0kedG5RBXjwtAFLuMFBsaa1VS/4/7WRZgXgx7vW
   T1NIkRMva91qpdZ4nM11ZKIMNB8ClyLKoEcMUovXMCYOstndisS4KzzQO
   ph9uP0HoD8mFTBjeFgVVgG54l08Z7o7dghTQWIsqFmXDFrsnyAZUefHAy
   g==;
X-CSE-ConnectionGUID: Q3nhIA+QS+WGNdJsgoDpGw==
X-CSE-MsgGUID: hyrQRvHWRK66e08Cmz0hqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32435530"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="32435530"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 14:50:48 -0800
X-CSE-ConnectionGUID: N0Enb1rPSG2eGozSO+Xfrw==
X-CSE-MsgGUID: 65z9r3hhSV2hdwoadBS8kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="96420628"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Nov 2024 14:50:40 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGnLJ-000A7R-1c;
	Thu, 28 Nov 2024 22:50:37 +0000
Date: Fri, 29 Nov 2024 06:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>
Subject: [linux-next:master 4454/12916] arch/um/kernel/skas/stub_exe.c:84:2:
 error: non-ASM statement in naked function is not supported
Message-ID: <202411290659.v3A9jmB3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f486c8aa16b8172f63bddc70116a0c897a7f3f02
commit: 8508a5e0e9db3932ca43651f86ba1042a1e9f4ca [4454/12916] um: Fix misaligned stack in stub_exe
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241129/202411290659.v3A9jmB3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290659.v3A9jmB3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290659.v3A9jmB3-lkp@intel.com/

Note: the linux-next/master HEAD f486c8aa16b8172f63bddc70116a0c897a7f3f02 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> arch/um/kernel/skas/stub_exe.c:84:2: error: non-ASM statement in naked function is not supported
      84 |         char *alloc;
         |         ^
   arch/um/kernel/skas/stub_exe.c:82:16: note: attribute is here
      82 | __attribute__((naked)) void _start(void)
         |                ^
   1 error generated.


vim +84 arch/um/kernel/skas/stub_exe.c

32e8eaf263d9be Benjamin Berg 2024-09-19  81  
8508a5e0e9db39 David Gow     2024-10-18  82  __attribute__((naked)) void _start(void)
32e8eaf263d9be Benjamin Berg 2024-09-19  83  {
32e8eaf263d9be Benjamin Berg 2024-09-19 @84  	char *alloc;

:::::: The code at line 84 was first introduced by commit
:::::: 32e8eaf263d9be014ba1970444f745682fa9c6c0 um: use execveat to create userspace MMs

:::::: TO: Benjamin Berg <benjamin.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
