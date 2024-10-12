Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370A56EB7C;
	Sat, 12 Oct 2024 20:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728763460; cv=none; b=cenh7wG/l5qIeHOBE+BXOednfUndFBHVoeBbgYVHQ1BeOFXPLUamBFm8rzuutNrbokwT+265jn+mmLkK/cNEQhR7wyQwP7l08bQxC0y/mG77hgNJzPOUCTTyMMDXdyD42DaFoLsTkKFvU2uBhHLO/lQ7kL91o9DzIE160s9yh08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728763460; c=relaxed/simple;
	bh=O96SMgbTU6uNJjDWI2TQm2c26PqDbVCO8e3fOJfk3gc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0HrCrbe27wCGp4s/slBd+B9V0odta2W1+PSmjJplQYb4Om0jA1v7AoP3X+3BkbwvKxpqUFC5jHO8FKzWfj7fD8uZtAIAfakKog7D/YwreATHPbaTwG8wa8YQvpPjcKOANJ32N8RsPOQC1DWoJwjtzutvhDYNRGmqsSzShC6nNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxNye3gi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxNye3gi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728763457; x=1760299457;
  h=date:from:cc:subject:message-id:mime-version;
  bh=O96SMgbTU6uNJjDWI2TQm2c26PqDbVCO8e3fOJfk3gc=;
  b=AxNye3gieVC999qiRSrRN0bvRZZF21jcB9zAkBTQUwZv2mSmWkmOIsxj
   zQtx+JEf/wGksY2E9J7gdh31+0JBG10+BDdscrcxmtI6QEF+elBHePqLZ
   BiK7sZTR3KAAoWA5xx03FH5dbI1mR0ZKgYXlYTZJ80Yv+bCcE/h9uvzpf
   qnHsxIwGGt97So2ndMGSXke0+P1CJAJVTXqCZ5Fq0lAzBoBAXgTRbeTat
   /4z0Cd4x2903YFe/eq+cijD+j9KTrCEy19yVvpPoE6nAd9BQi9W8Ma3a+
   Yn9g7y6pK2MNS9hEFlR11Wlt/LgbGXK9lLGKqtSk0+JVvoxVZqMPNPOUS
   Q==;
X-CSE-ConnectionGUID: 8T2LGU48QN68tdrHAVw1gA==
X-CSE-MsgGUID: hn8kkiiDScqUAt2hD3MSdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28321535"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28321535"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 13:04:17 -0700
X-CSE-ConnectionGUID: n2stYkt2TcmtcU+Os6K5VA==
X-CSE-MsgGUID: MrGnx1qNQvqLHWHuOcN3eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="81210333"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Oct 2024 13:04:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sziLV-000DgN-18;
	Sat, 12 Oct 2024 20:04:13 +0000
Date: Sun, 13 Oct 2024 04:03:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [staging:staging-next 88/94]
 drivers/staging/gpib/pc2/pc2_gpib.c:465:4: error: call to undeclared
 function 'free_dma'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202410130406.S1vi3OTc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: devel@driverdev.osuosl.org
TO: Dave Penkler <dpenkler@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
head:   728b72f4d40e1cdb5e27a187c5d89a05f8000747
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b [88/94] staging: gpib: Add KBUILD files for GPIB drivers
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241013/202410130406.S1vi3OTc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410130406.S1vi3OTc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130406.S1vi3OTc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/staging/gpib/ines/ines_gpib.c:8:
   In file included from drivers/staging/gpib/ines/ines.h:11:
   In file included from drivers/staging/gpib/include/nec7210.h:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   In file included from drivers/staging/gpib/ines/ines_gpib.c:8:
   In file included from drivers/staging/gpib/ines/ines.h:11:
   In file included from drivers/staging/gpib/include/nec7210.h:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/staging/gpib/ines/ines_gpib.c:8:
   In file included from drivers/staging/gpib/ines/ines.h:11:
   In file included from drivers/staging/gpib/include/nec7210.h:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   In file included from drivers/staging/gpib/ines/ines_gpib.c:10:
   In file included from include/linux/pci.h:2676:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/staging/gpib/ines/ines_gpib.c:19:
   drivers/staging/gpib/include/gpib_pci_ids.h:3:9: warning: '__GPIB_PCI_IDS_H' is used as a header guard here, followed by #define of a different macro [-Wheader-guard]
       3 | #ifndef __GPIB_PCI_IDS_H
         |         ^~~~~~~~~~~~~~~~
   drivers/staging/gpib/include/gpib_pci_ids.h:4:9: note: '__GPIB_LINUX_PCI_IDS_H' is defined here; did you mean '__GPIB_PCI_IDS_H'?
       4 | #define __GPIB_LINUX_PCI_IDS_H
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         __GPIB_PCI_IDS_H
   drivers/staging/gpib/ines/ines_gpib.c:28:23: warning: variable 'nec_priv' set but not used [-Wunused-but-set-variable]
      28 |         struct nec7210_priv *nec_priv;
         |                              ^
>> drivers/staging/gpib/ines/ines_gpib.c:74:34: warning: bitwise operation between different enumeration types ('enum ines_aux_reg_bits' and 'enum ines_auxd_bits') [-Wenum-enum-conversion]
      74 |                 write_byte(nec_priv, INES_AUXD | INES_FOLLOWING_T1_250ns |
         |                                      ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/ines/ines_gpib.c:78:34: warning: bitwise operation between different enumeration types ('enum ines_aux_reg_bits' and 'enum ines_auxd_bits') [-Wenum-enum-conversion]
      78 |                 write_byte(nec_priv, INES_AUXD | INES_FOLLOWING_T1_350ns |
         |                                      ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/ines/ines_gpib.c:82:34: warning: bitwise operation between different enumeration types ('enum ines_aux_reg_bits' and 'enum ines_auxd_bits') [-Wenum-enum-conversion]
      82 |                 write_byte(nec_priv, INES_AUXD | INES_FOLLOWING_T1_500ns |
         |                                      ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/ines/ines_gpib.c:1121:21: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
    1121 |         struct local_info *dev;
         |                            ^
   drivers/staging/gpib/ines/ines_gpib.c:90:18: warning: unused variable 'in_fifo_size' [-Wunused-const-variable]
      90 | static const int in_fifo_size = 0xff;
         |                  ^~~~~~~~~~~~
   14 warnings generated.
--
   In file included from drivers/staging/gpib/nec7210/nec7210.c:7:
   In file included from drivers/staging/gpib/nec7210/board.h:10:
   In file included from drivers/staging/gpib/include/gpibP.h:12:
   In file included from drivers/staging/gpib/include/gpib_types.h:23:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   In file included from drivers/staging/gpib/nec7210/nec7210.c:7:
   In file included from drivers/staging/gpib/nec7210/board.h:10:
   In file included from drivers/staging/gpib/include/gpibP.h:12:
   In file included from drivers/staging/gpib/include/gpib_types.h:23:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/staging/gpib/nec7210/nec7210.c:7:
   In file included from drivers/staging/gpib/nec7210/board.h:10:
   In file included from drivers/staging/gpib/include/gpibP.h:12:
   In file included from drivers/staging/gpib/include/gpib_types.h:23:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   In file included from drivers/staging/gpib/nec7210/nec7210.c:14:
   In file included from include/linux/pci.h:2676:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/staging/gpib/nec7210/nec7210.c:940:16: warning: variable 'command' set but not used [-Wunused-but-set-variable]
     940 |                 unsigned int command;
         |                              ^
>> drivers/staging/gpib/nec7210/nec7210.c:1000:23: warning: bitwise operation between different enumeration types ('enum auxmr_bits' and 'enum ppr_bits') [-Wenum-enum-conversion]
    1000 |         write_byte(priv, PPR | HR_PPU, AUXMR);
         |                          ~~~ ^ ~~~~~~
>> drivers/staging/gpib/nec7210/nec7210.c:1004:26: warning: bitwise operation between different enumeration types ('enum auxmr_bits' and 'enum auxra_bits') [-Wenum-enum-conversion]
    1004 |         priv->auxa_bits = AUXRA | HR_HLDA;
         |                           ~~~~~ ^ ~~~~~~~
>> drivers/staging/gpib/nec7210/nec7210.c:1010:26: warning: bitwise operation between different enumeration types ('enum auxmr_bits' and 'enum auxrb_bits') [-Wenum-enum-conversion]
    1010 |         priv->auxb_bits = AUXRB | HR_CPTE;
         |                           ~~~~~ ^ ~~~~~~~
   11 warnings generated.
--
   In file included from drivers/staging/gpib/ni_usb/ni_usb_gpib.c:11:
   In file included from drivers/staging/gpib/ni_usb/ni_usb_gpib.h:12:
   In file included from include/linux/usb.h:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   In file included from drivers/staging/gpib/ni_usb/ni_usb_gpib.c:11:
   In file included from drivers/staging/gpib/ni_usb/ni_usb_gpib.h:12:
   In file included from include/linux/usb.h:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/staging/gpib/ni_usb/ni_usb_gpib.c:11:
   In file included from drivers/staging/gpib/ni_usb/ni_usb_gpib.h:12:
   In file included from include/linux/usb.h:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   drivers/staging/gpib/ni_usb/ni_usb_gpib.c:441:15: warning: variable 'adr1_bits' set but not used [-Wunused-but-set-variable]
     441 |         unsigned int adr1_bits;
         |                      ^
>> drivers/staging/gpib/ni_usb/ni_usb_gpib.c:1557:24: warning: bitwise operation between different enumeration types ('enum tnt4882_aux_regs' and 'enum auxi_bits') [-Wenum-enum-conversion]
    1557 |                 reg[i].value = AUXRI | USTD | SISB;
         |                                ~~~~~ ^ ~~~~
   drivers/staging/gpib/ni_usb/ni_usb_gpib.c:1560:24: warning: bitwise operation between different enumeration types ('enum tnt4882_aux_regs' and 'enum auxi_bits') [-Wenum-enum-conversion]
    1560 |                 reg[i].value = AUXRI | SISB;
         |                                ~~~~~ ^ ~~~~
>> drivers/staging/gpib/ni_usb/ni_usb_gpib.c:1566:24: warning: bitwise operation between different enumeration types ('enum auxmr_bits' and 'enum auxrb_bits') [-Wenum-enum-conversion]
    1566 |                 reg[i].value = AUXRB | HR_TRI;
         |                                ~~~~~ ^ ~~~~~~
>> drivers/staging/gpib/ni_usb/ni_usb_gpib.c:1643:15: warning: bitwise operation between different enumeration types ('enum auxmr_bits' and 'enum auxra_bits') [-Wenum-enum-conversion]
    1643 |         mask = AUXRA | HR_HLDA;
         |                ~~~~~ ^ ~~~~~~~
>> drivers/staging/gpib/ni_usb/ni_usb_gpib.c:1685:26: warning: bitwise operation between different enumeration types ('enum tnt4882_aux_regs' and 'enum auxg_bits') [-Wenum-enum-conversion]
    1685 |         writes[i].value = AUXRG | NTNL_BIT;
         |                           ~~~~~ ^ ~~~~~~~~
   12 warnings generated.
--
   In file included from drivers/staging/gpib/pc2/pc2_gpib.c:12:
   In file included from arch/hexagon/include/asm/dma.h:9:
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
   In file included from drivers/staging/gpib/pc2/pc2_gpib.c:12:
   In file included from arch/hexagon/include/asm/dma.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/staging/gpib/pc2/pc2_gpib.c:12:
   In file included from arch/hexagon/include/asm/dma.h:9:
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
   In file included from drivers/staging/gpib/pc2/pc2_gpib.c:13:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/staging/gpib/pc2/pc2_gpib.c:465:4: error: call to undeclared function 'free_dma'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     465 |                         free_dma(nec_priv->dma_channel);
         |                         ^
   drivers/staging/gpib/pc2/pc2_gpib.c:465:4: note: did you mean 'free_nmi'?
   include/linux/interrupt.h:203:20: note: 'free_nmi' declared here
     203 | extern const void *free_nmi(unsigned int irq, void *dev_id);
         |                    ^
   drivers/staging/gpib/pc2/pc2_gpib.c:599:4: error: call to undeclared function 'free_dma'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     599 |                         free_dma(nec_priv->dma_channel);
         |                         ^
   7 warnings and 2 errors generated.
--
   In file included from drivers/staging/gpib/tnt4882/tnt4882_gpib.c:12:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   In file included from drivers/staging/gpib/tnt4882/tnt4882_gpib.c:12:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/staging/gpib/tnt4882/tnt4882_gpib.c:12:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   In file included from drivers/staging/gpib/tnt4882/tnt4882_gpib.c:12:
   In file included from include/linux/pci.h:2676:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/staging/gpib/tnt4882/tnt4882_gpib.c:242:30: warning: bitwise operation between different enumeration types ('enum tnt4882_aux_regs' and 'enum auxi_bits') [-Wenum-enum-conversion]
     242 |                 write_byte(nec_priv, AUXRI | USTD, AUXMR);
         |                                      ~~~~~ ^ ~~~~
   drivers/staging/gpib/tnt4882/tnt4882_gpib.c:617:28: warning: variable 'imr3_bits' set but not used [-Wunused-but-set-variable]
     617 |         int isr0_bits, isr3_bits, imr3_bits;
         |                                   ^
   drivers/staging/gpib/tnt4882/tnt4882_gpib.c:767:15: warning: variable 'retval' set but not used [-Wunused-but-set-variable]
     767 |         unsigned int retval;
         |                      ^
>> drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1251:30: warning: bitwise operation between different enumeration types ('enum tnt4882_aux_regs' and 'enum auxg_bits') [-Wenum-enum-conversion]
    1251 |         tnt_priv->auxg_bits = AUXRG | NTNL_BIT;
         |                               ~~~~~ ^ ~~~~~~~~
>> drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1256:45: warning: bitwise operation between different enumeration types ('enum imr0_bits' and 'enum isr0_bits') [-Wenum-enum-conversion]
    1256 |         tnt_priv->imr0_bits = TNT_IMR0_ALWAYS_BITS | TNT_ATNI_BIT | TNT_IFCIE_BIT;
         |                               ~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   12 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/free_dma +465 drivers/staging/gpib/pc2/pc2_gpib.c

0dc1ad1c0051c2 Dave Penkler 2024-09-18  456  
0dc1ad1c0051c2 Dave Penkler 2024-09-18  457  void pc2_detach(gpib_board_t *board)
0dc1ad1c0051c2 Dave Penkler 2024-09-18  458  {
0dc1ad1c0051c2 Dave Penkler 2024-09-18  459  	struct pc2_priv *pc2_priv = board->private_data;
0dc1ad1c0051c2 Dave Penkler 2024-09-18  460  	struct nec7210_priv *nec_priv;
0dc1ad1c0051c2 Dave Penkler 2024-09-18  461  
0dc1ad1c0051c2 Dave Penkler 2024-09-18  462  	if (pc2_priv) {
0dc1ad1c0051c2 Dave Penkler 2024-09-18  463  		nec_priv = &pc2_priv->nec7210_priv;
0dc1ad1c0051c2 Dave Penkler 2024-09-18  464  		if (nec_priv->dma_channel)
0dc1ad1c0051c2 Dave Penkler 2024-09-18 @465  			free_dma(nec_priv->dma_channel);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  466  		gpib_free_pseudo_irq(board);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  467  		if (pc2_priv->irq)
0dc1ad1c0051c2 Dave Penkler 2024-09-18  468  			free_irq(pc2_priv->irq, board);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  469  		if (nec_priv->iobase) {
0dc1ad1c0051c2 Dave Penkler 2024-09-18  470  			nec7210_board_reset(nec_priv, board);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  471  			release_region((unsigned long)(nec_priv->iobase), pc2_iosize);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  472  		}
0dc1ad1c0051c2 Dave Penkler 2024-09-18  473  		if (nec_priv->dma_buffer) {
0dc1ad1c0051c2 Dave Penkler 2024-09-18  474  			dma_free_coherent(board->dev, nec_priv->dma_buffer_length,
0dc1ad1c0051c2 Dave Penkler 2024-09-18  475  					  nec_priv->dma_buffer, nec_priv->dma_buffer_addr);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  476  			nec_priv->dma_buffer = NULL;
0dc1ad1c0051c2 Dave Penkler 2024-09-18  477  		}
0dc1ad1c0051c2 Dave Penkler 2024-09-18  478  	}
0dc1ad1c0051c2 Dave Penkler 2024-09-18  479  	free_private(board);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  480  }
0dc1ad1c0051c2 Dave Penkler 2024-09-18  481  

:::::: The code at line 465 was first introduced by commit
:::::: 0dc1ad1c0051c29eaca6202e08d0d5787d296649 staging: gpib: Add pc2 GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
