Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EED91CEE8D;
	Thu, 10 Oct 2024 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728548761; cv=none; b=c753+Kd1FBaxkNxCOR3I653m1UtO/sNK4YxtaiSkQYK1gKOIS5m8PYT9E2i7Gei3c59RRChdRcsyId31fwnFQEGl31bhd0XyjpL7T1hVB8lN3ot/xidj0OGtqytgFSqMew9RTAkMnXoAngOAsS6E2SV41cfqxJc8Na8RjRhT1dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728548761; c=relaxed/simple;
	bh=XP2xgM9KgTSJKHIv3PGttmR9ZZZOtNbxs8mz5yZbxnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYgFPW0yDhHhCcA630clQDSo7/+NYPu2PhxLkCUUxrLxFWiYNBXUIWB3sAkOR9MYhOVvmZvKV/4/7yUZMCErRE26lhPNN0B6JjwUOKg8kuSqEYZDGLxKfv9IVaLwhjuP6nXI889kUJK/ofJwaU2M3cylG2sdEMZJ/ZkZT+L3uGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWGOlU+X; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWGOlU+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728548760; x=1760084760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XP2xgM9KgTSJKHIv3PGttmR9ZZZOtNbxs8mz5yZbxnI=;
  b=HWGOlU+X/akUzogQuq1tKx7UHgh/FtCBbvqOXx3fLoS7VqRYH5gPvUm/
   fxhLIRlG3MASxHxMCrQx+hgM3aLzSWiy5qKjv9FPyCKOVEYhLSPv9hlAo
   5xoz39nUIJxBepz0RLF1ag3jo54anJan5R78KERElLFldtfEmARDWrbzM
   5x+6biAA/KZw1ojGYvp/QwhWWAI0i4pNeoKmxUMki948ZMR+a4hW/QqJt
   ppft9dKJgcDwqPrcGjru7FnY23JZAI8kF+g/74lvo+8OOXeGBu/K6LSQx
   9h15cjDSGLaq2x3SLEBGxk5HeLWODFH/mTi4+zzr7/EjUKHI0xwc8ah7+
   w==;
X-CSE-ConnectionGUID: 6Wmhqm0GS6KI205e/Rb3Pw==
X-CSE-MsgGUID: Ym11d4UyTUCHiCe/RHKfTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38535854"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="38535854"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 01:25:57 -0700
X-CSE-ConnectionGUID: SGhlmqg2SSyjOdyoNEEolQ==
X-CSE-MsgGUID: RS0hFUoTTfyUbMCbaz+7og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76511804"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2024 01:25:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syoUc-000AOJ-0C;
	Thu, 10 Oct 2024 08:25:54 +0000
Date: Thu, 10 Oct 2024 16:25:44 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 7/9] ASoC: loongson: Add I2S controller driver as
 platform device
Message-ID: <202410101647.o1lI37ou-lkp@intel.com>
References: <36c143358c7f48bc2e73c30e1d2009b2f2fc6498.1728459624.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36c143358c7f48bc2e73c30e1d2009b2f2fc6498.1728459624.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on d19f6bf5f17d77fb645654237130c94571c68a3d]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/ASoC-dt-bindings-Add-Everest-ES8323-Codec/20241009-155516
base:   d19f6bf5f17d77fb645654237130c94571c68a3d
patch link:    https://lore.kernel.org/r/36c143358c7f48bc2e73c30e1d2009b2f2fc6498.1728459624.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v3 7/9] ASoC: loongson: Add I2S controller driver as platform device
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241010/202410101647.o1lI37ou-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101647.o1lI37ou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101647.o1lI37ou-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/loongson/loongson_i2s_pci.c:12:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from sound/soc/loongson/loongson_i2s_pci.c:12:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/loongson/loongson_i2s_pci.c:12:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/loongson/loongson_i2s_pci.c:12:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> sound/soc/loongson/loongson_i2s_pci.c:157:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     157 | module_pci_driver(loongson_i2s_driver);
         | ^
         | int
>> sound/soc/loongson/loongson_i2s_pci.c:157:19: error: a parameter list without types is only allowed in a function definition
     157 | module_pci_driver(loongson_i2s_driver);
         |                   ^
   7 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/int +157 sound/soc/loongson/loongson_i2s_pci.c

d84881e06836dc Yingkun Meng 2023-06-15  148  
d84881e06836dc Yingkun Meng 2023-06-15  149  static struct pci_driver loongson_i2s_driver = {
d84881e06836dc Yingkun Meng 2023-06-15  150  	.name = "loongson-i2s-pci",
d84881e06836dc Yingkun Meng 2023-06-15  151  	.id_table = loongson_i2s_ids,
d84881e06836dc Yingkun Meng 2023-06-15  152  	.probe = loongson_i2s_pci_probe,
d84881e06836dc Yingkun Meng 2023-06-15  153  	.driver = {
d84881e06836dc Yingkun Meng 2023-06-15  154  		.pm = pm_sleep_ptr(&loongson_i2s_pm),
d84881e06836dc Yingkun Meng 2023-06-15  155  	},
d84881e06836dc Yingkun Meng 2023-06-15  156  };
d84881e06836dc Yingkun Meng 2023-06-15 @157  module_pci_driver(loongson_i2s_driver);
d84881e06836dc Yingkun Meng 2023-06-15  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
