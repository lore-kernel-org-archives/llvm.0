Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA417BD3;
	Thu, 21 Nov 2024 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732205496; cv=none; b=FFDOtuAwvoTt2hX1f/clxv8sKBLedUYXiPTyFzG//DEGmURQSgvj9xcP32g9nl2pKvMadNnNoJSwdld+4uR50edqaRLOkuBXtUX4YDy7gC2PUyL/oeVhE3udLfJqWmb4GeWvtouv4MA8R2U2csUH3hH1yWoZ5VHnlfmB/jVfpfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732205496; c=relaxed/simple;
	bh=d6ISQkT3Y+E8iqHAcA2/UNkyhH1RD6ltigcMZ4EB1Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=humHhi0fWNtL/pH5JMDiYgFL6hne5QSF46VrlDlspe2BL/7eyG/0PiWXXJ8ri+RA16wY/k/QBZS9H5ZGq5nNWLcvHZSDLthl/EeeHXh5SfANU1EKAOK6OngA+melFowO0A/XhO7KcOxHTofhKXQaud9aNISLrS4cMg1kGUBkDho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAjrcOKQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAjrcOKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732205495; x=1763741495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d6ISQkT3Y+E8iqHAcA2/UNkyhH1RD6ltigcMZ4EB1Fs=;
  b=FAjrcOKQvVYveTYspIsxj/LCgCD+Lr9Jz/m+5bQSBUMFeAcaK7xv31YV
   kMuCyA9hKlYSx4MRPVoxZhNRZNoWTq8R0XRikeaEkMZ76bsM2RDQrNfrm
   pcnEHABHHh104t1QEnqWv9zjAWT3Wn/+QQydggzRm+U973CNmnX8X25Wa
   +rLNSbaJYFK40CRBvH6sjd9OPnRseWN3c8PChAoh1lOSI/HKlfbWkerpz
   L/Vax5heUH4klHnBNBegh5gBNgHv99yDEDeZrddRvak9jZ8YbrcjfXf8e
   W/PRe8KxBGm4TBb8Ntng7cLAAdFtDs6A6AMmx5o6A7EMOzMn4nB4YzuIp
   w==;
X-CSE-ConnectionGUID: 8Vkip6O6Rou+6RFU1EW/DQ==
X-CSE-MsgGUID: I7I3xap6QwCzWwn//+Q+FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32181762"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="32181762"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 08:11:22 -0800
X-CSE-ConnectionGUID: 3qGkAx/GTTK3OLfWAPqEww==
X-CSE-MsgGUID: 1mnCViMGR1SysbN+UtA7Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="121171187"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Nov 2024 08:11:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE9m1-00038l-0p;
	Thu, 21 Nov 2024 16:11:17 +0000
Date: Fri, 22 Nov 2024 00:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bert Karwatzki <spasswolf@web.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ASoC: qcom: apq8016_sbc: Fix second argument of
 apq8016_dai_init()
Message-ID: <202411212307.PsgZfqIA-lkp@intel.com>
References: <20241117232100.23760-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241117232100.23760-1-spasswolf@web.de>

Hi Bert,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.12 next-20241121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bert-Karwatzki/ASoC-qcom-apq8016_sbc-Fix-second-argument-of-apq8016_dai_init/20241121-111313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20241117232100.23760-1-spasswolf%40web.de
patch subject: [PATCH] ASoC: qcom: apq8016_sbc: Fix second argument of apq8016_dai_init()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241121/202411212307.PsgZfqIA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411212307.PsgZfqIA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411212307.PsgZfqIA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/qcom/apq8016_sbc.c:6:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/qcom/apq8016_sbc.c:9:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from sound/soc/qcom/apq8016_sbc.c:9:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from sound/soc/qcom/apq8016_sbc.c:9:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> sound/soc/qcom/apq8016_sbc.c:153:31: error: call to undeclared function 'qdsp6_dai_get_lpass_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     153 |         return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
         |                                      ^
   sound/soc/qcom/apq8016_sbc.c:165:12: error: static declaration of 'qdsp6_dai_get_lpass_id' follows non-static declaration
     165 | static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
         |            ^
   sound/soc/qcom/apq8016_sbc.c:153:31: note: previous implicit declaration is here
     153 |         return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
         |                                      ^
   16 warnings and 2 errors generated.


vim +/qdsp6_dai_get_lpass_id +153 sound/soc/qcom/apq8016_sbc.c

   148	
   149	static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
   150	{
   151		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
   152	
 > 153		return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
