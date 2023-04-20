Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F5023A3;
	Thu, 20 Apr 2023 06:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681971595; x=1713507595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N+n1Z78ILMVR/3eTTuI5UBB9Fs6Wkrx0Nk4JkVTtGJk=;
  b=hqFcoqH99+Zx9sIbnAkhXOLABHD/d1/GAWLCqwFteG+DRxGgq+p/EjJx
   BLy0vC9/Hm+L6Gm7g3yVaOoUBeOfDuTXuIHpX9dTCKimrcOk1S6leTfnh
   U8pMz0RrWlCZMAwG6wyUihHrubzm/4u8EiDJPGNm3i1ZnpODPy+JouF8m
   kPYafVylOxCrtfvQGoJ79dxE84r+3Ul1EM9P0LEYrhNTsNBg+JaQDH0jT
   S2MimTy7fm8n0J82R763KTF83SsCP/XfIqBb7CbgxLDrjI97IkFBYHw04
   4twoqiy+D6ehNqIL+HKvNhDhPqI4ohhRjWI90Uk8cmz5tQgQAjnDKboDP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325255277"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="325255277"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 23:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021468205"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="1021468205"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Apr 2023 23:19:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppNdg-000fXi-2m;
	Thu, 20 Apr 2023 06:19:28 +0000
Date: Thu, 20 Apr 2023 14:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	dave.stevenson@raspberrypi.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2] media: i2c: add ov01a10 image sensor driver
Message-ID: <202304201334.WEmWyl5t-lkp@intel.com>
References: <20230420042213.2045722-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420042213.2045722-1-bingbu.cao@intel.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/bingbu-cao-intel-com/media-i2c-add-ov01a10-image-sensor-driver/20230420-121223
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230420042213.2045722-1-bingbu.cao%40intel.com
patch subject: [PATCH v2] media: i2c: add ov01a10 image sensor driver
config: hexagon-randconfig-r034-20230420 (https://download.01.org/0day-ci/archive/20230420/202304201334.WEmWyl5t-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0e64aee285d653993f7a4fdf42e0ce4fd0d4d4c6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review bingbu-cao-intel-com/media-i2c-add-ov01a10-image-sensor-driver/20230420-121223
        git checkout 0e64aee285d653993f7a4fdf42e0ce4fd0d4d4c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201334.WEmWyl5t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/ov01a10.c:10:
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
   In file included from drivers/media/i2c/ov01a10.c:10:
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
   In file included from drivers/media/i2c/ov01a10.c:10:
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
>> drivers/media/i2c/ov01a10.c:943:36: warning: unused variable 'ov01a10_acpi_ids' [-Wunused-const-variable]
   static const struct acpi_device_id ov01a10_acpi_ids[] = {
                                      ^
   7 warnings generated.


vim +/ov01a10_acpi_ids +943 drivers/media/i2c/ov01a10.c

   942	
 > 943	static const struct acpi_device_id ov01a10_acpi_ids[] = {
   944		{"OVTI01A0"},
   945		{}
   946	};
   947	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
