Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219BB2853EE;
	Thu, 18 Dec 2025 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057103; cv=none; b=f1DaarZz+jSRjN6oqlTmRXaZTRBkY2Pv+lMgd8yMcr7NEFaZ4xmpFeku0/NsTWIEe/+3AkTsL22N9CQZre1i6wqSh1cBHI1+JrTTAJSPYpjo0dgHf/9gbnDKNBTmxA7gT9ebhWYuMFd9S54oIvn2gsSTrqhLHWUfLmFmwlk/qqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057103; c=relaxed/simple;
	bh=03+pTdOwM2Jd2edXrnE5eWtHq6LU5aPgCBs4Xda1soA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYFsw8xog+lS2dWfvRHg5nKFcJZ8xGBJSeYzMuUvAGYe8pZJJcWX4owgDw0Z3Q0P8i4IQKtTvhuWgGi36Y3Okd/bBCwcvn7Wg6F6CIqlNQTd1SOhGyGTOAwtnbl6TpxJ0Y2PiZhyvuwXIe8WTW8uILydqKN4DbqO2ZeaGxxTkHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AB2ICgup; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AB2ICgup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766057100; x=1797593100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=03+pTdOwM2Jd2edXrnE5eWtHq6LU5aPgCBs4Xda1soA=;
  b=AB2ICgupTpqGd8Uni/g2Mqav2WBDqiunjHAhU8pY0qi5OoPCUtaUPgi4
   HXVBL7qFWQ4AwD5MpmAezvJbw2ilJhAyeUY4gep3RCFub7E1UAyipEmsh
   Dmlh1G5Z0iWeDbAX7bOcSYm1mA16KGV+irFRyrGQVteDoMoiwcesGDPjK
   cK57nMVKY0QOreC6izrIzBYOC3kTQ9zbY+IcRgCTzHVXb0/oETpy1tsEP
   tNoc0+dFPnIGZhkeLWPUBa8oUFOZLJj2YjMx+jXNj4r9A9hnKuVI3TYgw
   14LdoVtFhFet9Yk+S7PBocMneKpyrjxuXwlwIry0wtPGyY8EeMlDQ1Vdd
   w==;
X-CSE-ConnectionGUID: 2Pk0rjokRXWAb+HXfy4cow==
X-CSE-MsgGUID: f4S3cqVOTSyZX4qdjHVr2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67886810"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="67886810"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 03:24:59 -0800
X-CSE-ConnectionGUID: s5dtqLj3RIW2NlhjlffYxA==
X-CSE-MsgGUID: 1gSLVqk4RMG/wRwJpiSrRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="203457130"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Dec 2025 03:24:58 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWC7r-00000000207-2elL;
	Thu, 18 Dec 2025 11:24:55 +0000
Date: Thu, 18 Dec 2025 19:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:perf/core 22/22] include/linux/kvm_types.h:9:10: fatal error:
 'asm/kvm_types.h' file not found
Message-ID: <202512181927.qiodzgD6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
head:   23faa33d88df6d126cebd3121ea2cff3586e7b95
commit: 23faa33d88df6d126cebd3121ea2cff3586e7b95 [22/22] perf: Use EXPORT_SYMBOL_FOR_KVM() for the mediated APIs
config: arm-orion5x_defconfig (https://download.01.org/0day-ci/archive/20251218/202512181927.qiodzgD6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181927.qiodzgD6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181927.qiodzgD6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/events/core.c:60:
>> include/linux/kvm_types.h:9:10: fatal error: 'asm/kvm_types.h' file not found
       9 | #include <asm/kvm_types.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +9 include/linux/kvm_types.h

d77a39d982431e drivers/kvm/types.h       Hollis Blanchard    2007-12-03   5  
20c48920583675 include/linux/kvm_types.h Sean Christopherson 2025-09-18   6  #include <linux/bits.h>
20c48920583675 include/linux/kvm_types.h Sean Christopherson 2025-09-18   7  #include <linux/export.h>
20c48920583675 include/linux/kvm_types.h Sean Christopherson 2025-09-18   8  #include <linux/types.h>
20c48920583675 include/linux/kvm_types.h Sean Christopherson 2025-09-18  @9  #include <asm/kvm_types.h>
20c48920583675 include/linux/kvm_types.h Sean Christopherson 2025-09-18  10  

:::::: The code at line 9 was first introduced by commit
:::::: 20c48920583675e67b3824f147726e0fbda735ce KVM: Export KVM-internal symbols for sub-modules only

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
