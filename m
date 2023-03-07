Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB29CAD49;
	Tue,  7 Mar 2023 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678201032; x=1709737032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UKnVa+oAyCOtXPpsMrvrgWUBvX7IFeHDC47EgpGWWh0=;
  b=n8fjs8HNpUQR70ieckVqGl4cLPxfBCzJAePL6rSFsVbIa8pOKlcw3OlR
   NmPUstA9/EVQ1q2XMHDA0qz2JvclZLkKkYtS0KaEKyWKhikFWQA8e2Qpj
   EZl7sBOfw8VB82STFtqT2xmzFaWIjwTG70g6QfRAoETvXs07AbCHkmy6T
   VCySDWLGKgOXa2OMFwE3AJKvqp4sYudbQfQ/cQM3NEOmF5idcPZT/SeMh
   10fP50NDhKHtybLvLoWzYufvBSBmSafrlUkFeKBU0ZVmb+iZoB2Vw5U//
   WtGsBWCO26KAGEWUhVd25M1meK+aNm2IL+km+MUVJfK60WKK+aStLjFWy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="315522010"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="315522010"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 06:57:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="669909278"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="669909278"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Mar 2023 06:57:09 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZYkX-0001PP-09;
	Tue, 07 Mar 2023 14:57:09 +0000
Date: Tue, 7 Mar 2023 22:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-lpa2-v3c 40/61] ld.lld: error: undefined symbol:
 __kcfi_typeid_idmap_cpu_replace_ttbr1
Message-ID: <202303072236.1ggcsKhF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-lpa2-v3c
head:   8a7d10afac67fee414b59638121860605f862e67
commit: 9e8681178369900e6ae6e2de61cbe104ccde4580 [40/61] arm64: mm: omit redundant remap of kernel image
config: arm64-randconfig-r006-20230305 (https://download.01.org/0day-ci/archive/20230307/202303072236.1ggcsKhF-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=9e8681178369900e6ae6e2de61cbe104ccde4580
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb arm64-lpa2-v3c
        git checkout 9e8681178369900e6ae6e2de61cbe104ccde4580
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303072236.1ggcsKhF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __kcfi_typeid_idmap_cpu_replace_ttbr1
   >>> referenced by arch/arm64/mm/proc.o:(.idmap.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
