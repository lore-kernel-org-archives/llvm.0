Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121F7278E47;
	Tue, 21 Oct 2025 20:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761078147; cv=none; b=lOa2+IW23mujcBP7oChjEoslW4CH0Sc/q6YtbwKeFgqs2vlm40XOvseKcSATj4Qiak+HPhM1lqgP+brzKnoJBjAqW+YhoDtjEn4BgK8d2QYzqMDngLajo09xZg6aPZxEvUpO+IByaXmfX8NXP9ytn6TFAkzRrpkAfmUDtyN4ytU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761078147; c=relaxed/simple;
	bh=6bTeeUqgYhckfV/oEbeUh9lohPk1nsv1S0jfH74dCdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HuZAk7X9Bq52brbK2sZ48pLobisQqCYRPNP4aaCVjr3EeYJVlOdKALLWotVjvH9yamCyVMeada50aSdiNEXe5jemKUPFiJtcbOVn2/8QvXQw1hiDdHfh8wY85zXFywv0qHl7Cjt72oXgfV8az5hrxqDprj0yiT4ybAdhM70HVBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kK22+5qH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kK22+5qH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761078146; x=1792614146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6bTeeUqgYhckfV/oEbeUh9lohPk1nsv1S0jfH74dCdk=;
  b=kK22+5qHbqcWgPSB+FPUaFzbueFxcXRidWp+LCgWaSFe0hK+c7pLmI7N
   yqEK+mBuEd/Wliy0sYbVjptQ8FITUxZcjdm8xALjKNVYGnfh3vDwBrPx6
   Cx61zUabqk3zPy9UGYawvNYww73UDz9uliI5SCQLoE4oaN6xTa2PUMb3B
   7WV+/WD8hVrLH7xLrgiMH4dX2SxR02B1eSNlN8wr3RWLQ+R2BYay5l23m
   NaJ98oF0KOTSIwLARNjl22851cmeu/7IzIS62nJNPFkhZP90HFdADIq1k
   1W9f0JlEeWwcGlMO+tFQUUotWFLKK7lKcK8INUMnN/b8tv5YOXfkH/e4e
   A==;
X-CSE-ConnectionGUID: XjTCbKQtTVqVL4OtDDnWLg==
X-CSE-MsgGUID: eHZ+3Nf5RzqLfT4CfCVgGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74335375"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="74335375"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 13:22:25 -0700
X-CSE-ConnectionGUID: XJSmfp3zSeO4n0cunq9eVA==
X-CSE-MsgGUID: DR8zscKxQUCrwqrc9ixwjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="183618808"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2025 13:22:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBIsA-000Biq-0s;
	Tue, 21 Oct 2025 20:22:22 +0000
Date: Wed, 22 Oct 2025 04:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/perf 40/43] vmlinux.o: warning: objtool:
 .altinstr_replacement+0xfad: redundant UACCESS disable
Message-ID: <202510220454.kGlX08z7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   490d4a6bdf42130bc30c1dd36f791c4c092218f8
commit: 3cbbe13199da19656beaa912366be1d55b092155 [40/43] rseq: Switch to fast path processing on exit to user
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251022/202510220454.kGlX08z7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220454.kGlX08z7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220454.kGlX08z7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .altinstr_replacement+0xfad: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xfb0: redundant UACCESS disable
   vmlinux.o: warning: objtool: irqentry_exit+0x512: call to class_masked_user_rw_access_destructor() with UACCESS enabled

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
