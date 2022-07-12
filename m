Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D9E4414
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657638623; x=1689174623;
  h=date:from:cc:subject:message-id:mime-version;
  bh=VAgVpMuYzw9KCP5O4hgN+mCudJx5cCasdvnkgdl7/dk=;
  b=ikxIhv6O7FHM8yULDs7jjmOilvhZ9nGf+4D459haXXmv/B7Cm9mXPLmx
   fZYwyS4wfqdNWRdsE0f7m7jLVFpfcYgXriI5AF+iNv3AL5outZi+zxmXk
   dTTwQmdwFsQ/fhZ/uqD4gfaz9n1XlOm1MGO2fT6B+U/Gh82g863/amOO3
   14h/r3v7v2X14bLnItIVDfcffZhmAQkROjtB8+nsS0yArTQUI6nk/9aUm
   NKsNvc23qUN68CrEbVkNvXtqQa73JTgJQ1MHGCWMzvoLk96UE1f38i802
   plqQ1IhJKNHChQ2cwENx3Xl3BgL/BgDDzn5UKDSgj98hW7AGRBi3FyZZa
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="283713449"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="283713449"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 08:10:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="570233534"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Jul 2022 08:10:20 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBHWm-0002K6-9O;
	Tue, 12 Jul 2022 15:10:20 +0000
Date: Tue, 12 Jul 2022 23:09:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [krzk-github:n/dt-bindings-samsung-spi-mmc-sdhci 1/12] error: error:
 unknown target CPU 'r5000'
Message-ID: <202207122323.nlYDNUSy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/dt-bindings-samsung-spi-mmc-sdhci
head:   72467c82739697fbee5c7ab0b145cc6f3231f11f
commit: bcca70ce1e427ed42e65dff1a42b7705cbb69b4d [1/12] spi: dt-bindings: samsung: Add Exynos4210 SPI
config: mips-randconfig-c004-20220712 (https://download.01.org/0day-ci/archive/20220712/202207122323.nlYDNUSy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project badda4ac3c489a8c8cccdad1f74b9308c350a9e0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/krzk/linux/commit/bcca70ce1e427ed42e65dff1a42b7705cbb69b4d
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/dt-bindings-samsung-spi-mmc-sdhci
        git checkout bcca70ce1e427ed42e65dff1a42b7705cbb69b4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   error: unknown target CPU 'r5000'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> error: error: unknown target CPU 'r5000'
   unknown target CPU 'r5000'
   note: note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
