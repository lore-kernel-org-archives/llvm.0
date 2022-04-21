Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F5246B4
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 09:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650534232; x=1682070232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WH3xISqKnw04BXD66oYQGexIAP7wV/SMEV2dOxRcBQQ=;
  b=VFn7JWteSUev0SSRlhLEyRMVnR7Dggapn8vEXEQkhAoKOkNFKYvFzesb
   mnid4laYMHAxjIn+E20N/AYdzAJEhn65xRQYpZiwGnKKN4LjdRb4/H8a5
   GOriHCnQVpCOigCC1MrIawxaxg6hlaGQN3m/Uu/3fpxfmq34iAcMqmW8Z
   4VUBqhC7Po1Vj645HK3f2ropQzmCUxyAwzISLd5Zud+s6cg8GjpTS46qz
   Q2Rko2ZW2qJTc80Gsp/WLwAqDG3+I864EKUisw0DZQEmrOg6ldDTRjW4/
   Ihs9RpSLK60udMpJC658eaM3B31U62wuJLlVvOQwo7rM0JI5W3WieNpM7
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="244229094"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="244229094"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 02:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="562505181"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2022 02:43:50 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhTLp-0008BB-Ls;
	Thu, 21 Apr 2022 09:43:49 +0000
Date: Thu, 21 Apr 2022 17:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: drivers/acpi/arm64/agdi.c:88:13: warning: no previous prototype for
 function 'acpi_agdi_init'
Message-ID: <202204211729.xRuJP9jy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ilkka,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: a2a591fb76e6f5461dfd04715b69c317e50c43a5 ACPI: AGDI: Add driver for Arm Generic Diagnostic Dump and Reset device
date:   6 weeks ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220421/202204211729.xRuJP9jy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a2a591fb76e6f5461dfd04715b69c317e50c43a5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a2a591fb76e6f5461dfd04715b69c317e50c43a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/acpi/arm64/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/acpi/arm64/agdi.c:88:13: warning: no previous prototype for function 'acpi_agdi_init' [-Wmissing-prototypes]
   void __init acpi_agdi_init(void)
               ^
   drivers/acpi/arm64/agdi.c:88:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init acpi_agdi_init(void)
   ^
   static 
   1 warning generated.


vim +/acpi_agdi_init +88 drivers/acpi/arm64/agdi.c

    87	
  > 88	void __init acpi_agdi_init(void)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
