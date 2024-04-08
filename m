Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D69F146A68;
	Mon,  8 Apr 2024 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712607612; cv=none; b=pmBnO/xlLhZZiGrxoQIqtKDymqqWp2U+KlPZ9HOFaPFfvF61i9ntJMk06peSnsoLIG9kIehh06zf7XyUvMcNTd9PfweZEqcntpl7p8om7qjl4mq9USTHdOWElTOQ/9I2huIXwiCeEeS2WcbmiaPAFUotuYZsK/Qj6KVfR1AwhII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712607612; c=relaxed/simple;
	bh=FopTkbXlJzDGZH5vTNleHJZA3l0e8MEhRKXnz8foTUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSustNkiM6sl35iR8TxYUxtvatQvBazyzATKmS21yas4gV0VumPeqxL5qwfOFV9Rf4vL+C4Ef33PzjZguyWQZ+d23FCfnoqNc+CpXkx2s80ofq791vK1yOS/UvosDpo2Jq9svOFjWQAjzdnEANilgfGaHV/H8zZ6KCStJIgGZEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxYWI+je; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxYWI+je"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712607609; x=1744143609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FopTkbXlJzDGZH5vTNleHJZA3l0e8MEhRKXnz8foTUA=;
  b=HxYWI+jeeyPIxrJx/esE/0ARCjyLXPCp76BfUTGXWEj9B9iCplPjPHxK
   dA9NNsqMtzonovF2CqRXbWC7O2j+nTJRXsNELvxt95ZsUwTLiQy6uJwey
   g4G77cgNr+uHlwQ/xfh/yr1U/rg2QSLQ3e6lIqK6DWk0Hq8cRr6tMW+Kr
   TQoNZleZKENNmNUAFm0uxsI/jj3KtOMKXlwAQD18PQp2ejYJp93tKw8FM
   S73xrt+OP4IC9TRniWDaTN+eQ/+eb3xSOYPYTwQQqRZFgbj7p+jIL3d8Y
   EkwobD2cSO/xVLqKRbfHVbhU8HA6joky3Mnr1nTpFj8RrgR5Jqow+vmeR
   w==;
X-CSE-ConnectionGUID: 4fOdhhfdTX+SnH2qOZE8Tg==
X-CSE-MsgGUID: 2zvMS6uVRmCDmCF1+8Nvdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8085753"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="8085753"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 13:20:05 -0700
X-CSE-ConnectionGUID: goSAFJy5SZChhJsbk4b5Ew==
X-CSE-MsgGUID: Vwmj11fsSH+3gcLuoUu1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19866443"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Apr 2024 13:20:03 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtvTE-0005Ss-0y;
	Mon, 08 Apr 2024 20:20:00 +0000
Date: Tue, 9 Apr 2024 04:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 78/144]
 drivers/misc/eeprom/idt_89hpesx.c:903:55: error: expected ')'
Message-ID: <202404090440.xDx6plBE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1b82b543d52b554590942733a069919265a5f27b
commit: 79301b69940a7eb819122a94ae86009cde5fdfda [78/144] misc: eeprom/idt_89hpesx: convert to read/write iterators
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240409/202404090440.xDx6plBE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404090440.xDx6plBE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090440.xDx6plBE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/misc/eeprom/idt_89hpesx.c:50:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/misc/eeprom/idt_89hpesx.c:50:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/misc/eeprom/idt_89hpesx.c:50:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/misc/eeprom/idt_89hpesx.c:50:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/misc/eeprom/idt_89hpesx.c:903:55: error: expected ')'
     903 | static ssize_t idt_dbgfs_csr_write(struct file *kiocb *iocb,
         |                                                       ^
   drivers/misc/eeprom/idt_89hpesx.c:903:35: note: to match this '('
     903 | static ssize_t idt_dbgfs_csr_write(struct file *kiocb *iocb,
         |                                   ^
>> drivers/misc/eeprom/idt_89hpesx.c:906:33: error: use of undeclared identifier 'filep'
     906 |         struct idt_89hpesx_dev *pdev = filep->private_data;
         |                                        ^
>> drivers/misc/eeprom/idt_89hpesx.c:908:32: error: use of undeclared identifier 'from'
     908 |         size_t count = iov_iter_count(from);
         |                                       ^
>> drivers/misc/eeprom/idt_89hpesx.c:913:6: error: use of undeclared identifier 'iocb'; did you mean 'kiocb'?
     913 |         if (iocb->ki_pos)
         |             ^~~~
         |             kiocb
   drivers/misc/eeprom/idt_89hpesx.c:903:49: note: 'kiocb' declared here
     903 | static ssize_t idt_dbgfs_csr_write(struct file *kiocb *iocb,
         |                                                 ^
>> drivers/misc/eeprom/idt_89hpesx.c:913:12: error: no member named 'ki_pos' in 'struct file'; did you mean 'f_pos'?
     913 |         if (iocb->ki_pos)
         |                   ^~~~~~
         |                   f_pos
   include/linux/fs.h:1011:11: note: 'f_pos' declared here
    1011 |         loff_t                  f_pos;
         |                                 ^
>> drivers/misc/eeprom/idt_89hpesx.c:917:8: error: call to undeclared function 'iterdup_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     917 |         buf = iterdup_user(from, count);
         |               ^
   drivers/misc/eeprom/idt_89hpesx.c:917:21: error: use of undeclared identifier 'from'; did you mean 'for'?
     917 |         buf = iterdup_user(from, count);
         |                            ^~~~
         |                            for
>> drivers/misc/eeprom/idt_89hpesx.c:917:21: error: expected expression
>> drivers/misc/eeprom/idt_89hpesx.c:1028:16: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'int (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *)' (aka 'int (struct file *)') [-Wincompatible-function-pointer-types]
    1028 |         .write_iter = idt_dbgfs_csr_write,
         |                       ^~~~~~~~~~~~~~~~~~~
   7 warnings and 9 errors generated.


vim +903 drivers/misc/eeprom/idt_89hpesx.c

   887	
   888	/*
   889	 * idt_dbgfs_csr_write() - CSR debugfs-node write callback
   890	 * @filep:	Pointer to the file system file descriptor
   891	 * @buf:	Buffer to read data from
   892	 * @count:	Size of the buffer
   893	 * @offp:	Offset within the file
   894	 *
   895	 * It accepts either "0x<reg addr>:0x<value>" for saving register address
   896	 * and writing value to specified DWORD register or "0x<reg addr>" for
   897	 * just saving register address in order to perform next read operation.
   898	 *
   899	 * WARNING No spaces are allowed. Incoming string must be strictly formated as:
   900	 * "<reg addr>:<value>". Register address must be aligned within 4 bytes
   901	 * (one DWORD).
   902	 */
 > 903	static ssize_t idt_dbgfs_csr_write(struct file *kiocb *iocb,
   904					   struct iov_iter *from)
   905	{
 > 906		struct idt_89hpesx_dev *pdev = filep->private_data;
   907		char *colon_ch, *csraddr_str, *csrval_str;
 > 908		size_t count = iov_iter_count(from);
   909		int ret;
   910		u32 csraddr, csrval;
   911		char *buf;
   912	
 > 913		if (iocb->ki_pos)
   914			return 0;
   915	
   916		/* Copy data from User-space */
 > 917		buf = iterdup_user(from, count);
   918		if (IS_ERR(buf))
   919			return PTR_ERR(buf);
   920	
   921		/* Find position of colon in the buffer */
   922		colon_ch = strnchr(buf, count, ':');
   923	
   924		/*
   925		 * If there is colon passed then new CSR value should be parsed as
   926		 * well, so allocate buffer for CSR address substring.
   927		 * If no colon is found, then string must have just one number with
   928		 * no new CSR value
   929		 */
   930		if (colon_ch != NULL) {
   931			/* Copy the register address to the substring buffer */
   932			csraddr_str = kmemdup_nul(buf, colon_ch - buf, GFP_KERNEL);
   933			if (csraddr_str == NULL) {
   934				ret = -ENOMEM;
   935				goto free_buf;
   936			}
   937			/* Register value must follow the colon */
   938			csrval_str = colon_ch + 1;
   939		} else /* if (str_colon == NULL) */ {
   940			csraddr_str = (char *)buf; /* Just to shut warning up */
   941			csrval_str = NULL;
   942		}
   943	
   944		/* Convert CSR address to u32 value */
   945		ret = kstrtou32(csraddr_str, 0, &csraddr);
   946		if (ret != 0)
   947			goto free_csraddr_str;
   948	
   949		/* Check whether passed register address is valid */
   950		if (csraddr > CSR_MAX || !IS_ALIGNED(csraddr, SZ_4)) {
   951			ret = -EINVAL;
   952			goto free_csraddr_str;
   953		}
   954	
   955		/* Shift register address to the right so to have u16 address */
   956		pdev->csr = (csraddr >> 2);
   957	
   958		/* Parse new CSR value and send it to IDT, if colon has been found */
   959		if (colon_ch != NULL) {
   960			ret = kstrtou32(csrval_str, 0, &csrval);
   961			if (ret != 0)
   962				goto free_csraddr_str;
   963	
   964			ret = idt_csr_write(pdev, pdev->csr, csrval);
   965			if (ret != 0)
   966				goto free_csraddr_str;
   967		}
   968	
   969		/* Free memory only if colon has been found */
   970	free_csraddr_str:
   971		if (colon_ch != NULL)
   972			kfree(csraddr_str);
   973	
   974		/* Free buffer allocated for data retrieved from User-space */
   975	free_buf:
   976		kfree(buf);
   977	
   978		return (ret != 0 ? ret : count);
   979	}
   980	
   981	/*
   982	 * idt_dbgfs_csr_read() - CSR debugfs-node read callback
   983	 * @filep:	Pointer to the file system file descriptor
   984	 * @buf:	Buffer to write data to
   985	 * @count:	Size of the buffer
   986	 * @offp:	Offset within the file
   987	 *
   988	 * It just prints the pair "0x<reg addr>:0x<value>" to passed buffer.
   989	 */
   990	#define CSRBUF_SIZE	((size_t)32)
   991	static ssize_t idt_dbgfs_csr_read(struct kiocb *iocb, struct iov_iter *to)
   992	{
   993		struct idt_89hpesx_dev *pdev = iocb->ki_filp->private_data;
   994		u32 csraddr, csrval;
   995		char buf[CSRBUF_SIZE];
   996		int ret, size;
   997	
   998		/* Perform CSR read operation */
   999		ret = idt_csr_read(pdev, pdev->csr, &csrval);
  1000		if (ret != 0)
  1001			return ret;
  1002	
  1003		/* Shift register address to the left so to have real address */
  1004		csraddr = ((u32)pdev->csr << 2);
  1005	
  1006		/* Print the "0x<reg addr>:0x<value>" to buffer */
  1007		size = snprintf(buf, CSRBUF_SIZE, "0x%05x:0x%08x\n",
  1008			(unsigned int)csraddr, (unsigned int)csrval);
  1009	
  1010		/* Copy data to User-space */
  1011		return simple_copy_to_iter(buf, &iocb->ki_pos, size, to);
  1012	}
  1013	
  1014	/*
  1015	 * eeprom_attribute - EEPROM sysfs-node attributes
  1016	 *
  1017	 * NOTE Size will be changed in compliance with OF node. EEPROM attribute will
  1018	 * be read-only as well if the corresponding flag is specified in OF node.
  1019	 */
  1020	static BIN_ATTR_RW(eeprom, EEPROM_DEF_SIZE);
  1021	
  1022	/*
  1023	 * csr_dbgfs_ops - CSR debugfs-node read/write operations
  1024	 */
  1025	static const struct file_operations csr_dbgfs_ops = {
  1026		.owner = THIS_MODULE,
  1027		.open = simple_open,
> 1028		.write_iter = idt_dbgfs_csr_write,
  1029		.read_iter = idt_dbgfs_csr_read
  1030	};
  1031	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
