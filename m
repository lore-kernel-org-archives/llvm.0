Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB2920B33;
	Thu,  4 Apr 2024 04:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712203892; cv=none; b=a9bKmiQFOcbnc/OKW2QqBBvFtMdOJNif7qE733G6cJ5UrxjvtVKl0w78RBIUjqeZmmdnTUMqfabQBQoLSyxv3BH49+FeueoGZ4udccmOddW+jmoQI1LZlJgBAC9zGCaNXFZZ99oL+R7J6c0pvOEraRuerPzsIIvZd75kFiDM7u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712203892; c=relaxed/simple;
	bh=8UC9zDwEMsclzuolmj6YIx7RWNOPfvhRLdTlaf9hRoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T80vd7AxGFi7CDaVihOHvwOauWPutvo/R9zRowqyWYxpor7wvoSND1Er+ZLLpgaUl5OrQMRiNbcX/La4N2NLK+pUDjaQpe7p5M6UWK4yGfandOK0DHZz4ASoenNB7XXSPpJXVFJE8YhG6ryxbfiG3l++u6D9+MRQryiKdRni81s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIT5Taa7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIT5Taa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712203890; x=1743739890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8UC9zDwEMsclzuolmj6YIx7RWNOPfvhRLdTlaf9hRoc=;
  b=cIT5Taa7gHvOpsVDWApmM3yqywrv9mrRhWgTHwDB3rpeZg/2EGepjWBl
   HDF/kk9+cPiqF5q8YFOFgMNpskZ7EFfTsdlUPHp3HR3UBRrgFdpFBiaeg
   kvhXfdprN91HTwTajd3VWD5vOif/J4oS5k5gAYLUD3vwDtYIE03foeYSb
   zaSETg1XAn/PjmbTDnAd+8PNEaFxdryISnQky6cTWiQycSBY9ZTyjgbzJ
   EdZ6v4XyAo6iKUy4dhfu4pcY2o+puha8BEhSpg6xq4ngdgou5c7lMHih2
   ZL0yBl0nEvH535TQ0veaVWO95t0ZiihXh/3O/a5YdfYfX5hu6mlQl/z2I
   g==;
X-CSE-ConnectionGUID: M7UMc/PVSNKBLnvRb5nKCw==
X-CSE-MsgGUID: Q13jKbS4Qoet5Zrz6Q9VLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7335692"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7335692"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 21:11:28 -0700
X-CSE-ConnectionGUID: 1M/W6nkiTz6sWabmV+S4aw==
X-CSE-MsgGUID: kX7UKFGjQZ6/iGNRtjOxKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="18585745"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Apr 2024 21:11:27 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsERg-0000bS-3C;
	Thu, 04 Apr 2024 04:11:24 +0000
Date: Thu, 4 Apr 2024 12:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 15/18] kernel/sched/debug.c:129:15: error:
 implicit declaration of function 'iov_iter_count' is invalid in C99
Message-ID: <202404041205.8efEwKpu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f42048f21805f77541ea738ce4a902a8a9e331a4
commit: f42048f21805f77541ea738ce4a902a8a9e331a4 [15/18] kernel: convert to read/write iterators
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240404/202404041205.8efEwKpu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041205.8efEwKpu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041205.8efEwKpu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:72:
>> kernel/sched/debug.c:129:15: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t cnt = iov_iter_count(from);
                        ^
>> kernel/sched/debug.c:134:7: error: implicit declaration of function 'copy_from_iter' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter(&buf, cnt, from))
                ^
   kernel/sched/debug.c:134:7: note: did you mean 'copy_from_user'?
   include/linux/uaccess.h:180:1: note: 'copy_from_user' declared here
   copy_from_user(void *to, const void __user *from, unsigned long n)
   ^
   In file included from kernel/sched/build_utility.c:72:
   kernel/sched/debug.c:173:15: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t cnt = iov_iter_count(from);
                        ^
   kernel/sched/debug.c:180:7: error: implicit declaration of function 'copy_from_iter' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter(&buf, cnt, from))
                ^
   4 errors generated.
--
>> kernel/trace/trace.c:5020:9: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return iov_iter_count(to);
                  ^
   kernel/trace/trace.c:5054:17: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t count = iov_iter_count(to);
                          ^
   kernel/trace/trace.c:5353:15: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t cnt = iov_iter_count(from);
                        ^
>> kernel/trace/trace.c:5360:7: error: implicit declaration of function 'copy_from_iter' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter(buf, cnt, from))
                ^
   kernel/trace/trace.c:5360:7: note: did you mean 'copy_from_user'?
   include/linux/uaccess.h:180:1: note: 'copy_from_user' declared here
   copy_from_user(void *to, const void __user *from, unsigned long n)
   ^
   kernel/trace/trace.c:6212:15: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t cnt = iov_iter_count(from);
                        ^
   kernel/trace/trace.c:6223:7: error: implicit declaration of function 'copy_from_iter' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter(buf, cnt, from))
                ^
   kernel/trace/trace.c:6899:15: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t cnt = iov_iter_count(from);
                        ^
   kernel/trace/trace.c:7142:15: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t cnt = iov_iter_count(from);
                        ^
   kernel/trace/trace.c:7150:7: error: implicit declaration of function 'copy_from_iter' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter(buf, cnt, from))
                ^
   kernel/trace/trace.c:7616:15: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t cnt = iov_iter_count(to);
                        ^
   kernel/trace/trace.c:7891:9: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return iov_iter_count(from);
                  ^
   11 errors generated.


vim +/iov_iter_count +129 kernel/sched/debug.c

   122	
   123	static ssize_t sched_feat_write_iter(struct kiocb *iocb, struct iov_iter *from)
   124	{
   125		char buf[64];
   126		char *cmp;
   127		int ret;
   128		struct inode *inode;
 > 129		size_t cnt = iov_iter_count(from);
   130	
   131		if (cnt > 63)
   132			cnt = 63;
   133	
 > 134		if (!copy_from_iter(&buf, cnt, from))
   135			return -EFAULT;
   136	
   137		buf[cnt] = 0;
   138		cmp = strstrip(buf);
   139	
   140		/* Ensure the static_key remains in a consistent state */
   141		inode = file_inode(iocb->ki_filp);
   142		cpus_read_lock();
   143		inode_lock(inode);
   144		ret = sched_feat_set(cmp);
   145		inode_unlock(inode);
   146		cpus_read_unlock();
   147		if (ret < 0)
   148			return ret;
   149	
   150		iocb->ki_pos += cnt;
   151	
   152		return cnt;
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
