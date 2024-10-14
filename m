Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B211474A5;
	Mon, 14 Oct 2024 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895264; cv=none; b=ooPHyZYKHMS3Pr7N8V7sqDZ6OQU1E3CKdHL7leX2siAa0ljKgt154jCB3UzAx7kuqdBDr8tewMmJOOoGcyEJkcswhAB2w576KL0MJYqOzO/z1pYJO3t4vdoledndcwO9rSSWuEh+D9FsDqs9ZcS3E/C8+Bz9yPuNYZoV/03Gx7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895264; c=relaxed/simple;
	bh=6McgWTdSK9Egkkg7qjOMyJbOsm0OYaQ2Dxp90JCxbmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZUH4ZsvSxQZUFHDlPsznbSI3uszrt1yIpFn1oLVFXrHmh5bCw1VDOynkA1812rgCfpAQ71bgjZJH2EJHBBkg9u+8loNq+DE2Fy//R5K7aJ0+wLEf28BJ0ae549uaHMk2fRXtcm3XarcZaq1DMHE9HysV9/WCQYJum/RmxJ4MOhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEI2L8I6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEI2L8I6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728895260; x=1760431260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6McgWTdSK9Egkkg7qjOMyJbOsm0OYaQ2Dxp90JCxbmQ=;
  b=eEI2L8I6+9PYA4pEWm1uIrumKPBZ7YNU70vJo0n1k0uxbQm0QyoJ7b/i
   cKccMu0KckLd28xiFnM+upfm2Dn8X8AeJ87b5kyPOOJj5Zw+1IZgPupA8
   WuNKL6TZUFfvmZnLqYeVTenTGiIfHvFQ3Dk3BaJ/lHNwYwI+C0DzTPrn2
   MENxX+Q+suQkOsajbAXq0oHwZS1PTxg8zgWmLiFAaG78+D2vz2V4nWITd
   1JUVUvTC1zPf2wpC4OvpBq60x6NU4JHHljXZmhBLrIBnmXSK2fXAeE6cB
   GJoYSkhLZehq1/oodzhw8Ey9HD4Z5i0vd22eidSF6mGI/G7av1L3Ce2/v
   g==;
X-CSE-ConnectionGUID: Q7/zFureSqivgW/GpMAx/w==
X-CSE-MsgGUID: sKw4nlSyR6W53uJko900jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="45731218"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="45731218"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 01:41:00 -0700
X-CSE-ConnectionGUID: VWoTDhGlRfSNSuWWSRL/6w==
X-CSE-MsgGUID: u/T6wF8kRs6GPaAvY5K89Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="81497339"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Oct 2024 01:40:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0GdJ-000F5t-0a;
	Mon, 14 Oct 2024 08:40:53 +0000
Date: Mon, 14 Oct 2024 16:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 41/88] drivers/char/aml-gpiomem.c:129:20:
 error: assigning to 'pgprot_t' from incompatible type 'int'
Message-ID: <202410141610.uaqDcEo3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   506d08468b830f4f71052cf0f23e9f1053f9c9b6
commit: 5e7a0fcf547e3b4f54e37972019abef8e78192a7 [41/88] ODROID-N2/C4: char: Add /dev/gpiomem device
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20241014/202410141610.uaqDcEo3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141610.uaqDcEo3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141610.uaqDcEo3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/aml-gpiomem.c:51:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/char/aml-gpiomem.c:129:22: error: call to undeclared function 'phys_mem_access_prot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     129 |         vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
         |                             ^
>> drivers/char/aml-gpiomem.c:129:20: error: assigning to 'pgprot_t' from incompatible type 'int'
     129 |         vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
         |                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     130 |                         vma->vm_end - vma->vm_start,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     131 |                         vma->vm_page_prot);
         |                         ~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +129 drivers/char/aml-gpiomem.c

  > 51	#include <linux/mm.h>
    52	#include <linux/slab.h>
    53	#include <linux/cdev.h>
    54	#include <linux/pagemap.h>
    55	#include <linux/io.h>
    56	#include <linux/of.h>
    57	#include <asm/pgtable.h>
    58	#include <asm/io.h>
    59	
    60	#define DEVICE_NAME "aml-gpiomem"
    61	#define DRIVER_NAME "gpiomem-aml"
    62	#define DEVICE_MINOR 0
    63	
    64	struct regs_phys {
    65		unsigned long start;
    66		unsigned long end;
    67	};
    68	
    69	struct aml_gpiomem_instance {
    70		struct regs_phys gpio_regs_phys[32];
    71		int gpio_area_count;
    72		struct device *dev;
    73	};
    74	
    75	static struct cdev aml_gpiomem_cdev;
    76	static dev_t aml_gpiomem_devid;
    77	static struct class *aml_gpiomem_class;
    78	static struct device *aml_gpiomem_dev;
    79	static struct aml_gpiomem_instance *inst;
    80	
    81	static int aml_gpiomem_open(struct inode *inode, struct file *file)
    82	{
    83		int dev = iminor(inode);
    84		int ret = 0;
    85	
    86		dev_info(inst->dev, "gpiomem device opened.");
    87	
    88		if (dev != DEVICE_MINOR) {
    89			dev_err(inst->dev, "Unknown minor device: %d", dev);
    90			ret = -ENXIO;
    91		}
    92		return ret;
    93	}
    94	
    95	static int aml_gpiomem_release(struct inode *inode, struct file *file)
    96	{
    97		int dev = iminor(inode);
    98		int ret = 0;
    99	
   100		if (dev != DEVICE_MINOR) {
   101			dev_err(inst->dev, "Unknown minor device %d", dev);
   102			ret = -ENXIO;
   103		}
   104		return ret;
   105	}
   106	
   107	static const struct vm_operations_struct aml_gpiomem_vm_ops = {
   108	#ifdef CONFIG_HAVE_IOREMAP_PROT
   109		.access = generic_access_phys
   110	#endif
   111	};
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
