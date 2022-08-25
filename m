Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E634C87
	for <llvm@lists.linux.dev>; Thu, 25 Aug 2022 23:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661469177; x=1693005177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Qw9UAVBMXeB5Chv+0jjCLOuH0afuUp8MQfTHbW+8ew=;
  b=PwJLncMsiEraOA5dOXrs7vFK6/UGIH8KjLNJcBMS1UFthCQ4XuBtohnf
   VAEzHORfnwvemoC6rgJ8scOG0R/ur2DTjvQgA7gGAIOdmS/bgJNfG8vrR
   CrUXGCXwFFJAGVSJy4YFtx9UvyvwXJ12iORKXSy0x8KOouOupdNjMY6BY
   iAKIiT/cy9uN8sRAHuGiA1luxyhqwE7nUrhPDci2uLUz/JCvNyfe0wyIB
   uX3dv/U+5BhmU0dkI51JBW10ZmLEVG5UaZXtOkNTmCubUapPmNITiX46F
   Vl7yDdARn2I82m1Ez6gE2T8UIyuBFGtbxeANrgHLEzH+AVOP98cJOgnzJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="295651111"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="295651111"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 16:12:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="561223635"
Received: from lkp-server02.sh.intel.com (HELO 34e741d32628) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Aug 2022 16:12:55 -0700
Received: from kbuild by 34e741d32628 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oRM1u-000323-2p;
	Thu, 25 Aug 2022 23:12:54 +0000
Date: Fri, 26 Aug 2022 07:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [arm-integrator:realview 1/1]
 arch/arm/boot/dts/arm-realview-pba8.dts:48:36: warning: '/*' within block
 comment
Message-ID: <202208260759.RwmEK9fd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git realview
head:   2438557220f5d282cc55b136a287fe5ae98dc7a9
commit: 2438557220f5d282cc55b136a287fe5ae98dc7a9 [1/1] ARM: dts: realview: Extend PBX family memory description
config: arm-randconfig-r032-20220823 (https://download.01.org/0day-ci/archive/20220826/202208260759.RwmEK9fd-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5653884e34e05ee7aad099cc7f729688d92a002f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=2438557220f5d282cc55b136a287fe5ae98dc7a9
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator realview
        git checkout 2438557220f5d282cc55b136a287fe5ae98dc7a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/boot/dts/arm-realview-pba8.dts:48:36: warning: '/*' within block comment [-Wcomment]
                   /*reg = <0x70000000 0x20000000>; /* 512 MiB baseboard DDR */
                                                    ^
   1 warning generated.
   arch/arm/boot/dts/arm-realview-pbx.dtsi:42.9-45.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
     also defined at arch/arm/boot/dts/arm-realview-pba8.dts:47.9-49.4
   arch/arm/boot/dts/arm-realview-pbx.dtsi:64.27-68.4: Warning (unit_address_vs_reg): /xtal24mhz@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:76.20-82.4: Warning (unit_address_vs_reg): /timclk@1M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:84.17-90.4: Warning (unit_address_vs_reg): /mclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:92.21-98.4: Warning (unit_address_vs_reg): /kmiclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:100.21-106.4: Warning (unit_address_vs_reg): /sspclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:108.23-114.4: Warning (unit_address_vs_reg): /uartclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:116.23-122.4: Warning (unit_address_vs_reg): /wdogclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:125.15-129.4: Warning (unit_address_vs_reg): /pclk@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pba8.dts:51.13-56.4: Warning (unit_address_vs_reg): /pmu@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:169.9-194.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:64.27-68.4: Warning (unique_unit_address): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:64.27-68.4: Warning (unique_unit_address): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:84.17-90.4: Warning (unique_unit_address): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:64.27-68.4: Warning (unique_unit_address): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:84.17-90.4: Warning (unique_unit_address): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:92.21-98.4: Warning (unique_unit_address): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:64.27-68.4: Warning (unique_unit_address): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:84.17-90.4: Warning (unique_unit_address): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:92.21-98.4: Warning (unique_unit_address): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:100.21-106.4: Warning (unique_unit_address): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:64.27-68.4: Warning (unique_unit_address): /xtal24mhz@24M: duplicate unit-address (also used in node /wdogclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:84.17-90.4: Warning (unique_unit_address): /mclk@24M: duplicate unit-address (also used in node /wdogclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:92.21-98.4: Warning (unique_unit_address): /kmiclk@24M: duplicate unit-address (also used in node /wdogclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:100.21-106.4: Warning (unique_unit_address): /sspclk@24M: duplicate unit-address (also used in node /wdogclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:108.23-114.4: Warning (unique_unit_address): /uartclk@24M: duplicate unit-address (also used in node /wdogclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:125.15-129.4: Warning (unique_unit_address): /pclk@0: duplicate unit-address (also used in node /pmu@0)
--
>> arch/arm/boot/dts/arm-realview-pbx-a9.dts:68:36: warning: '/*' within block comment [-Wcomment]
                   /*reg = <0x20000000 0x20000000>, /* 512 MiB daughterboard DDR2 */
                                                    ^
   arch/arm/boot/dts/arm-realview-pbx-a9.dts:69:36: warning: '/*' within block comment [-Wcomment]
                   /*      <0x70000000 0x20000000>; /* 512 MiB baseboard DDR */
                                                    ^
   2 warnings generated.
   arch/arm/boot/dts/arm-realview-pbx.dtsi:42.9-45.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
     also defined at arch/arm/boot/dts/arm-realview-pbx-a9.dts:67.9-70.4
   arch/arm/boot/dts/arm-realview-pbx.dtsi:64.27-68.4: Warning (unit_address_vs_reg): /xtal24mhz@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:76.20-82.4: Warning (unit_address_vs_reg): /timclk@1M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:84.17-90.4: Warning (unit_address_vs_reg): /mclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:92.21-98.4: Warning (unit_address_vs_reg): /kmiclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:100.21-106.4: Warning (unit_address_vs_reg): /sspclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:108.23-114.4: Warning (unit_address_vs_reg): /uartclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:116.23-122.4: Warning (unit_address_vs_reg): /wdogclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:125.15-129.4: Warning (unit_address_vs_reg): /pclk@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx-a9.dts:72.23-88.4: Warning (unit_address_vs_reg): /cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm-realview-pbx-a9.dts:109.13-115.4: Warning (unit_address_vs_reg): /pmu@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:169.9-194.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/arm-realview-pbx.dtsi:64.27-68.4: Warning (unique_unit_address): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:64.27-68.4: Warning (unique_unit_address): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:84.17-90.4: Warning (unique_unit_address): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:64.27-68.4: Warning (unique_unit_address): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:84.17-90.4: Warning (unique_unit_address): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:92.21-98.4: Warning (unique_unit_address): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:64.27-68.4: Warning (unique_unit_address): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:84.17-90.4: Warning (unique_unit_address): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:92.21-98.4: Warning (unique_unit_address): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:100.21-106.4: Warning (unique_unit_address): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:64.27-68.4: Warning (unique_unit_address): /xtal24mhz@24M: duplicate unit-address (also used in node /wdogclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:84.17-90.4: Warning (unique_unit_address): /mclk@24M: duplicate unit-address (also used in node /wdogclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:92.21-98.4: Warning (unique_unit_address): /kmiclk@24M: duplicate unit-address (also used in node /wdogclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:100.21-106.4: Warning (unique_unit_address): /sspclk@24M: duplicate unit-address (also used in node /wdogclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:108.23-114.4: Warning (unique_unit_address): /uartclk@24M: duplicate unit-address (also used in node /wdogclk@24M)
   arch/arm/boot/dts/arm-realview-pbx.dtsi:125.15-129.4: Warning (unique_unit_address): /pclk@0: duplicate unit-address (also used in node /pmu@0)
   arch/arm/boot/dts/arm-realview-pbx-a9.dts:90.20-93.4: Warning (unique_unit_address): /scu@1f000000: duplicate unit-address (also used in node /interrupt-controller@1f000000)


vim +48 arch/arm/boot/dts/arm-realview-pba8.dts

    25	
    26	/ {
    27		model = "ARM RealView Platform Baseboard for Cortex-A8";
    28		compatible = "arm,realview-pba8";
    29		arm,hbi = <0x178>;
    30	
    31		cpus {
    32			#address-cells = <1>;
    33			#size-cells = <0>;
    34			enable-method = "arm,realview-smp";
    35	
    36			cpu0: cpu@0 {
    37				device_type = "cpu";
    38				compatible = "arm,cortex-a8";
    39				reg = <0>;
    40			};
    41		};
    42	
    43		/*
    44		 * Using the full 512MB of RAM will require bootloader
    45		 * changes to not load the kernel to the alias at 0x0.
    46		 */
    47		memory {
  > 48			/*reg = <0x70000000 0x20000000>; /* 512 MiB baseboard DDR */
    49		};
    50	
    51		pmu: pmu@0 {
    52			compatible = "arm,cortex-a8-pmu";
    53			interrupt-parent = <&intc>;
    54			interrupts = <0 47 IRQ_TYPE_LEVEL_HIGH>;
    55			interrupt-affinity = <&cpu0>;
    56		};
    57	
    58		/* Primary GIC PL390 interrupt controller in the test chip */
    59		intc: interrupt-controller@1e000000 {
    60			compatible = "arm,pl390";
    61			#interrupt-cells = <3>;
    62			#address-cells = <1>;
    63			interrupt-controller;
    64			reg = <0x1e001000 0x1000>,
    65			      <0x1e000000 0x100>;
    66		};
    67	};
    68	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
