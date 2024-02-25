Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C46A168DC;
	Sun, 25 Feb 2024 15:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708874197; cv=none; b=SyO8L1JESYsqVWIXKk2yLf1eAhc7Dlr3PEK2QCtxIJjgHg0d99xYdvn2TGurUAzyEYNSgJjcLrJtkRdlIZaYLDStODynto5o8vxaoBX6p+qAMhdYrpJXj8sXupFrWG3QP2oD6o7x6agT6FVPNI56ChFCiY+ZCYkWn77+T91Y6wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708874197; c=relaxed/simple;
	bh=GHeF7NlnHXsSqnUBViq7hy83TmuJdC2IKMFh6/5KCXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WYUtIL1BVYThoRo6wiaFxcez3W1x4u00y5CKGmJjKjEH0z9P9YpTXiYp7dIquRPce6OPjsM6gtD7yIA81l9ZmzVvH59x0rz37ezX4uJDgVRu815jmdm3H2Ni2sF9VLXuUKxxSH41nnsvEujJQEXsK4iQKg2NRTeIDFMjnjmokQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5Qix5Wf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5Qix5Wf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708874195; x=1740410195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GHeF7NlnHXsSqnUBViq7hy83TmuJdC2IKMFh6/5KCXc=;
  b=J5Qix5WfEhVbmpJMg95ldeYGgt2HgwSjADD/XD7ZNTETeDqUEr1K2JeZ
   /daToten+GdyHjubZX2+rOtvKRvC1UVa/6Ek74XsZD7lVXFzrxbnUWonJ
   tLygHV3SGFmk5M0l0tM3pJ7hNdXbYqFos3OM5/KYGXTUx923Q/1TFnwT7
   Zyq2W9IykQ+YKuiGmScewjtDcB302gYospLgjypQNA2T6FXnR45cM1HvX
   TLqAlxs4KZ/8xiP1zKOoASF5ElDlB2A2YJ1DluQtKDtIRrG/Frzsuw3eC
   66IAvViwvD6X0V+VNiUnQPoMZTcJMZpYk/VYb56Mp+xklZMc5glMuggOZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="6104443"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6104443"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 07:16:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="11121111"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Feb 2024 07:16:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reGEw-0009ai-34;
	Sun, 25 Feb 2024 15:16:30 +0000
Date: Sun, 25 Feb 2024 23:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: [jirislaby:devel 35/36] drivers/char/aaa.c:54:2: warning: variable
 '__tmp' is uninitialized when used within its own initialization
Message-ID: <202402252329.yeyioq7X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   e82f2321b99bd2f2be296a5b11b13e4f93ccff16
commit: d11b7bee978b87c1bd0b897f1b97eb1d2ae6da17 [35/36] kfifo tester
config: i386-buildonly-randconfig-003-20240225 (https://download.01.org/0day-ci/archive/20240225/202402252329.yeyioq7X-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402252329.yeyioq7X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402252329.yeyioq7X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/aaa.c:54:2: warning: variable '__tmp' is uninitialized when used within its own initialization [-Wuninitialized]
      54 |         kfifo_dma_out_finish(&fifo, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:801:19: note: expanded from macro 'kfifo_dma_out_finish'
     801 |         kfifo_skip_count(__tmp, (len) / sizeof(*__tmp->type)); \
         |         ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:312:30: note: expanded from macro 'kfifo_skip_count'
     312 |         typeof((fifo) + 1) __tmp = (fifo); \
         |                            ~~~~~    ^~~~
   1 warning generated.


vim +/__tmp +54 drivers/char/aaa.c

    48	
    49		if (copy_to_user(buf, ptr, count)) {
    50			mutex_unlock(&my_mutex);
    51			return -EFAULT;
    52		}
    53	
  > 54		kfifo_dma_out_finish(&fifo, count);
    55		mutex_unlock(&my_mutex);
    56	
    57		if (kfifo_avail(&fifo) >= MY_POLL_WR_THRESH)
    58			wake_up_interruptible(&fifo_wait);
    59	
    60		return count;
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
