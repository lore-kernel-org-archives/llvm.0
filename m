Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F452119;
	Wed,  9 Oct 2024 03:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728444394; cv=none; b=FhtQiQGsitTZUP5uPzTLylIJ27MwVfsZEemnffN3+9B8agSPBtfzqGVdc/1MpmTeItZh0ICkfaf9NnjsXZbzRECKbbGhV0blNEz4bAXTtPw9rpiaxhcqFNOz8p70pR1fcpGgRMzqC58NADr0ZXmA6xuRtCSsH0/fd00JUouGFkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728444394; c=relaxed/simple;
	bh=Vvq3GasDZ5OEHHM265BL9M8ogLQk30+7BiNEPEkvCPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uz8YkngWy5tqT3ROs5/htJ+sZX2SMHOVsrCWqKJJ/QrzNsxuDnoax3hRjCJRfGgT+Vet5HxKDI+AsOf0NjrIJ72aphEGcV88yGN2EoRVSMe6p15TYGyEx/HDt1viful+27+0xVi81UlqfUXsqPhWo3FGj9Sc7G5dqPOlqZ/hmwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vz8iLEEC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vz8iLEEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728444393; x=1759980393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vvq3GasDZ5OEHHM265BL9M8ogLQk30+7BiNEPEkvCPw=;
  b=Vz8iLEECpoiyZzIcOOIR7Yn2/mKijvmxTxwVORBgiShzEdCxQGnnybX2
   0o1Fl4Ap+dgxv6ULR1k6mCdCxgnbDtWvet2+oljhmgRo4YB5VjO7O6F+X
   Tg+PLLch0z/3+PPZ6ZpoXzfk9hyWRmOKOfj/hnFW82h+OVBjqi8RAD2d3
   omBUXSwGxMRTxEcXyGhS4q7LaBvsKtJUep9KwnibfF6a6VG7nICmG097N
   Ava9QSMCNm1ywrrz3pjryrF47E1oikLZp/OgE5rOmxLFgZs+5wBElQBZY
   bXN2Na/ait58VTWD1Mi1D7QP+8XH+xJritk83Sojbv2PPd2SGncpmuvFW
   w==;
X-CSE-ConnectionGUID: nXFgYJQ6TI2YZmU/8S3zog==
X-CSE-MsgGUID: 7qkWBmZtRiOlaQEzYwm1UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31501673"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="31501673"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 20:26:32 -0700
X-CSE-ConnectionGUID: StiRHXKtQQONRCWKega/Ww==
X-CSE-MsgGUID: CzpD02caTKOoZXqm+inSlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="80685703"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Oct 2024 20:26:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syNLC-0008fY-21;
	Wed, 09 Oct 2024 03:26:22 +0000
Date: Wed, 9 Oct 2024 11:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v8 01/14] Consolidate IO memcpy/memset into iomap_copy.c
Message-ID: <202410091134.mtrlor1I-lkp@intel.com>
References: <20241008075023.3052370-2-jvetter@kalrayinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008075023.3052370-2-jvetter@kalrayinc.com>

Hi Julian,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes arm64/for-next/core deller-parisc/for-next s390/features mtd/mtd/next mtd/mtd/fixes linus/master arm/for-next arm/fixes v6.12-rc2 next-20241008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julian-Vetter/Consolidate-IO-memcpy-memset-into-iomap_copy-c/20241008-163134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20241008075023.3052370-2-jvetter%40kalrayinc.com
patch subject: [PATCH v8 01/14] Consolidate IO memcpy/memset into iomap_copy.c
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241009/202410091134.mtrlor1I-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091134.mtrlor1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091134.mtrlor1I-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:105:13: error: conflicting types for 'memcpy_fromio'
   105 | extern void memcpy_fromio(void *to, const volatile void __iomem *from,
   |             ^
   arch/hexagon/include/asm/io.h:314:23: note: expanded from macro 'memcpy_fromio'
   314 | #define memcpy_fromio memcpy_fromio
   |                       ^
   arch/hexagon/include/asm/io.h:173:20: note: previous definition is here
   173 | static inline void memcpy_fromio(void *dst, const volatile void __iomem *src,
   |                    ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
>> include/asm-generic/io.h:107:13: error: conflicting types for 'memcpy_toio'
   107 | extern void memcpy_toio(volatile void __iomem *to, const void *from,
   |             ^
   arch/hexagon/include/asm/io.h:315:21: note: expanded from macro 'memcpy_toio'
   315 | #define memcpy_toio memcpy_toio
   |                     ^
   arch/hexagon/include/asm/io.h:179:20: note: previous definition is here
   179 | static inline void memcpy_toio(volatile void __iomem *dst, const void *src,
   |                    ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:554:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   554 |         val = __raw_readb(PCI_IOBASE + addr);
   |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
   |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
   |                                                   ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:580:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   580 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
   |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
   |                                                   ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:591:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   591 |         __raw_writeb(value, PCI_IOBASE + addr);
   |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:601:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   601 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
   |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:611:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   611 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
   |                                                       ~~~~~~~~~~ ^
   6 warnings and 2 errors generated.
   make[3]: *** [scripts/Makefile.build:102: arch/hexagon/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/memcpy_fromio +105 include/asm-generic/io.h

   104	
 > 105	extern void memcpy_fromio(void *to, const volatile void __iomem *from,
   106				  size_t count);
 > 107	extern void memcpy_toio(volatile void __iomem *to, const void *from,
   108				size_t count);
   109	extern void memset_io(volatile void __iomem *dst, int c, size_t count);
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
