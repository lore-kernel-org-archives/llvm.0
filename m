Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6653F8C3;
	Sun,  7 Apr 2024 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712517627; cv=none; b=CEmRor+uZJfu9LdsQLm9/V1W73OXel0bEJ8O0nDT7XKcORYPFFxNqrhs0z9W+/vF0k8B/NGvfPWTcXw5qYCbMIuKHYClgI0dBsUDSEU+4bUoBS4wD4ReZI1M3uP9NGeD3RUh9zbGoFzw22Wr1N7A8EL5jLmNJWysFeEznVaixRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712517627; c=relaxed/simple;
	bh=3VdWcgygLkN9IXwTXeGDBbYwK1eX9kLKfrlRWxdeZXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X3Asy2cv64DY2c3eWPqkElocASCType3LmnqTRxRdXX87XDyb0HZhQB+ib0o46qsPvSVW2e+HlfLgWSkacolk7NNY7UY/Lf4ykdHOc+MwNS0KYB1Sosd2+tjv8GtFZQWDjlbQSWI7RwYIUbo5sYzecYjGYoYcW1AyotgYvymcU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ym2/A9uO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ym2/A9uO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712517625; x=1744053625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3VdWcgygLkN9IXwTXeGDBbYwK1eX9kLKfrlRWxdeZXA=;
  b=Ym2/A9uO8UCH1ncMoDAye08pK4nqmnosjsff6p5JiQ7xzAFCvbDy79pe
   F/62poFPYwpyalKiEkXWncqj/FV24yJDvyW62hSuL8v5kw0F8omKI1Wn+
   gU2kRJAXoQFOcmamnjILGJjJb3xM6q4QKLL923jkiddUGPLI9QCMx9GgS
   qeWU3K/SDlO9akT0vjsmxdbHz+Q5IxWppFC5JCh8NrEyq+OaJkDY5lYWY
   idTacYy40BVoDdyZqPzwEE3kFqlY9xzmdeDUNuRGlAyryjxwthvpWAQYE
   Rr264MoMc8Z/QPv/QktOFQtz4111HlchGS/3ELRPvXPonSDWyydaPatMr
   g==;
X-CSE-ConnectionGUID: O1aC1BD5RR+pqMlP1lOp2g==
X-CSE-MsgGUID: wh+IsxkmQgWKVg+XXSs7Hg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="8362142"
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="8362142"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 12:20:24 -0700
X-CSE-ConnectionGUID: sLz108N8TC2+W65DcxgUbQ==
X-CSE-MsgGUID: /c9BV4P7SPeIgLjmL3F9rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="19695454"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2024 12:20:23 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtY3x-0004Yf-1c;
	Sun, 07 Apr 2024 19:20:21 +0000
Date: Mon, 8 Apr 2024 03:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 127/133] drivers/most/most_cdev.c:183: warning:
 Function parameter or struct member 'iocb' not described in 'comp_write'
Message-ID: <202404080327.RU67mvJN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f1cf9d93aefca99fd4de1be19eff1764ba941174
commit: 5e20f57e36986fd1fbf488594d6c04bdd6a62102 [127/133] drivers/most: convert to read/write iterators
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240408/202404080327.RU67mvJN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404080327.RU67mvJN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404080327.RU67mvJN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/most/most_cdev.c:183: warning: Function parameter or struct member 'iocb' not described in 'comp_write'
>> drivers/most/most_cdev.c:183: warning: Function parameter or struct member 'from' not described in 'comp_write'
>> drivers/most/most_cdev.c:183: warning: Excess function parameter 'filp' description in 'comp_write'
>> drivers/most/most_cdev.c:183: warning: Excess function parameter 'buf' description in 'comp_write'
>> drivers/most/most_cdev.c:183: warning: Excess function parameter 'count' description in 'comp_write'
>> drivers/most/most_cdev.c:183: warning: Excess function parameter 'offset' description in 'comp_write'
>> drivers/most/most_cdev.c:235: warning: Function parameter or struct member 'iocb' not described in 'comp_read'
>> drivers/most/most_cdev.c:235: warning: Function parameter or struct member 'to' not described in 'comp_read'
>> drivers/most/most_cdev.c:235: warning: Excess function parameter 'filp' description in 'comp_read'
>> drivers/most/most_cdev.c:235: warning: Excess function parameter 'buf' description in 'comp_read'
>> drivers/most/most_cdev.c:235: warning: Excess function parameter 'count' description in 'comp_read'
>> drivers/most/most_cdev.c:235: warning: Excess function parameter 'offset' description in 'comp_read'


vim +183 drivers/most/most_cdev.c

9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  174  
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  175  /**
1fd923f38610a8 drivers/staging/most/cdev/cdev.c     Christian Gromm 2017-11-21  176   * comp_write - implements the syscall to write to the device
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  177   * @filp: file pointer
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  178   * @buf: pointer to user buffer
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  179   * @count: number of bytes to write
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  180   * @offset: offset from where to start writing
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  181   */
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  182  static ssize_t comp_write(struct kiocb *iocb, struct iov_iter *from)
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24 @183  {
5adf5dc5682fa7 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  184  	int ret;
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  185  	size_t to_copy;
fa96b8ed9cc562 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  186  	struct mbo *mbo = NULL;
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  187  	struct comp_channel *c = iocb->ki_filp->private_data;
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  188  	size_t count = iov_iter_count(from);
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  189  
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  190  	mutex_lock(&c->io_mutex);
fa96b8ed9cc562 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  191  	while (c->dev && !ch_get_mbo(c, &mbo)) {
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  192  		mutex_unlock(&c->io_mutex);
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  193  
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  194  		if (iocb->ki_filp->f_flags & O_NONBLOCK)
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  195  			return -EAGAIN;
fa96b8ed9cc562 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  196  		if (wait_event_interruptible(c->wq, ch_has_mbo(c) || !c->dev))
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  197  			return -ERESTARTSYS;
fa96b8ed9cc562 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  198  		mutex_lock(&c->io_mutex);
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  199  	}
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  200  
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  201  	if (unlikely(!c->dev)) {
9b28e14818ad95 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2016-08-19  202  		ret = -ENODEV;
5adf5dc5682fa7 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  203  		goto unlock;
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  204  	}
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  205  
da2c08714c9478 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2016-09-23  206  	to_copy = min(count, c->cfg->buffer_size - c->mbo_offs);
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  207  	ret = copy_from_iter(mbo->virt_address + c->mbo_offs, to_copy, from);
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  208  	if (ret != to_copy) {
5adf5dc5682fa7 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  209  		ret = -EFAULT;
da2c08714c9478 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2016-09-23  210  		goto unlock;
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  211  	}
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  212  
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  213  	c->mbo_offs += ret;
da2c08714c9478 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2016-09-23  214  	if (c->mbo_offs >= c->cfg->buffer_size ||
da2c08714c9478 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2016-09-23  215  	    c->cfg->data_type == MOST_CH_CONTROL ||
da2c08714c9478 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2016-09-23  216  	    c->cfg->data_type == MOST_CH_ASYNC) {
da2c08714c9478 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2016-09-23  217  		kfifo_skip(&c->fifo);
da2c08714c9478 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2016-09-23  218  		mbo->buffer_length = c->mbo_offs;
da2c08714c9478 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2016-09-23  219  		c->mbo_offs = 0;
a6f9d846cc0980 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2016-09-21  220  		most_submit_mbo(mbo);
da2c08714c9478 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2016-09-23  221  	}
5adf5dc5682fa7 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  222  unlock:
fa96b8ed9cc562 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  223  	mutex_unlock(&c->io_mutex);
5adf5dc5682fa7 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  224  	return ret;
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  225  }
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  226  
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  227  /**
1fd923f38610a8 drivers/staging/most/cdev/cdev.c     Christian Gromm 2017-11-21  228   * comp_read - implements the syscall to read from the device
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  229   * @filp: file pointer
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  230   * @buf: pointer to user buffer
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  231   * @count: number of bytes to read
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  232   * @offset: offset from where to start reading
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  233   */
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  234  static ssize_t comp_read(struct kiocb *iocb, struct iov_iter *to)
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24 @235  {
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  236  	size_t to_copy, copied;
8463d9fab6e25a drivers/staging/most/cdev/cdev.c     Christian Gromm 2018-05-08  237  	struct mbo *mbo = NULL;
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  238  	struct comp_channel *c = iocb->ki_filp->private_data;
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  239  	size_t count = iov_iter_count(to);
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  240  
fa96b8ed9cc562 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  241  	mutex_lock(&c->io_mutex);
f45b0fba43f415 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  242  	while (c->dev && !kfifo_peek(&c->fifo, &mbo)) {
fa96b8ed9cc562 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  243  		mutex_unlock(&c->io_mutex);
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  244  		if (iocb->ki_filp->f_flags & O_NONBLOCK)
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  245  			return -EAGAIN;
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  246  		if (wait_event_interruptible(c->wq,
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  247  					     (!kfifo_is_empty(&c->fifo) ||
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  248  					      (!c->dev))))
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  249  			return -ERESTARTSYS;
fa96b8ed9cc562 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  250  		mutex_lock(&c->io_mutex);
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  251  	}
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  252  
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  253  	/* make sure we don't submit to gone devices */
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  254  	if (unlikely(!c->dev)) {
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  255  		mutex_unlock(&c->io_mutex);
9b28e14818ad95 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2016-08-19  256  		return -ENODEV;
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  257  	}
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  258  
e6d6cbe303c5cf drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  259  	to_copy = min_t(size_t,
e6d6cbe303c5cf drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  260  			count,
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  261  			mbo->processed_length - c->mbo_offs);
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  262  
5e20f57e36986f drivers/most/most_cdev.c             Jens Axboe      2024-04-06  263  	copied = copy_to_iter(mbo->virt_address + c->mbo_offs, to_copy, to);
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  264  
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  265  	c->mbo_offs += copied;
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  266  	if (c->mbo_offs >= mbo->processed_length) {
f45b0fba43f415 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  267  		kfifo_skip(&c->fifo);
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  268  		most_put_mbo(mbo);
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  269  		c->mbo_offs = 0;
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  270  	}
d8b082e6c625cb drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  271  	mutex_unlock(&c->io_mutex);
f9f24870d84d4c drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-12-22  272  	return copied;
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  273  }
9bc79bbcd0c526 drivers/staging/most/aim-cdev/cdev.c Christian Gromm 2015-07-24  274  

:::::: The code at line 183 was first introduced by commit
:::::: 9bc79bbcd0c526e3ec7b98e08c5d34648bb3c158 Staging: most: add MOST driver's aim-cdev module

:::::: TO: Christian Gromm <christian.gromm@microchip.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
