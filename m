Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4600A3CF73;
	Wed,  3 Jul 2024 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014834; cv=none; b=U/flI2ejLmtCsL+HeWOxhqQD+LyVCDQeZri+AH+2WMbCf10Kd5u/a9hH3MbVrcww/3P7/AIhDz2f1zWD5eOgBLFialS10nnzb5oDyzoD7PTlSdRF6ABIftwA+K+sW5ZwlyJC3Zf5pH14MzZ1ZkJTW3tBy1tQ4howkYLRSTXJsl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014834; c=relaxed/simple;
	bh=NbdUNCvtQF5QCNbUZD0HXRp9so82kXqy3ao2EDqptwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XxsFWeJushYIyKZkBz1+Ncs4EQ+UbgwHW8wtrIILKr5WfNGLfe1/yVkv+fFB0kYqXWDeMilqv5I/KUkVqQPy7ICAqSc/PM8whcyk66F5pahbyKy/kPVQzSPebOVB7JxH8pgC/6wGpYw7CNE6FSi5nFgmY4zYPrJoHKrmJv/4wWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRhJz10t; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRhJz10t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720014832; x=1751550832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NbdUNCvtQF5QCNbUZD0HXRp9so82kXqy3ao2EDqptwE=;
  b=ZRhJz10tZhpg4oL8j1/0H8y1riakyR1BxbUSSOiOOTxB5xRfY/JxmQy0
   1ckcHNrkRGEHOGKqxb8NWMNiReMGmphl4xPmgxdpmBHPeWX5BcJcur7lX
   xskAN8bqd5v67kVoUx/iEl1qAAMyGHF8xaaqeZRqRg+vNnjnpfuUKfFiC
   ZZyq7eA6QWhWmISXBYq6nTupoQ/njYqET50hAwGvJDNHq1HlIzxluKoZD
   UDJiqhjrjUoL2236V79GVJD6u38i8PHAIKF+upmWnRvBNCJKeqBOJRFi0
   igTtPYstvl00kp+yRmHqoGa+T9mp4LBSO9+52pz4abh03XNKok+EIWR6+
   Q==;
X-CSE-ConnectionGUID: IYokFp+4TfSR1AxBGGbMEQ==
X-CSE-MsgGUID: ls5B5B9pT9u3hKvc6EZeXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27918846"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="27918846"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 06:53:51 -0700
X-CSE-ConnectionGUID: iqNV4PAnQnK967FDZaXrUA==
X-CSE-MsgGUID: vothbto/R6e/mSJ6dXM4pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="50860503"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 06:53:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sP0Qe-000Png-1B;
	Wed, 03 Jul 2024 13:53:48 +0000
Date: Wed, 3 Jul 2024 21:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mordechay Goodstein <mordechay.goodstein@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>
Subject: [uml:pending 5/33] arch/um/kernel/time.c:936:13: warning: no
 previous prototype for function 'time_exit'
Message-ID: <202407032133.WIlBsHgE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux pending
head:   d2fcea450854bc95fb9185aeb9e87354a3c290bc
commit: 4e9de8a682eb227933bb95c0fbc14402cacf37f3 [5/33] um: time-travel: support time-travel protocol broadcast messages
config: um-randconfig-001-20240703 (https://download.01.org/0day-ci/archive/20240703/202407032133.WIlBsHgE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407032133.WIlBsHgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407032133.WIlBsHgE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/um/kernel/time.c:10:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from arch/um/kernel/time.c:10:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from arch/um/kernel/time.c:10:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
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
   In file included from arch/um/kernel/time.c:14:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/um/kernel/time.c:936:13: warning: no previous prototype for function 'time_exit' [-Wmissing-prototypes]
     936 | void __exit time_exit(void)
         |             ^
   arch/um/kernel/time.c:936:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     936 | void __exit time_exit(void)
         | ^
         | static 
   14 warnings generated.


vim +/time_exit +936 arch/um/kernel/time.c

   935	
 > 936	void __exit time_exit(void)
   937	{
   938		kobject_put(bc_time_kobject);
   939	}
   940	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
