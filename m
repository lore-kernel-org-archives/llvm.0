Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F301D9694;
	Sun, 17 Nov 2024 17:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731866108; cv=none; b=DJe1HjXMl6rnlOvIhkWIiG1yNqNVWfQPfhhDe4ozAkcw6fHjM1KJjtrx9RYtzv/+gyrPL5h2cFVDpDQhqEyvfmeTA9fps3ClWMsoqF+1S4bubxW6nMrQLsSmO+PGynxEms36ir6hDSkJ1SN6kNfj8KSmx14H8tOjyiuEptH89bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731866108; c=relaxed/simple;
	bh=4dwyIIWx9Uk68niLYWhTsR6ixYYORU5k3ARanAAZEx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QnEW8RsuL1CpcDEZFuzTiU/02jAX7NcTIzycb+OCSoIN82Q+vGeCvgvoxjHk6e6aCCEU948TTfo6Vif8mRvyRijdNYFaahQ53eGMmjBQA9Ezdalt6GVzfo7sB9ZBC1ljf9FymoNLroq0v5ppirbwBh5S7t/9eja01PUge3WhAwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgR1iHp7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgR1iHp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731866107; x=1763402107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4dwyIIWx9Uk68niLYWhTsR6ixYYORU5k3ARanAAZEx0=;
  b=SgR1iHp7XSIPEDJJL6vnkXgdKPlN9TYNLDpjfimaZtBDOgBhrSdsMn/A
   3KweL82nAHf0nASNhI9wDR8bu+2dtidTuCM/hLlf7hAdoH4uqsIEZFgFe
   hJ7n2bEn1NfHNQ440VBJkDSWwT9ILtqnuB+6ZGweRCA2XqHlLUO3lhcj6
   V/L7UdeE9zP68GeUVogafYzwextjfndZLHfa3zfwjw/T4Xz3Gv0lT9LX6
   j2w689Jq3OiS+sjcBt1fyeqRo2qRgXvjAiDdFPyWOUgNe5qxKgf5s6FRG
   Z9m8+qCuqC2X2OIpo5Hn//bZzVII1NfCB7O91/xeuPG6QCMcMnKtiJ82a
   Q==;
X-CSE-ConnectionGUID: mI72z0WFQkyB40mt+OKFBg==
X-CSE-MsgGUID: oi6VAKgMQTSw7SWZJixxpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35588664"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="35588664"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 09:55:05 -0800
X-CSE-ConnectionGUID: /yXCmkOeR0Sl1QabTUVnTw==
X-CSE-MsgGUID: F5WMFRjOQZGhl6lw0XCy3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="89025074"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Nov 2024 09:55:03 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCjUC-0001yy-1y;
	Sun, 17 Nov 2024 17:55:00 +0000
Date: Mon, 18 Nov 2024 01:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 119/120]
 drivers/s390/char/sclp_sd.c:542:26: error: incompatible function pointer
 types assigning to 'ssize_t (*)(struct file *, struct kobject *, const
 struct bin_attribute *, char *, loff_t, size_t)' (aka 'long (*)(struct file
 *, struct kobject *, const struct b...
Message-ID: <202411180127.D7d8hdiZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   216b83e0b4d86a2170ccde16f4a8117e32c02d85
commit: bd9c9ea9d4ba3b26fb22e8dc805d2f7eb826856d [119/120] read/write
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20241118/202411180127.D7d8hdiZ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180127.D7d8hdiZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180127.D7d8hdiZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/s390/char/sclp_sd.c:18:
   In file included from include/linux/async.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/s390/char/sclp_sd.c:24:
   In file included from drivers/s390/char/sclp.h:15:
   In file included from arch/s390/include/asm/sclp.h:21:
   In file included from arch/s390/include/asm/chpid.h:10:
   In file included from arch/s390/include/asm/cio.h:10:
   In file included from arch/s390/include/asm/dma-types.h:7:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/s390/char/sclp_sd.c:24:
   In file included from drivers/s390/char/sclp.h:15:
   In file included from arch/s390/include/asm/sclp.h:21:
   In file included from arch/s390/include/asm/chpid.h:10:
   In file included from arch/s390/include/asm/cio.h:10:
   In file included from arch/s390/include/asm/dma-types.h:7:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/s390/char/sclp_sd.c:24:
   In file included from drivers/s390/char/sclp.h:15:
   In file included from arch/s390/include/asm/sclp.h:21:
   In file included from arch/s390/include/asm/chpid.h:10:
   In file included from arch/s390/include/asm/cio.h:10:
   In file included from arch/s390/include/asm/dma-types.h:7:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
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
>> drivers/s390/char/sclp_sd.c:542:26: error: incompatible function pointer types assigning to 'ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t, size_t)' (aka 'long (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long, unsigned long)') from 'ssize_t (struct file *, struct kobject *, struct bin_attribute *, char *, loff_t, size_t)' (aka 'long (struct file *, struct kobject *, struct bin_attribute *, char *, long long, unsigned long)') [-Wincompatible-function-pointer-types]
     542 |         sd_file->data_attr.read = data_read;
         |                                 ^ ~~~~~~~~~
   13 warnings and 1 error generated.


vim +542 drivers/s390/char/sclp_sd.c

66aec647216f129 Peter Oberparleiter 2017-02-13  502  
66aec647216f129 Peter Oberparleiter 2017-02-13  503  /**
66aec647216f129 Peter Oberparleiter 2017-02-13  504   * sclp_sd_file_create() - Add a sysfs file representing a Store Data entity
66aec647216f129 Peter Oberparleiter 2017-02-13  505   * @name: Name of file
66aec647216f129 Peter Oberparleiter 2017-02-13  506   * @di: DI value associated with this entity
66aec647216f129 Peter Oberparleiter 2017-02-13  507   *
66aec647216f129 Peter Oberparleiter 2017-02-13  508   * Create a sysfs directory with the given @name located under
66aec647216f129 Peter Oberparleiter 2017-02-13  509   *
66aec647216f129 Peter Oberparleiter 2017-02-13  510   *   /sys/firmware/sclp_sd/
66aec647216f129 Peter Oberparleiter 2017-02-13  511   *
66aec647216f129 Peter Oberparleiter 2017-02-13  512   * The files in this directory can be used to access the contents of the Store
66aec647216f129 Peter Oberparleiter 2017-02-13  513   * Data entity associated with @DI.
66aec647216f129 Peter Oberparleiter 2017-02-13  514   *
66aec647216f129 Peter Oberparleiter 2017-02-13  515   * Return pointer to resulting sclp_sd_file object on success, %NULL otherwise.
66aec647216f129 Peter Oberparleiter 2017-02-13  516   * The object must be freed by calling kobject_put() on the embedded kobject
66aec647216f129 Peter Oberparleiter 2017-02-13  517   * pointer after use.
66aec647216f129 Peter Oberparleiter 2017-02-13  518   */
66aec647216f129 Peter Oberparleiter 2017-02-13  519  static __init struct sclp_sd_file *sclp_sd_file_create(const char *name, u8 di)
66aec647216f129 Peter Oberparleiter 2017-02-13  520  {
66aec647216f129 Peter Oberparleiter 2017-02-13  521  	struct sclp_sd_file *sd_file;
66aec647216f129 Peter Oberparleiter 2017-02-13  522  	int rc;
66aec647216f129 Peter Oberparleiter 2017-02-13  523  
66aec647216f129 Peter Oberparleiter 2017-02-13  524  	sd_file = kzalloc(sizeof(*sd_file), GFP_KERNEL);
66aec647216f129 Peter Oberparleiter 2017-02-13  525  	if (!sd_file)
66aec647216f129 Peter Oberparleiter 2017-02-13  526  		return NULL;
66aec647216f129 Peter Oberparleiter 2017-02-13  527  	sd_file->di = di;
66aec647216f129 Peter Oberparleiter 2017-02-13  528  	mutex_init(&sd_file->data_mutex);
66aec647216f129 Peter Oberparleiter 2017-02-13  529  
66aec647216f129 Peter Oberparleiter 2017-02-13  530  	/* Create kobject located under /sys/firmware/sclp_sd/ */
66aec647216f129 Peter Oberparleiter 2017-02-13  531  	sd_file->kobj.kset = sclp_sd_kset;
66aec647216f129 Peter Oberparleiter 2017-02-13  532  	rc = kobject_init_and_add(&sd_file->kobj, &sclp_sd_file_ktype, NULL,
66aec647216f129 Peter Oberparleiter 2017-02-13  533  				  "%s", name);
66aec647216f129 Peter Oberparleiter 2017-02-13  534  	if (rc) {
66aec647216f129 Peter Oberparleiter 2017-02-13  535  		kobject_put(&sd_file->kobj);
66aec647216f129 Peter Oberparleiter 2017-02-13  536  		return NULL;
66aec647216f129 Peter Oberparleiter 2017-02-13  537  	}
66aec647216f129 Peter Oberparleiter 2017-02-13  538  
66aec647216f129 Peter Oberparleiter 2017-02-13  539  	sysfs_bin_attr_init(&sd_file->data_attr);
66aec647216f129 Peter Oberparleiter 2017-02-13  540  	sd_file->data_attr.attr.name = "data";
66aec647216f129 Peter Oberparleiter 2017-02-13  541  	sd_file->data_attr.attr.mode = 0444;
66aec647216f129 Peter Oberparleiter 2017-02-13 @542  	sd_file->data_attr.read = data_read;
66aec647216f129 Peter Oberparleiter 2017-02-13  543  
66aec647216f129 Peter Oberparleiter 2017-02-13  544  	rc = sysfs_create_bin_file(&sd_file->kobj, &sd_file->data_attr);
66aec647216f129 Peter Oberparleiter 2017-02-13  545  	if (rc) {
66aec647216f129 Peter Oberparleiter 2017-02-13  546  		kobject_put(&sd_file->kobj);
66aec647216f129 Peter Oberparleiter 2017-02-13  547  		return NULL;
66aec647216f129 Peter Oberparleiter 2017-02-13  548  	}
66aec647216f129 Peter Oberparleiter 2017-02-13  549  
66aec647216f129 Peter Oberparleiter 2017-02-13  550  	/*
66aec647216f129 Peter Oberparleiter 2017-02-13  551  	 * For completeness only - users interested in entity data should listen
66aec647216f129 Peter Oberparleiter 2017-02-13  552  	 * for KOBJ_CHANGE instead.
66aec647216f129 Peter Oberparleiter 2017-02-13  553  	 */
66aec647216f129 Peter Oberparleiter 2017-02-13  554  	kobject_uevent(&sd_file->kobj, KOBJ_ADD);
66aec647216f129 Peter Oberparleiter 2017-02-13  555  
66aec647216f129 Peter Oberparleiter 2017-02-13  556  	/* Don't let a slow Store Data request delay further initialization */
66aec647216f129 Peter Oberparleiter 2017-02-13  557  	async_schedule(sclp_sd_file_update_async, sd_file);
66aec647216f129 Peter Oberparleiter 2017-02-13  558  
66aec647216f129 Peter Oberparleiter 2017-02-13  559  	return sd_file;
66aec647216f129 Peter Oberparleiter 2017-02-13  560  }
66aec647216f129 Peter Oberparleiter 2017-02-13  561  

:::::: The code at line 542 was first introduced by commit
:::::: 66aec647216f129b8560dba738303a8486481c53 s390/sclp: Add support for Store Data SCLP interface

:::::: TO: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
