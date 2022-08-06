Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96DC10F6
	for <llvm@lists.linux.dev>; Sat,  6 Aug 2022 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659796809; x=1691332809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dCzJt5QZzd/jFmndJyLiY8m0keauWURLIPjtwMvxFu8=;
  b=aaNJ9muOzt5VOhHwswb9QSjvtFSb73wjSUeCrykfGMb14XQXPboYfNZj
   Uxf5M0xbv1ER3CLua9uzL3IkMBINUhKsm2oe29DefIX6jk8t54T4Fi/DI
   XOXFL+p7YqSPeKmK+zSKlcH05bZ04UMLbGWQlMerbWbUckeqsl8GFZHMk
   LvqXznKIIDJ+JslbmHdgX7uc25OpgtPbjYZe+kd0GfxNfBYgr81c5Wl6e
   OH/wklhjLaWsd7c2lbeYUgbH14vlcXNQ4lU35gw2FVP7MijeCaQFkYfMQ
   xvSPzKmUpNZorsiMHItGIYcBl78irQZkGMk3OyJX0Dg9pdDKAwdrXJht6
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="316270970"
X-IronPort-AV: E=Sophos;i="5.93,217,1654585200"; 
   d="scan'208";a="316270970"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2022 07:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,217,1654585200"; 
   d="scan'208";a="636804642"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Aug 2022 07:39:59 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKKy6-000KRl-1F;
	Sat, 06 Aug 2022 14:39:58 +0000
Date: Sat, 6 Aug 2022 22:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Subject: drivers/irqchip/irq-loongson-pch-pic.c:51:5: warning: no previous
 prototype for function 'find_pch_pic'
Message-ID: <202208062228.5NkhxzNQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6614a3c3164a5df2b54abb0b3559f51041cf705b
commit: bcdd75c596c89d7925a3438fde2578ca23a62b06 irqchip/loongson-pch-pic: Add ACPI init support
date:   2 weeks ago
config: mips-loongson2k_defconfig (https://download.01.org/0day-ci/archive/20220806/202208062228.5NkhxzNQ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bcdd75c596c89d7925a3438fde2578ca23a62b06
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bcdd75c596c89d7925a3438fde2578ca23a62b06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-loongson-pch-pic.c:51:5: warning: no previous prototype for function 'find_pch_pic' [-Wmissing-prototypes]
   int find_pch_pic(u32 gsi)
       ^
   drivers/irqchip/irq-loongson-pch-pic.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int find_pch_pic(u32 gsi)
   ^
   static 
   1 warning generated.


vim +/find_pch_pic +51 drivers/irqchip/irq-loongson-pch-pic.c

    50	
  > 51	int find_pch_pic(u32 gsi)
    52	{
    53		int i;
    54	
    55		/* Find the PCH_PIC that manages this GSI. */
    56		for (i = 0; i < MAX_IO_PICS; i++) {
    57			struct pch_pic *priv = pch_pic_priv[i];
    58	
    59			if (!priv)
    60				return -1;
    61	
    62			if (gsi >= priv->gsi_base && gsi < (priv->gsi_base + priv->vec_count))
    63				return i;
    64		}
    65	
    66		pr_err("ERROR: Unable to locate PCH_PIC for GSI %d\n", gsi);
    67		return -1;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
