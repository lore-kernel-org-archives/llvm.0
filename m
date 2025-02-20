Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BA31ADC6C;
	Thu, 20 Feb 2025 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740081696; cv=none; b=ZdzjLLZ0tIN8FWRRu33HtBlxARnQbVEukysBM+UtS4QBfBpdBOBRw1F8pQY9emG3Pfu3CebMQNc6KZErUJ4uDHoxYEXyVlIAzyNOtyRE6nn9jDOVvB8Czl1ASj6kIsm2kqSRGeY9bvJ1zYaGiAe7HeivHwXp67Hr74NAAbmIRrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740081696; c=relaxed/simple;
	bh=E/5YCxJbkRWceBzp8kxov21PXkLqMU+DfDqgJpn02Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MOlwACnV9MSwy0mSVnzUknL0p+qHhCnGZWgkHmSmhFMET5CDPvLXHFiggc1For4pfK5+oUvC3raQPCUzJlOrSP52/41XbUNkcKWZ1tYwHgExB2Y0IvGmh9H3yLDv6rF+nmkd7Ug18OX3AKvIUn6Q8jeLgGYryu4s8JQ9JzYTGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbckWYhs; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbckWYhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740081695; x=1771617695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E/5YCxJbkRWceBzp8kxov21PXkLqMU+DfDqgJpn02Ls=;
  b=DbckWYhsxNdUn4hUtulyd4nbd89mpCt8Rkv/VHGhnMF9IYw07v4YpK9V
   W627sNKPykWX0jL0B/8z4EpnQu6ilERiRwPBM9n/MOzGplkbB0nLX0T1+
   VilegH9JtmcC7djTRHOLbYtwt08D1i96ro5ofwBIeU6i2goXjghfPFuXC
   ZhfaKvWxM2yHEZIKLIJmtQVgqdWR2ZvEECa0Gi7QBvBfBtHuIffgJyO6y
   HF/kM5oVEub/1eW420QTe0mTinG0N6Jc7DI2FfAQFaD75EsaAaO1ca3AV
   Xm04WPdQWiigiG637DZe9zcsq3ttR/f3eMMMeDegn1E7J7s4hLd3Sc415
   g==;
X-CSE-ConnectionGUID: Zn+29eFTRfSxIJTfjEaLDw==
X-CSE-MsgGUID: 90lXudEpTJqjKNglLTMjNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41003775"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="41003775"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 12:01:33 -0800
X-CSE-ConnectionGUID: 0F0tLK/GSHKpKrT5ZrwBuA==
X-CSE-MsgGUID: ikcp0NtgQ9uuGPvquKXZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="138365512"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Feb 2025 12:01:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlCjg-0004iJ-1d;
	Thu, 20 Feb 2025 20:01:28 +0000
Date: Fri, 21 Feb 2025 04:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:driver-core-testing 5/32] include/linux/device.h:381:9:
 error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202502210319.SfrlprS5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-testing
head:   820252db26434126c85a78027a1bcbe9c0903204
commit: cd29796e495160c05a672f3098dffe0fb6ae9daf [5/32] driver core: device.h: fix incorrect type in return expression
config: s390-randconfig-001-20250220 (https://download.01.org/0day-ci/archive/20250221/202502210319.SfrlprS5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210319.SfrlprS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502210319.SfrlprS5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/irqchip.c:11:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
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
   In file included from drivers/irqchip/irqchip.c:11:
   In file included from include/linux/acpi.h:14:
>> include/linux/device.h:381:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
>> include/linux/device.h:381:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:388:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:388:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:396:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:396:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 6 errors generated.
--
   In file included from drivers/dax/device.c:4:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2224:
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
   In file included from drivers/dax/device.c:6:
>> include/linux/device.h:381:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
>> include/linux/device.h:381:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:388:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:388:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:396:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:396:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/dax/device.c:13:
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
     160 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   4 warnings and 6 errors generated.
--
   In file included from drivers/leds/leds-pca9532.c:11:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
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
   In file included from drivers/leds/leds-pca9532.c:12:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
>> include/linux/device.h:381:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
>> include/linux/device.h:381:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:388:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:388:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:396:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:396:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pca9532.c:391:6: warning: variable 'gpios' set but not used [-Wunused-but-set-variable]
     391 |         int gpios = 0;
         |             ^
   3 warnings and 6 errors generated.
--
   In file included from drivers/dma-buf/udmabuf.c:3:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
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
   In file included from drivers/dma-buf/udmabuf.c:3:
>> include/linux/device.h:381:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
>> include/linux/device.h:381:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:388:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:388:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:396:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:396:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:563:9: warning: shift count >= width of type [-Wshift-count-overflow]
     563 |                                            DMA_BIT_MASK(64));
         |                                            ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   3 warnings and 6 errors generated.
--
   In file included from drivers/input/touchscreen/mms114.c:7:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
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
   In file included from drivers/input/touchscreen/mms114.c:10:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
>> include/linux/device.h:381:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
>> include/linux/device.h:381:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:388:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:388:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:396:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:396:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/mms114.c:507:15: warning: cast to smaller integer type 'enum mms_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     507 |         data->type = (enum mms_type)match_data;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings and 6 errors generated.
--
   In file included from drivers/gpio/gpiolib-cdev.c:7:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
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
   In file included from drivers/gpio/gpiolib-cdev.c:7:
   In file included from include/linux/cdev.h:8:
>> include/linux/device.h:381:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
>> include/linux/device.h:381:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:388:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:388:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:396:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:396:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:1665:2: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1665 |         INIT_KFIFO(lr->events);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:135:69: note: expanded from macro 'INIT_KFIFO'
     135 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : ARRAY_SIZE(__tmp->buf) - 1;\
         |                       ~                             ~~~~~~~~~~~~~~~~~~~~~~~^~~
   3 warnings and 6 errors generated.
--
   In file included from drivers/tty/tty_port.c:8:
   In file included from include/linux/tty.h:9:
   In file included from include/linux/tty_driver.h:9:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
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
   In file included from drivers/tty/tty_port.c:8:
   In file included from include/linux/tty.h:9:
   In file included from include/linux/tty_driver.h:9:
   In file included from include/linux/cdev.h:8:
>> include/linux/device.h:381:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
>> include/linux/device.h:381:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:388:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:388:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:396:9: error: call to undeclared function 'IOMEM_ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^
   include/linux/device.h:396:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_port.c:266:2: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     266 |         INIT_KFIFO(port->xmit_fifo);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:135:69: note: expanded from macro 'INIT_KFIFO'
     135 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : ARRAY_SIZE(__tmp->buf) - 1;\
         |                       ~                             ~~~~~~~~~~~~~~~~~~~~~~~^~~
   3 warnings and 6 errors generated.
..


vim +/IOMEM_ERR_PTR +381 include/linux/device.h

   376	
   377	static inline
   378	void __iomem *devm_ioremap_resource(struct device *dev,
   379					    const struct resource *res)
   380	{
 > 381		return IOMEM_ERR_PTR(-EINVAL);
   382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
