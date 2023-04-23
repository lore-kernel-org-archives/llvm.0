Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA573D76;
	Sun, 23 Apr 2023 22:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682289214; x=1713825214;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eYcRtGlFFRppamKGX+lW+LOC/bW/gk43KK9RxuCxbYw=;
  b=WGqsg0x9/jj9lN0j6+09id6zQUh3syuCeOt8L0bcWwpjwMUfK1PhETaQ
   Bq56/7K2G/q5MNi3GJELg2RgCpmFC2/7Q24h5OKsQrXvNNxnLxbs5Opov
   wwTAazFoNtb94slwXItOxjxUVlb3wgKlDRiNp36LwbSwNzXJg9EhGhOwn
   9m8635dznQC3COXaAtP4Vi6mgzLsFyyxL9WwItZf/jb8HTtRvzuDMvkoM
   L3x3pPTXwU0L97Wt+9CkcyRO+bdG6wCvlCHyttzTj+pUI9eF2KlBnGTCP
   WwnNiRkhVSEe+oxLECJveJYnduxLKdlPSsVEhx/hpku0XCYD3EFKODt1t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="325920344"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="325920344"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 15:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="762195556"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="762195556"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Apr 2023 15:33:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqiGx-000i7o-1T;
	Sun, 23 Apr 2023 22:33:31 +0000
Date: Mon, 24 Apr 2023 06:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/070-audio 40/40]
 sound/soc/codecs/cs42l84.c:1062:34: warning: unused variable
 'cs42l84_of_match'
Message-ID: <202304240619.0SB66hSu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   04466302f3a6cb36c4784f371777f254644bfff3
commit: 04466302f3a6cb36c4784f371777f254644bfff3 [40/40] fixup! wip: ASoC: cs42l84: Start new codec driver
config: hexagon-randconfig-r045-20230424 (https://download.01.org/0day-ci/archive/20230424/202304240619.0SB66hSu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/04466302f3a6cb36c4784f371777f254644bfff3
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/070-audio
        git checkout 04466302f3a6cb36c4784f371777f254644bfff3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304240619.0SB66hSu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/cs42l84.c:21:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
   In file included from sound/soc/codecs/cs42l84.c:21:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from sound/soc/codecs/cs42l84.c:21:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
>> sound/soc/codecs/cs42l84.c:1062:34: warning: unused variable 'cs42l84_of_match' [-Wunused-const-variable]
   static const struct of_device_id cs42l84_of_match[] = {
                                    ^
   7 warnings generated.


vim +/cs42l84_of_match +1062 sound/soc/codecs/cs42l84.c

9e86ecb7bce72a Martin Povišer 2022-06-29  1061  
9e86ecb7bce72a Martin Povišer 2022-06-29 @1062  static const struct of_device_id cs42l84_of_match[] = {
9e86ecb7bce72a Martin Povišer 2022-06-29  1063  	{ .compatible = "cirrus,cs42l84", },
9e86ecb7bce72a Martin Povišer 2022-06-29  1064  	{}
9e86ecb7bce72a Martin Povišer 2022-06-29  1065  };
9e86ecb7bce72a Martin Povišer 2022-06-29  1066  MODULE_DEVICE_TABLE(of, cs42l84_of_match);
9e86ecb7bce72a Martin Povišer 2022-06-29  1067  

:::::: The code at line 1062 was first introduced by commit
:::::: 9e86ecb7bce72a03d9992664f460e1afbd91ba19 wip: ASoC: cs42l84: Start new codec driver

:::::: TO: Martin Povišer <povik+lin@cutebit.org>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
