Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD58B171E4E;
	Fri,  5 Apr 2024 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712339822; cv=none; b=lkIIQJ22YHBxU7YgyqyiAhGoYBYMUuqCJ9Adb2UWXTl/06zjp5zTySYqdXLthRRh4U01/ju96538M92AVa1uVGBDwenoGZDbx36GEhb4jdUhm8bY6nvJC1CyUgLqaIsWM6+t+eH2+ect3WKr1KFmIGuKxhRdAxs20V0fKFcUreM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712339822; c=relaxed/simple;
	bh=stFZJYyszuXZHLAJj985RUllVL2WKQPZa/9/2VnV0uY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t5a9+2BbOUrbPGBxqmRiRrX/9Bc1Y5tufh4x2TXHMzhEI+qroRqL0loy4IlcyiisHKyOPwLFhBMd2ysNRCaLXsJSubbUfyOpLhVF9C+aFVbfbOuZ0Tb1+b0POMw6sE9fZNYNShnKRzHGXQVchzUjjS5K+U6zCfZWoTIwgm+rChQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLKPLcQ8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLKPLcQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712339820; x=1743875820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=stFZJYyszuXZHLAJj985RUllVL2WKQPZa/9/2VnV0uY=;
  b=QLKPLcQ8MKuYlT39iHxJWb4+xl2dY89NLtP6i3JyD7RRj5a2OA3SLkWo
   mr5yZeF77aq8p2QlI4Ix0GlM/iXYMkNPUUaoRoN5i1LVw8Li6VfqoI/fs
   dnM7SYamtGkoSFzKjXV9rHW+1MrSzkVlC1biaT8AQwUQYc8kYHpScIM+V
   IH4zJUJ/w9EM04U61gn6sSDlw/GDy+014xTBo11yhEI+qRZ0GVC+x5OTr
   /a7tgIJk+gJwKKKrXkHW9098vVgBBEQyUkrAK/v6kLr+6kCEM7nwEdNu8
   geKAkXRgv+g1OruEbZ/DFjC+/xyU5iLD5uIpCI/jaqwhM8p3aOAfiSjDj
   Q==;
X-CSE-ConnectionGUID: 2IrjXO+5Q4qlGvBAwgiTbQ==
X-CSE-MsgGUID: wMokw7HuTY+hKNb55i5F6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7522425"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7522425"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 10:56:59 -0700
X-CSE-ConnectionGUID: LSwCIgR3TcidqmbJtRosQQ==
X-CSE-MsgGUID: WGR4nC1YSeeyQ9fNaD42Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="23919666"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Apr 2024 10:56:57 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsno6-0002Z2-0x;
	Fri, 05 Apr 2024 17:56:54 +0000
Date: Sat, 6 Apr 2024 01:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 15/40]
 drivers/staging/axis-fifo/axis-fifo.c:351:15: error: implicit declaration of
 function 'iov_iter_count' is invalid in C99
Message-ID: <202404060116.iQ7IejKc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   a9cbf952fcac761bffbb44eab7d5ef86b310c71c
commit: 9bddfc061dffa3ca19b6e971ef1f1281458ee8a3 [15/40] staging: convert drivers to read/write iterators
config: powerpc-randconfig-002-20240405 (https://download.01.org/0day-ci/archive/20240406/202404060116.iQ7IejKc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060116.iQ7IejKc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060116.iQ7IejKc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/axis-fifo/axis-fifo.c:351:15: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t len = iov_iter_count(to);
                        ^
>> drivers/staging/axis-fifo/axis-fifo.c:434:8: error: implicit declaration of function 'copy_to_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (!copy_to_iter_full(tmp_buf, copy * sizeof(u32), to)) {
                        ^
   drivers/staging/axis-fifo/axis-fifo.c:354:15: warning: variable 'copied' set but not used [-Wunused-but-set-variable]
           unsigned int copied;
                        ^
   drivers/staging/axis-fifo/axis-fifo.c:470:15: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t len = iov_iter_count(from);
                        ^
>> drivers/staging/axis-fifo/axis-fifo.c:542:8: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (!copy_from_iter_full(tmp_buf, copy * sizeof(u32), from)) {
                        ^
   drivers/staging/axis-fifo/axis-fifo.c:542:8: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
   long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
        ^
   1 warning and 4 errors generated.


vim +/iov_iter_count +351 drivers/staging/axis-fifo/axis-fifo.c

   332	
   333	/**
   334	 * axis_fifo_read() - Read a packet from AXIS-FIFO character device.
   335	 * @f: Open file.
   336	 * @buf: User space buffer to read to.
   337	 * @len: User space buffer length.
   338	 * @off: Buffer offset.
   339	 *
   340	 * As defined by the device's documentation, we need to check the device's
   341	 * occupancy before reading the length register and then the data. All these
   342	 * operations must be executed atomically, in order and one after the other
   343	 * without missing any.
   344	 *
   345	 * Returns the number of bytes read from the device or negative error code
   346	 *	on failure.
   347	 */
   348	static ssize_t axis_fifo_read(struct kiocb *iocb, struct iov_iter *to)
   349	{
   350		struct axis_fifo *fifo = iocb->ki_filp->private_data;
 > 351		size_t len = iov_iter_count(to);
   352		size_t bytes_available;
   353		unsigned int words_available;
   354		unsigned int copied;
   355		unsigned int copy;
   356		unsigned int i;
   357		int ret;
   358		u32 tmp_buf[READ_BUF_SIZE];
   359	
   360		if (fifo->read_flags & O_NONBLOCK) {
   361			/*
   362			 * Device opened in non-blocking mode. Try to lock it and then
   363			 * check if any packet is available.
   364			 */
   365			if (!mutex_trylock(&fifo->read_lock))
   366				return -EAGAIN;
   367	
   368			if (!ioread32(fifo->base_addr + XLLF_RDFO_OFFSET)) {
   369				ret = -EAGAIN;
   370				goto end_unlock;
   371			}
   372		} else {
   373			/* opened in blocking mode
   374			 * wait for a packet available interrupt (or timeout)
   375			 * if nothing is currently available
   376			 */
   377			mutex_lock(&fifo->read_lock);
   378			ret = wait_event_interruptible_timeout(fifo->read_queue,
   379				ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
   380				read_timeout);
   381	
   382			if (ret <= 0) {
   383				if (ret == 0) {
   384					ret = -EAGAIN;
   385				} else if (ret != -ERESTARTSYS) {
   386					dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in read (ret=%i)\n",
   387						ret);
   388				}
   389	
   390				goto end_unlock;
   391			}
   392		}
   393	
   394		bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
   395		if (!bytes_available) {
   396			dev_err(fifo->dt_device, "received a packet of length 0 - fifo core will be reset\n");
   397			reset_ip_core(fifo);
   398			ret = -EIO;
   399			goto end_unlock;
   400		}
   401	
   402		if (bytes_available > len) {
   403			dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu) - fifo core will be reset\n",
   404				bytes_available, len);
   405			reset_ip_core(fifo);
   406			ret = -EINVAL;
   407			goto end_unlock;
   408		}
   409	
   410		if (bytes_available % sizeof(u32)) {
   411			/* this probably can't happen unless IP
   412			 * registers were previously mishandled
   413			 */
   414			dev_err(fifo->dt_device, "received a packet that isn't word-aligned - fifo core will be reset\n");
   415			reset_ip_core(fifo);
   416			ret = -EIO;
   417			goto end_unlock;
   418		}
   419	
   420		words_available = bytes_available / sizeof(u32);
   421	
   422		/* read data into an intermediate buffer, copying the contents
   423		 * to userspace when the buffer is full
   424		 */
   425		copied = 0;
   426		while (words_available > 0) {
   427			copy = min(words_available, READ_BUF_SIZE);
   428	
   429			for (i = 0; i < copy; i++) {
   430				tmp_buf[i] = ioread32(fifo->base_addr +
   431						      XLLF_RDFD_OFFSET);
   432			}
   433	
 > 434			if (!copy_to_iter_full(tmp_buf, copy * sizeof(u32), to)) {
   435				reset_ip_core(fifo);
   436				ret = -EFAULT;
   437				goto end_unlock;
   438			}
   439	
   440			copied += copy;
   441			words_available -= copy;
   442		}
   443	
   444		ret = bytes_available;
   445	
   446	end_unlock:
   447		mutex_unlock(&fifo->read_lock);
   448	
   449		return ret;
   450	}
   451	
   452	/**
   453	 * axis_fifo_write() - Write buffer to AXIS-FIFO character device.
   454	 * @f: Open file.
   455	 * @buf: User space buffer to write to the device.
   456	 * @len: User space buffer length.
   457	 * @off: Buffer offset.
   458	 *
   459	 * As defined by the device's documentation, we need to write to the device's
   460	 * data buffer then to the device's packet length register atomically. Also,
   461	 * we need to lock before checking if the device has available space to avoid
   462	 * any concurrency issue.
   463	 *
   464	 * Returns the number of bytes written to the device or negative error code
   465	 *	on failure.
   466	 */
   467	static ssize_t axis_fifo_write(struct kiocb *iocb, struct iov_iter *from)
   468	{
   469		struct axis_fifo *fifo = iocb->ki_filp->private_data;
   470		size_t len = iov_iter_count(from);
   471		unsigned int words_to_write;
   472		unsigned int copied;
   473		unsigned int copy;
   474		unsigned int i;
   475		int ret;
   476		u32 tmp_buf[WRITE_BUF_SIZE];
   477	
   478		if (len % sizeof(u32)) {
   479			dev_err(fifo->dt_device,
   480				"tried to send a packet that isn't word-aligned\n");
   481			return -EINVAL;
   482		}
   483	
   484		words_to_write = len / sizeof(u32);
   485	
   486		if (!words_to_write) {
   487			dev_err(fifo->dt_device,
   488				"tried to send a packet of length 0\n");
   489			return -EINVAL;
   490		}
   491	
   492		if (words_to_write > fifo->tx_fifo_depth) {
   493			dev_err(fifo->dt_device, "tried to write more words [%u] than slots in the fifo buffer [%u]\n",
   494				words_to_write, fifo->tx_fifo_depth);
   495			return -EINVAL;
   496		}
   497	
   498		if (fifo->write_flags & O_NONBLOCK) {
   499			/*
   500			 * Device opened in non-blocking mode. Try to lock it and then
   501			 * check if there is any room to write the given buffer.
   502			 */
   503			if (!mutex_trylock(&fifo->write_lock))
   504				return -EAGAIN;
   505	
   506			if (words_to_write > ioread32(fifo->base_addr +
   507						      XLLF_TDFV_OFFSET)) {
   508				ret = -EAGAIN;
   509				goto end_unlock;
   510			}
   511		} else {
   512			/* opened in blocking mode */
   513	
   514			/* wait for an interrupt (or timeout) if there isn't
   515			 * currently enough room in the fifo
   516			 */
   517			mutex_lock(&fifo->write_lock);
   518			ret = wait_event_interruptible_timeout(fifo->write_queue,
   519				ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
   520					 >= words_to_write,
   521				write_timeout);
   522	
   523			if (ret <= 0) {
   524				if (ret == 0) {
   525					ret = -EAGAIN;
   526				} else if (ret != -ERESTARTSYS) {
   527					dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in write (ret=%i)\n",
   528						ret);
   529				}
   530	
   531				goto end_unlock;
   532			}
   533		}
   534	
   535		/* write data from an intermediate buffer into the fifo IP, refilling
   536		 * the buffer with userspace data as needed
   537		 */
   538		copied = 0;
   539		while (words_to_write > 0) {
   540			copy = min(words_to_write, WRITE_BUF_SIZE);
   541	
 > 542			if (!copy_from_iter_full(tmp_buf, copy * sizeof(u32), from)) {
   543				reset_ip_core(fifo);
   544				ret = -EFAULT;
   545				goto end_unlock;
   546			}
   547	
   548			for (i = 0; i < copy; i++)
   549				iowrite32(tmp_buf[i], fifo->base_addr +
   550					  XLLF_TDFD_OFFSET);
   551	
   552			copied += copy;
   553			words_to_write -= copy;
   554		}
   555	
   556		ret = copied * sizeof(u32);
   557	
   558		/* write packet size to fifo */
   559		iowrite32(ret, fifo->base_addr + XLLF_TLR_OFFSET);
   560	
   561	end_unlock:
   562		mutex_unlock(&fifo->write_lock);
   563	
   564		return ret;
   565	}
   566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
