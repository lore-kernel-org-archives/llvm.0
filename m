Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E784A2F48
	for <llvm@lists.linux.dev>; Thu, 16 Jun 2022 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655399590; x=1686935590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A+VKyUwo6r/29IE+tEGCUobPdPvJ+Sqrh0mVlDij3s4=;
  b=RJ3r3/eD1NNsakJiAaX5kA/hWNcxcNk9f7t6m5sCeApGZCxgaScAvjGp
   9pxATMpGOxX+dabTg28NnTc+xUTxb3FF0lswQQ5Vj2t+VXHmiQKCD/e0C
   NM8G1Fhe6AVbOBOZBC7H8UXYobs8/VuQ9wSVAtgjXlCyKEWExa6Afj+Z4
   ZNtllJ28dj4CNS2dY5aJG8ZajP5DJLgtjj5E0BBdswr07aVyvYawqtWn0
   pmT9+Yzy+Njxt5qVVuRbTrkf0g7zcBWJKB+1sduoZlAYyALoXT43xUCqv
   MQgAFi6U9SxzoXfpRbZsDqfS8IYLgm9nUvs3XVN8yfVtxc/+HJlWD2H3K
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259153343"
X-IronPort-AV: E=Sophos;i="5.92,305,1650956400"; 
   d="scan'208";a="259153343"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 10:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,305,1650956400"; 
   d="scan'208";a="653246345"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2022 10:13:09 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1t3M-000ObN-Cf;
	Thu, 16 Jun 2022 17:13:08 +0000
Date: Fri, 17 Jun 2022 01:12:32 +0800
From: kernel test robot <lkp@intel.com>
To: Eli Cohen <elic@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 1/3] vdpa/mlx5: Implement susupend virtqueue callback
Message-ID: <202206170119.3hXbEXxz-lkp@intel.com>
References: <20220616132725.50599-2-elic@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616132725.50599-2-elic@nvidia.com>

Hi Eli,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc2 next-20220616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Eli-Cohen/Support-live-migration-with-mlx5_vdpa/20220616-213010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 30306f6194cadcc29c77f6ddcd416a75bf5c0232
config: riscv-randconfig-r042-20220616 (https://download.01.org/0day-ci/archive/20220617/202206170119.3hXbEXxz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/3c2592433495f8e099adf6734416c288e847c8f8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eli-Cohen/Support-live-migration-with-mlx5_vdpa/20220616-213010
        git checkout 3c2592433495f8e099adf6734416c288e847c8f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/vdpa/mlx5/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/vdpa/mlx5/net/mlx5_vnet.c:5:
   In file included from include/linux/vdpa.h:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/vdpa/mlx5/net/mlx5_vnet.c:5:
   In file included from include/linux/vdpa.h:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/vdpa/mlx5/net/mlx5_vnet.c:5:
   In file included from include/linux/vdpa.h:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:2819:3: error: field designator 'suspend' does not refer to any field in type 'const struct vdpa_config_ops'
           .suspend = mlx5_vdpa_suspend,
            ^
   7 warnings and 1 error generated.


vim +2819 drivers/vdpa/mlx5/net/mlx5_vnet.c

  2788	
  2789	static const struct vdpa_config_ops mlx5_vdpa_ops = {
  2790		.set_vq_address = mlx5_vdpa_set_vq_address,
  2791		.set_vq_num = mlx5_vdpa_set_vq_num,
  2792		.kick_vq = mlx5_vdpa_kick_vq,
  2793		.set_vq_cb = mlx5_vdpa_set_vq_cb,
  2794		.set_vq_ready = mlx5_vdpa_set_vq_ready,
  2795		.get_vq_ready = mlx5_vdpa_get_vq_ready,
  2796		.set_vq_state = mlx5_vdpa_set_vq_state,
  2797		.get_vq_state = mlx5_vdpa_get_vq_state,
  2798		.get_vendor_vq_stats = mlx5_vdpa_get_vendor_vq_stats,
  2799		.get_vq_notification = mlx5_get_vq_notification,
  2800		.get_vq_irq = mlx5_get_vq_irq,
  2801		.get_vq_align = mlx5_vdpa_get_vq_align,
  2802		.get_vq_group = mlx5_vdpa_get_vq_group,
  2803		.get_device_features = mlx5_vdpa_get_device_features,
  2804		.set_driver_features = mlx5_vdpa_set_driver_features,
  2805		.get_driver_features = mlx5_vdpa_get_driver_features,
  2806		.set_config_cb = mlx5_vdpa_set_config_cb,
  2807		.get_vq_num_max = mlx5_vdpa_get_vq_num_max,
  2808		.get_device_id = mlx5_vdpa_get_device_id,
  2809		.get_vendor_id = mlx5_vdpa_get_vendor_id,
  2810		.get_status = mlx5_vdpa_get_status,
  2811		.set_status = mlx5_vdpa_set_status,
  2812		.reset = mlx5_vdpa_reset,
  2813		.get_config_size = mlx5_vdpa_get_config_size,
  2814		.get_config = mlx5_vdpa_get_config,
  2815		.set_config = mlx5_vdpa_set_config,
  2816		.get_generation = mlx5_vdpa_get_generation,
  2817		.set_map = mlx5_vdpa_set_map,
  2818		.free = mlx5_vdpa_free,
> 2819		.suspend = mlx5_vdpa_suspend,
  2820	};
  2821	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
