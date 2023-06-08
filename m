Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1058CA32;
	Thu,  8 Jun 2023 01:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686188955; x=1717724955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3IgeIMSC7locqfGCGS9Jrx+5QZr/DIeXzFVqciv6VBI=;
  b=VRTiv0GDPpvUajeYZQZDGE3bzKh/q2zHWB/ELgzryg3v7TOYbRt+JvGx
   iwoF20kMalPapgPTNaJMdTn0p9tFxVap7SiUGzhxirnJJ7b2cY7cCdv2W
   ivGmMpYWVpU3UQ1Kbo2NdM5uQ5xy4zAM8N7U6gctd9q3iKCPx4IB+xgwO
   lFFhPgrruu0eo3onVT4Z9opePZW+pCDpYTC5Nkvaiga6UscAWCn/A9nSK
   dCtM2TneP8d0T/v1eoCkNK7CncvKhkYh+XhpS8Rzob9IC6OxBwdlcdSQG
   SSEs/EcZqIp4ANL4dJI3t4NIh0Kr++psDUm8OGA4sH6Wu0XB0yymKNg6C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="443534340"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="443534340"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 18:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709768793"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="709768793"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Jun 2023 18:49:12 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q74lz-000775-2N;
	Thu, 08 Jun 2023 01:49:11 +0000
Date: Thu, 8 Jun 2023 09:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/4] ASoC: add new trigger ordering method
Message-ID: <202306080953.UuPUjBQz-lkp@intel.com>
References: <873532hm8a.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <873532hm8a.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.4-rc5 next-20230607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-add-new-trigger-ordering-method/20230608-074707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/873532hm8a.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH 1/4] ASoC: add new trigger ordering method
config: hexagon-buildonly-randconfig-r003-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080953.UuPUjBQz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add broonie-sound https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
        git fetch broonie-sound for-next
        git checkout broonie-sound/for-next
        b4 shazam https://lore.kernel.org/r/873532hm8a.wl-kuninori.morimoto.gx@renesas.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080953.UuPUjBQz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from sound/soc/soc-pcm.c:24:
   In file included from include/sound/soc.h:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/soc-pcm.c:24:
   In file included from include/sound/soc.h:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/soc-pcm.c:24:
   In file included from include/sound/soc.h:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> sound/soc/soc-pcm.c:1075:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
    1075 | const static
         | ^~~~~~
>> sound/soc/soc-pcm.c:1078:3: error: incompatible function pointer types initializing 'const int (*)(struct snd_pcm_substream *, int, int)' with an expression of type 'int (struct snd_pcm_substream *, int, int)' [-Wincompatible-function-pointer-types]
    1078 |                 snd_soc_link_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1079:3: error: incompatible function pointer types initializing 'const int (*)(struct snd_pcm_substream *, int, int)' with an expression of type 'int (struct snd_pcm_substream *, int, int)' [-Wincompatible-function-pointer-types]
    1079 |                 snd_soc_pcm_component_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1080:3: error: incompatible function pointer types initializing 'const int (*)(struct snd_pcm_substream *, int, int)' with an expression of type 'int (struct snd_pcm_substream *, int, int)' [-Wincompatible-function-pointer-types]
    1080 |                 snd_soc_pcm_dai_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1083:3: error: incompatible function pointer types initializing 'const int (*)(struct snd_pcm_substream *, int, int)' with an expression of type 'int (struct snd_pcm_substream *, int, int)' [-Wincompatible-function-pointer-types]
    1083 |                 snd_soc_link_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1084:3: error: incompatible function pointer types initializing 'const int (*)(struct snd_pcm_substream *, int, int)' with an expression of type 'int (struct snd_pcm_substream *, int, int)' [-Wincompatible-function-pointer-types]
    1084 |                 snd_soc_pcm_dai_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1085:3: error: incompatible function pointer types initializing 'const int (*)(struct snd_pcm_substream *, int, int)' with an expression of type 'int (struct snd_pcm_substream *, int, int)' [-Wincompatible-function-pointer-types]
    1085 |                 snd_soc_pcm_component_trigger,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 6 errors generated.


vim +1078 sound/soc/soc-pcm.c

  1073	
  1074	#define TRIGGER_MAX 3
> 1075	const static
  1076	int (*trigger[][TRIGGER_MAX])(struct snd_pcm_substream *substream, int cmd, int rollback) = {
  1077		[SND_SOC_TRIGGER_ORDER_DEFAULT] = {
> 1078			snd_soc_link_trigger,
  1079			snd_soc_pcm_component_trigger,
  1080			snd_soc_pcm_dai_trigger,
  1081		},
  1082		[SND_SOC_TRIGGER_ORDER_LDC] = {
  1083			snd_soc_link_trigger,
  1084			snd_soc_pcm_dai_trigger,
  1085			snd_soc_pcm_component_trigger,
  1086		},
  1087	};
  1088	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
