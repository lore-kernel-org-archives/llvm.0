Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4524189BA2;
	Sun, 24 Nov 2024 15:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732461819; cv=none; b=ASpOtrgBGAv/BpIqswjMvbydpIlH2dqEGOc+yjEdfkvbzxPmkGfK+adQBYXxP6eK+ygfn5Tb9Ihn9zX+5MzcTD0AcNlXWxWe4pb2MdfFaYjKsT4bprcl7oqsfZdcSKynZKeMkXYFeX7Z3wOE5mSPAKsCPs5CrvhAPNnUIbFms1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732461819; c=relaxed/simple;
	bh=DrelEwjQZ8BHrSr8KL9bWEcEy8KOMP7e+pivSle6qaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7U8LSNP6e3RVL3o/tRnL/vKI8dhF7w/mIUcH0C9x23BEe4m5jdD+sojduu3UfPAezs50S0Utw2IRbum+54iRuX5qMee57aimCv4MdzOpHzUlR/QKqvQmBWrx/k4PbOYCfViN0BfyMx6YeybD2uXVf4qQPakLrIFJlPjzxxc6uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CR1DQ9dm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CR1DQ9dm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732461817; x=1763997817;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DrelEwjQZ8BHrSr8KL9bWEcEy8KOMP7e+pivSle6qaQ=;
  b=CR1DQ9dmZCtZ2QmcIyhiyLr6EvG5PhVMP2IIUi5LnXVydwZcs8y68ZlF
   N+yHkDu4AaZWeomOl9ipe2My+bpDyjuAK33td8j4pcQDa4Hc+02n3D9rb
   gPKzbBD95l51zlFyqKWIeWIBJHzZmZtu4tNYqrVf2/chmGYPErod2qgaT
   fZ5TVVJBnqlH6OcJRRagSqFuJF/O2LUQyCgVJNVkdYYEPwTDZWXfg4+Mk
   +QwR2kbhbS8OtzMfuPpXT+MRl5Kb3EbSGslGBx6g100nRQuOQIDamhFbH
   E6YOXKHLk7dyEbgQNxKSGmHI+HH5Yu12JSPf65H181ugu8X31bNbKpsYR
   A==;
X-CSE-ConnectionGUID: BWSotqPVQuy94hxH8OTpvg==
X-CSE-MsgGUID: 3CNewNu/R8CFXlJ+wLOKbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="36481070"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="36481070"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 07:23:33 -0800
X-CSE-ConnectionGUID: 6ANeqvImR9iPPAv03wQxQQ==
X-CSE-MsgGUID: NoJhJWvUTi6zysd8uBUmYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="90666540"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Nov 2024 07:23:32 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFESP-00053b-2U;
	Sun, 24 Nov 2024 15:23:29 +0000
Date: Sun, 24 Nov 2024 23:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 14/160]
 drivers/pci/pci-sysfs.c:980:21: error: incompatible function pointer types
 assigning to 'ssize_t (*)(struct file *, struct kobject *, struct
 bin_attribute *, char *, loff_t, size_t)' (aka 'long (*)(struct file *,
 struct kobject *, struct bin_attribute *, ...
Message-ID: <202411242318.WVVWNoIJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   6f8dc678557864c0f850a774caa0c7dd4cda89fd
commit: 914bce99f9dd9aaaa72cdc35fa7d2f48353415d7 [14/160] pci
config: powerpc-pasemi_defconfig (https://download.01.org/0day-ci/archive/20241124/202411242318.WVVWNoIJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241124/202411242318.WVVWNoIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411242318.WVVWNoIJ-lkp@intel.com/

Note: the thomas-weissschuh/b4/b4-sysfs-const-bin_attr-cb HEAD 6f8dc678557864c0f850a774caa0c7dd4cda89fd builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci-sysfs.c:18:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/pci/pci-sysfs.c:980:21: error: incompatible function pointer types assigning to 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t, size_t)' (aka 'long (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long, unsigned long)') from 'ssize_t (struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t, size_t)' (aka 'long (struct file *, struct kobject *, const struct bin_attribute *, char *, long long, unsigned long)') [-Wincompatible-function-pointer-types]
     980 |         b->legacy_io->read = pci_read_legacy_io;
         |                            ^ ~~~~~~~~~~~~~~~~~~
   drivers/pci/pci-sysfs.c:981:22: error: incompatible function pointer types assigning to 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t, size_t)' (aka 'long (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long, unsigned long)') from 'ssize_t (struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t, size_t)' (aka 'long (struct file *, struct kobject *, const struct bin_attribute *, char *, long long, unsigned long)') [-Wincompatible-function-pointer-types]
     981 |         b->legacy_io->write = pci_write_legacy_io;
         |                             ^ ~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +980 drivers/pci/pci-sysfs.c

10a0ef39fbd1d48 Ivan Kokshaysky        2009-02-17   952  
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   953  /**
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   954   * pci_create_legacy_files - create legacy I/O port and memory files
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   955   * @b: bus to create files under
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   956   *
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   957   * Some platforms allow access to legacy I/O port and ISA memory space on
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   958   * a per-bus basis.  This routine creates the files and ties them into
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   959   * their associated read, write and mmap files from pci-sysfs.c
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   960   *
25985edcedea639 Lucas De Marchi        2011-03-30   961   * On error unwind, but don't propagate the error to the caller
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   962   * as it is ok to set up the PCI bus without these files.
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   963   */
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   964  void pci_create_legacy_files(struct pci_bus *b)
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   965  {
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   966  	int error;
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   967  
efd532a679afae4 Simona Vetter          2021-02-05   968  	if (!sysfs_initialized)
efd532a679afae4 Simona Vetter          2021-02-05   969  		return;
efd532a679afae4 Simona Vetter          2021-02-05   970  
6396bb221514d28 Kees Cook              2018-06-12   971  	b->legacy_io = kcalloc(2, sizeof(struct bin_attribute),
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   972  			       GFP_ATOMIC);
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   973  	if (!b->legacy_io)
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   974  		goto kzalloc_err;
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   975  
62e877b893e6350 Stephen Rothwell       2010-03-01   976  	sysfs_bin_attr_init(b->legacy_io);
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   977  	b->legacy_io->attr.name = "legacy_io";
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   978  	b->legacy_io->size = 0xffff;
e2154044dd4168b Kelsey Skunberg        2019-08-13   979  	b->legacy_io->attr.mode = 0600;
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  @980  	b->legacy_io->read = pci_read_legacy_io;
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   981  	b->legacy_io->write = pci_write_legacy_io;
24de09c16f974dc Valentine Sinitsyn     2023-09-25   982  	/* See pci_create_attr() for motivation */
24de09c16f974dc Valentine Sinitsyn     2023-09-25   983  	b->legacy_io->llseek = pci_llseek_resource;
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   984  	b->legacy_io->mmap = pci_mmap_legacy_io;
f06aff924f97588 Krzysztof Wilczyński   2021-07-29   985  	b->legacy_io->f_mapping = iomem_get_mapping;
10a0ef39fbd1d48 Ivan Kokshaysky        2009-02-17   986  	pci_adjust_legacy_attr(b, pci_mmap_io);
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   987  	error = device_create_bin_file(&b->dev, b->legacy_io);
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   988  	if (error)
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   989  		goto legacy_io_err;
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   990  
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   991  	/* Allocated above after the legacy_io struct */
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   992  	b->legacy_mem = b->legacy_io + 1;
6757eca348fbbdd Mel Gorman             2010-03-10   993  	sysfs_bin_attr_init(b->legacy_mem);
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   994  	b->legacy_mem->attr.name = "legacy_mem";
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   995  	b->legacy_mem->size = 1024*1024;
e2154044dd4168b Kelsey Skunberg        2019-08-13   996  	b->legacy_mem->attr.mode = 0600;
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03   997  	b->legacy_mem->mmap = pci_mmap_legacy_mem;
24de09c16f974dc Valentine Sinitsyn     2023-09-25   998  	/* See pci_create_attr() for motivation */
24de09c16f974dc Valentine Sinitsyn     2023-09-25   999  	b->legacy_mem->llseek = pci_llseek_resource;
c6c3c5704ba7082 Linus Torvalds         2021-09-01  1000  	b->legacy_mem->f_mapping = iomem_get_mapping;
10a0ef39fbd1d48 Ivan Kokshaysky        2009-02-17  1001  	pci_adjust_legacy_attr(b, pci_mmap_mem);
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1002  	error = device_create_bin_file(&b->dev, b->legacy_mem);
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1003  	if (error)
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1004  		goto legacy_mem_err;
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1005  
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1006  	return;
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1007  
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1008  legacy_mem_err:
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1009  	device_remove_bin_file(&b->dev, b->legacy_io);
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1010  legacy_io_err:
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1011  	kfree(b->legacy_io);
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1012  	b->legacy_io = NULL;
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1013  kzalloc_err:
7db4af43c97b68d Bjorn Helgaas          2019-05-07  1014  	dev_warn(&b->dev, "could not create legacy I/O port and ISA memory resources in sysfs\n");
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1015  }
f19aeb1f3638b7b Benjamin Herrenschmidt 2008-10-03  1016  

:::::: The code at line 980 was first introduced by commit
:::::: f19aeb1f3638b7bb4ca21eb361f004fac2bfe259 PCI: Add ability to mmap legacy_io on some platforms

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Jesse Barnes <jbarnes@virtuousgeek.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
