Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6822F28;
	Thu,  9 Mar 2023 12:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678366647; x=1709902647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gAO/ZmU8eXx/vsxehuSBxuIdT/XE5J+bjSt1rwDfgxs=;
  b=gvDUn+t7Vv9uOcvUEk908xLu5XfbBTNlcZIwRfDqUxZncCcALftEAZa/
   rDwAnA1cTYby8Fzwhj+i3W7FJyN7G5r8HNnrNuPxBekq5ZhV2LaaxTeQ3
   N7rl287oV1GEJ3evvrhdZAhggTYwwEiCA/z7lH4iWAIFWKEX+FR1pcC6D
   sqjOwLStCzg3PLteCcUFG4HGn6xlpjJ3393twMYXxcD+sVavLUwXHcq+g
   bL9ko4mV1iy8UfDnucgd2TgSR0GBNdp7otJPDp5rx8qS8JAJeMf0j31zE
   jGUImNH+06LLySquovLpIQBir6eVwjVR/5g8vnbE93ULARKnLymBvPNMP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="399012922"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="399012922"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 04:57:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709835799"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="709835799"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Mar 2023 04:57:25 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paFpk-0002xN-0z;
	Thu, 09 Mar 2023 12:57:24 +0000
Date: Thu, 9 Mar 2023 20:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 3/8] pinctrl: renesas: Add support for 1.8V/2.5V I/O
 voltage levels
Message-ID: <202303092028.R5gxePOb-lkp@intel.com>
References: <0c04925457bf3f7e78e7e3851528d9a4c29246da.1678271030.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c04925457bf3f7e78e7e3851528d9a4c29246da.1678271030.git.geert+renesas@glider.be>

Hi Geert,

I love your patch! Yet something to improve:

[auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
[also build test ERROR on linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.3-rc1 next-20230309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/pinctrl-renesas-r8a77995-Retain-POCCTRL0-register-across-suspend-resume/20230308-212328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
patch link:    https://lore.kernel.org/r/0c04925457bf3f7e78e7e3851528d9a4c29246da.1678271030.git.geert%2Brenesas%40glider.be
patch subject: [PATCH 3/8] pinctrl: renesas: Add support for 1.8V/2.5V I/O voltage levels
config: s390-buildonly-randconfig-r003-20230308 (https://download.01.org/0day-ci/archive/20230309/202303092028.R5gxePOb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/513932515f943c5987c5a214520f6875cd507c3e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Geert-Uytterhoeven/pinctrl-renesas-r8a77995-Retain-POCCTRL0-register-across-suspend-resume/20230308-212328
        git checkout 513932515f943c5987c5a214520f6875cd507c3e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303092028.R5gxePOb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
           PINMUX_GPIO_GP_ALL(),
           ^
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:24:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:24:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:24:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:24:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:24:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:24:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
>> drivers/pinctrl/renesas/pfc-r8a77950.c:1502:2: error: use of undeclared identifier 'SH_PFC_PIN_CFG_IO_VOLTAGE'
   drivers/pinctrl/renesas/sh_pfc.h:622:31: note: expanded from macro 'PINMUX_GPIO_GP_ALL'
   #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
                                           ^
   drivers/pinctrl/renesas/pfc-r8a77950.c:24:41: note: expanded from macro 'CPU_ALL_GP'
           PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
                                                  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/SH_PFC_PIN_CFG_IO_VOLTAGE +1502 drivers/pinctrl/renesas/pfc-r8a77950.c

b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  1500  
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  1501  static const struct sh_pfc_pin pinmux_pins[] = {
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03 @1502  	PINMUX_GPIO_GP_ALL(),
4f062bcb588972 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2019-01-15  1503  	PINMUX_NOGP_ALL(),
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  1504  };
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  1505  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
