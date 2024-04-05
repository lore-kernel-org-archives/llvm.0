Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7FA1BC40;
	Fri,  5 Apr 2024 02:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712285253; cv=none; b=SQx0JmLyntXPEEORBc5UljL6A/m+3sP9+QkRdKhG4TUi2+x0zMLv300Dh89kYr6u5AHJllovhodCPxh8MvsPc/SGvVquA7Z0kiDrgaiREVmYg1u7AJCMW3L99rSMRdqqDCSqGn0tEBgaWhOBFFIJnVlzRCq+wRT2l+KOFBilgh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712285253; c=relaxed/simple;
	bh=pzmU0/o0jjsqRYfWnvaLhrQsx1T5dDQLZBqGxAZpNS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bA6GLJNIYf4LYNEuVdKbEbGCCiqC5GGPTA8ECedG0N8D/e7uOKA6v095VMZ44BXn03T3TzqrSVxXFmAoOa/wQNeYz7wi6dQYX4Rk1WzbRC0XNH7lUPxyjBbKKDYGA6JdtccTS3AJNpHJryUaWMDW85PTr2yddGFjWAGhw28KaYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgyCzH9D; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgyCzH9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712285251; x=1743821251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pzmU0/o0jjsqRYfWnvaLhrQsx1T5dDQLZBqGxAZpNS0=;
  b=UgyCzH9DQV/k4KvmA2MkrzROexfWMKrfklswyG3gMPUbmqxcL8AKPF4S
   o3CfIRIgDoiOxCEYoZ4dy2WGzBE/rWPO2rJDegEO6L00wDHX3iQIAVkkM
   K/hitYQWNidIozD3W0i6eIHWOHJzQZjkzPPYA2yzsfOmicugHTPm7kQpp
   dqs+gtwkGsS9daZkAdECBLt0dfgGiPIZRFeDhIo15U1pcIFesbf0X8eOa
   yZMMPRfNwUw4xDtDNSumjNcMY993PqkMMHOVjNPuIM1McxbM6f2P7e8tp
   Lma9EXd4LfjpwhERR12kdmBuSrGKduajNoTPcYptwhN3WY3t0EXr5T6Ho
   Q==;
X-CSE-ConnectionGUID: /YAVT29PRwGABoonpXXQgQ==
X-CSE-MsgGUID: qAJA7mp+S0S7vtPSFgo7kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8182499"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="8182499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 19:47:25 -0700
X-CSE-ConnectionGUID: vnBKRh9cT5S/mtaCdfvgmA==
X-CSE-MsgGUID: p4aZC1VQR0OeaENsPJS/eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="23654239"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Apr 2024 19:47:23 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsZbt-0001o7-0H;
	Fri, 05 Apr 2024 02:47:21 +0000
Date: Fri, 5 Apr 2024 10:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 30/37] drivers/usb/chipidea/debug.c:76:17:
 error: implicit declaration of function 'iov_iter_count' is invalid in C99
Message-ID: <202404051032.X5yg2o62-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   449fd46baa282dd51ed0f757f111cd2cb11d03d9
commit: 32cd57aa11bcff56cc617bd01c4e00fbcf4a5ee7 [30/37] drivers/usb: convert to ->read_iter and ->write_iter
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240405/202404051032.X5yg2o62-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051032.X5yg2o62-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051032.X5yg2o62-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/chipidea/debug.c:76:17: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t count = iov_iter_count(from);
                          ^
>> drivers/usb/chipidea/debug.c:84:7: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter_full(buf, count, from))
                ^
   drivers/usb/chipidea/debug.c:84:7: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
   long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
        ^
   2 errors generated.
--
>> drivers/usb/dwc2/debugfs.c:30:19: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t                  count = iov_iter_count(from);
                                           ^
>> drivers/usb/dwc2/debugfs.c:36:7: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter_full(&buf, min_t(size_t, sizeof(buf) - 1, count), from))
                ^
   drivers/usb/dwc2/debugfs.c:36:7: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
   long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
        ^
   2 errors generated.
--
>> drivers/usb/dwc3/debugfs.c:371:19: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t                  count = iov_iter_count(from);
                                           ^
>> drivers/usb/dwc3/debugfs.c:378:7: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter_full(&buf, min_t(size_t, sizeof(buf) - 1, count), from))
                ^
   drivers/usb/dwc3/debugfs.c:378:7: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
   long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
        ^
   drivers/usb/dwc3/debugfs.c:442:19: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t                  count = iov_iter_count(from);
                                           ^
   drivers/usb/dwc3/debugfs.c:447:7: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter_full(&buf, min_t(size_t, sizeof(buf) - 1, count), from))
                ^
   drivers/usb/dwc3/debugfs.c:528:19: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t                  count = iov_iter_count(from);
                                           ^
   drivers/usb/dwc3/debugfs.c:535:7: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter_full(&buf, min_t(size_t, sizeof(buf) - 1, count), from))
                ^
   drivers/usb/dwc3/debugfs.c:616:19: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t                  count = iov_iter_count(from);
                                           ^
   drivers/usb/dwc3/debugfs.c:625:7: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter_full(&buf, min_t(size_t, sizeof(buf) - 1, count), from))
                ^
   8 errors generated.
--
>> drivers/usb/host/xhci-debugfs.c:366:19: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t                  count = iov_iter_count(from);
                                           ^
>> drivers/usb/host/xhci-debugfs.c:373:7: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter_full(&buf, min_t(size_t, sizeof(buf) - 1, count), from))
                ^
   drivers/usb/host/xhci-debugfs.c:373:7: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
   long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
        ^
   2 errors generated.
--
>> drivers/usb/musb/musb_debugfs.c:166:19: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t                  count = iov_iter_count(from);
                                           ^
>> drivers/usb/musb/musb_debugfs.c:173:7: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter_full(buf, min_t(size_t, sizeof(buf) - 1, count), from))
                ^
   drivers/usb/musb/musb_debugfs.c:173:7: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
   long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
        ^
   drivers/usb/musb/musb_debugfs.c:266:19: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t                  count = iov_iter_count(from);
                                           ^
   drivers/usb/musb/musb_debugfs.c:273:7: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter_full(&buf, min_t(size_t, sizeof(buf) - 1, count), from))
                ^
   4 errors generated.
--
>> drivers/usb/gadget/function/f_hid.c:438:17: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t count = iov_iter_count(from);
                          ^
>> drivers/usb/gadget/function/f_hid.c:477:11: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           status = copy_from_iter_full(req->buf, count, from);
                    ^
   drivers/usb/gadget/function/f_hid.c:477:11: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
   long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
        ^
   2 errors generated.
--
>> drivers/usb/gadget/function/f_printer.c:432:18: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t                          len = iov_iter_count(to);
                                                 ^
>> drivers/usb/gadget/function/f_printer.c:525:11: error: implicit declaration of function 'copy_to_iter' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   size -= copy_to_iter(current_rx_buf, size, to);
                           ^
   drivers/usb/gadget/function/f_printer.c:525:11: note: did you mean 'copy_to_user'?
   include/linux/uaccess.h:188:1: note: 'copy_to_user' declared here
   copy_to_user(void __user *to, const void *from, unsigned long n)
   ^
   drivers/usb/gadget/function/f_printer.c:573:17: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t                  len = iov_iter_count(from);
                                         ^
>> drivers/usb/gadget/function/f_printer.c:644:8: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (!copy_from_iter_full(req->buf, size, from)) {
                        ^
   drivers/usb/gadget/function/f_printer.c:644:8: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
   long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
        ^
   4 errors generated.


vim +/iov_iter_count +76 drivers/usb/chipidea/debug.c

    69	
    70	/*
    71	 * ci_port_test_write: writes port test mode
    72	 */
    73	static ssize_t ci_port_test_write(struct kiocb *iocb, struct iov_iter *from)
    74	{
    75		struct seq_file *s = iocb->ki_filp->private_data;
  > 76		size_t count = iov_iter_count(from);
    77		struct ci_hdrc *ci = s->private;
    78		unsigned long flags;
    79		unsigned mode;
    80		char buf[32];
    81		int ret;
    82	
    83		count = min_t(size_t, sizeof(buf) - 1, count);
  > 84		if (!copy_from_iter_full(buf, count, from))
    85			return -EFAULT;
    86	
    87		/* sscanf requires a zero terminated string */
    88		buf[count] = '\0';
    89	
    90		if (sscanf(buf, "%u", &mode) != 1)
    91			return -EINVAL;
    92	
    93		if (mode > 255)
    94			return -EBADRQC;
    95	
    96		pm_runtime_get_sync(ci->dev);
    97		spin_lock_irqsave(&ci->lock, flags);
    98		ret = hw_port_test_set(ci, mode);
    99		spin_unlock_irqrestore(&ci->lock, flags);
   100		pm_runtime_put_sync(ci->dev);
   101	
   102		return ret ? ret : count;
   103	}
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
