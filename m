Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E3127B58;
	Thu,  1 Feb 2024 20:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706818998; cv=none; b=UbVj4PYAN0OGy78drYzQGQMtB4hvBbPxHhxo2AJR+qItQA1p/4Kproadq1NGD1iGl5s/3tSa0SXmGfqW6zlHhFpcMjrq/kIuvBk+hP8xbuF1fXfktyhiv+S+9h0IYdYreQNqUC/IxTYsbnOb9efOqU4SKezmhnmU7OvILqSlzQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706818998; c=relaxed/simple;
	bh=kXP9NBqHZozxTiOcBidIXIWn+P6iYD0Qqiy94461ISc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MF9bRgGkHfwElckZ400CNMnti8xmT/Axyp+JxJ4v0cySKban+CvnyLJMU4Y52vUwViw5jGP7EI1htlu7QgtSoHl64azYqQDyDIi+P/G5CxEUzD4L4Jm9QIJCNyDldRQUFac5B8g8ymJxnq5FLJams+noLqQMSG4necNl5WckPWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPpRc+tV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPpRc+tV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706818997; x=1738354997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kXP9NBqHZozxTiOcBidIXIWn+P6iYD0Qqiy94461ISc=;
  b=OPpRc+tVV1Ih3UeqsFnkXWeXDnD1SmuKyKj2Kvfa8/aRYVelBLQX6u5l
   NksPLS4VAOKoI5lvMzH3l49bmUDYJg2uyVnCS5sxwuRIdH8NEuOwFVqHd
   5c15cCojFS1EdhW9nObbjKgC4Lb4jsM6rylo5mbErAM3vrAjlQMjuESAy
   gEX2HatSG8lRTh8XzOwLITGrcLvtoEpM57qwWbmy0xNTBp9ADvRR69cEa
   r1aUgTm85pelNOV0Nm/ULQblR53HJ14PVtOootpss+q4Qqj8B0nG/cxO8
   U71El/OuvWCRydWEIyI4MydkOteVopj3oqY4+hjTq+xbPtJ+IdIfshJP5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11373575"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="11373575"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 12:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="908358551"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="908358551"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 01 Feb 2024 12:23:14 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVdaa-00039u-1I;
	Thu, 01 Feb 2024 20:23:12 +0000
Date: Fri, 2 Feb 2024 04:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 42/52] drivers/char/aml-gpiomem.c:128:22:
 error: call to undeclared function 'phys_mem_access_prot'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202402020412.1kIXYSrj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   c654494198e1117133ca8ee7743fce7a4460ead3
commit: 5fa32be6d7ce558be554b60a740b8906fcc0e648 [42/52] ODROID-N2/C4: char: Add /dev/gpiomem device
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20240202/202402020412.1kIXYSrj-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240202/202402020412.1kIXYSrj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402020412.1kIXYSrj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/aml-gpiomem.c:54:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/char/aml-gpiomem.c:54:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/char/aml-gpiomem.c:54:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
>> drivers/char/aml-gpiomem.c:128:22: error: call to undeclared function 'phys_mem_access_prot'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
                               ^
   drivers/char/aml-gpiomem.c:128:20: error: assigning to 'pgprot_t' from incompatible type 'int'
           vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 2 errors generated.


vim +/phys_mem_access_prot +128 drivers/char/aml-gpiomem.c

   111	
   112	static int aml_gpiomem_mmap(struct file *file, struct vm_area_struct *vma)
   113	{
   114		int gpio_area = 0;
   115		unsigned long start = vma->vm_pgoff << PAGE_SHIFT;
   116		unsigned long end   = start + vma->vm_end - vma->vm_start;
   117	
   118		while (gpio_area < inst->gpio_area_count) {
   119			if ((inst->gpio_regs_phys[gpio_area].start >= start) &&
   120			    (inst->gpio_regs_phys[gpio_area].end   <= end))
   121				goto found;
   122			gpio_area++;
   123		}
   124	
   125		return -EACCES;
   126	
   127	found:
 > 128		vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
   129				vma->vm_end - vma->vm_start,
   130				vma->vm_page_prot);
   131	
   132		vma->vm_ops = &aml_gpiomem_vm_ops;
   133	
   134		if (remap_pfn_range(vma, vma->vm_start,
   135					vma->vm_pgoff,
   136					vma->vm_end - vma->vm_start,
   137					vma->vm_page_prot)) {
   138			return -EAGAIN;
   139		}
   140	
   141		return 0;
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
