Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63A470CC9;
	Thu,  4 Apr 2024 22:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712271201; cv=none; b=eH0B0HHnTH48U95fe+GWchEVEBrjduvNXrZ355ZPNfYtfA2N/2u8K+4dd4ycB66EZtzLMbhboncW/JJTHyg5pjcHOniyXTcXNtcqbqDwSUJCYX+bJjQiUGyWFvUqz6tFkStpseX9eXoAbgJPlJ76pAGHPO9xYvrGclbd4JuhMNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712271201; c=relaxed/simple;
	bh=j1XQAN31zKlmMGzcyUeDPEX9W2Q4bBhmhMTIikWSHVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QTQLzDGPOkSdn8fO8+soseStvInzHo87lB4x2CuHZmtoou4BfCJtL0UCDuLDuKz8G+Sf0Np1JXpxZZIJh9GlaQz3reOHeNNbMBbahvFX8tuFrKvrBQCzO0f9TO5ji7HlEM2z/5XIOvLwLec1gWHN3ozYexO/59qAZFcsOlZnj9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YdNxXtRV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YdNxXtRV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712271200; x=1743807200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j1XQAN31zKlmMGzcyUeDPEX9W2Q4bBhmhMTIikWSHVM=;
  b=YdNxXtRVbEhawKRyobRQsHuMzYud7VwhuWcpfpz3afKlGb+4LyHb+0dK
   UivuSl0MJm+Lw0quEi30FY4Zdx+Xw0c5omt5HmOVJokgC6HIsLPBloy5t
   AmCxNor+Xd09bB7BPB6ztJ97A+nVwH47fiSKoc2Wu7WznHtIRxIRKvKHS
   U5xVCQWytWD5u+saED4C+E62+q5ONSBLVrcP3O1x3DA2L0vmbHUkqvgB6
   MXcIpKOx9MGwcvMxkYgvqCcjvjwXK/yX/9TgqIpWXWRj6abUVk2luydGA
   7OQycE9i4xvr8WWbuSDKdIJ8k3kSv1jtt7U3kamticSkUhHULiN+i/6HY
   Q==;
X-CSE-ConnectionGUID: om7XnIxAS6qB5bPtQAbasQ==
X-CSE-MsgGUID: zxHGanFBTkOqGTaXuhIQ8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7747168"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7747168"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 15:53:16 -0700
X-CSE-ConnectionGUID: 9zQOBmKDQjqVYQtxSSvW6w==
X-CSE-MsgGUID: gHlvW2s6RLG37fJ/awtnmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="50191961"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2024 15:53:14 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsVxH-0001bD-2n;
	Thu, 04 Apr 2024 22:53:11 +0000
Date: Fri, 5 Apr 2024 06:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 19/28] kernel/locking/lock_events.h:61:31:
 warning: declaration of 'struct kiocb' will not be visible outside of this
 function
Message-ID: <202404050614.WSWZs0lK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f43454f1aaa3229f819380d12166825180ccee0e
commit: 02b8fcd817e5dbfce4b90bc975bbb4b7c0934cd9 [19/28] kernel: convert to read/write iterators
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240405/202404050614.WSWZs0lK-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050614.WSWZs0lK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050614.WSWZs0lK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/locking/rwsem.c:33:
>> kernel/locking/lock_events.h:61:31: warning: declaration of 'struct kiocb' will not be visible outside of this function [-Wvisibility]
      61 | ssize_t lockevent_read(struct kiocb *iocb, struct iov_iter *to);
         |                               ^
>> kernel/locking/lock_events.h:61:51: warning: declaration of 'struct iov_iter' will not be visible outside of this function [-Wvisibility]
      61 | ssize_t lockevent_read(struct kiocb *iocb, struct iov_iter *to);
         |                                                   ^
   kernel/locking/rwsem.c:187:20: warning: unused function 'is_rwsem_reader_owned' [-Wunused-function]
     187 | static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:271:35: warning: unused function 'rwsem_owner' [-Wunused-function]
     271 | static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
         |                                   ^~~~~~~~~~~
   kernel/locking/rwsem.c:282:1: warning: unused function 'rwsem_owner_flags' [-Wunused-function]
     282 | rwsem_owner_flags(struct rw_semaphore *sem, unsigned long *pflags)
         | ^~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +61 kernel/locking/lock_events.h

    60	
  > 61	ssize_t lockevent_read(struct kiocb *iocb, struct iov_iter *to);
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
