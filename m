Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B46BA23;
	Fri, 16 Jun 2023 12:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686917734; x=1718453734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TJ8frg6HkptminmtlkY4zu4e19aJYU/HJP18W7iXQFQ=;
  b=b3oEw+u63AhlXl6RC+S9We2rMeIGpFgChH6akENnUCoLrqYCKJzyrnH7
   QDiF6ZP1soFHqKVMThnM5FLxwhZBeBwgljMf7xNbgcOuXKNGYFynj9sqf
   ECmJGNrxLovCelx9ZtxU7Y+4BHmN3pPy+NhTs/ZLGkYS8ottxkBKod46/
   EwxEmsOqmiMwQB7L2d3akX/ciJrB0GTfaVPuHMw0hh2IpfCNN+ugSgKSP
   V/pp0Winwrn2oQ8va9qRytp2tFvCKdIl6DDZmvqwvLhG5dAz3bnSthhdP
   6KHdzfk1AP6/4NTrUP+zQu6MmcMfJ0eaLgaiuPHD+6PPFPMEHeS0PvkvW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387914946"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="387914946"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 05:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="782880853"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="782880853"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2023 05:15:25 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA8MP-0001EC-18;
	Fri, 16 Jun 2023 12:15:25 +0000
Date: Fri, 16 Jun 2023 20:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [dcui-tdx:decui/upstream-tip/x86/tdx/v7-wip 7/14] ld.lld: error:
 undefined symbol: __tdx_hypercall_ret
Message-ID: <202306162015.9xyd65bD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/upstream-tip/x86/tdx/v7-wip
head:   f91277070137eb09dc47fe27d0e327b8a285fc6b
commit: c95e14c94d53cbb21418b661eb397cee1c67dd24 [7/14] x86/hyperv: Support hypercalls for TDX guests
config: i386-randconfig-r024-20230615 (https://download.01.org/0day-ci/archive/20230616/202306162015.9xyd65bD-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306162015.9xyd65bD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306162015.9xyd65bD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __tdx_hypercall_ret
   >>> referenced by ivm.c:427 (arch/x86/hyperv/ivm.c:427)
   >>>               arch/x86/hyperv/ivm.o:(hv_tdx_hypercall) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
