Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D40523A2;
	Wed, 19 Apr 2023 15:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681916555; x=1713452555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XBiJTfIgTend9c6JUHceG7etl4rakE4n2xhOljQ08Ns=;
  b=UxATrn8NZ6OcsI2OLCg4gA+DUFGzphMV0FPYp4nBdYs7XRDPwFKuaGuA
   BpWp4c67rtTw4oEJsbpBecUsZH8+9L9/dN2kvAfLbHnG3ck1bp7DHVfZ/
   RPU72Jg6qCneVH+ws6cqQICyIX0J7/7CgpZHvZLt5k2hfz3I22fuNdB/5
   FiEFbUkpA1j4E0KI6zrVxystxVMyNiJA3O7uCOtKbi1kLGAwqZD2fU/KS
   UOzQ3DXwW3iHdN84CRNysvzJ/Luj6jBeB0+m8qI82oGCyAKDO6ZuNcmoJ
   SD7ueAVeS3C0GiWQbl9ll6r7SYPJNGlPTeJHH3bjoD8J3+me7LGMLkeRi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="334281334"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="334281334"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 08:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="724079780"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="724079780"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Apr 2023 08:01:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp9Jg-000ewD-0s;
	Wed, 19 Apr 2023 15:01:52 +0000
Date: Wed, 19 Apr 2023 23:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: nick.hawkins@hpe.com, verdun@hpe.com, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
	linux@roeck-us.net, linux@armlinux.org.uk,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 2/9] hwmon: (gxp_fan_ctrl) Give GPIO access to fan data
Message-ID: <202304192243.9hwJ1Cad-lkp@intel.com>
References: <20230418152824.110823-3-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418152824.110823-3-nick.hawkins@hpe.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next linus/master v6.3-rc7]
[cannot apply to brgl/gpio/for-next next-20230418]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/nick-hawkins-hpe-com/gpio-gxp-Add-HPE-GXP-GPIO/20230418-233513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230418152824.110823-3-nick.hawkins%40hpe.com
patch subject: [PATCH v1 2/9] hwmon: (gxp_fan_ctrl) Give GPIO access to fan data
config: hexagon-randconfig-r045-20230419 (https://download.01.org/0day-ci/archive/20230419/202304192243.9hwJ1Cad-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/be3722d7f32fea1ea375090d05cbfdd3dd4e04d3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review nick-hawkins-hpe-com/gpio-gxp-Add-HPE-GXP-GPIO/20230418-233513
        git checkout be3722d7f32fea1ea375090d05cbfdd3dd4e04d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash block/partitions/ drivers/hwmon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304192243.9hwJ1Cad-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/gxp-fan-ctrl.c:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/hwmon/gxp-fan-ctrl.c:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/hwmon/gxp-fan-ctrl.c:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/hwmon/gxp-fan-ctrl.c:32:4: warning: no previous prototype for function 'get_fans_installed' [-Wmissing-prototypes]
   u8 get_fans_installed(void)
      ^
   drivers/hwmon/gxp-fan-ctrl.c:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u8 get_fans_installed(void)
   ^
   static 
>> drivers/hwmon/gxp-fan-ctrl.c:52:4: warning: no previous prototype for function 'get_fans_failed' [-Wmissing-prototypes]
   u8 get_fans_failed(void)
      ^
   drivers/hwmon/gxp-fan-ctrl.c:52:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u8 get_fans_failed(void)
   ^
   static 
   8 warnings generated.


vim +/get_fans_installed +32 drivers/hwmon/gxp-fan-ctrl.c

    31	
  > 32	u8 get_fans_installed(void)
    33	{
    34		static u8 val;
    35	
    36		val = readb(drvdata->plreg + OFS_FAN_INST);
    37	
    38		return val;
    39	}
    40	EXPORT_SYMBOL(get_fans_installed);
    41	
    42	static long fan_failed(struct device *dev, int fan)
    43	{
    44		struct gxp_fan_ctrl_drvdata *drvdata = dev_get_drvdata(dev);
    45		u8 val;
    46	
    47		val = readb(drvdata->plreg + OFS_FAN_FAIL);
    48	
    49		return !!(val & BIT(fan));
    50	}
    51	
  > 52	u8 get_fans_failed(void)
    53	{
    54		static u8 val;
    55	
    56		val = readb(drvdata->plreg + OFS_FAN_FAIL);
    57	
    58		return val;
    59	}
    60	EXPORT_SYMBOL(get_fans_failed);
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
