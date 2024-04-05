Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84C81D52B;
	Fri,  5 Apr 2024 23:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712360833; cv=none; b=lwdekVxksbSndmzKrm7gX2eM0+7zPacpb4mVnlXiIhfutu8ZuypNK0TI2uxcq1n9XXVXow06lT0tDEz+vcQIdKHO50a2y36LDMpxgaG3txYZy9aHxzuNYBLABf62aMKXL5ci9lEZpQQRKds1FUxS773qDizaQH4j8EOgrBtWLYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712360833; c=relaxed/simple;
	bh=PZYJDA0d/pefABqFOioV8IxbC7pGCDL8rtej7zBOAhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kPM2Pyo513kUzOBhKP06DLoy0AuQ6bTKNEIGKfQhMQEI13EYMOsGG+cifX7iZT4Y4WKkxZ/wFyBzP1hG2wpryFCPoVaYVmduzc3puVrKU+gEFgpQm4E2UZT2ke9XYZ7yjWnAXhSgLOyqQqnpgIAMBNbzfKQBW1jrXZHqMCBEG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/WgqDq2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/WgqDq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712360832; x=1743896832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PZYJDA0d/pefABqFOioV8IxbC7pGCDL8rtej7zBOAhk=;
  b=n/WgqDq2jyEPVug4nXANMOGU6gUfEIznN/hIqwG5/oGDWMUXIRlr7QK/
   8jRnPoj0e3hgeDZp2/Ew6eShgfAYvW43ge+SBGjsNfoHsnaPURBPD37bQ
   e///TXg/NKpgSPYumpsmeJYaK3CjJaRUPSFZLPxNH4+abI9WcL4WYYGXe
   /t/+kQEGLLh7T4aRwPe9z6vC9MXvqV5je4TmGAfYXVqFKydcAPlRBagQU
   NJ2BaEF81d3IvnLXPiFDunY1pF4FDingJ0dTY0mTpMpckLYama3cyIdOF
   bEeadIttmy+Tt0s1d3V1MhE3JdW0K4otvZedzXK+GPvkhM925ltkl/0sW
   A==;
X-CSE-ConnectionGUID: kOoACOXNT4ywQFKx1KOkeA==
X-CSE-MsgGUID: FnsFFmXMTISlzhc6pV+4fA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11503235"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="11503235"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 16:47:11 -0700
X-CSE-ConnectionGUID: ZWeDekeBTUuIuFtwjnpymA==
X-CSE-MsgGUID: Q+l0zr19RWSFAAMoTBoZOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="24043972"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Apr 2024 16:47:09 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rstH1-0002sS-1u;
	Fri, 05 Apr 2024 23:47:07 +0000
Date: Sat, 6 Apr 2024 07:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 53/93] drivers/gpu/drm/drm_file.c:545:17:
 error: call to undeclared function 'iov_iter_count'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202404060732.gecci6ak-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   025d6230e73400e8c46ec29a297b9bca08f36f6f
commit: 006113b249eac4c98b4ad16c1c3d1b6aae90fcda [53/93] drivers/gpu: convert to ->read_iter and ->write_iter
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060732.gecci6ak-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060732.gecci6ak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060732.gecci6ak-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_file.c:545:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     545 |         size_t count = iov_iter_count(to);
         |                        ^
   drivers/gpu/drm/drm_file.c:594:9: error: call to undeclared function 'copy_to_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     594 |                         if (!copy_to_iter_full(e->event, length, to)) {
         |                              ^
   2 errors generated.
--
>> drivers/gpu/drm/drm_debugfs.c:410:15: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     410 |         size_t len = iov_iter_count(from);
         |                      ^
>> drivers/gpu/drm/drm_debugfs.c:416:7: error: call to undeclared function 'copy_from_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     416 |         if (!copy_from_iter_full(buf, len, from))
         |              ^
   2 errors generated.
--
>> drivers/gpu/drm/drm_debugfs_crc.c:289:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     289 |         size_t count = iov_iter_count(to);
         |                        ^
>> drivers/gpu/drm/drm_debugfs_crc.c:339:7: error: call to undeclared function 'copy_to_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     339 |         if (!copy_to_iter_full(buf, LINE_LEN(crc->values_cnt), to))
         |              ^
   2 errors generated.
--
>> drivers/gpu/drm/i915/display/intel_hotplug.c:1028:15: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1028 |         size_t len = iov_iter_count(from);
         |                      ^
>> drivers/gpu/drm/i915/display/intel_hotplug.c:1037:7: error: call to undeclared function 'copy_from_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1037 |         if (!copy_from_iter_full(tmp, len, from))
         |              ^
   drivers/gpu/drm/i915/display/intel_hotplug.c:1109:15: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1109 |         size_t len = iov_iter_count(from);
         |                      ^
   drivers/gpu/drm/i915/display/intel_hotplug.c:1118:7: error: call to undeclared function 'copy_from_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1118 |         if (!copy_from_iter_full(tmp, len, from))
         |              ^
   4 errors generated.
--
>> drivers/gpu/drm/i915/display/intel_wm.c:293:15: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     293 |         size_t len = iov_iter_count(from);
         |                      ^
>> drivers/gpu/drm/i915/display/intel_wm.c:302:7: error: call to undeclared function 'copy_from_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     302 |         if (!copy_from_iter_full(tmp, len, from))
         |              ^
   2 errors generated.


vim +/iov_iter_count +545 drivers/gpu/drm/drm_file.c

   515	
   516	/**
   517	 * drm_read - read method for DRM file
   518	 * @filp: file pointer
   519	 * @buffer: userspace destination pointer for the read
   520	 * @count: count in bytes to read
   521	 * @offset: offset to read
   522	 *
   523	 * This function must be used by drivers as their &file_operations.read
   524	 * method if they use DRM events for asynchronous signalling to userspace.
   525	 * Since events are used by the KMS API for vblank and page flip completion this
   526	 * means all modern display drivers must use it.
   527	 *
   528	 * @offset is ignored, DRM events are read like a pipe. Polling support is
   529	 * provided by drm_poll().
   530	 *
   531	 * This function will only ever read a full event. Therefore userspace must
   532	 * supply a big enough buffer to fit any event to ensure forward progress. Since
   533	 * the maximum event space is currently 4K it's recommended to just use that for
   534	 * safety.
   535	 *
   536	 * RETURNS:
   537	 *
   538	 * Number of bytes read (always aligned to full events, and can be 0) or a
   539	 * negative error code on failure.
   540	 */
   541	ssize_t drm_read(struct kiocb *iocb, struct iov_iter *to)
   542	{
   543		struct drm_file *file_priv = iocb->ki_filp->private_data;
   544		struct drm_device *dev = file_priv->minor->dev;
 > 545		size_t count = iov_iter_count(to);
   546		ssize_t ret;
   547	
   548		ret = mutex_lock_interruptible(&file_priv->event_read_lock);
   549		if (ret)
   550			return ret;
   551	
   552		for (;;) {
   553			struct drm_pending_event *e = NULL;
   554	
   555			spin_lock_irq(&dev->event_lock);
   556			if (!list_empty(&file_priv->event_list)) {
   557				e = list_first_entry(&file_priv->event_list,
   558						struct drm_pending_event, link);
   559				file_priv->event_space += e->event->length;
   560				list_del(&e->link);
   561			}
   562			spin_unlock_irq(&dev->event_lock);
   563	
   564			if (e == NULL) {
   565				if (ret)
   566					break;
   567	
   568				if (iocb->ki_filp->f_flags & O_NONBLOCK) {
   569					ret = -EAGAIN;
   570					break;
   571				}
   572	
   573				mutex_unlock(&file_priv->event_read_lock);
   574				ret = wait_event_interruptible(file_priv->event_wait,
   575							       !list_empty(&file_priv->event_list));
   576				if (ret >= 0)
   577					ret = mutex_lock_interruptible(&file_priv->event_read_lock);
   578				if (ret)
   579					return ret;
   580			} else {
   581				unsigned length = e->event->length;
   582	
   583				if (length > count - ret) {
   584	put_back_event:
   585					spin_lock_irq(&dev->event_lock);
   586					file_priv->event_space -= length;
   587					list_add(&e->link, &file_priv->event_list);
   588					spin_unlock_irq(&dev->event_lock);
   589					wake_up_interruptible_poll(&file_priv->event_wait,
   590						EPOLLIN | EPOLLRDNORM);
   591					break;
   592				}
   593	
   594				if (!copy_to_iter_full(e->event, length, to)) {
   595					if (ret == 0)
   596						ret = -EFAULT;
   597					goto put_back_event;
   598				}
   599	
   600				ret += length;
   601				kfree(e);
   602			}
   603		}
   604		mutex_unlock(&file_priv->event_read_lock);
   605	
   606		return ret;
   607	}
   608	EXPORT_SYMBOL(drm_read);
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
