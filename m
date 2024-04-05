Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C4C14288;
	Fri,  5 Apr 2024 02:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712283326; cv=none; b=C1+BQP+5Q+Cvc3Em4xjDGaK2Gr+xeeVTA0T4KRanMB4cNddPlt8QoWa//b6DgcUnr3qFy+aA1c/B5RvJxNgGMKXdkXez30/Ob3UOntc7Bqol3AbA50G7wguBSGn5GCnBG9yYiD7fuEfjLnGpzUUuoxmYiwYneGsUcLGESyPY1E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712283326; c=relaxed/simple;
	bh=8RNziIHlVkO0i8kR56y6C2xmukLnt0XbZgK/aTLFaqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rqP22C3EOrAd7HImJ7nSWWaGR/80SnhkPNm4K2zOSMNbBhjBEZMFEl4IK053vSLv7shItexdbRFrC4CRkaHZuDsKLIXU8kP9vD+BoCYab9Zoz3GCi1VdpXDjELixLPEZ199pqp2by1v2xUFuHqIwgWeznOBB1VdwbH2li3OLhoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buCPBzdY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buCPBzdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712283324; x=1743819324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8RNziIHlVkO0i8kR56y6C2xmukLnt0XbZgK/aTLFaqY=;
  b=buCPBzdYExcMVKIxI5cNGaxCmLL59Kd/GRZugQ1ETw/9FgE2f6z1zef5
   Erq4XHFY+4lRi22KKjelzYu5U9y+R7hs5e3LC6NB8H9jbEL7WjZZneZxm
   fP1nybctDFmX1ugtONUZT92G23yyhGXUWBMchDKiGty0haaj4efL920y3
   krmOKBBCj8C8Y4YzL69JEbi4lZSKFzqO62DTEyN7BBK6i7Yt5samI1cpx
   MTcexFF77b9uCcclO9Siw20sxPMyndD3vDWlbnOyMFkqDvg5+Jpo02XEz
   zjLyHkF8OZrGP23u7IMmBaOqbaeallj5kwTJmX0Xzv6wsztaUuHy8Iybe
   g==;
X-CSE-ConnectionGUID: UYqsCOY8Sce7dPOSbd5xkw==
X-CSE-MsgGUID: d1LQBGtxRpiAIsynmgNzbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7704735"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7704735"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 19:15:24 -0700
X-CSE-ConnectionGUID: SEMxfj+JRKe2WsBGGoMKpA==
X-CSE-MsgGUID: D9f/f4wGReCrFCoonpN7wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18957183"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Apr 2024 19:15:22 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsZ6t-0001ls-1j;
	Fri, 05 Apr 2024 02:15:19 +0000
Date: Fri, 5 Apr 2024 10:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 15/29]
 drivers/staging/axis-fifo/axis-fifo.c:354:15: warning: variable 'copied' set
 but not used
Message-ID: <202404051005.42QnWRjN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   34a49de340a534b0cb222309e73d1ef215ff4db6
commit: 9bddfc061dffa3ca19b6e971ef1f1281458ee8a3 [15/29] staging: convert drivers to read/write iterators
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240405/202404051005.42QnWRjN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051005.42QnWRjN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051005.42QnWRjN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/axis-fifo/axis-fifo.c:27:
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
   In file included from drivers/staging/axis-fifo/axis-fifo.c:27:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/staging/axis-fifo/axis-fifo.c:27:
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
   drivers/staging/axis-fifo/axis-fifo.c:351:15: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     351 |         size_t len = iov_iter_count(to);
         |                      ^
   drivers/staging/axis-fifo/axis-fifo.c:434:8: error: call to undeclared function 'copy_to_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     434 |                 if (!copy_to_iter_full(tmp_buf, copy * sizeof(u32), to)) {
         |                      ^
>> drivers/staging/axis-fifo/axis-fifo.c:354:15: warning: variable 'copied' set but not used [-Wunused-but-set-variable]
     354 |         unsigned int copied;
         |                      ^
   drivers/staging/axis-fifo/axis-fifo.c:470:15: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     470 |         size_t len = iov_iter_count(from);
         |                      ^
   drivers/staging/axis-fifo/axis-fifo.c:542:8: error: call to undeclared function 'copy_from_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     542 |                 if (!copy_from_iter_full(tmp_buf, copy * sizeof(u32), from)) {
         |                      ^
   drivers/staging/axis-fifo/axis-fifo.c:542:8: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
     377 | long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
         |      ^
   7 warnings and 4 errors generated.


vim +/copied +354 drivers/staging/axis-fifo/axis-fifo.c

4a965c5f89decd Jacob Feder       2018-07-22  332  
0443b3f4436321 Quentin Deslandes 2020-01-21  333  /**
bbf40b2f6e38d0 Lee Jones         2021-04-14  334   * axis_fifo_read() - Read a packet from AXIS-FIFO character device.
c848434c629db5 Lee Jones         2021-04-14  335   * @f: Open file.
c848434c629db5 Lee Jones         2021-04-14  336   * @buf: User space buffer to read to.
c848434c629db5 Lee Jones         2021-04-14  337   * @len: User space buffer length.
c848434c629db5 Lee Jones         2021-04-14  338   * @off: Buffer offset.
0443b3f4436321 Quentin Deslandes 2020-01-21  339   *
0443b3f4436321 Quentin Deslandes 2020-01-21  340   * As defined by the device's documentation, we need to check the device's
0443b3f4436321 Quentin Deslandes 2020-01-21  341   * occupancy before reading the length register and then the data. All these
0443b3f4436321 Quentin Deslandes 2020-01-21  342   * operations must be executed atomically, in order and one after the other
0443b3f4436321 Quentin Deslandes 2020-01-21  343   * without missing any.
0443b3f4436321 Quentin Deslandes 2020-01-21  344   *
0443b3f4436321 Quentin Deslandes 2020-01-21  345   * Returns the number of bytes read from the device or negative error code
0443b3f4436321 Quentin Deslandes 2020-01-21  346   *	on failure.
0443b3f4436321 Quentin Deslandes 2020-01-21  347   */
9bddfc061dffa3 Jens Axboe        2024-04-03  348  static ssize_t axis_fifo_read(struct kiocb *iocb, struct iov_iter *to)
4a965c5f89decd Jacob Feder       2018-07-22  349  {
9bddfc061dffa3 Jens Axboe        2024-04-03  350  	struct axis_fifo *fifo = iocb->ki_filp->private_data;
9bddfc061dffa3 Jens Axboe        2024-04-03  351  	size_t len = iov_iter_count(to);
4a965c5f89decd Jacob Feder       2018-07-22  352  	size_t bytes_available;
4a965c5f89decd Jacob Feder       2018-07-22  353  	unsigned int words_available;
4a965c5f89decd Jacob Feder       2018-07-22 @354  	unsigned int copied;
4a965c5f89decd Jacob Feder       2018-07-22  355  	unsigned int copy;
4a965c5f89decd Jacob Feder       2018-07-22  356  	unsigned int i;
4a965c5f89decd Jacob Feder       2018-07-22  357  	int ret;
4a965c5f89decd Jacob Feder       2018-07-22  358  	u32 tmp_buf[READ_BUF_SIZE];
4a965c5f89decd Jacob Feder       2018-07-22  359  
4a965c5f89decd Jacob Feder       2018-07-22  360  	if (fifo->read_flags & O_NONBLOCK) {
0443b3f4436321 Quentin Deslandes 2020-01-21  361  		/*
0443b3f4436321 Quentin Deslandes 2020-01-21  362  		 * Device opened in non-blocking mode. Try to lock it and then
0443b3f4436321 Quentin Deslandes 2020-01-21  363  		 * check if any packet is available.
4a965c5f89decd Jacob Feder       2018-07-22  364  		 */
0443b3f4436321 Quentin Deslandes 2020-01-21  365  		if (!mutex_trylock(&fifo->read_lock))
4a965c5f89decd Jacob Feder       2018-07-22  366  			return -EAGAIN;
0443b3f4436321 Quentin Deslandes 2020-01-21  367  
0443b3f4436321 Quentin Deslandes 2020-01-21  368  		if (!ioread32(fifo->base_addr + XLLF_RDFO_OFFSET)) {
0443b3f4436321 Quentin Deslandes 2020-01-21  369  			ret = -EAGAIN;
0443b3f4436321 Quentin Deslandes 2020-01-21  370  			goto end_unlock;
0443b3f4436321 Quentin Deslandes 2020-01-21  371  		}
4a965c5f89decd Jacob Feder       2018-07-22  372  	} else {
4a965c5f89decd Jacob Feder       2018-07-22  373  		/* opened in blocking mode
4a965c5f89decd Jacob Feder       2018-07-22  374  		 * wait for a packet available interrupt (or timeout)
4a965c5f89decd Jacob Feder       2018-07-22  375  		 * if nothing is currently available
4a965c5f89decd Jacob Feder       2018-07-22  376  		 */
0443b3f4436321 Quentin Deslandes 2020-01-21  377  		mutex_lock(&fifo->read_lock);
0443b3f4436321 Quentin Deslandes 2020-01-21  378  		ret = wait_event_interruptible_timeout(fifo->read_queue,
4a965c5f89decd Jacob Feder       2018-07-22  379  			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
752cbd8f191678 Khadija Kamran    2023-03-17  380  			read_timeout);
4a965c5f89decd Jacob Feder       2018-07-22  381  
0443b3f4436321 Quentin Deslandes 2020-01-21  382  		if (ret <= 0) {
4a965c5f89decd Jacob Feder       2018-07-22  383  			if (ret == 0) {
0443b3f4436321 Quentin Deslandes 2020-01-21  384  				ret = -EAGAIN;
0443b3f4436321 Quentin Deslandes 2020-01-21  385  			} else if (ret != -ERESTARTSYS) {
4a965c5f89decd Jacob Feder       2018-07-22  386  				dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in read (ret=%i)\n",
4a965c5f89decd Jacob Feder       2018-07-22  387  					ret);
0443b3f4436321 Quentin Deslandes 2020-01-21  388  			}
0443b3f4436321 Quentin Deslandes 2020-01-21  389  
0443b3f4436321 Quentin Deslandes 2020-01-21  390  			goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  391  		}
4a965c5f89decd Jacob Feder       2018-07-22  392  	}
4a965c5f89decd Jacob Feder       2018-07-22  393  
4a965c5f89decd Jacob Feder       2018-07-22  394  	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
4a965c5f89decd Jacob Feder       2018-07-22  395  	if (!bytes_available) {
4a965c5f89decd Jacob Feder       2018-07-22  396  		dev_err(fifo->dt_device, "received a packet of length 0 - fifo core will be reset\n");
4a965c5f89decd Jacob Feder       2018-07-22  397  		reset_ip_core(fifo);
0443b3f4436321 Quentin Deslandes 2020-01-21  398  		ret = -EIO;
0443b3f4436321 Quentin Deslandes 2020-01-21  399  		goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  400  	}
4a965c5f89decd Jacob Feder       2018-07-22  401  
4a965c5f89decd Jacob Feder       2018-07-22  402  	if (bytes_available > len) {
4a965c5f89decd Jacob Feder       2018-07-22  403  		dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu) - fifo core will be reset\n",
4a965c5f89decd Jacob Feder       2018-07-22  404  			bytes_available, len);
4a965c5f89decd Jacob Feder       2018-07-22  405  		reset_ip_core(fifo);
0443b3f4436321 Quentin Deslandes 2020-01-21  406  		ret = -EINVAL;
0443b3f4436321 Quentin Deslandes 2020-01-21  407  		goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  408  	}
4a965c5f89decd Jacob Feder       2018-07-22  409  
4a965c5f89decd Jacob Feder       2018-07-22  410  	if (bytes_available % sizeof(u32)) {
4a965c5f89decd Jacob Feder       2018-07-22  411  		/* this probably can't happen unless IP
4a965c5f89decd Jacob Feder       2018-07-22  412  		 * registers were previously mishandled
4a965c5f89decd Jacob Feder       2018-07-22  413  		 */
4a965c5f89decd Jacob Feder       2018-07-22  414  		dev_err(fifo->dt_device, "received a packet that isn't word-aligned - fifo core will be reset\n");
4a965c5f89decd Jacob Feder       2018-07-22  415  		reset_ip_core(fifo);
0443b3f4436321 Quentin Deslandes 2020-01-21  416  		ret = -EIO;
0443b3f4436321 Quentin Deslandes 2020-01-21  417  		goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  418  	}
4a965c5f89decd Jacob Feder       2018-07-22  419  
4a965c5f89decd Jacob Feder       2018-07-22  420  	words_available = bytes_available / sizeof(u32);
4a965c5f89decd Jacob Feder       2018-07-22  421  
4a965c5f89decd Jacob Feder       2018-07-22  422  	/* read data into an intermediate buffer, copying the contents
4a965c5f89decd Jacob Feder       2018-07-22  423  	 * to userspace when the buffer is full
4a965c5f89decd Jacob Feder       2018-07-22  424  	 */
4a965c5f89decd Jacob Feder       2018-07-22  425  	copied = 0;
4a965c5f89decd Jacob Feder       2018-07-22  426  	while (words_available > 0) {
4a965c5f89decd Jacob Feder       2018-07-22  427  		copy = min(words_available, READ_BUF_SIZE);
4a965c5f89decd Jacob Feder       2018-07-22  428  
4a965c5f89decd Jacob Feder       2018-07-22  429  		for (i = 0; i < copy; i++) {
4a965c5f89decd Jacob Feder       2018-07-22  430  			tmp_buf[i] = ioread32(fifo->base_addr +
4a965c5f89decd Jacob Feder       2018-07-22  431  					      XLLF_RDFD_OFFSET);
4a965c5f89decd Jacob Feder       2018-07-22  432  		}
4a965c5f89decd Jacob Feder       2018-07-22  433  
9bddfc061dffa3 Jens Axboe        2024-04-03  434  		if (!copy_to_iter_full(tmp_buf, copy * sizeof(u32), to)) {
4a965c5f89decd Jacob Feder       2018-07-22  435  			reset_ip_core(fifo);
0443b3f4436321 Quentin Deslandes 2020-01-21  436  			ret = -EFAULT;
0443b3f4436321 Quentin Deslandes 2020-01-21  437  			goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  438  		}
4a965c5f89decd Jacob Feder       2018-07-22  439  
4a965c5f89decd Jacob Feder       2018-07-22  440  		copied += copy;
4a965c5f89decd Jacob Feder       2018-07-22  441  		words_available -= copy;
4a965c5f89decd Jacob Feder       2018-07-22  442  	}
4a965c5f89decd Jacob Feder       2018-07-22  443  
0443b3f4436321 Quentin Deslandes 2020-01-21  444  	ret = bytes_available;
0443b3f4436321 Quentin Deslandes 2020-01-21  445  
0443b3f4436321 Quentin Deslandes 2020-01-21  446  end_unlock:
0443b3f4436321 Quentin Deslandes 2020-01-21  447  	mutex_unlock(&fifo->read_lock);
0443b3f4436321 Quentin Deslandes 2020-01-21  448  
0443b3f4436321 Quentin Deslandes 2020-01-21  449  	return ret;
4a965c5f89decd Jacob Feder       2018-07-22  450  }
4a965c5f89decd Jacob Feder       2018-07-22  451  

:::::: The code at line 354 was first introduced by commit
:::::: 4a965c5f89decd636129cddc47e5f2c61e8f13e6 staging: add driver for Xilinx AXI-Stream FIFO v4.1 IP core

:::::: TO: Jacob Feder <jacobsfeder@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
