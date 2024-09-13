Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C72481C0;
	Fri, 13 Sep 2024 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726241838; cv=none; b=AqUT7q0DobqsVw52tbgipFw4VdOlQipaV++KT65uaqtVlOYKhFHoU/UpHxE2/w2YAlX3XCdqT25qGHwODqfjRdfDjlzHsSkBGa0CofDipQRUpfdYloPguXrTo79456JB88dTcCvcLC6KhWX3BgpkqDxRC+Q0rRKdozYtC5ZvL7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726241838; c=relaxed/simple;
	bh=qKZS7gKFbdbvYJNw0orhcxfy64ecTPi7YhsqUN3BZc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ezx4EWTXWvP/PTRO9GNu8Lj0u11qmFBBqfM98HoQUxgEpLLiCq1zPECM8LtciU1Y5RWa+L/bIVasrIcB7DzJtg4MQF+ekYSxazte+VfMt1ZSLUfgsWhEE5u9GXajBlZnsxqlr/HhRQqYo4TWtKQ9LwVXa7X7fCggfneia8p/A1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBk/V5dZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBk/V5dZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726241837; x=1757777837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qKZS7gKFbdbvYJNw0orhcxfy64ecTPi7YhsqUN3BZc8=;
  b=iBk/V5dZnl+AxGpscY2iVS0enm86BaPQzTlFVfJU9wBZbZgJd+ezue/5
   A7NE12TBbiA/J2Yxtq8LTyMu0opeu9znxFMRRR1X6R6GyRsl6dKq3xseI
   nTYuNWhJsfmOW5bqcq6uJ6vAfHoGJJjpzF9j5E5dyag+BlD52r/Lf/QBG
   79jE60jGGUQzWuNNJ8NAHZ0MuEzahXscy+9YF6kTyvUl486GdbpLHJEZn
   ZRTcJKt7jXVFVVuw2RwEQCqbh09ea2rKRG87hEoccRl+/dijl4seMHVhb
   RYz9C7teJ3tlbLfMETuDIDasjacplxQK95OwjUQQlobIb6IRLeMbl87Z2
   w==;
X-CSE-ConnectionGUID: aL5yJPCFS2+RUzN9VSTlcw==
X-CSE-MsgGUID: DPen2xD5TTO7eW1P1j2SgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25345521"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25345521"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 08:37:03 -0700
X-CSE-ConnectionGUID: SuvMplaFTvarrWZvHyvm7A==
X-CSE-MsgGUID: HHxLgRdXQE+eJID1d0c2hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="91352230"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Sep 2024 08:37:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp8Ly-0006d7-0c;
	Fri, 13 Sep 2024 15:36:58 +0000
Date: Fri, 13 Sep 2024 23:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: Use new initialization api for tasklet
Message-ID: <202409132323.MbFMwNBU-lkp@intel.com>
References: <20240912172231.369566-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912172231.369566-1-abhishektamboli9@gmail.com>

Hi Abhishek,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Tamboli/staging-octeon-Use-new-initialization-api-for-tasklet/20240913-012448
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20240912172231.369566-1-abhishektamboli9%40gmail.com
patch subject: [PATCH] staging: octeon: Use new initialization api for tasklet
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240913/202409132323.MbFMwNBU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409132323.MbFMwNBU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409132323.MbFMwNBU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/octeon/ethernet-tx.c:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/staging/octeon/ethernet-tx.c:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/staging/octeon/ethernet-tx.c:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/staging/octeon/ethernet-tx.c:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
>> drivers/staging/octeon/ethernet-tx.c:44:52: error: incompatible function pointer types initializing 'void (*)(struct tasklet_struct *)' with an expression of type 'void (struct tasklet_struct)' [-Wincompatible-function-pointer-types]
      44 | static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/interrupt.h:665:14: note: expanded from macro 'DECLARE_TASKLET'
     665 |         .callback = _callback,                          \
         |                     ^~~~~~~~~
   7 warnings and 1 error generated.


vim +44 drivers/staging/octeon/ethernet-tx.c

    42	
    43	static void cvm_oct_tx_do_cleanup(struct tasklet_struct clean);
  > 44	static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
