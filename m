Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F74E13D606;
	Wed, 10 Apr 2024 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754308; cv=none; b=iahPhfc5DYpU5EqTRBVgwgflzod62DggPRnqDC1KDKd90KGxsqtWAGJio2OjpKiB2l7oYygcznkT+DsyrmAG9FVO3Xy9c9ioAbbz2JfAPcSHla102ZLGrjWKFpzxT5Rx+XNZVI4thjREI+MxK5Rwpy3vqR8JId6O+fAdiCmN9PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754308; c=relaxed/simple;
	bh=EomByJRkSxkyrdiMojZz40hq1pQuNfsoOeHkHwekn/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rfne6nQbxvhbYeLraNiyHotXc65vIR5TaZ7Qjr5CA8NKWaLS6fdwaYKA/j6s/oOH8pFvlE53x2JRa0ASYdoFu5I7Z2JHUKbyElOBPr7mKBmH6QoQzpxxLclgQPCWNtkmqE+HGltfA9nlXksGDp6c4GcvKBCjBZcoyWo9XcApgN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KV/bXXLq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KV/bXXLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712754307; x=1744290307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EomByJRkSxkyrdiMojZz40hq1pQuNfsoOeHkHwekn/I=;
  b=KV/bXXLqAbjUUy6KCtMrsJfFWEWotKbPFrGxW+4iKNRkfvjTG7P6wt7i
   BALGyAElcf6Ki/mEmIkmockt0EhNqvacxH7l7c1HxSG6RLTiXvZQN66b2
   rrJ3k7AuWeZcXtTgkds+TwJU6BX9ur4HBXKbgEeTIESB0O5FWqLAbpqcM
   9s0AG/Vvs3TlKgWYn1IveBik+9oRR/PmX/pbiRL4KN/pjSAbF74SUc85u
   XrtX8hHEvEqBQeGxC3of4IlJa1fC2zd5zFB524plRQ3hdZXlL7+VHef47
   uYQy45RidAUZlXeIGrlxIJsYWpoDU8wPM+436y0Zj6TnqAI0qSHydsGp4
   Q==;
X-CSE-ConnectionGUID: L7JWEph8T+2B5Aegs2WqeA==
X-CSE-MsgGUID: GspxPeDMTuSpzb0jC6iarQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8684440"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8684440"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 06:05:06 -0700
X-CSE-ConnectionGUID: MHT3kVS0R/W+bKemJ6j3IQ==
X-CSE-MsgGUID: BeE3lB7GTammzZeyKwZZ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25328257"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Apr 2024 06:05:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruXdO-0007QW-1p;
	Wed, 10 Apr 2024 13:05:02 +0000
Date: Wed, 10 Apr 2024 21:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 287/367] drivers/s390/char/hmcdrv_dev.c:73:15:
 error: use of undeclared identifier 'hmcdrv_dev_read_iter'; did you mean
 'hmcdrv_dev_read'?
Message-ID: <202404102139.GBZ7gNSS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   ad69a5a8c930e58537ce092334af08caaa412900
commit: 0b4ce834b4399204416ea6f4abcad6da6f28f7f4 [287/367] s390: hmcdrv: convert to read/write iterators
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240410/202404102139.GBZ7gNSS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404102139.GBZ7gNSS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404102139.GBZ7gNSS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/s390/char/hmcdrv_dev.c:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/char/hmcdrv_dev.c:73:15: error: use of undeclared identifier 'hmcdrv_dev_read_iter'; did you mean 'hmcdrv_dev_read'?
      73 |         .read_iter = hmcdrv_dev_read_iter,
         |                      ^~~~~~~~~~~~~~~~~~~~
         |                      hmcdrv_dev_read
   drivers/s390/char/hmcdrv_dev.c:59:16: note: 'hmcdrv_dev_read' declared here
      59 | static ssize_t hmcdrv_dev_read(struct file *fp, char __user *ubuf,
         |                ^
>> drivers/s390/char/hmcdrv_dev.c:74:16: error: use of undeclared identifier 'hmcdrv_dev_write_iter'; did you mean 'hmcdrv_dev_write'?
      74 |         .write_iter = hmcdrv_dev_write_iter,
         |                       ^~~~~~~~~~~~~~~~~~~~~
         |                       hmcdrv_dev_write
   drivers/s390/char/hmcdrv_dev.c:61:16: note: 'hmcdrv_dev_write' declared here
      61 | static ssize_t hmcdrv_dev_write(struct file *fp, const char __user *ubuf,
         |                ^
>> drivers/s390/char/hmcdrv_dev.c:73:15: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t *)' (aka 'long (struct file *, char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
      73 |         .read_iter = hmcdrv_dev_read_iter,
         |                      ^~~~~~~~~~~~~~~~~~~~
   drivers/s390/char/hmcdrv_dev.c:74:16: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, const char *, size_t, loff_t *)' (aka 'long (struct file *, const char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
      74 |         .write_iter = hmcdrv_dev_write_iter,
         |                       ^~~~~~~~~~~~~~~~~~~~~
   5 warnings and 4 errors generated.


vim +73 drivers/s390/char/hmcdrv_dev.c

    55	
    56	static int hmcdrv_dev_open(struct inode *inode, struct file *fp);
    57	static int hmcdrv_dev_release(struct inode *inode, struct file *fp);
    58	static loff_t hmcdrv_dev_seek(struct file *fp, loff_t pos, int whence);
    59	static ssize_t hmcdrv_dev_read(struct file *fp, char __user *ubuf,
    60				       size_t len, loff_t *pos);
    61	static ssize_t hmcdrv_dev_write(struct file *fp, const char __user *ubuf,
    62					size_t len, loff_t *pos);
    63	static ssize_t hmcdrv_dev_transfer(char __kernel *cmd, loff_t offset,
    64					   char __user *buf, size_t len);
    65	
    66	/*
    67	 * device operations
    68	 */
    69	static const struct file_operations hmcdrv_dev_fops = {
    70		.open = hmcdrv_dev_open,
    71		.llseek = hmcdrv_dev_seek,
    72		.release = hmcdrv_dev_release,
  > 73		.read_iter = hmcdrv_dev_read_iter,
  > 74		.write_iter = hmcdrv_dev_write_iter,
    75	};
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
