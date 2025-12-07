Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26632F49E5;
	Sun,  7 Dec 2025 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765114548; cv=none; b=Qw1cBtAWeuni+2fo5MjqdFbO5an54YBjywfejD6/Aq/F56zv95eNo5TQ6vggBXom4QgpJvJnGANmpwrs37ywD1I1fdI/x/zwsFGC5et7ttxAYM6MFZneRdRDrCXIS/nHjdmz9HYnjEwXuWmpmLCcK1MErj1Ty0e9Sk0t0psZXH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765114548; c=relaxed/simple;
	bh=fcSbDJU+nWL/2yiSyKUWGPkJ8nJHG+D7O+5jcGlrqko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f1w8IOdicrNVpkeDDih8elRleDfhEdSdLohIXe521d06v0ezHkETIythDemIkwF1b6tfUjFw0avXg2IkqiwisxySnRWtA+U9ZVRp+HUoFMAPYnTkehH87XSMlBvbBJbUwQmVyVU5HmTfh9Hv5eaeKoRakjQZMfOiK4kVay5/P1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ec7XGtzl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ec7XGtzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765114546; x=1796650546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fcSbDJU+nWL/2yiSyKUWGPkJ8nJHG+D7O+5jcGlrqko=;
  b=Ec7XGtzl+GtoNrDsg46IHS6wbmAkV+pu6tyOVNPEHTYSqNWKelN8IBpK
   PHjJqMAqWsKGtnaLWiAMNpZwp4RCwTEnQOJeM60S8fBN0DqdmhoH9RGt5
   uPalQ3AwZ4tOHEnWcYr3F5K9TJUvkWX2VM1Rl4hag8rUcDzONU2RKYHoF
   jgJMTRTYS+ujr8ss7/8QYQb+MsdR1G06kOzxCgJkSD4FfSK/RE0llxEG2
   AK32vFMSAfA5BBe/smb5Xg75YByrzM+LixzKM4cE7G9aWxRLvHE+jWdxx
   RC3D06dOX3FsC+bBh2IB+Y8s8207FYUJ8khymuasOasiS4xMSDPGdulb1
   g==;
X-CSE-ConnectionGUID: +q0kAk+CQL2bSptZxLx5NQ==
X-CSE-MsgGUID: TS40x9/yQl+5iGWtyVC62w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="70923237"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="70923237"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 05:35:44 -0800
X-CSE-ConnectionGUID: 2NQnY7TyQXasmLrrRosvOg==
X-CSE-MsgGUID: 0vvceEC5QwOuqTAt6r/ldA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="195780421"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Dec 2025 05:35:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSEvN-00000000JFb-0bNH;
	Sun, 07 Dec 2025 13:35:41 +0000
Date: Sun, 7 Dec 2025 21:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uapi-nostdinc 4/4]
 ./usr/include/asm/sigcontext.h:32:13: error: expected parameter declarator
Message-ID: <202512072123.lobWpG5E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-nostdinc
head:   e2e62098929b652605656a82869ed467c2b96568
commit: e2e62098929b652605656a82869ed467c2b96568 [4/4] no libc
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251207/202512072123.lobWpG5E-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512072123.lobWpG5E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512072123.lobWpG5E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/asm/sigcontext.h:32:13: error: expected parameter declarator
      32 | } __aligned(8);
         |             ^
>> ./usr/include/asm/sigcontext.h:32:13: error: expected ')'
   ./usr/include/asm/sigcontext.h:32:12: note: to match this '('
      32 | } __aligned(8);
         |            ^
>> ./usr/include/asm/sigcontext.h:32:12: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      32 | } __aligned(8);
         |            ^ 
         |              void
   3 errors generated.
--
   In file included from <built-in>:1:
>> ./usr/include/asm/signal.h:25:23: error: declaration of 'struct pt_regs' will not be visible outside of this function [-Werror,-Wvisibility]
      25 | void do_signal(struct pt_regs *regs);
         |                       ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
