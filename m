Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B03290C;
	Sun, 10 Dec 2023 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BykUgVgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702210807; x=1733746807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NVYibZ6S+fMVNCRReoEAo+y7BLN2Kq3pEjr4N3r1XKs=;
  b=BykUgVgy9bAB+pruR1bFGn715HpaMabEYodcxGZsghKqPN7P+xbVjo6y
   KxsXlW4I/l5+IBxMKRcz7A5MiBB4EZH3DsLnbcRBVXGUA7aKtsuRl9Nqz
   lL6Dp5emgsKaiUVLvS9fPjA8ku/yBk2Kkg+FfBZZPoER4hGdFC5D3hMig
   iEyzJfsL4bCVoVvgoDAMbUYz/DzJzzW3oJcjzQPZZLvVbVsnR5uOhjFj5
   OdQbeapwKR5qg0JBx5DZt4QL1/UuI/WwIBYo95IORNK0GzdvjDooIjExJ
   uLVUqlc+oooqZv9D2cB/cnwrAoOQM6473uXgHQm6TnLr/PUjEvY5isyWL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="374058121"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="374058121"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 04:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="801654372"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="801654372"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Dec 2023 04:20:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCImw-000GoZ-2u;
	Sun, 10 Dec 2023 12:20:02 +0000
Date: Sun, 10 Dec 2023 20:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 03/10] soc: qcom: spm: add support for voltage
 regulator
Message-ID: <202312102051.Wlgq1q5I-lkp@intel.com>
References: <20231207130703.3322321-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207130703.3322321-4-dmitry.baryshkov@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231207]
[also build test WARNING on v6.7-rc4]
[cannot apply to robh/for-next linus/master v6.7-rc4 v6.7-rc3 v6.7-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/dt-bindings-soc-qcom-merge-qcom-saw2-txt-into-qcom-spm-yaml/20231207-210841
base:   next-20231207
patch link:    https://lore.kernel.org/r/20231207130703.3322321-4-dmitry.baryshkov%40linaro.org
patch subject: [PATCH v5 03/10] soc: qcom: spm: add support for voltage regulator
config: hexagon-randconfig-001-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102051.Wlgq1q5I-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102051.Wlgq1q5I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312102051.Wlgq1q5I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/qcom/spm.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/soc/qcom/spm.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/soc/qcom/spm.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/soc/qcom/spm.c:293:35: warning: unused variable 'spm_reg_ops' [-Wunused-const-variable]
     293 | static const struct regulator_ops spm_reg_ops = {
         |                                   ^
   drivers/soc/qcom/spm.c:359:12: warning: unused function 'spm_get_cpu' [-Wunused-function]
     359 | static int spm_get_cpu(struct device *dev)
         |            ^
   8 warnings generated.


vim +/spm_reg_ops +293 drivers/soc/qcom/spm.c

   292	
 > 293	static const struct regulator_ops spm_reg_ops = {
   294		.set_voltage_sel	= spm_set_voltage_sel,
   295		.get_voltage_sel	= spm_get_voltage_sel,
   296		.list_voltage		= regulator_list_voltage_linear_range,
   297		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
   298	};
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
