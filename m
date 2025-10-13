Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD33C2E7F2D;
	Mon, 13 Oct 2025 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350345; cv=none; b=XOPGc7xVYvI8NOUKchTZ04618XAwxS8CfUP1TeWofdOjR/CfJBBW0sGFOWS2/JOb57m0MKkWO51SH7ZkVXuceGuQIbm0zIc8+AZAgMO2A4oA+tAom7Xzpl/4SEcsn4KBgJX4dnnAXURH65+RU3ixyU1+a13/byQJJF/gTV/YcCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350345; c=relaxed/simple;
	bh=M//0ZCpz189T49x8KTjz9fAgIFaivSmQ1xCVbz7Xlx4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fu1pGgRvaN1B1PWi/X3MWkp7rjHdlQ3rmtA2b84L7k6071hGjNnXEEnR0+mWm2mwlagZfgZkiVcGDpZBPwR+WwSIjxwE21tBF44s8uyRHLwkpM292rt7keAdXuk+nranKUUeg0ArIUcpCel+xvlAecIQ9H1/1KpE+8aY7Om81mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4clY3r0xsCz6L5L3;
	Mon, 13 Oct 2025 18:09:28 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id C14771402FD;
	Mon, 13 Oct 2025 18:12:14 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 13 Oct
 2025 11:12:14 +0100
Date: Mon, 13 Oct 2025 11:12:12 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: kernel test robot <lkp@intel.com>
CC: Petre Rodan <petre.rodan@subdimension.ro>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [jic23-iio:testing 151/155]
 drivers/iio/accel/bma220_core.c:23:10: fatal error: 'bma220.h' file not
 found
Message-ID: <20251013111212.00004cf4@huawei.com>
In-Reply-To: <202510130200.xmZGt5tr-lkp@intel.com>
References: <202510130200.xmZGt5tr-lkp@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Mon, 13 Oct 2025 02:21:57 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   680b1fb5d2d9b3ed6644e85f6115972d8ade01aa
> commit: b85080e8ba03eca25678f77539193ab2c25193d4 [151/155] iio: accel: bma220: split original driver
> config: riscv-randconfig-002-20251013 (https://download.01.org/0day-ci/archive/20251013/202510130200.xmZGt5tr-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510130200.xmZGt5tr-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510130200.xmZGt5tr-lkp@intel.com/

For the file not found.

I messed up whilst applying Petre's set yesterday.

I think this is a report from the stale tree I pushed out before realizing
my mistake.

So hopefully gone already.
Thanks,

Jonathan


> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/iio/accel/bma220_core.c:15:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      804 |         insb(addr, buffer, count);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
>      104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
>          |                                          ~~~~~~~~~~ ^
>    In file included from drivers/iio/accel/bma220_core.c:15:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      812 |         insw(addr, buffer, count);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
>      105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
>          |                                          ~~~~~~~~~~ ^
>    In file included from drivers/iio/accel/bma220_core.c:15:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      820 |         insl(addr, buffer, count);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
>      106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
>          |                                          ~~~~~~~~~~ ^
>    In file included from drivers/iio/accel/bma220_core.c:15:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      829 |         outsb(addr, buffer, count);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
>      118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
>          |                                            ~~~~~~~~~~ ^
>    In file included from drivers/iio/accel/bma220_core.c:15:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      838 |         outsw(addr, buffer, count);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
>      119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
>          |                                            ~~~~~~~~~~ ^
>    In file included from drivers/iio/accel/bma220_core.c:15:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      847 |         outsl(addr, buffer, count);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
>      120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
>          |                                            ~~~~~~~~~~ ^
>    In file included from drivers/iio/accel/bma220_core.c:15:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>     1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>          |                                                   ~~~~~~~~~~ ^
> >> drivers/iio/accel/bma220_core.c:23:10: fatal error: 'bma220.h' file not found  
>       23 | #include "bma220.h"
>          |          ^~~~~~~~~~
>    7 warnings and 1 error generated.
> --
>    In file included from drivers/iio/accel/bma220_spi.c:11:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      804 |         insb(addr, buffer, count);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
>      104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
>          |                                          ~~~~~~~~~~ ^
>    In file included from drivers/iio/accel/bma220_spi.c:11:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      812 |         insw(addr, buffer, count);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
>      105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
>          |                                          ~~~~~~~~~~ ^
>    In file included from drivers/iio/accel/bma220_spi.c:11:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      820 |         insl(addr, buffer, count);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
>      106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
>          |                                          ~~~~~~~~~~ ^
>    In file included from drivers/iio/accel/bma220_spi.c:11:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      829 |         outsb(addr, buffer, count);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
>      118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
>          |                                            ~~~~~~~~~~ ^
>    In file included from drivers/iio/accel/bma220_spi.c:11:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      838 |         outsw(addr, buffer, count);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
>      119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
>          |                                            ~~~~~~~~~~ ^
>    In file included from drivers/iio/accel/bma220_spi.c:11:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      847 |         outsl(addr, buffer, count);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
>      120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
>          |                                            ~~~~~~~~~~ ^
>    In file included from drivers/iio/accel/bma220_spi.c:11:
>    In file included from include/linux/spi/spi.h:17:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>     1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>          |                                                   ~~~~~~~~~~ ^
> >> drivers/iio/accel/bma220_spi.c:13:10: fatal error: 'bma220.h' file not found  
>       13 | #include "bma220.h"
>          |          ^~~~~~~~~~
>    7 warnings and 1 error generated.
> 
> 
> vim +23 drivers/iio/accel/bma220_core.c
> 
>     22	
>   > 23	#include "bma220.h"  
>     24	
> 

