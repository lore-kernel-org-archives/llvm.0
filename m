Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8000A50;
	Sat,  6 Apr 2024 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712382264; cv=none; b=Z/s7Sx0utOsFKaYWbdDek/r95+h57fTFnv8hqltsAU1l9Jc1GNO4gl3NDdEefqWqM95IawsB7FzD6d0FF6lJn7N7hTJ9RvlfhLD0dB4PV99OAcKk3H/0bdFDpYSu7MN+ylB9xFpC82iBWNe9ouQ7c3UtdilZ2LEFVXSiT74MDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712382264; c=relaxed/simple;
	bh=gCmyNtT6Aa4fuJ0nzKqJteditnaWnDfPLwEbJr20Bvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJHyn0arEglrf+IVVGfFDxCQQsf9OFQ1+BE3Nifrd88khQkh318YEFwee2nakngH7eelvZnvX3aoU7O7AgGMKsaHVwrXB2VtoRzZqZL2rxPoR9WRsb6msYc8dPD/c2sMAimsWjrpCNs5ycVNof6pWgDPqVZn7dI9IxJ+Hi2rGX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DM+bmadT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DM+bmadT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712382262; x=1743918262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gCmyNtT6Aa4fuJ0nzKqJteditnaWnDfPLwEbJr20Bvs=;
  b=DM+bmadTjwyVtRp2uoRojz8Zk6vTGSR0btmCOVX4LZyNjcB1Ta6Y8llc
   n7thfaBYvHoFg/LUnP5QXAIDhnijCNIo5CyHMjFibSehQdu8QKKCxT6Zw
   1poKo5sZ9ORDXOZadSkLCvXuAqIlAHTFXVp/Ci84sMjUhEu/qUypE04xx
   kxxKncIjf9GI0tbwsiEelwblKuXX7eQCZ5h5rbOBOc/RxA7CMtsR+vkv3
   pcZssGXF4PEMFX9U6/mt6qdVjSYLOr3qxRAFdHQptueufBiLW2BFDUElb
   96CPwxNBts9W4tVBAOaq0fhvjZGC2gr57Y5Sw0Xiw5UVl1wCX7DfSyzd8
   g==;
X-CSE-ConnectionGUID: gPjM0euUSR68EPb/MVoFOA==
X-CSE-MsgGUID: U3u8cT1kRymDX1rHfg+wTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7579164"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7579164"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 22:44:21 -0700
X-CSE-ConnectionGUID: WEsb5VZoTvGEdBMOXt/NLw==
X-CSE-MsgGUID: HpKM3AppRpist/8gPJPy8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19397508"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Apr 2024 22:44:20 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsyqf-0003A2-1U;
	Sat, 06 Apr 2024 05:44:17 +0000
Date: Sat, 6 Apr 2024 13:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 73/100]
 drivers/misc/lis3lv02d/lis3lv02d.c:604:17: error: call to undeclared
 function 'iov_iter_count'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202404061340.6zU6DYml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   bb4803260393a54d3b254c2abfe121ab89cce776
commit: 3da0a9ea5378904e1a669a4b7e7130204b5bce95 [73/100] misc: lis3lv02d: convert to iterators
config: i386-buildonly-randconfig-004-20240406 (https://download.01.org/0day-ci/archive/20240406/202404061340.6zU6DYml-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061340.6zU6DYml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061340.6zU6DYml-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/lis3lv02d/lis3lv02d.c:604:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     604 |         size_t count = iov_iter_count(to);
         |                        ^
>> drivers/misc/lis3lv02d/lis3lv02d.c:641:7: error: call to undeclared function 'copy_to_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     641 |         if (!copy_to_iter_full(&byte_data, sizeof(byte_data), to))
         |              ^
   2 errors generated.


vim +/iov_iter_count +604 drivers/misc/lis3lv02d/lis3lv02d.c

   598	
   599	static ssize_t lis3lv02d_misc_read(struct kiocb *iocb, struct iov_iter *to)
   600	{
   601		struct lis3lv02d *lis3 = container_of(iocb->ki_filp->private_data,
   602						      struct lis3lv02d, miscdev);
   603	
 > 604		size_t count = iov_iter_count(to);
   605		DECLARE_WAITQUEUE(wait, current);
   606		u32 data;
   607		unsigned char byte_data;
   608		ssize_t retval = 1;
   609	
   610		if (count < 1)
   611			return -EINVAL;
   612	
   613		add_wait_queue(&lis3->misc_wait, &wait);
   614		while (true) {
   615			set_current_state(TASK_INTERRUPTIBLE);
   616			data = atomic_xchg(&lis3->count, 0);
   617			if (data)
   618				break;
   619	
   620			if (iocb->ki_filp->f_flags & O_NONBLOCK) {
   621				retval = -EAGAIN;
   622				goto out;
   623			}
   624	
   625			if (signal_pending(current)) {
   626				retval = -ERESTARTSYS;
   627				goto out;
   628			}
   629	
   630			schedule();
   631		}
   632	
   633		if (data < 255)
   634			byte_data = data;
   635		else
   636			byte_data = 255;
   637	
   638		/* make sure we are not going into copy_to_user() with
   639		 * TASK_INTERRUPTIBLE state */
   640		set_current_state(TASK_RUNNING);
 > 641		if (!copy_to_iter_full(&byte_data, sizeof(byte_data), to))
   642			retval = -EFAULT;
   643	
   644	out:
   645		__set_current_state(TASK_RUNNING);
   646		remove_wait_queue(&lis3->misc_wait, &wait);
   647	
   648		return retval;
   649	}
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
