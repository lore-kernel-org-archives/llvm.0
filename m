Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5F3BE6C;
	Sat,  6 Apr 2024 18:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712426989; cv=none; b=A4Gw8/gq0YFaJln/JyjWUNSY9obXFAybDNjJ197vcYuNUr47bdWSRP4fg7POBlIsgwjQQWanSD+won19lNJscTrZ/I4u9KZuHygg7fDFoOCyohArC/XTmBHsnKjrw+SOlrlK5rgTImpp9fxpaNlMFTCAORp0zaWd57GWnFUJ8Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712426989; c=relaxed/simple;
	bh=n0JlIHA5Iqd7L/Kv9q775wtwPQAEggHT1d+NKpgw4ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cBhIzjllZOvLTYEBLyLulQ3p4KBe5+fJrl3HWNwcIdcre+b3Sq3hJ9eCCpTKWXQgW+tSx6RmGx6o34naednYr3stp1GlF/FDLV82CwN1ryLtV/nrlrhVRaw/RRsxrja4VHBlTLRsql2zFsTaCcRqWJvRpysNEy5BvCbhx0rU+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YD08y/6M; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YD08y/6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712426987; x=1743962987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n0JlIHA5Iqd7L/Kv9q775wtwPQAEggHT1d+NKpgw4ns=;
  b=YD08y/6MDwWh4TQhOdWMlg+mi3lT2LGlGzat+SnthPS4krGdDdsQL9/s
   8hN2e7OKkCxMtJVSNERkSpAT79qZ2gKFJUAbd3eyjxkafdZJuPj4H432i
   yFxboWZXrbfXWEtxrTOXqoVj4LZcwXNt/VBvSmfZbW23h4/vRjfOpwQR7
   Uw5N9g/VStwxAb4eg18zYqgaE0ExgLv5WA5xp+1Yk1U7X0KbpY71ngMII
   3eLf5X+Yc3uTHhiHRW1DPEuDH2T8RDDx0cF7DnIF+m4F+893F2FOr0s1I
   2d7A41JgJ/9nK3ZHAda2cT3t+YThBpdZaK+kP15Wi0rFFiJ/WQv49nFJn
   g==;
X-CSE-ConnectionGUID: GVVmQWOESdutJVIMq+ddug==
X-CSE-MsgGUID: F36mkv/5RBCbatk0HoENgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7601253"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="7601253"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 11:09:46 -0700
X-CSE-ConnectionGUID: MGytukvRS2qX8u7eRJKNhg==
X-CSE-MsgGUID: dp90UWJZSR2lU7KbEBc98w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="24193729"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Apr 2024 11:09:44 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtAU1-0003kK-2i;
	Sat, 06 Apr 2024 18:09:41 +0000
Date: Sun, 7 Apr 2024 02:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 107/120] drivers/net/ieee802154/ca8210.c:2448:
 warning: Function parameter or struct member 'iocb' not described in
 'ca8210_test_int_user_write'
Message-ID: <202404070201.i53oMmZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f5a71066e2fa8ca66dd137e17bac2e2090b3802d
commit: d5a83c7c7a55cb27d2dba543610d7cce1523f87c [107/120] drivers/net/ieee802154: convert to read/write iterators
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240407/202404070201.i53oMmZ7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070201.i53oMmZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070201.i53oMmZ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ieee802154/ca8210.c:2448: warning: Function parameter or struct member 'iocb' not described in 'ca8210_test_int_user_write'
>> drivers/net/ieee802154/ca8210.c:2448: warning: Function parameter or struct member 'from' not described in 'ca8210_test_int_user_write'
>> drivers/net/ieee802154/ca8210.c:2448: warning: Excess function parameter 'filp' description in 'ca8210_test_int_user_write'
>> drivers/net/ieee802154/ca8210.c:2448: warning: Excess function parameter 'in_buf' description in 'ca8210_test_int_user_write'
>> drivers/net/ieee802154/ca8210.c:2448: warning: Excess function parameter 'len' description in 'ca8210_test_int_user_write'
>> drivers/net/ieee802154/ca8210.c:2448: warning: Excess function parameter 'off' description in 'ca8210_test_int_user_write'
>> drivers/net/ieee802154/ca8210.c:2521: warning: Function parameter or struct member 'iocb' not described in 'ca8210_test_int_user_read'
>> drivers/net/ieee802154/ca8210.c:2521: warning: Function parameter or struct member 'to' not described in 'ca8210_test_int_user_read'
>> drivers/net/ieee802154/ca8210.c:2521: warning: Excess function parameter 'filp' description in 'ca8210_test_int_user_read'
>> drivers/net/ieee802154/ca8210.c:2521: warning: Excess function parameter 'buf' description in 'ca8210_test_int_user_read'
>> drivers/net/ieee802154/ca8210.c:2521: warning: Excess function parameter 'len' description in 'ca8210_test_int_user_read'
>> drivers/net/ieee802154/ca8210.c:2521: warning: Excess function parameter 'offp' description in 'ca8210_test_int_user_read'


vim +2448 drivers/net/ieee802154/ca8210.c

ded845a781a578d Harry Morris 2017-03-28  2434  
ded845a781a578d Harry Morris 2017-03-28  2435  /**
ded845a781a578d Harry Morris 2017-03-28  2436   * ca8210_test_int_user_write() - Called by a process in userspace to send a
ded845a781a578d Harry Morris 2017-03-28  2437   *                                message to the ca8210 drivers
ded845a781a578d Harry Morris 2017-03-28  2438   * @filp:    file interface
ded845a781a578d Harry Morris 2017-03-28  2439   * @in_buf:  Buffer containing message to write
ded845a781a578d Harry Morris 2017-03-28  2440   * @len:     length of message
ded845a781a578d Harry Morris 2017-03-28  2441   * @off:     file offset
ded845a781a578d Harry Morris 2017-03-28  2442   *
ded845a781a578d Harry Morris 2017-03-28  2443   * Return: 0 or linux error code
ded845a781a578d Harry Morris 2017-03-28  2444   */
ded845a781a578d Harry Morris 2017-03-28  2445  static ssize_t ca8210_test_int_user_write(
d5a83c7c7a55cb2 Jens Axboe   2024-04-06  2446  	struct kiocb *iocb,
d5a83c7c7a55cb2 Jens Axboe   2024-04-06  2447  	struct iov_iter *from)
ded845a781a578d Harry Morris 2017-03-28 @2448  {
ded845a781a578d Harry Morris 2017-03-28  2449  	int ret;
d5a83c7c7a55cb2 Jens Axboe   2024-04-06  2450  	struct ca8210_priv *priv = iocb->ki_filp->private_data;
d5a83c7c7a55cb2 Jens Axboe   2024-04-06  2451  	size_t len = iov_iter_count(from);
ded845a781a578d Harry Morris 2017-03-28  2452  	u8 command[CA8210_SPI_BUF_SIZE];
ded845a781a578d Harry Morris 2017-03-28  2453  
86674a97f5055f4 Harry Morris 2018-03-28  2454  	memset(command, SPI_IDLE, 6);
86674a97f5055f4 Harry Morris 2018-03-28  2455  	if (len > CA8210_SPI_BUF_SIZE || len < 2) {
ded845a781a578d Harry Morris 2017-03-28  2456  		dev_warn(
ded845a781a578d Harry Morris 2017-03-28  2457  			&priv->spi->dev,
86674a97f5055f4 Harry Morris 2018-03-28  2458  			"userspace requested erroneous write length (%zu)\n",
ded845a781a578d Harry Morris 2017-03-28  2459  			len
ded845a781a578d Harry Morris 2017-03-28  2460  		);
86674a97f5055f4 Harry Morris 2018-03-28  2461  		return -EBADE;
ded845a781a578d Harry Morris 2017-03-28  2462  	}
ded845a781a578d Harry Morris 2017-03-28  2463  
d5a83c7c7a55cb2 Jens Axboe   2024-04-06  2464  	ret = !copy_from_iter_full(command, len, from);
ded845a781a578d Harry Morris 2017-03-28  2465  	if (ret) {
ded845a781a578d Harry Morris 2017-03-28  2466  		dev_err(
ded845a781a578d Harry Morris 2017-03-28  2467  			&priv->spi->dev,
ded845a781a578d Harry Morris 2017-03-28  2468  			"%d bytes could not be copied from userspace\n",
ded845a781a578d Harry Morris 2017-03-28  2469  			ret
ded845a781a578d Harry Morris 2017-03-28  2470  		);
ded845a781a578d Harry Morris 2017-03-28  2471  		return -EIO;
ded845a781a578d Harry Morris 2017-03-28  2472  	}
86674a97f5055f4 Harry Morris 2018-03-28  2473  	if (len != command[1] + 2) {
86674a97f5055f4 Harry Morris 2018-03-28  2474  		dev_err(
86674a97f5055f4 Harry Morris 2018-03-28  2475  			&priv->spi->dev,
86674a97f5055f4 Harry Morris 2018-03-28  2476  			"write len does not match packet length field\n"
86674a97f5055f4 Harry Morris 2018-03-28  2477  		);
86674a97f5055f4 Harry Morris 2018-03-28  2478  		return -EBADE;
86674a97f5055f4 Harry Morris 2018-03-28  2479  	}
ded845a781a578d Harry Morris 2017-03-28  2480  
ded845a781a578d Harry Morris 2017-03-28  2481  	ret = ca8210_test_check_upstream(command, priv->spi);
ded845a781a578d Harry Morris 2017-03-28  2482  	if (ret == 0) {
ded845a781a578d Harry Morris 2017-03-28  2483  		ret = ca8210_spi_exchange(
ded845a781a578d Harry Morris 2017-03-28  2484  			command,
ded845a781a578d Harry Morris 2017-03-28  2485  			command[1] + 2,
ded845a781a578d Harry Morris 2017-03-28  2486  			NULL,
ded845a781a578d Harry Morris 2017-03-28  2487  			priv->spi
ded845a781a578d Harry Morris 2017-03-28  2488  		);
ded845a781a578d Harry Morris 2017-03-28  2489  		if (ret < 0) {
ded845a781a578d Harry Morris 2017-03-28  2490  			/* effectively 0 bytes were written successfully */
ded845a781a578d Harry Morris 2017-03-28  2491  			dev_err(
ded845a781a578d Harry Morris 2017-03-28  2492  				&priv->spi->dev,
ded845a781a578d Harry Morris 2017-03-28  2493  				"spi exchange failed\n"
ded845a781a578d Harry Morris 2017-03-28  2494  			);
ded845a781a578d Harry Morris 2017-03-28  2495  			return ret;
ded845a781a578d Harry Morris 2017-03-28  2496  		}
ded845a781a578d Harry Morris 2017-03-28  2497  		if (command[0] & SPI_SYN)
ded845a781a578d Harry Morris 2017-03-28  2498  			priv->sync_down++;
ded845a781a578d Harry Morris 2017-03-28  2499  	}
ded845a781a578d Harry Morris 2017-03-28  2500  
ded845a781a578d Harry Morris 2017-03-28  2501  	return len;
ded845a781a578d Harry Morris 2017-03-28  2502  }
ded845a781a578d Harry Morris 2017-03-28  2503  
ded845a781a578d Harry Morris 2017-03-28  2504  /**
ded845a781a578d Harry Morris 2017-03-28  2505   * ca8210_test_int_user_read() - Called by a process in userspace to read a
ded845a781a578d Harry Morris 2017-03-28  2506   *                               message from the ca8210 drivers
ded845a781a578d Harry Morris 2017-03-28  2507   * @filp:  file interface
ded845a781a578d Harry Morris 2017-03-28  2508   * @buf:   Buffer to write message to
ded845a781a578d Harry Morris 2017-03-28  2509   * @len:   length of message to read (ignored)
ded845a781a578d Harry Morris 2017-03-28  2510   * @offp:  file offset
ded845a781a578d Harry Morris 2017-03-28  2511   *
ded845a781a578d Harry Morris 2017-03-28  2512   * If the O_NONBLOCK flag was set when opening the file then this function will
ded845a781a578d Harry Morris 2017-03-28  2513   * not block, i.e. it will return if the fifo is empty. Otherwise the function
ded845a781a578d Harry Morris 2017-03-28  2514   * will block, i.e. wait until new data arrives.
ded845a781a578d Harry Morris 2017-03-28  2515   *
ded845a781a578d Harry Morris 2017-03-28  2516   * Return: number of bytes read
ded845a781a578d Harry Morris 2017-03-28  2517   */
ded845a781a578d Harry Morris 2017-03-28  2518  static ssize_t ca8210_test_int_user_read(
d5a83c7c7a55cb2 Jens Axboe   2024-04-06  2519  	struct kiocb *iocb,
d5a83c7c7a55cb2 Jens Axboe   2024-04-06  2520  	struct iov_iter *to)
ded845a781a578d Harry Morris 2017-03-28 @2521  {
ded845a781a578d Harry Morris 2017-03-28  2522  	int i, cmdlen;
d5a83c7c7a55cb2 Jens Axboe   2024-04-06  2523  	struct ca8210_priv *priv = iocb->ki_filp->private_data;
ded845a781a578d Harry Morris 2017-03-28  2524  	unsigned char *fifo_buffer;
ded845a781a578d Harry Morris 2017-03-28  2525  	unsigned long bytes_not_copied;
ded845a781a578d Harry Morris 2017-03-28  2526  
d5a83c7c7a55cb2 Jens Axboe   2024-04-06  2527  	if (iocb->ki_filp->f_flags & O_NONBLOCK) {
ded845a781a578d Harry Morris 2017-03-28  2528  		/* Non-blocking mode */
ded845a781a578d Harry Morris 2017-03-28  2529  		if (kfifo_is_empty(&priv->test.up_fifo))
ded845a781a578d Harry Morris 2017-03-28  2530  			return 0;
ded845a781a578d Harry Morris 2017-03-28  2531  	} else {
ded845a781a578d Harry Morris 2017-03-28  2532  		/* Blocking mode */
ded845a781a578d Harry Morris 2017-03-28  2533  		wait_event_interruptible(
ded845a781a578d Harry Morris 2017-03-28  2534  			priv->test.readq,
ded845a781a578d Harry Morris 2017-03-28  2535  			!kfifo_is_empty(&priv->test.up_fifo)
ded845a781a578d Harry Morris 2017-03-28  2536  		);
ded845a781a578d Harry Morris 2017-03-28  2537  	}
ded845a781a578d Harry Morris 2017-03-28  2538  
ded845a781a578d Harry Morris 2017-03-28  2539  	if (kfifo_out(&priv->test.up_fifo, &fifo_buffer, 4) != 4) {
ded845a781a578d Harry Morris 2017-03-28  2540  		dev_err(
ded845a781a578d Harry Morris 2017-03-28  2541  			&priv->spi->dev,
ded845a781a578d Harry Morris 2017-03-28  2542  			"test_interface: Wrong number of elements popped from upstream fifo\n"
ded845a781a578d Harry Morris 2017-03-28  2543  		);
ded845a781a578d Harry Morris 2017-03-28  2544  		return 0;
ded845a781a578d Harry Morris 2017-03-28  2545  	}
ded845a781a578d Harry Morris 2017-03-28  2546  	cmdlen = fifo_buffer[1];
ded845a781a578d Harry Morris 2017-03-28  2547  	bytes_not_copied = cmdlen + 2;
ded845a781a578d Harry Morris 2017-03-28  2548  
d5a83c7c7a55cb2 Jens Axboe   2024-04-06  2549  	bytes_not_copied = !copy_to_iter_full(fifo_buffer, bytes_not_copied, to);
ded845a781a578d Harry Morris 2017-03-28  2550  	if (bytes_not_copied > 0) {
ded845a781a578d Harry Morris 2017-03-28  2551  		dev_err(
ded845a781a578d Harry Morris 2017-03-28  2552  			&priv->spi->dev,
ded845a781a578d Harry Morris 2017-03-28  2553  			"%lu bytes could not be copied to user space!\n",
ded845a781a578d Harry Morris 2017-03-28  2554  			bytes_not_copied
ded845a781a578d Harry Morris 2017-03-28  2555  		);
ded845a781a578d Harry Morris 2017-03-28  2556  	}
ded845a781a578d Harry Morris 2017-03-28  2557  
ded845a781a578d Harry Morris 2017-03-28  2558  	dev_dbg(&priv->spi->dev, "test_interface: Cmd len = %d\n", cmdlen);
ded845a781a578d Harry Morris 2017-03-28  2559  
ded845a781a578d Harry Morris 2017-03-28  2560  	dev_dbg(&priv->spi->dev, "test_interface: Read\n");
ded845a781a578d Harry Morris 2017-03-28  2561  	for (i = 0; i < cmdlen + 2; i++)
ded845a781a578d Harry Morris 2017-03-28  2562  		dev_dbg(&priv->spi->dev, "%#03x\n", fifo_buffer[i]);
ded845a781a578d Harry Morris 2017-03-28  2563  
ded845a781a578d Harry Morris 2017-03-28  2564  	kfree(fifo_buffer);
ded845a781a578d Harry Morris 2017-03-28  2565  
ded845a781a578d Harry Morris 2017-03-28  2566  	return cmdlen + 2;
ded845a781a578d Harry Morris 2017-03-28  2567  }
ded845a781a578d Harry Morris 2017-03-28  2568  

:::::: The code at line 2448 was first introduced by commit
:::::: ded845a781a578dfb0b5b2c138e5a067aa3b1242 ieee802154: Add CA8210 IEEE 802.15.4 device driver

:::::: TO: Harry Morris <harrymorris12@gmail.com>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
