Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB064288CC;
	Tue, 29 Jul 2025 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753793181; cv=none; b=fKHw9fOYSWqA2mdsz6sZBrENUi/7zdRexoqJJ6TxBXqSBNitR+rkLLu/ePRE84NSPV2uB57pjGhZ9cwCgMgCm2c5JtooHuu+DJQ4iqLLZe/67Hc1dt/nFsmogiTK/MVWiLLtDuUe+jCEJffRWXhnELkFlrc3smq9vkYO243hjt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753793181; c=relaxed/simple;
	bh=n+DyNlCVJvJMlCe4zS5352sTVpW1xx9oNFAud80lWzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JnK8GCKvxbffLTJTI1PGC92VRak6Pv7DCFfMxGqgJmnHUCITxVZnUAhkcA6qOLvyPhm+htfCNO2QIqC9Eg2HAXnXbKrEAnxwL3s4spYP5WEl/bLPLa8D1X+nHYiNLfGdo5lw9ralDsxII8cYvY4a5/PexNXxxsmpj1oIbeFLbnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eeZbefuY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eeZbefuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753793180; x=1785329180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n+DyNlCVJvJMlCe4zS5352sTVpW1xx9oNFAud80lWzc=;
  b=eeZbefuYwxaHfn1XubsBimyqTphOG3MxdMZxyc4FhX1fK8c8qtmJrTF7
   gNv/5ysY1B+PiVLTCGmOfjXgma3qrXgk0TxluAaJq3ErWKRgegA6G59Ut
   7FRujUzd/TVr1L07HwS2sshy2DHp7jqWwb3NgUabMvFS3F5zPx+SQRDCj
   qWgkLDZHI/jmPUwAgnOGrUDTWljeDMmoxe+vJ3pbSFvpLyEGuJjp7b7Ih
   1hc3nzOgNftzsHW19JS3kJMIT2MRs5taN15wjBR4uFddHPO7Snq+72juK
   +2Y7xn4eDo6d4OcpgDjR7v7ki8jJ7/IEWrOIaJW535tcBpSKV6LXVwd3i
   A==;
X-CSE-ConnectionGUID: /maQtQJuSq6YYhWf4FkeZg==
X-CSE-MsgGUID: ja+zdxUoQy++uWKgMm0Tpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55943393"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="55943393"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 05:46:20 -0700
X-CSE-ConnectionGUID: yhHLyINBRR+qjenaZ/pEDQ==
X-CSE-MsgGUID: Iloppt18Q2++fehcOPLQlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="166866255"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jul 2025 05:46:18 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugjih-0001Hv-2s;
	Tue, 29 Jul 2025 12:46:15 +0000
Date: Tue, 29 Jul 2025 20:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvm_exports_for_kvm 20/20]
 include/linux/kvm_types.h:9:10: fatal error: 'asm/kvm_types.h' file not
 found
Message-ID: <202507292016.G4NJfddl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/kvm_exports_for_kvm
head:   ad35ef8ce42f860d08d8f651d3cbafcede4f8275
commit: ad35ef8ce42f860d08d8f651d3cbafcede4f8275 [20/20] x86: Restrict KVM-induced symbol exports to KVM modules where obvious/possible
config: arm-randconfig-002-20250729 (https://download.01.org/0day-ci/archive/20250729/202507292016.G4NJfddl-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507292016.G4NJfddl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507292016.G4NJfddl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/events/core.c:29:
>> include/linux/kvm_types.h:9:10: fatal error: 'asm/kvm_types.h' file not found
       9 | #include <asm/kvm_types.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +9 include/linux/kvm_types.h

d77a39d982431ef drivers/kvm/types.h       Hollis Blanchard    2007-12-03   5  
eeecbf904ba24bd include/linux/kvm_types.h Sean Christopherson 2025-06-20   6  #include <linux/bits.h>
eeecbf904ba24bd include/linux/kvm_types.h Sean Christopherson 2025-06-20   7  #include <linux/export.h>
eeecbf904ba24bd include/linux/kvm_types.h Sean Christopherson 2025-06-20   8  #include <linux/types.h>
eeecbf904ba24bd include/linux/kvm_types.h Sean Christopherson 2025-06-20  @9  #include <asm/kvm_types.h>
eeecbf904ba24bd include/linux/kvm_types.h Sean Christopherson 2025-06-20  10  

:::::: The code at line 9 was first introduced by commit
:::::: eeecbf904ba24bd3aebf40fd37fadfbf7ca43c3d KVM: Export KVM-internal symbols for sub-modules only

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
