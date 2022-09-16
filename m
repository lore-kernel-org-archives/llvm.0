Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED58210D
	for <llvm@lists.linux.dev>; Fri, 16 Sep 2022 05:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663307981; x=1694843981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w0qqJosfPVrIgxuOR6YYYTKrfFKZQ4iaFYo5f9yH9hc=;
  b=Bgt/XifXigTMtTg6Ve97usbej9ysD9JZJ22sixzl3ct0U0pzD1krpaMx
   6xN0qfwMV/HEEzjtCIZORK4He+Ey0rxOhUyOlJc2TNmzVPluqq1fPWI97
   GioVT3DHIUfeTBK+X5Ve8eiI2npdPlD4/h9oARmu3Ohv1bH4n8UzyT6dR
   ZPUSAF7JJiucQa8TW+ewpOeRVNK6vQ9vjD1S0alCuCO81cpnSXtvG/vsx
   W1rkBn50meSiuL8QnbpM5GQolXy3bTpx+LgxPobWbmlwn9vsBsylbm6pv
   QhdTBkxOYFz21YMN5KH4axo+eWoCPytTDi1ibf7jBnkp0LFKNRw0v+67O
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="278647711"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="278647711"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 22:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="706637186"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Sep 2022 22:59:39 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZ4O2-0001Uu-1E;
	Fri, 16 Sep 2022 05:59:38 +0000
Date: Fri, 16 Sep 2022 13:59:09 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Subject: drivers/irqchip/irq-loongson-pch-lpc.c:151:13: warning: declaration
 of 'struct acpi_madt_lpc_pic' will not be visible outside of this function
Message-ID: <202209161317.b47Av73d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3245cb65fd91cd514801bf91f5a3066d562f0ac4
commit: ee73f14ee9eb7e1a04051b303b56130c4dd6e048 irqchip: Add Loongson PCH LPC controller support
date:   8 weeks ago
config: mips-randconfig-r023-20220915 (https://download.01.org/0day-ci/archive/20220916/202209161317.b47Av73d-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ee73f14ee9eb7e1a04051b303b56130c4dd6e048
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ee73f14ee9eb7e1a04051b303b56130c4dd6e048
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-loongson-pch-lpc.c:151:13: warning: declaration of 'struct acpi_madt_lpc_pic' will not be visible outside of this function [-Wvisibility]
                                           struct acpi_madt_lpc_pic *acpi_pchlpc)
                                                  ^
   drivers/irqchip/irq-loongson-pch-lpc.c:164:34: error: incomplete definition of type 'struct acpi_madt_lpc_pic'
           priv->base = ioremap(acpi_pchlpc->address, acpi_pchlpc->size);
                                ~~~~~~~~~~~^
   arch/mips/include/asm/io.h:180:16: note: expanded from macro 'ioremap'
           ioremap_prot((offset), (size), _CACHE_UNCACHED)
                         ^~~~~~
   drivers/irqchip/irq-loongson-pch-lpc.c:151:13: note: forward declaration of 'struct acpi_madt_lpc_pic'
                                           struct acpi_madt_lpc_pic *acpi_pchlpc)
                                                  ^
   drivers/irqchip/irq-loongson-pch-lpc.c:164:56: error: incomplete definition of type 'struct acpi_madt_lpc_pic'
           priv->base = ioremap(acpi_pchlpc->address, acpi_pchlpc->size);
                                                      ~~~~~~~~~~~^
   arch/mips/include/asm/io.h:180:26: note: expanded from macro 'ioremap'
           ioremap_prot((offset), (size), _CACHE_UNCACHED)
                                   ^~~~
   drivers/irqchip/irq-loongson-pch-lpc.c:151:13: note: forward declaration of 'struct acpi_madt_lpc_pic'
                                           struct acpi_madt_lpc_pic *acpi_pchlpc)
                                                  ^
   drivers/irqchip/irq-loongson-pch-lpc.c:188:31: error: incomplete definition of type 'struct acpi_madt_lpc_pic'
           fwspec.param[0] = acpi_pchlpc->cascade + GSI_MIN_PCH_IRQ;
                             ~~~~~~~~~~~^
   drivers/irqchip/irq-loongson-pch-lpc.c:151:13: note: forward declaration of 'struct acpi_madt_lpc_pic'
                                           struct acpi_madt_lpc_pic *acpi_pchlpc)
                                                  ^
   drivers/irqchip/irq-loongson-pch-lpc.c:188:43: error: use of undeclared identifier 'GSI_MIN_PCH_IRQ'
           fwspec.param[0] = acpi_pchlpc->cascade + GSI_MIN_PCH_IRQ;
                                                    ^
>> drivers/irqchip/irq-loongson-pch-lpc.c:150:12: warning: no previous prototype for function 'pch_lpc_acpi_init' [-Wmissing-prototypes]
   int __init pch_lpc_acpi_init(struct irq_domain *parent,
              ^
   drivers/irqchip/irq-loongson-pch-lpc.c:150:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init pch_lpc_acpi_init(struct irq_domain *parent,
   ^
   static 
   2 warnings and 4 errors generated.


vim +151 drivers/irqchip/irq-loongson-pch-lpc.c

   149	
 > 150	int __init pch_lpc_acpi_init(struct irq_domain *parent,
 > 151						struct acpi_madt_lpc_pic *acpi_pchlpc)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
