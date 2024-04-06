Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6BE45037;
	Sat,  6 Apr 2024 22:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712443618; cv=none; b=VimYL7GRNyVfaOellNK1qnxaS110fBu3zmaBwxQ0V2tbHWUkqZC1KqYChSPInIanqEYOsEP26aU2leKpyl97u8ukOnRClzuKlKRP7OV7/LTestaJj45FEuxUEdaRtyvfgCcidAjgN5mVpxljSdCb1ptDcO61kRhNZNdiolfcdp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712443618; c=relaxed/simple;
	bh=I1OiO+ZEI9YWtq71HEl4I/O2u8xoSYN4danCs8WD6PE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXmZyP0MJLDUMXuXj5lQl2nPD3dQD/Fsh6W/WTiFwce6zvyytzk7Mkn+jd//6NjmEopCUeO0v+CVh8Rpod8KC6s57A6mYvyO+RlXnWy1sL8wzsTNyLaSCujuBwxF7POOonyubNHcVyAWA/tvpQyP4Yj1FJnkgizjXek6Bb/WP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNal/srR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNal/srR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712443616; x=1743979616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I1OiO+ZEI9YWtq71HEl4I/O2u8xoSYN4danCs8WD6PE=;
  b=fNal/srRY0wse7Nrts98MESYGNJfcc0tsRgz1/k8toPi/q3UPkDp00Wx
   NM0pLeLan5UWYBcFEsWUVEwbGe+G1B7LHWxpAY7suvkCdFE87EFfocEND
   M9h9HqgwKeeYbN+TaXd7Y+6UgACj83d3le3utjg8YyCAF2BCj0pTBsxPn
   MCjlJtHvKX6/GMJUNZPKmZ45bNaLa/weVhNgJV8GekojL/Dm9Fk4WJxeN
   rwOXiYTALzLxPjVTRxPscQ+Q1ccn6Js/Yn1S6gTKaHQesOFLi4vf7ab3R
   nzGJxH4YPBlJPpi5RPezw7W88pKUU8XR5dk5BR8p6U4aF+6fXuTUsIrpY
   Q==;
X-CSE-ConnectionGUID: r80PwGhKTy2N1sG8N+OtaQ==
X-CSE-MsgGUID: 1zV3ImbxTDSSJqLKekcjJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="25251931"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="25251931"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 15:46:52 -0700
X-CSE-ConnectionGUID: gONa6hqbSqGVlkaA1kDRNg==
X-CSE-MsgGUID: lluMgK2/QROHMgwDUQ0MBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="23995112"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Apr 2024 15:46:51 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtEoD-0003v6-1K;
	Sat, 06 Apr 2024 22:46:49 +0000
Date: Sun, 7 Apr 2024 06:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 127/133] drivers/most/most_cdev.c:188:17:
 error: call to undeclared function 'iov_iter_count'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202404070647.uLcGRMUV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100
commit: 5e20f57e36986fd1fbf488594d6c04bdd6a62102 [127/133] drivers/most: convert to read/write iterators
config: i386-buildonly-randconfig-004-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070647.uLcGRMUV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070647.uLcGRMUV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070647.uLcGRMUV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/most/most_cdev.c:188:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     188 |         size_t count = iov_iter_count(from);
         |                        ^
>> drivers/most/most_cdev.c:207:8: error: call to undeclared function 'copy_from_iter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     207 |         ret = copy_from_iter(mbo->virt_address + c->mbo_offs, to_copy, from);
         |               ^
   drivers/most/most_cdev.c:207:8: note: did you mean 'copy_from_user'?
   include/linux/uaccess.h:180:1: note: 'copy_from_user' declared here
     180 | copy_from_user(void *to, const void __user *from, unsigned long n)
         | ^
   drivers/most/most_cdev.c:239:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     239 |         size_t count = iov_iter_count(to);
         |                        ^
>> drivers/most/most_cdev.c:263:11: error: call to undeclared function 'copy_to_iter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     263 |         copied = copy_to_iter(mbo->virt_address + c->mbo_offs, to_copy, to);
         |                  ^
   drivers/most/most_cdev.c:263:11: note: did you mean 'copy_to_user'?
   include/linux/uaccess.h:188:1: note: 'copy_to_user' declared here
     188 | copy_to_user(void __user *to, const void *from, unsigned long n)
         | ^
   4 errors generated.


vim +/iov_iter_count +188 drivers/most/most_cdev.c

   174	
   175	/**
   176	 * comp_write - implements the syscall to write to the device
   177	 * @filp: file pointer
   178	 * @buf: pointer to user buffer
   179	 * @count: number of bytes to write
   180	 * @offset: offset from where to start writing
   181	 */
   182	static ssize_t comp_write(struct kiocb *iocb, struct iov_iter *from)
   183	{
   184		int ret;
   185		size_t to_copy;
   186		struct mbo *mbo = NULL;
   187		struct comp_channel *c = iocb->ki_filp->private_data;
 > 188		size_t count = iov_iter_count(from);
   189	
   190		mutex_lock(&c->io_mutex);
   191		while (c->dev && !ch_get_mbo(c, &mbo)) {
   192			mutex_unlock(&c->io_mutex);
   193	
   194			if (iocb->ki_filp->f_flags & O_NONBLOCK)
   195				return -EAGAIN;
   196			if (wait_event_interruptible(c->wq, ch_has_mbo(c) || !c->dev))
   197				return -ERESTARTSYS;
   198			mutex_lock(&c->io_mutex);
   199		}
   200	
   201		if (unlikely(!c->dev)) {
   202			ret = -ENODEV;
   203			goto unlock;
   204		}
   205	
   206		to_copy = min(count, c->cfg->buffer_size - c->mbo_offs);
 > 207		ret = copy_from_iter(mbo->virt_address + c->mbo_offs, to_copy, from);
   208		if (ret != to_copy) {
   209			ret = -EFAULT;
   210			goto unlock;
   211		}
   212	
   213		c->mbo_offs += ret;
   214		if (c->mbo_offs >= c->cfg->buffer_size ||
   215		    c->cfg->data_type == MOST_CH_CONTROL ||
   216		    c->cfg->data_type == MOST_CH_ASYNC) {
   217			kfifo_skip(&c->fifo);
   218			mbo->buffer_length = c->mbo_offs;
   219			c->mbo_offs = 0;
   220			most_submit_mbo(mbo);
   221		}
   222	unlock:
   223		mutex_unlock(&c->io_mutex);
   224		return ret;
   225	}
   226	
   227	/**
   228	 * comp_read - implements the syscall to read from the device
   229	 * @filp: file pointer
   230	 * @buf: pointer to user buffer
   231	 * @count: number of bytes to read
   232	 * @offset: offset from where to start reading
   233	 */
   234	static ssize_t comp_read(struct kiocb *iocb, struct iov_iter *to)
   235	{
   236		size_t to_copy, copied;
   237		struct mbo *mbo = NULL;
   238		struct comp_channel *c = iocb->ki_filp->private_data;
   239		size_t count = iov_iter_count(to);
   240	
   241		mutex_lock(&c->io_mutex);
   242		while (c->dev && !kfifo_peek(&c->fifo, &mbo)) {
   243			mutex_unlock(&c->io_mutex);
   244			if (iocb->ki_filp->f_flags & O_NONBLOCK)
   245				return -EAGAIN;
   246			if (wait_event_interruptible(c->wq,
   247						     (!kfifo_is_empty(&c->fifo) ||
   248						      (!c->dev))))
   249				return -ERESTARTSYS;
   250			mutex_lock(&c->io_mutex);
   251		}
   252	
   253		/* make sure we don't submit to gone devices */
   254		if (unlikely(!c->dev)) {
   255			mutex_unlock(&c->io_mutex);
   256			return -ENODEV;
   257		}
   258	
   259		to_copy = min_t(size_t,
   260				count,
   261				mbo->processed_length - c->mbo_offs);
   262	
 > 263		copied = copy_to_iter(mbo->virt_address + c->mbo_offs, to_copy, to);
   264	
   265		c->mbo_offs += copied;
   266		if (c->mbo_offs >= mbo->processed_length) {
   267			kfifo_skip(&c->fifo);
   268			most_put_mbo(mbo);
   269			c->mbo_offs = 0;
   270		}
   271		mutex_unlock(&c->io_mutex);
   272		return copied;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
