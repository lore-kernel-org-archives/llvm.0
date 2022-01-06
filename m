Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8322CA3
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 06:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641449234; x=1672985234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7AkrZf7HriC31XhCU+7euIHqwBZbtNb8QCpPnoeBj8s=;
  b=mCFbcY3xn8M82v3Y9bEtI/ey/FTrdx/7xTx9zaPD9b+UZldgqway8VO0
   32lqKPEJJ+ZH7oSJIMhOTSECa3XRufMKrlYOzGtgPAibgqjkcuNjNgtDX
   OoJoSs0d2Ih5NTxwz91ant0HDZlHMxVUph6E1qdlZDgX6x8wCSt76xxcb
   to5eWdt85grjrNR+SAVb8GFriFT/YELoi6wEc5LHNO8Gz1mnZxpbe+Lfs
   HWbvTavGDFSI/MvgDWJAOni7JnlnlwPiko06liiJXESIM/namVb6r5KHe
   edOFrS4NwwLmqVReseAueJaBq7QzOTBa5fP1RWobtvy0yPFK40qt5WKzI
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="240145322"
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; 
   d="scan'208";a="240145322"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 22:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; 
   d="scan'208";a="472770884"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Jan 2022 22:07:07 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5LvX-000HOd-25; Thu, 06 Jan 2022 06:07:07 +0000
Date: Thu, 6 Jan 2022 14:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Silverman <brian.silverman@bluerivertech.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] can: m_can: Add driver for M_CAN hardware in NVIDIA
 devices
Message-ID: <202201061251.9fCLutdh-lkp@intel.com>
References: <20220106002514.24589-1-brian.silverman@bluerivertech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106002514.24589-1-brian.silverman@bluerivertech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Brian,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on mkl-can-next/testing]
[also build test ERROR on v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Brian-Silverman/can-m_can-Add-driver-for-M_CAN-hardware-in-NVIDIA-devices/20220106-082838
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git testing
config: i386-randconfig-a012-20220105
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3c5bcd8d6834eb3e2ac215c9aa35b662aca84aac
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Brian-Silverman/can-m_can-Add-driver-for-M_CAN-hardware-in-NVIDIA-devices/20220106-082838
        git checkout 3c5bcd8d6834eb3e2ac215c9aa35b662aca84aac
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=i386  randconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/can/m_can/Kconfig:29: syntax error
   drivers/net/can/m_can/Kconfig:28: unknown statement "---help---"
   drivers/net/can/m_can/Kconfig:29:warning: ignoring unsupported character ','
   drivers/net/can/m_can/Kconfig:29: unknown statement "Say"
   drivers/net/can/m_can/Kconfig:30:warning: ignoring unsupported character '.'
   drivers/net/can/m_can/Kconfig:30: unknown statement "with"
   drivers/net/can/m_can/Kconfig:31:warning: ignoring unsupported character '/'
   drivers/net/can/m_can/Kconfig:31: unknown statement "This"
   drivers/net/can/m_can/Kconfig:32: unknown statement "controller"
   drivers/net/can/m_can/Kconfig:33:warning: ignoring unsupported character '.'
   drivers/net/can/m_can/Kconfig:33: unknown statement "processor"
   make[2]: *** [scripts/kconfig/Makefile:77: oldconfig] Error 1
   make[1]: *** [Makefile:619: oldconfig] Error 2
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/net/can/m_can/Kconfig:29: syntax error
   drivers/net/can/m_can/Kconfig:28: unknown statement "---help---"
   drivers/net/can/m_can/Kconfig:29:warning: ignoring unsupported character ','
   drivers/net/can/m_can/Kconfig:29: unknown statement "Say"
   drivers/net/can/m_can/Kconfig:30:warning: ignoring unsupported character '.'
   drivers/net/can/m_can/Kconfig:30: unknown statement "with"
   drivers/net/can/m_can/Kconfig:31:warning: ignoring unsupported character '/'
   drivers/net/can/m_can/Kconfig:31: unknown statement "This"
   drivers/net/can/m_can/Kconfig:32: unknown statement "controller"
   drivers/net/can/m_can/Kconfig:33:warning: ignoring unsupported character '.'
   drivers/net/can/m_can/Kconfig:33: unknown statement "processor"
   make[2]: *** [scripts/kconfig/Makefile:77: olddefconfig] Error 1
   make[1]: *** [Makefile:619: olddefconfig] Error 2
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +29 drivers/net/can/m_can/Kconfig

     9	
    10	config CAN_M_CAN_PCI
    11		tristate "Generic PCI Bus based M_CAN driver"
    12		depends on PCI
    13		help
    14		  Say Y here if you want to support Bosch M_CAN controller connected
    15		  to the pci bus.
    16	
    17	config CAN_M_CAN_PLATFORM
    18		tristate "Bosch M_CAN support for io-mapped devices"
    19		depends on HAS_IOMEM
    20		help
    21		  Say Y here if you want support for IO Mapped Bosch M_CAN controller.
    22		  This support is for devices that have the Bosch M_CAN controller
    23		  IP embedded into the device and the IP is IO Mapped to the processor.
    24	
    25	config CAN_M_CAN_TEGRA
    26		tristate "Bosch M_CAN support for io-mapped devices on NVIDIA Tegra"
    27		depends on HAS_IOMEM
    28		---help---
  > 29		  Say Y here if you want support for IO Mapped Bosch M_CAN controller,
    30		  with additional NVIDIA Tegra-specific glue logic.
    31		  This support is for Tegra devices that have the Bosch M_CAN/M_TTCAN
    32			controller IP embedded into the device and the IP is IO Mapped to the
    33			processor.
    34	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
