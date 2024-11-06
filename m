Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C071DC194;
	Wed,  6 Nov 2024 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888246; cv=none; b=m2yGwqr6bQU0x1FcRAdsfPPt94AHhdLtYO49iIoXsTjJUTCXPlcw32pTNyfJUzVr+V8PHd8IL/dC6Si0oPWsuLWFO+g9kSuGGGySnYCMkoRxREjY9q+8uFygg+UyF9KckAaQFsNcc/g7i6rbSUPecNleANQ8lSTzTUC1cR7Okx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888246; c=relaxed/simple;
	bh=zkb4wZ27Y2KjcXTANjwfpxh6rJegVZieqvBVXEsCfTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAsgrADmQSIti/wpeGBsn2+s6sjqfE/pSflRwfC0kaDP90+e4acPc9nSHPO3cnE9FgCD3LDRRUNGXQZhIdYdSk+u7HRVbEWEyWFywkfiiH+SRUJy6H1l74iRNtTZw6A/pT7n0kN2ZSKycNJT/GcdKluZlocMA0TeLY69auzkkFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NI6vbDS5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NI6vbDS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730888245; x=1762424245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zkb4wZ27Y2KjcXTANjwfpxh6rJegVZieqvBVXEsCfTE=;
  b=NI6vbDS5R/QJqjthw5ihjRszzz68SIhclAz2j7idUaoz/scXTYb8+tuE
   G0L7g1F1+W6YqhDvLx/aOa/Tbc5lugHUpMhx0hozsrilC5PhUZLyQOWKt
   D/VJfwWfv9VCtaxf64Yplr7vFidvxnUBgjBXicX7fMVE34dY+AHhSwZx6
   UcmHUh9EYoGsSb+L32radYqL9ROeU47AFOC74Ga8KPH7cpsDchynW+9us
   +5jOPmTCn09XbZFf/l8+dzWJ9ft20fgKPnIvfDBLJjD7vvHgqI7P+sojq
   D4gCuTCOcv+jDtqwjzhECZW2EcznuecxiivwQChiQxzaYmcWcTpLSFz6v
   Q==;
X-CSE-ConnectionGUID: YUxuBiGXR/qvud8Q5VFiIQ==
X-CSE-MsgGUID: wbVfKw2dSbioq63XTKWkmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41270718"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="41270718"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:17:22 -0800
X-CSE-ConnectionGUID: nJVy8MMLTcyiXYI55ZWMRw==
X-CSE-MsgGUID: s+7kSnqzTEu67X7N1h6Pig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="89303428"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2024 02:17:21 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8d6E-000nBE-1w;
	Wed, 06 Nov 2024 10:17:18 +0000
Date: Wed, 6 Nov 2024 18:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [qcom:clk-for-6.13 30/30] drivers/clk/qcom/gcc-ipq5424.c:497:30:
 warning: unused variable 'ftbl_gcc_qupv3_2x_core_clk_src'
Message-ID: <202411061802.Gncrt9l5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-6.13
head:   21b5d5a4a3114607a27653371c0332f2080e3c05
commit: 21b5d5a4a3114607a27653371c0332f2080e3c05 [30/30] clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241106/202411061802.Gncrt9l5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061802.Gncrt9l5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061802.Gncrt9l5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/qcom/gcc-ipq5424.c:9:
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
   In file included from drivers/clk/qcom/gcc-ipq5424.c:12:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
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
   In file included from drivers/clk/qcom/gcc-ipq5424.c:12:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/clk/qcom/gcc-ipq5424.c:12:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
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
>> drivers/clk/qcom/gcc-ipq5424.c:497:30: warning: unused variable 'ftbl_gcc_qupv3_2x_core_clk_src' [-Wunused-const-variable]
     497 | static const struct freq_tbl ftbl_gcc_qupv3_2x_core_clk_src[] = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-ipq5424.c:957:30: warning: unused variable 'ftbl_gcc_qpic_clk_src' [-Wunused-const-variable]
     957 | static const struct freq_tbl ftbl_gcc_qpic_clk_src[] = {
         |                              ^~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-ipq5424.c:1064:30: warning: unused variable 'ftbl_gcc_q6_axi_clk_src' [-Wunused-const-variable]
    1064 | static const struct freq_tbl ftbl_gcc_q6_axi_clk_src[] = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   19 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/ftbl_gcc_qupv3_2x_core_clk_src +497 drivers/clk/qcom/gcc-ipq5424.c

   496	
 > 497	static const struct freq_tbl ftbl_gcc_qupv3_2x_core_clk_src[] = {
   498		F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
   499		{ }
   500	};
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
