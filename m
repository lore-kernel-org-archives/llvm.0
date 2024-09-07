Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5799614EC5D;
	Sat,  7 Sep 2024 18:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725734483; cv=none; b=GAzyOJsjHlOoDRnlqwKG4M5dL52gYWCEN6SZ2MaMwnvL6wJrawGhZ4SrgIFcd6+e5L7veQit9apI3LGMVuIHmknWLPJUypjwzw1B0jB+rBnYbPMomNhkSrK4wxLBWvPFuHJNKf/sea21s/TOwop7ee66989nBZMsGoE+WTwcwps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725734483; c=relaxed/simple;
	bh=QzLPxJNpW0ummtXfm/a7SXko0h0avC25mylKyRU7lT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RSRSb8ektpIQOMm8gluL+VzkSD+iA0x+74iYaUiWMGUi5o2/F5UIy1J+aS4MUmxNCRFn3b0GkPmpVv8zGr3UPOit31mg8i+ZgpEywpRUDsChRZQuVuN9K+qCw6OCmLDzcmN3jkL9k1aTVrpUR0uFfbTaim3/+LfkgZ0lKD1cRf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXWaFZsn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXWaFZsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725734481; x=1757270481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QzLPxJNpW0ummtXfm/a7SXko0h0avC25mylKyRU7lT8=;
  b=mXWaFZsnu3mwvX/13LaGRoQFz/z+LtclV56vcqEqkpXGpUTgPTyb5HOw
   bfd3CWefp+SkPnBhm9UyAH4ynYOM0jV56odsNgBOl8HXizAVSe5kHhvXJ
   kPX24TaPygg9zYa5s8agYM9GGDwy70jW9FJV+s7hkZs6wjPKkweWi+EaE
   6SNaQPssuJO6G+zlZYh6ZUYgslgl30Ep9ekqytKzef2F9ihvS364JhCIk
   uP9xnIIcRIFpdXTcDB1Cu191LADyXyzGT6XlqLjmPyja4FC8UpE4cucCM
   ynHP1VdpQ4iS8vblVkALJmoR0jISG3JoVv3GuU/BVM9QrWtEy9t6NJMjm
   A==;
X-CSE-ConnectionGUID: 9KJXcz0JT4qTOw+8gRz8uQ==
X-CSE-MsgGUID: 9g2BLALXRCqKIyOxb+2wmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24345826"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24345826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 11:41:21 -0700
X-CSE-ConnectionGUID: x5M4F/EDSsC4fViRyX95VA==
X-CSE-MsgGUID: jinmvRcfQUaqNgf48CmYjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66239957"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Sep 2024 11:41:19 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn0N3-000CrP-1c;
	Sat, 07 Sep 2024 18:41:17 +0000
Date: Sun, 8 Sep 2024 02:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 41/82] drivers/char/aml-gpiomem.c:129:22:
 error: call to undeclared function 'phys_mem_access_prot'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202409080228.5faeeBw8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   c970a63609188f53cf758a3dcd395e777150a29a
commit: 5e7a0fcf547e3b4f54e37972019abef8e78192a7 [41/82] ODROID-N2/C4: char: Add /dev/gpiomem device
config: s390-randconfig-002-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080228.5faeeBw8-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080228.5faeeBw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080228.5faeeBw8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/aml-gpiomem.c:55:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/char/aml-gpiomem.c:55:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/char/aml-gpiomem.c:55:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/char/aml-gpiomem.c:129:22: error: call to undeclared function 'phys_mem_access_prot'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
                               ^
   drivers/char/aml-gpiomem.c:129:20: error: assigning to 'pgprot_t' from incompatible type 'int'
           vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 2 errors generated.


vim +/phys_mem_access_prot +129 drivers/char/aml-gpiomem.c

   112	
   113	static int aml_gpiomem_mmap(struct file *file, struct vm_area_struct *vma)
   114	{
   115		int gpio_area = 0;
   116		unsigned long start = vma->vm_pgoff << PAGE_SHIFT;
   117		unsigned long end   = start + vma->vm_end - vma->vm_start;
   118	
   119		while (gpio_area < inst->gpio_area_count) {
   120			if ((inst->gpio_regs_phys[gpio_area].start >= start) &&
   121			    (inst->gpio_regs_phys[gpio_area].end   <= end))
   122				goto found;
   123			gpio_area++;
   124		}
   125	
   126		return -EACCES;
   127	
   128	found:
 > 129		vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
   130				vma->vm_end - vma->vm_start,
   131				vma->vm_page_prot);
   132	
   133		vma->vm_ops = &aml_gpiomem_vm_ops;
   134	
   135		if (remap_pfn_range(vma, vma->vm_start,
   136					vma->vm_pgoff,
   137					vma->vm_end - vma->vm_start,
   138					vma->vm_page_prot)) {
   139			return -EAGAIN;
   140		}
   141	
   142		return 0;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
