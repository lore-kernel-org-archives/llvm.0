Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522555;
	b=oBLA6knQ2hYAT3ZR96gYHbX8hQG9ORibnyOfMSZSYDgqBmOr9LO7hhHQtu1JzJnrESL8
	 W13zXpA1z+nhcGy1BjhOgvOaChRLWPXedKR3l6UOXGXq3g08vaHtXmAjHf/11sttmb2Dx
	 ea68j2Vvli0IravO4jGy3sf4WoRf5hYZ5FcMaf6xDAqhe7tyCy6WaYBmsOr5zbL8kORyx
	 +Ap7m3j1SP+KnbLEFcN/2JhIESrK28jEIX535xVUgb0f7G0POXNJL6+0RAwAWoHdEDU4O
	 SL423EQq/jPLtgGPSeKwWfInueLQ4cjSbwtrkDPFKBL+BtmDiaNvZpnJPUtqJz2Gh4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522555;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=v5+JB49zGwfz6x8QzP+xULfuT4zKF494oD+NRHmQd8g=;
	b=CSEhTL3eQsRQgVqeiba9uUjv0aVnQ79Qo4tu/x+OmHX9I6246uN0Wf+6kLGibjxJEQZC
	 Gf7R1qsrPxEc/vJZeDMLU+fhjwbbY4INceVo8oFg0+YE1NVx3rRrMmLoEYNlGZqd6TOdu
	 GKyGjcKwzkM06YQr8xSdmszjmkamp+Kczg8y4ZHAhpsOYGTllpBfcNN6w4zD4/zM0l85B
	 JYObNef1n3z1O+DlpeHxcabWvhr7sxeVW3y4NkS9oQe9egBgrG6c4gMsFB6u2KSFtFhl5
	 fp4qatmLUIYglQUN5Vd9HarHH8eNkZkFp6YZFvHU3wif/QZBrwgzjVd88mkQwUCdyIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="eGu/Gg+T";
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05387606A32D;
	Thu, 12 Nov 2026 22:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05387606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eGu/Gg+T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794522554; x=1826058554;
  h=date:from:to:cc:subject:message-id;
  bh=mjIhBx9c4PapmPJhmOnRWWa5HG+y5lfjQ5VNCu3ZhXI=;
  b=eGu/Gg+TqAbIYmrqDyihMmZJhkQF8hCbGGXQFrHzXjil6qo7KqGNhMhJ
   AMqnmU3FSojeBuNYfNhOdkOkSH9WgS1JayW++c2daLvlhJTll9JvZjSa9
   bhw2rtEwJRqmQAuzWIhPOSUYyZfUxRiXToK/wdnAFipzuvMo9jum6xNgk
   r/3y/c4tsifHZdV5cx7aImeITozwY4pa1CGPGuY3UUY+25KpzFlTsMfUt
   BSrDmHdCSyTYZfJts0BrnMBN42NjFC6FgGs/SGY3sQ31etycYDmls8FIi
   w8CGRiyIr5+6i3uwEFgCUDfWD7oRQjw24P1VcJ8p+weAl8jioKOgSrA3Q
   w==;
X-CSE-ConnectionGUID: 74AuFaRHTwiZCUJgNXnIJQ==
X-CSE-MsgGUID: /gopJsRKSnudYWrUS8x8ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3218120"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3218120"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 14:29:13 -0800
X-CSE-ConnectionGUID: mEXAnhxFQZSMAWr+Y2dkZA==
X-CSE-MsgGUID: /QJWUeLzRZ+DVkuaPlK0dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="10499358"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 12 Nov 2026 14:29:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRdI4-0000000127T-3GNA;
	Thu, 12 Nov 2026 22:29:08 +0000
Date: Fri, 13 Nov 2026 06:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Frank Li <Frank.Li@nxp.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 492/1483]
 arch/sparc/include/asm/io.h:16:9: warning: 'readw_be' macro redefined
Message-ID: <202611130633.mhXKOMTv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   85261a88dc955839e3dabe5339b3a8d86ec545db
commit: 66262fff1de8401d7f4dd6c23d0adab1701e28dc [492/1483] asm-generic/io.h: Add big-endian MMIO accessors
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261113/202611130633.mhXKOMTv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130633.mhXKOMTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130633.mhXKOMTv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_swab32'
      19 |         (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
         |                   ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   In file included from arch/sparc/include/asm/io.h:7:
   In file included from arch/sparc/include/asm/io_32.h:21:
   include/asm-generic/io.h:821:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     821 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
     119 |         ___constant_swab32(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_swab32'
      20 |         (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
         |                   ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   In file included from arch/sparc/include/asm/io.h:7:
   In file included from arch/sparc/include/asm/io_32.h:21:
   include/asm-generic/io.h:821:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     821 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
     119 |         ___constant_swab32(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_swab32'
      21 |         (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
         |                   ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   In file included from arch/sparc/include/asm/io.h:7:
   In file included from arch/sparc/include/asm/io_32.h:21:
   include/asm-generic/io.h:821:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     821 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
     119 |         ___constant_swab32(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_swab32'
      22 |         (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
         |                   ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   In file included from arch/sparc/include/asm/io.h:7:
   In file included from arch/sparc/include/asm/io_32.h:21:
   include/asm-generic/io.h:821:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     821 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
     120 |         __fswab32(x))
         |                   ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   In file included from arch/sparc/include/asm/io.h:7:
   In file included from arch/sparc/include/asm/io_32.h:21:
   include/asm-generic/io.h:837:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     837 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:852:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     852 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:867:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     867 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:960:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     960 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:973:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     973 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:986:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     986 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:1000:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1000 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:1014:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1014 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:1028:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1028 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:1411:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1411 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
>> arch/sparc/include/asm/io.h:16:9: warning: 'readw_be' macro redefined [-Wmacro-redefined]
      16 | #define readw_be(__addr)        __raw_readw(__addr)
         |         ^
   include/asm-generic/io.h:322:9: note: previous definition is here
     322 | #define readw_be readw_be
         |         ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   arch/sparc/include/asm/io.h:17:9: warning: 'readl_be' macro redefined [-Wmacro-redefined]
      17 | #define readl_be(__addr)        __raw_readl(__addr)
         |         ^
   include/asm-generic/io.h:337:9: note: previous definition is here
     337 | #define readl_be readl_be
         |         ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   arch/sparc/include/asm/io.h:19:9: warning: 'writel_be' macro redefined [-Wmacro-redefined]
      19 | #define writel_be(__w, __addr)  __raw_writel(__w, __addr)
         |         ^
   include/asm-generic/io.h:381:9: note: previous definition is here
     381 | #define writel_be writel_be
         |         ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   arch/sparc/include/asm/io.h:20:9: warning: 'writew_be' macro redefined [-Wmacro-redefined]
      20 | #define writew_be(__l, __addr)  __raw_writew(__l, __addr)
         |         ^
   include/asm-generic/io.h:369:9: note: previous definition is here
     369 | #define writew_be writew_be
         |         ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   arch/sparc/vdso/vdso32/../vclock_gettime.c:274:1: warning: no previous prototype for function '__vdso_clock_gettime' [-Wmissing-prototypes]
     274 | __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
         | ^
   arch/sparc/vdso/vdso32/../vclock_gettime.c:273:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
     273 | notrace int
         |         ^
         |         static 
   arch/sparc/vdso/vdso32/../vclock_gettime.c:302:1: warning: no previous prototype for function '__vdso_clock_gettime_stick' [-Wmissing-prototypes]
     302 | __vdso_clock_gettime_stick(clockid_t clock, struct __kernel_old_timespec *ts)
         | ^
   arch/sparc/vdso/vdso32/../vclock_gettime.c:301:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
     301 | notrace int
         |         ^
         |         static 
   arch/sparc/vdso/vdso32/../vclock_gettime.c:327:1: warning: no previous prototype for function '__vdso_gettimeofday' [-Wmissing-prototypes]
     327 | __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
         | ^
   arch/sparc/vdso/vdso32/../vclock_gettime.c:326:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
     326 | notrace int
         |         ^
         |         static 
   arch/sparc/vdso/vdso32/../vclock_gettime.c:363:1: warning: no previous prototype for function '__vdso_gettimeofday_stick' [-Wmissing-prototypes]
     363 | __vdso_gettimeofday_stick(struct __kernel_old_timeval *tv, struct timezone *tz)
         | ^
   arch/sparc/vdso/vdso32/../vclock_gettime.c:362:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
     362 | notrace int
         |         ^
         |         static 
   29 warnings generated.


vim +/readw_be +16 arch/sparc/include/asm/io.h

21dccddf45aae2d Jan Andersson 2011-05-10   9  
21dccddf45aae2d Jan Andersson 2011-05-10  10  /*
21dccddf45aae2d Jan Andersson 2011-05-10  11   * Defines used for both SPARC32 and SPARC64
21dccddf45aae2d Jan Andersson 2011-05-10  12   */
21dccddf45aae2d Jan Andersson 2011-05-10  13  
21dccddf45aae2d Jan Andersson 2011-05-10  14  /* Big endian versions of memory read/write routines */
21dccddf45aae2d Jan Andersson 2011-05-10  15  #define readb_be(__addr)	__raw_readb(__addr)
21dccddf45aae2d Jan Andersson 2011-05-10 @16  #define readw_be(__addr)	__raw_readw(__addr)
21dccddf45aae2d Jan Andersson 2011-05-10  17  #define readl_be(__addr)	__raw_readl(__addr)
21dccddf45aae2d Jan Andersson 2011-05-10  18  #define writeb_be(__b, __addr)	__raw_writeb(__b, __addr)
21dccddf45aae2d Jan Andersson 2011-05-10  19  #define writel_be(__w, __addr)	__raw_writel(__w, __addr)
21dccddf45aae2d Jan Andersson 2011-05-10  20  #define writew_be(__l, __addr)	__raw_writew(__l, __addr)
21dccddf45aae2d Jan Andersson 2011-05-10  21  

:::::: The code at line 16 was first introduced by commit
:::::: 21dccddf45aae2d9f973696ce06115da0d1012b6 sparc: add {read,write}*_be routines

:::::: TO: Jan Andersson <jan@gaisler.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
