Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861472C80
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 17:50:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="255602804"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; 
   d="gz'50?scan'50,208,50";a="255602804"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 10:50:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; 
   d="gz'50?scan'50,208,50";a="450660320"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Nov 2021 10:50:05 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mj3Lo-00081t-LQ; Fri, 05 Nov 2021 17:50:04 +0000
Date: Sat, 6 Nov 2021 01:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add pinmux support for Tegra194
Message-ID: <202111060119.T02XJFAA-lkp@intel.com>
References: <20211018121815.3017-2-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20211018121815.3017-2-pshete@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prathamesh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on v5.15]
[cannot apply to linusw-pinctrl/devel next-20211105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Prathamesh-Shete/pinctrl-tegra-include-lpdr-pin-properties/20211018-201953
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
config: arm64-randconfig-r002-20211019 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b37efed957ed0a0193d80020aefd55cb587dfc1f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/92156f1b2fd0094350da5bfb971a19b375de94f0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Prathamesh-Shete/pinctrl-tegra-include-lpdr-pin-properties/20211018-201953
        git checkout 92156f1b2fd0094350da5bfb971a19b375de94f0
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=arm64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/tegra/pinctrl-tegra194.c:1636:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PINGROUP(touch_clk_pcc4,        GP,             TOUCH,          RSVD2,          RSVD3,          0x2000,         1,      Y,      -1,     -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_ao"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1631:3: note: expanded from macro 'PINGROUP'
                   drive_##pg_name,                                \
                   ^~~~~~~~~~~~~~~
   <scratch space>:24:1: note: expanded from here
   drive_touch_clk_pcc4
   ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1392:41: note: expanded from macro 'drive_touch_clk_pcc4'
   #define drive_touch_clk_pcc4            DRV_PINGROUP_ENTRY_Y(0x2004,    12,     5,      20,     5,      -1,     -1,     -1,     -1,     1)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1341:14: note: expanded from macro 'DRV_PINGROUP_ENTRY_Y'
                   .drv_reg = ((r)),                               \
                              ^~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1636:2: note: previous initialization is here
           PINGROUP(touch_clk_pcc4,        GP,             TOUCH,          RSVD2,          RSVD3,          0x2000,         1,      Y,      -1,     -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_ao"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1625:3: note: expanded from macro 'PINGROUP'
                   PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1390:14: note: expanded from macro 'PIN_PINGROUP_ENTRY_Y'
                   .drv_reg = -1,                                  \
                              ^~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1637:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PINGROUP(uart3_rx_pcc6,         UARTC,          RSVD1,          RSVD2,          RSVD3,          0x2008,         1,      Y,      5,      -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_ao"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1631:3: note: expanded from macro 'PINGROUP'
                   drive_##pg_name,                                \
                   ^~~~~~~~~~~~~~~
   <scratch space>:33:1: note: expanded from here
   drive_uart3_rx_pcc6
   ^~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1393:41: note: expanded from macro 'drive_uart3_rx_pcc6'
   #define drive_uart3_rx_pcc6             DRV_PINGROUP_ENTRY_Y(0x200c,    12,     5,      20,     5,      -1,     -1,     -1,     -1,     1)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1341:14: note: expanded from macro 'DRV_PINGROUP_ENTRY_Y'
                   .drv_reg = ((r)),                               \
                              ^~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1637:2: note: previous initialization is here
           PINGROUP(uart3_rx_pcc6,         UARTC,          RSVD1,          RSVD2,          RSVD3,          0x2008,         1,      Y,      5,      -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_ao"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1625:3: note: expanded from macro 'PINGROUP'
                   PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1390:14: note: expanded from macro 'PIN_PINGROUP_ENTRY_Y'
                   .drv_reg = -1,                                  \
                              ^~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1638:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PINGROUP(uart3_tx_pcc5,         UARTC,          RSVD1,          RSVD2,          RSVD3,          0x2010,         1,      Y,      5,      -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_ao"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1631:3: note: expanded from macro 'PINGROUP'
                   drive_##pg_name,                                \
                   ^~~~~~~~~~~~~~~
   <scratch space>:42:1: note: expanded from here
   drive_uart3_tx_pcc5
   ^~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1394:41: note: expanded from macro 'drive_uart3_tx_pcc5'
   #define drive_uart3_tx_pcc5             DRV_PINGROUP_ENTRY_Y(0x2014,    12,     5,      20,     5,      -1,     -1,     -1,     -1,     1)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1341:14: note: expanded from macro 'DRV_PINGROUP_ENTRY_Y'
                   .drv_reg = ((r)),                               \
                              ^~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1638:2: note: previous initialization is here
           PINGROUP(uart3_tx_pcc5,         UARTC,          RSVD1,          RSVD2,          RSVD3,          0x2010,         1,      Y,      5,      -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_ao"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1625:3: note: expanded from macro 'PINGROUP'
                   PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1390:14: note: expanded from macro 'PIN_PINGROUP_ENTRY_Y'
                   .drv_reg = -1,                                  \
                              ^~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1639:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PINGROUP(gen8_i2c_sda_pdd2,     I2C8,           RSVD1,          RSVD2,          RSVD3,          0x2018,         1,      Y,      5,      -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_ao"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1631:3: note: expanded from macro 'PINGROUP'
                   drive_##pg_name,                                \
                   ^~~~~~~~~~~~~~~
   <scratch space>:51:1: note: expanded from here
   drive_gen8_i2c_sda_pdd2
   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1395:41: note: expanded from macro 'drive_gen8_i2c_sda_pdd2'
   #define drive_gen8_i2c_sda_pdd2         DRV_PINGROUP_ENTRY_Y(0x201c,    12,     5,      20,     5,      -1,     -1,     -1,     -1,     1)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1341:14: note: expanded from macro 'DRV_PINGROUP_ENTRY_Y'
                   .drv_reg = ((r)),                               \
                              ^~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1639:2: note: previous initialization is here
           PINGROUP(gen8_i2c_sda_pdd2,     I2C8,           RSVD1,          RSVD2,          RSVD3,          0x2018,         1,      Y,      5,      -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_ao"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1625:3: note: expanded from macro 'PINGROUP'
                   PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1390:14: note: expanded from macro 'PIN_PINGROUP_ENTRY_Y'
                   .drv_reg = -1,                                  \
                              ^~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1640:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PINGROUP(gen8_i2c_scl_pdd1,     I2C8,           RSVD1,          RSVD2,          RSVD3,          0x2020,         1,      Y,      5,      -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_ao"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1631:3: note: expanded from macro 'PINGROUP'
                   drive_##pg_name,                                \
--
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1390:14: note: expanded from macro 'PIN_PINGROUP_ENTRY_Y'
                   .drv_reg = -1,                                  \
                              ^~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1851:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PINGROUP(usb_vbus_en0_pz1,      USB,            RSVD1,          RSVD2,          RSVD3,          0xD0b0,         0,      Y,      5,      -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_uart"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1631:3: note: expanded from macro 'PINGROUP'
                   drive_##pg_name,                                \
                   ^~~~~~~~~~~~~~~
   <scratch space>:188:1: note: expanded from here
   drive_usb_vbus_en0_pz1
   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1555:41: note: expanded from macro 'drive_usb_vbus_en0_pz1'
   #define drive_usb_vbus_en0_pz1          DRV_PINGROUP_ENTRY_Y(0xD0b4,    12,     5,      20,     5,      -1,     -1,     -1,     -1,     0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1341:14: note: expanded from macro 'DRV_PINGROUP_ENTRY_Y'
                   .drv_reg = ((r)),                               \
                              ^~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1851:2: note: previous initialization is here
           PINGROUP(usb_vbus_en0_pz1,      USB,            RSVD1,          RSVD2,          RSVD3,          0xD0b0,         0,      Y,      5,      -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_uart"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1625:3: note: expanded from macro 'PINGROUP'
                   PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1390:14: note: expanded from macro 'PIN_PINGROUP_ENTRY_Y'
                   .drv_reg = -1,                                  \
                              ^~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1852:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PINGROUP(usb_vbus_en1_pz2,      USB,            RSVD1,          RSVD2,          RSVD3,          0xD0b8,         0,      Y,      5,      -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_uart"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1631:3: note: expanded from macro 'PINGROUP'
                   drive_##pg_name,                                \
                   ^~~~~~~~~~~~~~~
   <scratch space>:197:1: note: expanded from here
   drive_usb_vbus_en1_pz2
   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1556:41: note: expanded from macro 'drive_usb_vbus_en1_pz2'
   #define drive_usb_vbus_en1_pz2          DRV_PINGROUP_ENTRY_Y(0xD0bc,    12,     5,      20,     5,      -1,     -1,     -1,     -1,     0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1341:14: note: expanded from macro 'DRV_PINGROUP_ENTRY_Y'
                   .drv_reg = ((r)),                               \
                              ^~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1852:2: note: previous initialization is here
           PINGROUP(usb_vbus_en1_pz2,      USB,            RSVD1,          RSVD2,          RSVD3,          0xD0b8,         0,      Y,      5,      -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_uart"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1625:3: note: expanded from macro 'PINGROUP'
                   PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1390:14: note: expanded from macro 'PIN_PINGROUP_ENTRY_Y'
                   .drv_reg = -1,                                  \
                              ^~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1853:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PINGROUP(ufs0_rst_pff1,         UFS0,           RSVD1,          RSVD2,          RSVD3,          0x11000,        0,      Y,      -1,     -1,     6,      -1,     9,      10,     -1,     12,     Y,      15,     17,     Y,      "vddio_ufs"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1631:3: note: expanded from macro 'PINGROUP'
                   drive_##pg_name,                                \
                   ^~~~~~~~~~~~~~~
   <scratch space>:206:1: note: expanded from here
   drive_ufs0_rst_pff1
   ^~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1557:41: note: expanded from macro 'drive_ufs0_rst_pff1'
   #define drive_ufs0_rst_pff1             DRV_PINGROUP_ENTRY_Y(0x11004,   12,     9,      24,     8,      -1,     -1,     -1,     -1,     0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1341:14: note: expanded from macro 'DRV_PINGROUP_ENTRY_Y'
                   .drv_reg = ((r)),                               \
                              ^~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1853:2: note: previous initialization is here
           PINGROUP(ufs0_rst_pff1,         UFS0,           RSVD1,          RSVD2,          RSVD3,          0x11000,        0,      Y,      -1,     -1,     6,      -1,     9,      10,     -1,     12,     Y,      15,     17,     Y,      "vddio_ufs"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1625:3: note: expanded from macro 'PINGROUP'
                   PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1390:14: note: expanded from macro 'PIN_PINGROUP_ENTRY_Y'
                   .drv_reg = -1,                                  \
                              ^~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1854:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PINGROUP(ufs0_ref_clk_pff0,     UFS0,           RSVD1,          RSVD2,          RSVD3,          0x11008,        0,      Y,      -1,     -1,     6,      -1,     9,      10,     -1,     12,     Y,      15,     17,     Y,      "vddio_ufs"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1631:3: note: expanded from macro 'PINGROUP'
                   drive_##pg_name,                                \
                   ^~~~~~~~~~~~~~~
   <scratch space>:215:1: note: expanded from here
   drive_ufs0_ref_clk_pff0
   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1558:41: note: expanded from macro 'drive_ufs0_ref_clk_pff0'
   #define drive_ufs0_ref_clk_pff0         DRV_PINGROUP_ENTRY_Y(0x1100c,   12,     9,      24,     8,      -1,     -1,     -1,     -1,     0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1341:14: note: expanded from macro 'DRV_PINGROUP_ENTRY_Y'
                   .drv_reg = ((r)),                               \
                              ^~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1854:2: note: previous initialization is here
           PINGROUP(ufs0_ref_clk_pff0,     UFS0,           RSVD1,          RSVD2,          RSVD3,          0x11008,        0,      Y,      -1,     -1,     6,      -1,     9,      10,     -1,     12,     Y,      15,     17,     Y,      "vddio_ufs"),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1625:3: note: expanded from macro 'PINGROUP'
                   PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/tegra/pinctrl-tegra194.c:1390:14: note: expanded from macro 'PIN_PINGROUP_ENTRY_Y'
                   .drv_reg = -1,                                  \
                              ^~
>> drivers/pinctrl/tegra/pinctrl-tegra194.c:1113:27: warning: unused variable 'sdmmc1_hv_trim_pins' [-Wunused-const-variable]
   static const unsigned int sdmmc1_hv_trim_pins[] = {
                             ^
>> drivers/pinctrl/tegra/pinctrl-tegra194.c:1119:27: warning: unused variable 'sdmmc3_hv_trim_pins' [-Wunused-const-variable]
   static const unsigned int sdmmc3_hv_trim_pins[] = {
                             ^
>> drivers/pinctrl/tegra/pinctrl-tegra194.c:1128:27: warning: unused variable 'sys_reset_n_pins' [-Wunused-const-variable]
   static const unsigned int sys_reset_n_pins[] = {
                             ^
   222 warnings generated.


vim +1636 drivers/pinctrl/tegra/pinctrl-tegra194.c

  1635	
> 1636		PINGROUP(touch_clk_pcc4,	GP,		TOUCH,		RSVD2,		RSVD3,		0x2000,		1,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
  1637		PINGROUP(uart3_rx_pcc6,		UARTC,		RSVD1,		RSVD2,		RSVD3,		0x2008,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
  1638		PINGROUP(uart3_tx_pcc5,		UARTC,		RSVD1,		RSVD2,		RSVD3,		0x2010,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
  1639		PINGROUP(gen8_i2c_sda_pdd2,	I2C8,		RSVD1,		RSVD2,		RSVD3,		0x2018,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
  1640		PINGROUP(gen8_i2c_scl_pdd1,	I2C8,		RSVD1,		RSVD2,		RSVD3,		0x2020,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
  1641		PINGROUP(spi2_mosi_pcc2,	SPI2,		UARTG,		RSVD2,		RSVD3,		0x2028,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
  1642		PINGROUP(gen2_i2c_scl_pcc7,	I2C2,		RSVD1,		RSVD2,		RSVD3,		0x2030,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
  1643		PINGROUP(spi2_cs0_pcc3,		SPI2,		UARTG,		RSVD2,		RSVD3,		0x2038,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
  1644		PINGROUP(gen2_i2c_sda_pdd0,	I2C2,		RSVD1,		RSVD2,		RSVD3,		0x2040,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
  1645		PINGROUP(spi2_sck_pcc0,		SPI2,		UARTG,		RSVD2,		RSVD3,		0x2048,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
  1646		PINGROUP(spi2_miso_pcc1,	SPI2,		UARTG,		RSVD2,		RSVD3,		0x2050,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
  1647		PINGROUP(can1_dout_paa0,	CAN1,		RSVD1,		RSVD2,		RSVD3,		0x3000,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
  1648		PINGROUP(can1_din_paa1,		CAN1,		RSVD1,		RSVD2,		RSVD3,		0x3008,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
  1649		PINGROUP(can0_dout_paa2,	CAN0,		RSVD1,		RSVD2,		RSVD3,		0x3010,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
  1650		PINGROUP(can0_din_paa3,		CAN0,		RSVD1,		RSVD2,		RSVD3,		0x3018,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
  1651		PINGROUP(can0_stb_paa4,		RSVD0,		WDT,		RSVD2,		RSVD3,		0x3020,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
  1652		PINGROUP(can0_en_paa5,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3028,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
  1653		PINGROUP(can0_wake_paa6,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3030,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
  1654		PINGROUP(can0_err_paa7,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3038,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
  1655		PINGROUP(can1_stb_pbb0,		RSVD0,		DMIC3,		DMIC5,		RSVD3,		0x3040,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
  1656		PINGROUP(can1_en_pbb1,		RSVD0,		DMIC3,		DMIC5,		RSVD3,		0x3048,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
  1657		PINGROUP(can1_wake_pbb2,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3050,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
  1658		PINGROUP(can1_err_pbb3,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3058,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
  1659		PINGROUP(soc_gpio33_pt0,	RSVD0,		SPDIF,		RSVD2,		RSVD3,		0x1000,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1660		PINGROUP(soc_gpio32_ps7,	RSVD0,		SPDIF,		RSVD2,		RSVD3,		0x1008,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1661		PINGROUP(soc_gpio31_ps6,	RSVD0,		SDMMC1,		RSVD2,		RSVD3,		0x1010,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1662		PINGROUP(soc_gpio30_ps5,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1018,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1663		PINGROUP(aud_mclk_ps4,		AUD,		RSVD1,		RSVD2,		RSVD3,		0x1020,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1664		PINGROUP(dap1_fs_ps3,		I2S1,		RSVD1,		RSVD2,		RSVD3,		0x1028,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1665		PINGROUP(dap1_din_ps2,		I2S1,		RSVD1,		RSVD2,		RSVD3,		0x1030,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1666		PINGROUP(dap1_dout_ps1,		I2S1,		RSVD1,		RSVD2,		RSVD3,		0x1038,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1667		PINGROUP(dap1_sclk_ps0,		I2S1,		RSVD1,		RSVD2,		RSVD3,		0x1040,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1668		PINGROUP(dap3_fs_pt4,		I2S3,		DMIC2,		RSVD2,		RSVD3,		0x1048,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1669		PINGROUP(dap3_din_pt3,		I2S3,		DMIC2,		RSVD2,		RSVD3,		0x1050,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1670		PINGROUP(dap3_dout_pt2,		I2S3,		DMIC1,		RSVD2,		RSVD3,		0x1058,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1671		PINGROUP(dap3_sclk_pt1,		I2S3,		DMIC1,		RSVD2,		RSVD3,		0x1060,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1672		PINGROUP(dap5_fs_pu0,		I2S5,		DMIC4,		DSPK1,		RSVD3,		0x1068,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1673		PINGROUP(dap5_din_pt7,		I2S5,		DMIC4,		DSPK1,		RSVD3,		0x1070,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1674		PINGROUP(dap5_dout_pt6,		I2S5,		DSPK0,		RSVD2,		RSVD3,		0x1078,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1675		PINGROUP(dap5_sclk_pt5,		I2S5,		DSPK0,		RSVD2,		RSVD3,		0x1080,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
  1676		PINGROUP(dap6_fs_pa3,		I2S6,		IQC1,		RSVD2,		RSVD3,		0x2000,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_audio_hv"),
  1677		PINGROUP(dap6_din_pa2,		I2S6,		IQC1,		RSVD2,		RSVD3,		0x2008,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_audio_hv"),
  1678		PINGROUP(dap6_dout_pa1,		I2S6,		IQC1,		RSVD2,		RSVD3,		0x2010,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_audio_hv"),
  1679		PINGROUP(dap6_sclk_pa0,		I2S6,		IQC1,		RSVD2,		RSVD3,		0x2018,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_audio_hv"),
  1680		PINGROUP(dap4_fs_pa7,		I2S4,		IQC2,		RSVD2,		RSVD3,		0x2020,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_audio_hv"),
  1681		PINGROUP(dap4_din_pa6,		I2S4,		IQC2,		RSVD2,		RSVD3,		0x2028,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_audio_hv"),
  1682		PINGROUP(dap4_dout_pa5,		I2S4,		IQC2,		RSVD2,		RSVD3,		0x2030,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_audio_hv"),
  1683		PINGROUP(dap4_sclk_pa4,		I2S4,		IQC2,		RSVD2,		RSVD3,		0x2038,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_audio_hv"),
  1684		PINGROUP(extperiph2_clk_pp1,	EXTPERIPH2,	RSVD1,		RSVD2,		RSVD3,		0x0000,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1685		PINGROUP(extperiph1_clk_pp0,	EXTPERIPH1,	RSVD1,		RSVD2,		RSVD3,		0x0008,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1686		PINGROUP(cam_i2c_sda_pp3,	I2C3,		RSVD1,		RSVD2,		RSVD3,		0x0010,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1687		PINGROUP(cam_i2c_scl_pp2,	I2C3,		RSVD1,		RSVD2,		RSVD3,		0x0018,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1688		PINGROUP(soc_gpio40_pq4,	VGP1,		SLVS,		RSVD2,		RSVD3,		0x0020,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1689		PINGROUP(soc_gpio41_pq5,	VGP2,		EXTPERIPH3,	RSVD2,		RSVD3,		0x0028,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1690		PINGROUP(soc_gpio42_pq6,	VGP3,		EXTPERIPH4,	RSVD2,		RSVD3,		0x0030,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1691		PINGROUP(soc_gpio43_pq7,	VGP4,		SLVS,		RSVD2,		RSVD3,		0x0038,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1692		PINGROUP(soc_gpio44_pr0,	VGP5,		GP,		RSVD2,		RSVD3,		0x0040,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1693		PINGROUP(soc_gpio45_pr1,	VGP6,		RSVD1,		RSVD2,		RSVD3,		0x0048,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1694		PINGROUP(soc_gpio20_pq0,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x0050,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1695		PINGROUP(soc_gpio21_pq1,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x0058,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1696		PINGROUP(soc_gpio22_pq2,	RSVD0,		NV,		RSVD2,		RSVD3,		0x0060,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1697		PINGROUP(soc_gpio23_pq3,	RSVD0,		WDT,		RSVD2,		RSVD3,		0x0068,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1698		PINGROUP(soc_gpio04_pp4,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x0070,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1699		PINGROUP(soc_gpio05_pp5,	RSVD0,		IGPU,		RSVD2,		RSVD3,		0x0078,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1700		PINGROUP(soc_gpio06_pp6,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x0080,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1701		PINGROUP(soc_gpio07_pp7,	RSVD0,		SATA,		SOC,		RSVD3,		0x0088,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1702		PINGROUP(uart1_cts_pr5,		UARTA,		RSVD1,		RSVD2,		RSVD3,		0x0090,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1703		PINGROUP(uart1_rts_pr4,		UARTA,		RSVD1,		RSVD2,		RSVD3,		0x0098,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1704		PINGROUP(uart1_rx_pr3,		UARTA,		RSVD1,		RSVD2,		RSVD3,		0x00a0,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1705		PINGROUP(uart1_tx_pr2,		UARTA,		RSVD1,		RSVD2,		RSVD3,		0x00a8,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_cam"),
  1706		PINGROUP(dap2_din_pi1,		I2S2,		RSVD1,		RSVD2,		RSVD3,		0x4000,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1707		PINGROUP(dap2_dout_pi0,		I2S2,		RSVD1,		RSVD2,		RSVD3,		0x4008,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1708		PINGROUP(dap2_fs_pi2,		I2S2,		RSVD1,		RSVD2,		RSVD3,		0x4010,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1709		PINGROUP(dap2_sclk_ph7,		I2S2,		RSVD1,		RSVD2,		RSVD3,		0x4018,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1710		PINGROUP(uart4_cts_ph6,		UARTD,		RSVD1,		RSVD2,		RSVD3,		0x4020,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1711		PINGROUP(uart4_rts_ph5,		UARTD,		RSVD1,		RSVD2,		RSVD3,		0x4028,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1712		PINGROUP(uart4_rx_ph4,		UARTD,		RSVD1,		RSVD2,		RSVD3,		0x4030,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1713		PINGROUP(uart4_tx_ph3,		UARTD,		RSVD1,		RSVD2,		RSVD3,		0x4038,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1714		PINGROUP(soc_gpio03_pg3,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x4040,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1715		PINGROUP(soc_gpio02_pg2,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x4048,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1716		PINGROUP(soc_gpio01_pg1,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x4050,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1717		PINGROUP(soc_gpio00_pg0,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x4058,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1718		PINGROUP(gen1_i2c_scl_pi3,	I2C1,		RSVD1,		RSVD2,		RSVD3,		0x4060,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1719		PINGROUP(gen1_i2c_sda_pi4,	I2C1,		RSVD1,		RSVD2,		RSVD3,		0x4068,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1720		PINGROUP(soc_gpio08_pg4,	RSVD0,		CCLA,		RSVD2,		RSVD3,		0x4070,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1721		PINGROUP(soc_gpio09_pg5,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x4078,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1722		PINGROUP(soc_gpio10_pg6,	GP,		RSVD1,		RSVD2,		RSVD3,		0x4080,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1723		PINGROUP(soc_gpio11_pg7,	RSVD0,		SDMMC1,		RSVD2,		RSVD3,		0x4088,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1724		PINGROUP(soc_gpio12_ph0,	RSVD0,		GP,		RSVD2,		RSVD3,		0x4090,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1725		PINGROUP(soc_gpio13_ph1,	RSVD0,		GP,		RSVD2,		RSVD3,		0x4098,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1726		PINGROUP(soc_gpio14_ph2,	RSVD0,		SDMMC1,		RSVD2,		RSVD3,		0x40a0,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_conn"),
  1727		PINGROUP(directdc1_out7_pw1,	DIRECTDC1,	RSVD1,		RSVD2,		RSVD3,		0x5008,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_debug"),
  1728		PINGROUP(directdc1_out6_pw0,	DIRECTDC1,	RSVD1,		RSVD2,		RSVD3,		0x5010,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_debug"),
  1729		PINGROUP(directdc1_out5_pv7,	DIRECTDC1,	RSVD1,		RSVD2,		RSVD3,		0x5018,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_debug"),
  1730		PINGROUP(directdc1_out4_pv6,	DIRECTDC1,	RSVD1,		RSVD2,		RSVD3,		0x5020,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_debug"),
  1731		PINGROUP(directdc1_out3_pv5,	DIRECTDC1,	RSVD1,		RSVD2,		RSVD3,		0x5028,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_debug"),
  1732		PINGROUP(directdc1_out2_pv4,	DIRECTDC1,	RSVD1,		RSVD2,		RSVD3,		0x5030,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_debug"),
  1733		PINGROUP(directdc1_out1_pv3,	DIRECTDC1,	RSVD1,		RSVD2,		RSVD3,		0x5038,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_debug"),
  1734		PINGROUP(directdc1_out0_pv2,	DIRECTDC1,	RSVD1,		RSVD2,		RSVD3,		0x5040,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_debug"),
  1735		PINGROUP(directdc1_in_pv1,	DIRECTDC1,	RSVD1,		RSVD2,		RSVD3,		0x5048,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_debug"),
  1736		PINGROUP(directdc1_clk_pv0,	DIRECTDC1,	RSVD1,		RSVD2,		RSVD3,		0x5050,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_debug"),
  1737		PINGROUP(directdc_comp,		DIRECTDC,	RSVD1,		RSVD2,		RSVD3,		0x5058,		0,	N,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	Y,	"vddio_debug"),
  1738		PINGROUP(soc_gpio50_pm5,	RSVD0,		DCA,		RSVD2,		RSVD3,		0x10000,	0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_edp"),
  1739		PINGROUP(soc_gpio51_pm6,	RSVD0,		DCA,		RSVD2,		RSVD3,		0x10008,	0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_edp"),
  1740		PINGROUP(soc_gpio52_pm7,	RSVD0,		DCB,		DGPU,		RSVD3,		0x10010,	0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_edp"),
  1741		PINGROUP(soc_gpio53_pn0,	RSVD0,		DCB,		RSVD2,		RSVD3,		0x10018,	0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_edp"),
  1742		PINGROUP(soc_gpio54_pn1,	RSVD0,		SDMMC3,		GP,		RSVD3,		0x10020,	0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_edp"),
  1743		PINGROUP(soc_gpio55_pn2,	RSVD0,		SDMMC3,		RSVD2,		RSVD3,		0x10028,	0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_edp"),
  1744		PINGROUP(dp_aux_ch0_hpd_pm0,	DP,		RSVD1,		RSVD2,		RSVD3,		0x10030,	0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_edp"),
  1745		PINGROUP(dp_aux_ch1_hpd_pm1,	DP,		RSVD1,		RSVD2,		RSVD3,		0x10038,	0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_edp"),
  1746		PINGROUP(dp_aux_ch2_hpd_pm2,	DP,		DISPLAYA,	RSVD2,		RSVD3,		0x10040,	0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_edp"),
  1747		PINGROUP(dp_aux_ch3_hpd_pm3,	DP,		DISPLAYB,	RSVD2,		RSVD3,		0x10048,	0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_edp"),
  1748		PINGROUP(hdmi_cec_pm4,		HDMI,		RSVD1,		RSVD2,		RSVD3,		0x10050,	0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_edp"),
  1749		PINGROUP(eqos_td3_pe4,		EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15000,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1750		PINGROUP(eqos_td2_pe3,		EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15008,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1751		PINGROUP(eqos_td1_pe2,		EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15010,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1752		PINGROUP(eqos_td0_pe1,		EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15018,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1753		PINGROUP(eqos_rd3_pf1,		EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15020,	0,	Y,	-1,	5,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1754		PINGROUP(eqos_rd2_pf0,		EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15028,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1755		PINGROUP(eqos_rd1_pe7,		EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15030,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1756		PINGROUP(eqos_sma_mdio_pf4,	EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15038,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1757		PINGROUP(eqos_rd0_pe6,		EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15040,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1758		PINGROUP(eqos_sma_mdc_pf5,	EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15048,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1759		PINGROUP(eqos_comp,		EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15050,	0,	N,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	Y,	"vddio_eqos"),
  1760		PINGROUP(eqos_txc_pe0,		EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15058,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1761		PINGROUP(eqos_rxc_pf3,		EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15060,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1762		PINGROUP(eqos_tx_ctl_pe5,	EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15068,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1763		PINGROUP(eqos_rx_ctl_pf2,	EQOS,		RSVD1,		RSVD2,		RSVD3,		0x15070,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_eqos"),
  1764		PINGROUP(pex_l2_clkreq_n_pk4,	PE2,		RSVD1,		RSVD2,		RSVD3,		0x7000,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl"),
  1765		PINGROUP(pex_wake_n_pl2,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x7008,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl"),
  1766		PINGROUP(pex_l1_clkreq_n_pk2,	PE1,		RSVD1,		RSVD2,		RSVD3,		0x7010,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl"),
  1767		PINGROUP(pex_l1_rst_n_pk3,	PE1,		RSVD1,		RSVD2,		RSVD3,		0x7018,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl"),
  1768		PINGROUP(pex_l0_clkreq_n_pk0,	PE0,		RSVD1,		RSVD2,		RSVD3,		0x7020,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl"),
  1769		PINGROUP(pex_l0_rst_n_pk1,	PE0,		RSVD1,		RSVD2,		RSVD3,		0x7028,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl"),
  1770		PINGROUP(pex_l2_rst_n_pk5,	PE2,		RSVD1,		RSVD2,		RSVD3,		0x7030,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl"),
  1771		PINGROUP(pex_l3_clkreq_n_pk6,	PE3,		RSVD1,		RSVD2,		RSVD3,		0x7038,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl"),
  1772		PINGROUP(pex_l3_rst_n_pk7,	PE3,		RSVD1,		RSVD2,		RSVD3,		0x7040,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl"),
  1773		PINGROUP(pex_l4_clkreq_n_pl0,	PE4,		RSVD1,		RSVD2,		RSVD3,		0x7048,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl"),
  1774		PINGROUP(pex_l4_rst_n_pl1,	PE4,		RSVD1,		RSVD2,		RSVD3,		0x7050,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl"),
  1775		PINGROUP(sata_dev_slp_pl3,	SATA,		RSVD1,		RSVD2,		RSVD3,		0x7058,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl"),
  1776		PINGROUP(pex_l5_clkreq_n_pgg0,	PE5,		RSVD1,		RSVD2,		RSVD3,		0x14000,	0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl_2"),
  1777		PINGROUP(pex_l5_rst_n_pgg1,	PE5,		RSVD1,		RSVD2,		RSVD3,		0x14008,	0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pex_ctl_2"),
  1778		PINGROUP(cpu_pwr_req_1_pb1,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x16000,	0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pwr_ctl"),
  1779		PINGROUP(cpu_pwr_req_0_pb0,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x16008,	0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_pwr_ctl"),
  1780		PINGROUP(qspi0_io3_pc5,		QSPI0,		RSVD1,		RSVD2,		RSVD3,		0xB000,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_qspi"),
  1781		PINGROUP(qspi0_io2_pc4,		QSPI0,		RSVD1,		RSVD2,		RSVD3,		0xB008,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_qspi"),
  1782		PINGROUP(qspi0_io1_pc3,		QSPI0,		RSVD1,		RSVD2,		RSVD3,		0xB010,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_qspi"),
  1783		PINGROUP(qspi0_io0_pc2,		QSPI0,		RSVD1,		RSVD2,		RSVD3,		0xB018,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_qspi"),
  1784		PINGROUP(qspi0_sck_pc0,		QSPI0,		RSVD1,		RSVD2,		RSVD3,		0xB020,		0,	Y,	-1,	5,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_qspi"),
  1785		PINGROUP(qspi0_cs_n_pc1,	QSPI0,		RSVD1,		RSVD2,		RSVD3,		0xB028,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_qspi"),
  1786		PINGROUP(qspi1_io3_pd3,		QSPI1,		RSVD1,		RSVD2,		RSVD3,		0xB030,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_qspi"),
  1787		PINGROUP(qspi1_io2_pd2,		QSPI1,		RSVD1,		RSVD2,		RSVD3,		0xB038,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_qspi"),
  1788		PINGROUP(qspi1_io1_pd1,		QSPI1,		RSVD1,		RSVD2,		RSVD3,		0xB040,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_qspi"),
  1789		PINGROUP(qspi1_io0_pd0,		QSPI1,		RSVD1,		RSVD2,		RSVD3,		0xB048,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_qspi"),
  1790		PINGROUP(qspi1_sck_pc6,		QSPI1,		RSVD1,		RSVD2,		RSVD3,		0xB050,		0,	Y,	-1,	5,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_qspi"),
  1791		PINGROUP(qspi1_cs_n_pc7,	QSPI1,		RSVD1,		RSVD2,		RSVD3,		0xB058,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_qspi"),
  1792		PINGROUP(qspi_comp,		QSPI,		RSVD1,		RSVD2,		RSVD3,		0xB060,		0,	N,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	Y,	"vddio_qspi"),
  1793		PINGROUP(sdmmc1_clk_pj0,	SDMMC1,		RSVD1,		MIPI,		RSVD3,		0x8000,		0,	Y,	-1,	5,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_sdmmc1_hv"),
  1794		PINGROUP(sdmmc1_cmd_pj1,	SDMMC1,		RSVD1,		MIPI,		RSVD3,		0x8008,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_sdmmc1_hv"),
  1795		PINGROUP(sdmmc1_comp,		SDMMC1,		RSVD1,		RSVD2,		RSVD3,		0x8010,		0,	N,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	N,	-1,	-1,	N,	"vddio_sdmmc1_hv"),
  1796		PINGROUP(sdmmc1_dat3_pj5,	SDMMC1,		RSVD1,		MIPI,		RSVD3,		0x8018,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_sdmmc1_hv"),
  1797		PINGROUP(sdmmc1_dat2_pj4,	SDMMC1,		RSVD1,		MIPI,		RSVD3,		0x8020,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_sdmmc1_hv"),
  1798		PINGROUP(sdmmc1_dat1_pj3,	SDMMC1,		RSVD1,		MIPI,		RSVD3,		0x8028,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_sdmmc1_hv"),
  1799		PINGROUP(sdmmc1_dat0_pj2,	SDMMC1,		RSVD1,		MIPI,		RSVD3,		0x8030,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_sdmmc1_hv"),
  1800		PINGROUP(sdmmc3_dat3_po5,	SDMMC3,		RSVD1,		RSVD2,		RSVD3,		0xA000,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_sdmmc3_hv"),
  1801		PINGROUP(sdmmc3_dat2_po4,	SDMMC3,		RSVD1,		RSVD2,		RSVD3,		0xA008,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_sdmmc3_hv"),
  1802		PINGROUP(sdmmc3_dat1_po3,	SDMMC3,		RSVD1,		RSVD2,		RSVD3,		0xA010,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_sdmmc3_hv"),
  1803		PINGROUP(sdmmc3_dat0_po2,	SDMMC3,		RSVD1,		RSVD2,		RSVD3,		0xA018,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_sdmmc3_hv"),
  1804		PINGROUP(sdmmc3_comp,		SDMMC3,		RSVD1,		RSVD2,		RSVD3,		0xA020,		0,	N,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	N,	-1,	-1,	N,	"vddio_sdmmc3_hv"),
  1805		PINGROUP(sdmmc3_cmd_po1,	SDMMC3,		RSVD1,		RSVD2,		RSVD3,		0xA028,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_sdmmc3_hv"),
  1806		PINGROUP(sdmmc3_clk_po0,	SDMMC3,		RSVD1,		RSVD2,		RSVD3,		0xA030,		0,	Y,	-1,	5,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_sdmmc3_hv"),
  1807		PINGROUP(sdmmc4_clk,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6008,		0,	Y,	-1,	5,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
  1808		PINGROUP(sdmmc4_cmd,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6010,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
  1809		PINGROUP(sdmmc4_dqs,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6018,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	N,	-1,	-1,	N,	"vddio_sdmmc4"),
  1810		PINGROUP(sdmmc4_dat7,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6020,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
  1811		PINGROUP(sdmmc4_dat6,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6028,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
  1812		PINGROUP(sdmmc4_dat5,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6030,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
  1813		PINGROUP(sdmmc4_dat4,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6038,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
  1814		PINGROUP(sdmmc4_dat3,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6040,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
  1815		PINGROUP(sdmmc4_dat2,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6048,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
  1816		PINGROUP(sdmmc4_dat1,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6050,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
  1817		PINGROUP(sdmmc4_dat0,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6058,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
  1818		PINGROUP(shutdown_n,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1000,		1,	Y,	5,	-1,	6,	8,	-1,	-1,	-1,	12,	N,	-1,	-1,	N,	"vddio_sys"),
  1819		PINGROUP(pmu_int_n,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1008,		1,	Y,	-1,	-1,	6,	8,	-1,	-1,	-1,	12,	N,	-1,	-1,	N,	"vddio_sys"),
  1820		PINGROUP(safe_state_pee0,	SCE,		RSVD1,		RSVD2,		RSVD3,		0x1010,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
  1821		PINGROUP(vcomp_alert_pee1,	SOC,		RSVD1,		RSVD2,		RSVD3,		0x1018,		1,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
  1822		PINGROUP(soc_pwr_req,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1020,		1,	Y,	-1,	-1,	6,	8,	-1,	-1,	-1,	12,	N,	-1,	-1,	N,	"vddio_sys"),
  1823		PINGROUP(batt_oc_pee3,		SOC,		RSVD1,		RSVD2,		RSVD3,		0x1028,		1,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
  1824		PINGROUP(clk_32k_in,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1030,		1,	Y,	-1,	-1,	-1,	8,	-1,	-1,	-1,	12,	N,	-1,	-1,	N,	"vddio_sys"),
  1825		PINGROUP(power_on_pee4,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1038,		1,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
  1826		PINGROUP(pwr_i2c_scl_pee5,	I2C5,		RSVD1,		RSVD2,		RSVD3,		0x1040,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
  1827		PINGROUP(pwr_i2c_sda_pee6,	I2C5,		RSVD1,		RSVD2,		RSVD3,		0x1048,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
  1828		PINGROUP(ao_retention_n_pee2,	GPIO,		RSVD1,		RSVD2,		RSVD3,		0x1060,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
  1829		PINGROUP(gpu_pwr_req_px0,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0xD000,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1830		PINGROUP(spi3_miso_py1,		SPI3,		RSVD1,		RSVD2,		RSVD3,		0xD008,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1831		PINGROUP(spi1_cs0_pz6,		SPI1,		RSVD1,		RSVD2,		RSVD3,		0xD010,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1832		PINGROUP(spi3_cs0_py3,		SPI3,		RSVD1,		RSVD2,		RSVD3,		0xD018,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1833		PINGROUP(spi1_miso_pz4,		SPI1,		RSVD1,		RSVD2,		RSVD3,		0xD020,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1834		PINGROUP(spi3_cs1_py4,		SPI3,		RSVD1,		RSVD2,		RSVD3,		0xD028,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1835		PINGROUP(gp_pwm3_px3,		GP,		RSVD1,		RSVD2,		RSVD3,		0xD030,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1836		PINGROUP(gp_pwm2_px2,		GP,		RSVD1,		RSVD2,		RSVD3,		0xD038,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1837		PINGROUP(spi1_sck_pz3,		SPI1,		RSVD1,		RSVD2,		RSVD3,		0xD040,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1838		PINGROUP(spi3_sck_py0,		SPI3,		RSVD1,		RSVD2,		RSVD3,		0xD048,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1839		PINGROUP(spi1_cs1_pz7,		SPI1,		RSVD1,		RSVD2,		RSVD3,		0xD050,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1840		PINGROUP(spi1_mosi_pz5,		SPI1,		RSVD1,		RSVD2,		RSVD3,		0xD058,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1841		PINGROUP(spi3_mosi_py2,		SPI3,		RSVD1,		RSVD2,		RSVD3,		0xD060,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1842		PINGROUP(cv_pwr_req_px1,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0xD068,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1843		PINGROUP(uart2_tx_px4,		UARTB,		RSVD1,		RSVD2,		RSVD3,		0xD070,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1844		PINGROUP(uart2_rx_px5,		UARTB,		RSVD1,		RSVD2,		RSVD3,		0xD078,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1845		PINGROUP(uart2_rts_px6,		UARTB,		RSVD1,		RSVD2,		RSVD3,		0xD080,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1846		PINGROUP(uart2_cts_px7,		UARTB,		RSVD1,		RSVD2,		RSVD3,		0xD088,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1847		PINGROUP(uart5_rx_py6,		UARTE,		RSVD1,		RSVD2,		RSVD3,		0xD090,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1848		PINGROUP(uart5_tx_py5,		UARTE,		RSVD1,		RSVD2,		RSVD3,		0xD098,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1849		PINGROUP(uart5_rts_py7,		UARTE,		RSVD1,		RSVD2,		RSVD3,		0xD0a0,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1850		PINGROUP(uart5_cts_pz0,		UARTE,		RSVD1,		RSVD2,		RSVD3,		0xD0a8,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1851		PINGROUP(usb_vbus_en0_pz1,	USB,		RSVD1,		RSVD2,		RSVD3,		0xD0b0,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1852		PINGROUP(usb_vbus_en1_pz2,	USB,		RSVD1,		RSVD2,		RSVD3,		0xD0b8,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
  1853		PINGROUP(ufs0_rst_pff1,		UFS0,		RSVD1,		RSVD2,		RSVD3,		0x11000,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_ufs"),
  1854		PINGROUP(ufs0_ref_clk_pff0,	UFS0,		RSVD1,		RSVD2,		RSVD3,		0x11008,	0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	15,	17,	Y,	"vddio_ufs"),
  1855	};
  1856	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--EVF5PPMfhYS0aIcm
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
XIr9PyelQbLlsQEA

--EVF5PPMfhYS0aIcm--
