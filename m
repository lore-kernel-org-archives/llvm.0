Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A817B
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 22:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654728848; x=1686264848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hi7TghKYdYkjm4GjlEn/LxQ5ri3t6qc1FEgYaMhqY6E=;
  b=DbAQpvGqwMCn5L+zp1KZfCuItm80B9EU5nGbVZPHcOujwawmFPylIOQe
   G/qVgyK5jp738P8No9sxsT772DfH9e0CsH45wrDSy0auVvoNqSKuTKG0K
   0Xh4VEIMdaRPUAG/unndFdKE7G02sD/jVQkV6U3rkEackxbrJIn9W2rII
   gathsq1PtqFNOtmW4FrLqdX3q29yrL4XCw0YwcMFTHblqxAWDiAF9aEVU
   ex1RaupVowgGw1+zB6jEKxSy8pF12A2tA3Bhe0NZ2r+w1U6Bt/SldhoTV
   8iPVMDZMXR9yoff4TASPG6pNkTY2hjAelabXYaXGc2g30UGs5t1FDjKZz
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="277098960"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="277098960"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 15:54:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="615605908"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Jun 2022 15:54:06 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nz4Yv-000FCL-JB;
	Wed, 08 Jun 2022 22:54:05 +0000
Date: Thu, 9 Jun 2022 06:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpoimboe:reserve-brk-2 1/1] ld.lld: warning: section type mismatch
 for .brk_reservation
Message-ID: <202206090620.HpoizvXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git reserve-brk-2
head:   a802eefebee4d2c01f479a7d3f2008fdd32ce270
commit: a802eefebee4d2c01f479a7d3f2008fdd32ce270 [1/1] x86/mm: Fix RESERVE_BRK() for older binutils
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220609/202206090620.HpoizvXw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=a802eefebee4d2c01f479a7d3f2008fdd32ce270
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe reserve-brk-2
        git checkout a802eefebee4d2c01f479a7d3f2008fdd32ce270
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> ld.lld: warning: section type mismatch for .brk_reservation
   >>> arch/x86/built-in.a(kernel/setup.o):(.brk_reservation): SHT_PROGBITS
   >>> output section .brk: SHT_NOBITS
--
>> ld.lld: warning: section type mismatch for .brk_reservation
   >>> arch/x86/built-in.a(mm/init.o):(.brk_reservation): SHT_PROGBITS
   >>> output section .brk: SHT_NOBITS
>> ld.lld: warning: section type mismatch for .brk_reservation
   >>> arch/x86/built-in.a(kernel/setup.o):(.brk_reservation): SHT_PROGBITS
   >>> output section .brk: SHT_NOBITS
--
>> ld.lld: warning: section type mismatch for .brk_reservation
   >>> arch/x86/built-in.a(mm/init.o):(.brk_reservation): SHT_PROGBITS
   >>> output section .brk: SHT_NOBITS

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
