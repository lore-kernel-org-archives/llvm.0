Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AAE21ADB9;
	Mon, 17 Mar 2025 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742197073; cv=none; b=u7BJL1Yv9MmUeTwC7GVInfhnbd5I0fRsBCaf8A60gqsrFwMDGfxpaWXywLRS6OQrlC2XmULHdPgT/l0BYCTciIEuSllnDTvC9CA9pZk7vZt2GJb4e10SqXyIjKL1JhS1fsSbSXL3T9UlIjHcm8XXW7RNmM+4I+t9pNJhNz+tiUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742197073; c=relaxed/simple;
	bh=V26T4goWKFTV9iOffAkxEQry6X+ntGakBBbXt07afK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JRVv/gLY/mhhV+MqG2fBJp2cbkqPebRjBnPSza9eqH9QNqM9dWICc1u43B7SqOUrofxEt+ONGYLeaW6dYZWxUjUUXRu2rg//DlKg7DjuHux/5k5/hBzxbkqhbR9lid2DWDGn1vJVZgsfwURbnPV/4AfB3XoUO4vu/ka/Lv4df+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7uuyzVm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7uuyzVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742197069; x=1773733069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V26T4goWKFTV9iOffAkxEQry6X+ntGakBBbXt07afK8=;
  b=O7uuyzVmNgoz7I4s9gmfFp3zZFawSosiIk5i1I9KuhbYTLy41qOzzE4f
   LaW8eY4paU00o4YxZ5xrhefrQVa9XoUtV2k1jvzaxnQq8OWQq44LRGqsc
   uX/oPPUPq8GPGJErEd1hzbLW/530/TxTvPzwHYIvmlukmftpEW0CKmSKA
   skdqNEOCH1iO6tUHpytGil7FKrG+43zVr6+HLhT+kDxE6b+ridYYmavcG
   zTli0bnNk/bXJI8SioovkYlwzoQoF8KfZc4kQz6ouo37zBuf/6u3iEM8c
   re2HAHWrqzrmNixJqA7LRQv3O1WcCp9FWiB2uQB1XoQv2GnfvofrGkBMp
   w==;
X-CSE-ConnectionGUID: JUIsttzcQV+cybMQfTIN2Q==
X-CSE-MsgGUID: BD8PJnH6SWOlS/riUaDvcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="68637759"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="68637759"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 00:37:46 -0700
X-CSE-ConnectionGUID: yTFheZ66R9+OIdPlpPqv/A==
X-CSE-MsgGUID: DvgdmxfyTIqp0H8jzDyOjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="122373974"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Mar 2025 00:37:44 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu52c-000CZZ-2i;
	Mon, 17 Mar 2025 07:37:42 +0000
Date: Mon, 17 Mar 2025 15:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs-6.15.pidfs 3/3] fs/pidfs.c:868:2: error: call to
 '__compiletime_assert_339' declared with 'error' attribute: BUILD_BUG_ON
 failed: O_DSYNC != CLONE_PIDFD
Message-ID: <202503171528.azXWAvUl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.15.pidfs
head:   b0f4119d8b2a680c8cd019f41c64e8b5444c6b83
commit: b0f4119d8b2a680c8cd019f41c64e8b5444c6b83 [3/3] pidfs: ensure that PIDFS_INFO_EXIT is available
config: mips-bcm47xx_defconfig (https://download.01.org/0day-ci/archive/20250317/202503171528.azXWAvUl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171528.azXWAvUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171528.azXWAvUl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/pidfs.c:868:2: error: call to '__compiletime_assert_339' declared with 'error' attribute: BUILD_BUG_ON failed: O_DSYNC != CLONE_PIDFD
     868 |         BUILD_BUG_ON(O_DSYNC != CLONE_PIDFD);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:107:1: note: expanded from here
     107 | __compiletime_assert_339
         | ^
   1 error generated.


vim +868 fs/pidfs.c

   862	
   863		struct file *pidfd_file;
   864		struct path path __free(path_put) = {};
   865		unsigned int pidfd_flags = (flags & ~CLONE_PIDFD);
   866		int ret;
   867	
 > 868		BUILD_BUG_ON(O_DSYNC != CLONE_PIDFD);
   869	
   870		ret = path_from_stashed(&pid->stashed, pidfs_mnt, get_pid(pid), &path);
   871		if (ret < 0)
   872			return ERR_PTR(ret);
   873	
   874		if (!pidfs_pid_valid(pid, &path, flags))
   875			return ERR_PTR(-ESRCH);
   876	
   877		pidfd_file = dentry_open(&path, pidfd_flags, current_cred());
   878		/* Raise PIDFD_THREAD explicitly as do_dentry_open() strips it. */
   879		if (!IS_ERR(pidfd_file))
   880			pidfd_file->f_flags |= (pidfd_flags & PIDFD_THREAD);
   881	
   882		return pidfd_file;
   883	}
   884	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
