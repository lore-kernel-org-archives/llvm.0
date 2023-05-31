Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283DCEA6;
	Wed, 31 May 2023 02:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685501941; x=1717037941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BALmWeeuedFL0DVbHkciqCqCoX3nMmYQLv8f1PS7hc8=;
  b=IIYxwH4X2QN6DL0wxsbUFsNEwAO4rPUPeJ/mBfiLweOgiGSTjiS3wmmt
   wo+StIoMXRiZH3zvsns6xZMUC4dEBR8HzjkzGjpkbO9GDN93VwUEMV85c
   gl/apBe4xSe7Cz8f7HyWezj5BL2GbvgB37SFcCZBvHdlVp2Syn5DBKg7i
   ftUT5+T5EJ5nlikCiOAz3dKrehJCxD9jPqmoqsxudb1tAYNaHjWfArtIW
   uLJlE2NVia5Sfh8LvsZgUVsILvUSqpGq0TEfSq1HmvSixyL8OtbR0xz3k
   CoWBoxOBljMOih+dBD+a1A/EGgcnGuwKlI55JgaB+kDWALt+dIrEye2ad
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="335465192"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="335465192"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 19:59:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="953432382"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="953432382"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 May 2023 19:58:55 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4C35-00011j-0T;
	Wed, 31 May 2023 02:58:55 +0000
Date: Wed, 31 May 2023 10:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jing Zhang <renyu.zj@linux.alibaba.com>,
	John Garry <john.g.garry@oracle.com>,
	Ian Rogers <irogers@google.com>, Will Deacon <will@kernel.org>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Robin Murphy <robin.murphy@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Zhuo Song <zhuo.song@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>
Subject: Re: [PATCH v3 1/7] driver/perf: Add identifier sysfs file for CMN
Message-ID: <202305311005.YR2SisSe-lkp@intel.com>
References: <1685438374-33287-2-git-send-email-renyu.zj@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1685438374-33287-2-git-send-email-renyu.zj@linux.alibaba.com>

Hi Jing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/perf/core]
[also build test WARNING on acme/perf/core arm-perf/for-next/perf linus/master v6.4-rc4 next-20230530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jing-Zhang/driver-perf-Add-identifier-sysfs-file-for-CMN/20230530-172139
base:   tip/perf/core
patch link:    https://lore.kernel.org/r/1685438374-33287-2-git-send-email-renyu.zj%40linux.alibaba.com
patch subject: [PATCH v3 1/7] driver/perf: Add identifier sysfs file for CMN
config: hexagon-buildonly-randconfig-r006-20230530 (https://download.01.org/0day-ci/archive/20230531/202305311005.YR2SisSe-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c7483d062f1b91e98b028fa720b8a98b94ec9bc5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jing-Zhang/driver-perf-Add-identifier-sysfs-file-for-CMN/20230530-172139
        git checkout c7483d062f1b91e98b028fa720b8a98b94ec9bc5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305311005.YR2SisSe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/perf/arm-cmn.c:9:
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
   In file included from drivers/perf/arm-cmn.c:9:
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
   In file included from drivers/perf/arm-cmn.c:9:
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
>> drivers/perf/arm-cmn.c:2379:41: warning: unused variable 'arm_cmn600_data' [-Wunused-const-variable]
   static const struct arm_cmn_device_data arm_cmn600_data = {
                                           ^
>> drivers/perf/arm-cmn.c:2384:41: warning: unused variable 'arm_cmn650_data' [-Wunused-const-variable]
   static const struct arm_cmn_device_data arm_cmn650_data = {
                                           ^
>> drivers/perf/arm-cmn.c:2389:41: warning: unused variable 'arm_cmn700_data' [-Wunused-const-variable]
   static const struct arm_cmn_device_data arm_cmn700_data = {
                                           ^
>> drivers/perf/arm-cmn.c:2394:41: warning: unused variable 'arm_ci700_data' [-Wunused-const-variable]
   static const struct arm_cmn_device_data arm_ci700_data = {
                                           ^
   10 warnings generated.


vim +/arm_cmn600_data +2379 drivers/perf/arm-cmn.c

  2378	
> 2379	static const struct arm_cmn_device_data arm_cmn600_data = {
  2380		.model_name = "arm_cmn600",
  2381		.model = CMN600
  2382	};
  2383	
> 2384	static const struct arm_cmn_device_data arm_cmn650_data = {
  2385		.model_name = "arm_cmn650",
  2386		.model = CMN650
  2387	};
  2388	
> 2389	static const struct arm_cmn_device_data arm_cmn700_data = {
  2390		.model_name = "arm_cmn700",
  2391		.model = CMN700
  2392	};
  2393	
> 2394	static const struct arm_cmn_device_data arm_ci700_data = {
  2395		.model_name = "arm_ci700",
  2396		.model = CI700
  2397	};
  2398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
