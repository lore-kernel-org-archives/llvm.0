Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861CB7E
	for <llvm@lists.linux.dev>; Mon, 21 Feb 2022 23:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645486307; x=1677022307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x+UfySmbRFe9Cqfygtte/qoyhJzLe1c+2voBSnzDupk=;
  b=WpmfusFASbaUuT5oYJUWBkPBzl38fWPFgHUqwOSOuU6AsCnGeTi2iGkH
   tu5AufvQtQ6oDitM3NsS6xQrWWsJH8y0MUOO8ctPcE4C/ZI11WHx8Fd+6
   HqY+MxK7BK1p7Y+XkR0cfDqxl1K4V9UJ3cbTG88KAkuxv1bSMHp4eMR4C
   GuYE0GXHLjAmupS8Ec7TQMdy6Q7mrB1rveAg2jfGp/A+j4FJASY6MPs36
   CTuhNI/g/nAfSb5C6a3ZOqNRG97voW5icYFdo3sdvSZ8pxOw+QJvPkTKz
   Vpp4Rm2j8im29p9f/r/8Cz1jX82p+lyUVVFJaBtN8Km4rVnbR/emc1gyg
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="250401237"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="250401237"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 15:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="547493845"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Feb 2022 15:31:45 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMI9g-000253-Rs; Mon, 21 Feb 2022 23:31:44 +0000
Date: Tue, 22 Feb 2022 07:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 03/12] pinctrl: renesas: Initial R8A779F0 PFC support
Message-ID: <202202220706.BSRvcjhD-lkp@intel.com>
References: <fd8201da404b7b0897130b254380ffc97f437266.1645457792.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd8201da404b7b0897130b254380ffc97f437266.1645457792.git.geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Geert,

I love your patch! Yet something to improve:

[auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
[also build test ERROR on robh/for-next linusw-pinctrl/devel v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/pinctrl-renesas-Add-R-Car-S4-8-support/20220221-234855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
config: arm64-randconfig-r021-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220706.BSRvcjhD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/a774a621c83874c65ae824a0a53f2741f3612df8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Geert-Uytterhoeven/pinctrl-renesas-Add-R-Car-S4-8-support/20220221-234855
        git checkout a774a621c83874c65ae824a0a53f2741f3612df8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pinctrl/renesas/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/renesas/pfc-r8a779f0.c:998:20: error: incompatible function pointer types initializing 'int (*)(struct sh_pfc *, unsigned int, u32 *)' (aka 'int (*)(struct sh_pfc *, unsigned int, unsigned int *)') with an expression of type 'int (unsigned int, u32 *)' (aka 'int (unsigned int, unsigned int *)') [-Werror,-Wincompatible-function-pointer-types]
           .pin_to_pocctrl = r8a779f0_pin_to_pocctrl,
                             ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +998 drivers/pinctrl/renesas/pfc-r8a779f0.c

   996	
   997	static const struct sh_pfc_soc_operations r8a779f0_pfc_ops = {
 > 998		.pin_to_pocctrl = r8a779f0_pin_to_pocctrl,
   999		.get_bias = rcar_pinmux_get_bias,
  1000		.set_bias = rcar_pinmux_set_bias,
  1001	};
  1002	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
