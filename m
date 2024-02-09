Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591684E1A2;
	Fri,  9 Feb 2024 19:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707507405; cv=none; b=Mdl+dOB6uiOddEymIsasVJsY3EEOUWIhpEpI9frmEpol6/x3ydCLYBQuWNRxCxlypwoKoMXZS2D8nMxI4QnYHg5xb4L4JAe72+9A6vjx79vzSY69yVzKr8i7JT05wSIBQO33pUC7PMVpKkUOQUAz7GNUcBMxGMNoaMYA8gvdW8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707507405; c=relaxed/simple;
	bh=x69QAG9V/SNO4qHWlDyDPZi2/ljfHuari8c9sh434TM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=svVHF5+e9VqUqSFuQiNF8ocjxfDhXTJE1mHdai8uqzRfLHBEef1RWGazDjFhHPdQWI4jKYweXrNDVYPlZvu8+tDzfP1DaXnNkeSlgPzA1IBivIxZEz/WBqj2cLdAPiKMEQGEqiNRq8utGdus4s5cndICs1ReWumhxN5n6z0ITfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHeUSVfY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHeUSVfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707507403; x=1739043403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x69QAG9V/SNO4qHWlDyDPZi2/ljfHuari8c9sh434TM=;
  b=MHeUSVfY3GXmBS9AZmCdV9KTnMLlmIAGIAb49IkQvlsnBv6RveBdwvUY
   zYkezD3BcXIo9QCM9t2kTeRfzdgVbeW1EWbn5sKDNSU4EIo2q382Ex26f
   vSomTfEVgREA41fE91nHpV5oHKFINCQuAVqxY1+miKRkm18/0UfzBW6QO
   HA8WTnRIZojU9etC/ur2PWf0BulNS+33z5XgRUUIaumAfmvsJB0XRaF6a
   sgPYXcs09VVgyBlOcdR7kMcYv7us8L6OxnUAyfv1JiWZUZJvJ0nZ4XpfY
   MHF1E9Ne0jccFcDhGXHdEtF4UyM2FQslfSsSo5MW3/gh7vk5GgFQAI3aD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="18902714"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="18902714"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 11:36:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="934510390"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934510390"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 11:36:39 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYWfs-00053c-2i;
	Fri, 09 Feb 2024 19:36:36 +0000
Date: Sat, 10 Feb 2024 03:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pavel Machek <pavel@denx.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [cip:linux-5.10.y-cip 42/56] drivers/cache/ax45mp_cache.c:70:3:
 error: implicit declaration of function 'csr_write'
Message-ID: <202402100339.wXcU8JJF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   a624abaa85d7f3ff289eb2e257db5c4485d11d18
commit: 1f507f18150b3f6ae54a27ba2f88bd0cc6afd8e6 [42/56] cache: Add L2 cache management for Andes AX45MP RISC-V core
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240210/202402100339.wXcU8JJF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100339.wXcU8JJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100339.wXcU8JJF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cache/ax45mp_cache.c:9:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     464 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     477 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro '__le16_to_cpu'
      36 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/cache/ax45mp_cache.c:9:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     490 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
      34 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/cache/ax45mp_cache.c:9:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     501 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     511 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     521 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     609 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     617 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     625 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     634 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     643 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     652 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/cache/ax45mp_cache.c:70:3: error: implicit declaration of function 'csr_write' [-Werror,-Wimplicit-function-declaration]
      70 |                 csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
         |                 ^
   12 warnings and 1 error generated.


vim +/csr_write +70 drivers/cache/ax45mp_cache.c

    60	
    61	static void ax45mp_cpu_cache_operation(unsigned long start, unsigned long end,
    62					       unsigned int l1_op, unsigned int l2_op)
    63	{
    64		unsigned long line_size = ax45mp_priv.ax45mp_cache_line_size;
    65		void __iomem *base = ax45mp_priv.l2c_base;
    66		int mhartid = smp_processor_id();
    67		unsigned long pa;
    68	
    69		while (end > start) {
  > 70			csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
    71			csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, l1_op);
    72	
    73			pa = virt_to_phys((void *)start);
    74			writel(pa, base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid));
    75			writel(l2_op, base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid));
    76			while ((ax45mp_cpu_l2c_get_cctl_status() &
    77				AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
    78				AX45MP_CCTL_L2_STATUS_IDLE)
    79				;
    80	
    81			start += line_size;
    82		}
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
