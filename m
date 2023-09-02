Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E5E17E1;
	Sat,  2 Sep 2023 03:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693624869; x=1725160869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OhIqMbUbOOWVETjMdSrdXDJq9r+qQHGx1UnX35EU7J4=;
  b=RXofzfALxdOYRI+9llK1lsSQiQvtxkmuSX9JKb2zvUL6vO+nXZ2z2bxr
   tXswlcEMwGtuYfHhX5ADk81I4KEKLa9RmHj+TBsdA8hw1cFSurXh9hBVJ
   lTKxBsGO6lOL6E0rb7ErcTs5l9A+pEBfkBs35+cG6DkGCVMrCATPsJebQ
   IEXhTbpDU3FYF76gx1z+YS8ex3pIYEvNdkFc/5xnmtQJTElnAN1N3mnXr
   XhUeOR4m3J0xJ35Fym4OQglPTRe2LXTR5xjyEKNcin0QB35EsOHpPspmT
   l/uKUI3u8YAr9B6ge9K0CAq9R+3nnVuRTkLv5vy1gyIoZ0paiea19Gmtu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="380133814"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="380133814"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 20:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805653883"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="805653883"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Sep 2023 20:21:04 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcHC2-0001uf-1y;
	Sat, 02 Sep 2023 03:21:02 +0000
Date: Sat, 2 Sep 2023 11:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	robdclark@gmail.com, quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org, sean@poorly.run,
	marijn.suijten@somainline.org, robh@kernel.org,
	steven.price@arm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, adrian.larumbe@collabora.com,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	healych@amazon.com, kernel@collabora.com,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 2/6] drm/panfrost: Add fdinfo support GPU load metrics
Message-ID: <202309021155.i3NPUDJi-lkp@intel.com>
References: <20230824013604.466224-3-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230824013604.466224-3-adrian.larumbe@collabora.com>

Hi Adrián,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.5 next-20230831]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panfrost-Add-cycle-count-GPU-register-definitions/20230824-093848
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230824013604.466224-3-adrian.larumbe%40collabora.com
patch subject: [PATCH v2 2/6] drm/panfrost: Add fdinfo support GPU load metrics
config: s390-randconfig-001-20230902 (https://download.01.org/0day-ci/archive/20230902/202309021155.i3NPUDJi-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021155.i3NPUDJi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021155.i3NPUDJi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/panfrost/panfrost_drv.c:17:
   In file included from drivers/gpu/drm/panfrost/panfrost_device.h:9:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/gpu/drm/panfrost/panfrost_drv.c:17:
   In file included from drivers/gpu/drm/panfrost/panfrost_device.h:9:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/gpu/drm/panfrost/panfrost_drv.c:17:
   In file included from drivers/gpu/drm/panfrost/panfrost_device.h:9:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/panfrost/panfrost_drv.c:552:17: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
                              ei->name, pfdev->pfdevfreq.current_frequency);
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.


vim +552 drivers/gpu/drm/panfrost/panfrost_drv.c

   534	
   535	
   536	static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
   537					     struct panfrost_file_priv *panfrost_priv,
   538					     struct drm_printer *p)
   539	{
   540		int i;
   541	
   542		for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
   543			struct engine_info *ei = &panfrost_priv->fdinfo.engines[i];
   544	
   545			drm_printf(p, "drm-engine-%s:\t%llu ns\n",
   546				   ei->name, ei->elapsed_ns);
   547			drm_printf(p, "drm-cycles-%s:\t%llu\n",
   548				   ei->name, ei->cycles);
   549			drm_printf(p, "drm-maxfreq-%s:\t%u Hz\n",
   550				   ei->name, panfrost_priv->fdinfo.maxfreq);
   551			drm_printf(p, "drm-curfreq-%s:\t%u Hz\n",
 > 552				   ei->name, pfdev->pfdevfreq.current_frequency);
   553		}
   554	}
   555	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
