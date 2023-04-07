Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896478494;
	Fri,  7 Apr 2023 18:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680891122; x=1712427122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V57JsY7Mvm++kH2IO/0KrWsC57mQQSwpe9M6ha823Us=;
  b=IC8lQOrNNQN2F3KMSjB6jB0P/lxV5P+y3EgmdDISODyKLTIWU8xZc8UJ
   8PZob5YOSPAXKpBhPvFDP75yJNSgVC6fVAwKNsKdveTFAMyoe2AYp/KIP
   UkyuEeomBJ2flyagcvtV8ni6MltiURR9bursuoIZ9E9U4V/7Pz1bVjfPy
   ivqOR2NZmp8/SimBN4Y12gBEc5k65XMJvwvu7Lt22VGtCLmhHdbL5ZVDq
   IEle1aBj48TRwpFK07kcRNej28GfFrw0wLplmd+X4mO1XgWYJOlbnlLbQ
   jMHTPhbSsmpG6Dqd4bldy24Ulz6QruTwa32yvgrz0rfb0ABIFHSvxF5Em
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="345693806"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="345693806"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="717916022"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="717916022"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Apr 2023 11:11:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkqZ3-000Slc-20;
	Fri, 07 Apr 2023 18:11:57 +0000
Date: Sat, 8 Apr 2023 02:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ufs: hwmon: constify pointers to hwmon_channel_info
Message-ID: <202304080236.gChYf5FS-lkp@intel.com>
References: <20230407150137.79947-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150137.79947-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build errors:

[auto build test ERROR on mkp-scsi/for-next]
[also build test ERROR on jejb-scsi/for-next linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/ufs-hwmon-constify-pointers-to-hwmon_channel_info/20230407-231053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20230407150137.79947-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] ufs: hwmon: constify pointers to hwmon_channel_info
config: hexagon-randconfig-r045-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080236.gChYf5FS-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7697d4619c62de396a373d422e59846af320e552
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/ufs-hwmon-constify-pointers-to-hwmon_channel_info/20230407-231053
        git checkout 7697d4619c62de396a373d422e59846af320e552
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/ufs/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080236.gChYf5FS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ufs/core/ufs-hwmon.c:10:
   In file included from include/ufs/ufshcd.h:16:
   In file included from include/linux/blk-crypto-profile.h:9:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/ufs/core/ufs-hwmon.c:10:
   In file included from include/ufs/ufshcd.h:16:
   In file included from include/linux/blk-crypto-profile.h:9:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/ufs/core/ufs-hwmon.c:10:
   In file included from include/ufs/ufshcd.h:16:
   In file included from include/linux/blk-crypto-profile.h:9:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
>> drivers/ufs/core/ufs-hwmon.c:162:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[2]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info   = ufs_hwmon_info,
                     ^~~~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +162 drivers/ufs/core/ufs-hwmon.c

e88e2d32200a17 drivers/scsi/ufs/ufs-hwmon.c Avri Altman 2021-09-15  159  
e88e2d32200a17 drivers/scsi/ufs/ufs-hwmon.c Avri Altman 2021-09-15  160  static const struct hwmon_chip_info ufs_hwmon_hba_info = {
e88e2d32200a17 drivers/scsi/ufs/ufs-hwmon.c Avri Altman 2021-09-15  161  	.ops	= &ufs_hwmon_ops,
e88e2d32200a17 drivers/scsi/ufs/ufs-hwmon.c Avri Altman 2021-09-15 @162  	.info	= ufs_hwmon_info,
e88e2d32200a17 drivers/scsi/ufs/ufs-hwmon.c Avri Altman 2021-09-15  163  };
e88e2d32200a17 drivers/scsi/ufs/ufs-hwmon.c Avri Altman 2021-09-15  164  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
