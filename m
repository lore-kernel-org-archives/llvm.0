Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD81D3009F7;
	Fri, 19 Dec 2025 13:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149769; cv=none; b=FfHLpbW380fdl2PmHSlJP5ql5ie5ixtXKV8yNLDcYo4dpYm9MJMZbTb8Khjw41kJoG/VOm0Gnz3+4CeJMFjdN1uSuiW5qH7Rh5WZ8FdY8wuAbcoU/Vzw7CsqqtDm65QF/9iOWULKUmybFwyCFzdcSCg044j8L5HuCbPBN7WKPzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149769; c=relaxed/simple;
	bh=0YDidwStzOsTHy/NPlx6w2CXLDJTRj0k5aNCsy37OIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HYq541lZh63nlOxSQ9iMrO8qfZEH47SOUE1F8jjlC1fA46LAo5oswsXh8L8cEJ1i39kf3yfqld9CxHCHxkW0RORhAZKCX+5kcHjeu6B9PCQ7iOdlpcusQv4nJL6WCMAVmOVid/l3FQ+k9PbmFokzMCuJZIt5q/b5OmmXbgUWf+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNNZXOb3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNNZXOb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766149767; x=1797685767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0YDidwStzOsTHy/NPlx6w2CXLDJTRj0k5aNCsy37OIs=;
  b=SNNZXOb33DTtmayobOia0J8WdT9eW/pXsubZuduOxFvf7T+cN8nqLHxj
   tZt//LEmxD/vGO3AWVBV5YwuQfq0PxhOmLC024s61eI0wtqaRRVgGCLRX
   IaP3Q5ebGzJBA4G4d/ElbJsGVTVJfRKYGgTNfb83NWsnl+U3AURu+CKUr
   UH7uImQmBLyqsSY2Ex4gUwmXn6Fh81+EzXx1EUOZB5Z0I2x19BkGeOgh7
   5SmZDRJ19RcdDsLx2fBc8KlQs/IVk/XtcRXyVkgRSFOcG+sR7HStQ92Vb
   efK9QAJ/WEnNRERRC2qSwweasr/72k6okVGQUXwRCB3VNd16gEcW3S5N2
   A==;
X-CSE-ConnectionGUID: saQiKlqoSv6vXXjU0xisfQ==
X-CSE-MsgGUID: XoANgv3RTFyVe5K9gkVVTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="55685320"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="55685320"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 05:09:26 -0800
X-CSE-ConnectionGUID: Fdg9HkwySsSNaUdDFJh/2g==
X-CSE-MsgGUID: qPoBMol2SjqukOWiNqyCFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="198759484"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Dec 2025 05:09:25 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWaEU-000000003ZJ-42Pc;
	Fri, 19 Dec 2025 13:09:22 +0000
Date: Fri, 19 Dec 2025 21:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 14/15] ld.lld: error: relocation R_X86_64_32S
 cannot be used against symbol 'saved_context'; recompile with -fPIC
Message-ID: <202512192147.tSHsiVv7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   5ed57ce1a7de9e649ede6b45207ee2f3bdf4cd2f
commit: b7e8d6fe21add95370ab27990dd2e972eebdc16b [14/15] x86/kernel: Switch to PIE linking for the core kernel
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251219/202512192147.tSHsiVv7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512192147.tSHsiVv7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512192147.tSHsiVv7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_X86_64_32S cannot be used against symbol 'saved_context'; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(virtual_mapped)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
