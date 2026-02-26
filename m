Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6BC30F555;
	Thu, 26 Feb 2026 20:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772138729; cv=none; b=I//Zy98kCATHlg0dDITWUKRJXCfYIlgZ0icRsLSeNUREJ2oi/GE+FyvF5Eg1GiAXhXnnLNjhBLTHZz5zRSIrRDAtVikA53FwBEf80zif924Qarfwhm94M+uUnXR8DIrw2GjTUQvFnb5514E9ZxWMpHEtESOiKIPeXK7knnxtsl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772138729; c=relaxed/simple;
	bh=Rn4pkpUdRy+jKKSOJcLe3W0qb6ZeGDHZTSFbiHgF8gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7rotTshKQNwUF4msqD5G4MGHzhfS+ARd+136TCJDR5TLsv+2u3G1WBKwgj4ITpHvHqGlcN2ZRb93mL7WFWMfLtQ0FjOfSP4iiiDaCa9PfYHBQp0BaUAAoGjH3lAUXlWdxRaEg42HZm1UoLumD1gpUHQ5Hhw51kY1Nrc3e7H+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PI7R5TT+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PI7R5TT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772138728; x=1803674728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rn4pkpUdRy+jKKSOJcLe3W0qb6ZeGDHZTSFbiHgF8gU=;
  b=PI7R5TT+uF6RmTJ57KpEVBhXTR8OJAAHOBS6e1dSwXpJ68XNRZR+ZiHm
   3qpxs5MwuOk7PpVWISZjhkqzBg+o/96HNUGQ9G8sz9ppRCr/iLpm8O3gq
   bSo7+YbAtyRvvbIie7XTREYCUTjgYmLQPMLSw3+1FxVBFgcH5rIKkQ5Je
   LC9KcLKyywifpr9/5GmZUE7DcR74wRIdnexJuMmGD9DZa0CloL0FPPTV0
   flFY0kX9Iyz216QnPuzpiQ+VeSNoQAMREBQDeittX5daPY4yfhRd00vDd
   CpduCZ3i2Pu/DbiIw3gNFnpWiu3r94WdWhPpELI0JZr7kFWlqZYL8aXYW
   A==;
X-CSE-ConnectionGUID: fgU67652Qf2xZhXgH8J8jA==
X-CSE-MsgGUID: /qbU3CcMS8KHNunjv6iamQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90796228"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="90796228"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 12:45:28 -0800
X-CSE-ConnectionGUID: qJ0JBltpS9SimzLHCjercg==
X-CSE-MsgGUID: xcXwHnfzSdeZqABRlfzkHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="219985317"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Feb 2026 12:45:26 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vviEe-000000009rX-0m47;
	Thu, 26 Feb 2026 20:45:24 +0000
Date: Fri, 27 Feb 2026 04:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mathura_Kumar <academic1mathura@gmail.com>, brauner@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-ipc@vger.kernel.org,
	Mathura_Kumar <academic1mathura@gmail.com>
Subject: Re: [PATCH] mqueue: introduce new  do_mq_timedreceive2() [ mq_peek
  syscall] for non-destructive receive             and inspection
Message-ID: <202602270443.k6N6t2u4-lkp@intel.com>
References: <20260226174010.118080-1-academic1mathura@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226174010.118080-1-academic1mathura@gmail.com>

Hi Mathura_Kumar,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v7.0-rc1 next-20260226]
[cannot apply to shuah-kselftest/next shuah-kselftest/fixes tip/x86/asm]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathura_Kumar/mqueue-introduce-new-do_mq_timedreceive2-mq_peek-syscall-for-non-destructive-receive-and-inspection/20260227-021340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260226174010.118080-1-academic1mathura%40gmail.com
patch subject: [PATCH] mqueue: introduce new  do_mq_timedreceive2() [ mq_peek  syscall] for non-destructive receive             and inspection
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260227/202602270443.k6N6t2u4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270443.k6N6t2u4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270443.k6N6t2u4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
>> include/linux/syscalls.h:750:42: warning: declaration of 'struct mq_timedreceive2_args' will not be visible outside of this function [-Wvisibility]
     750 | sys_mq_timedreceive2(mqd_t mqdes, struct mq_timedreceive2_args __user *uargs,
         |                                          ^
   include/linux/syscalls.h:755:15: warning: declaration of 'struct mq_timedreceive2_args' will not be visible outside of this function [-Wvisibility]
     755 |                             struct mq_timedreceive2_args __user *uargs,
         |                                    ^
   2 warnings generated.
--
   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
>> /usr/bin/ld: arch/x86/um/sys_call_table_32.o:(.rodata+0x760): undefined reference to `sys_mq_timedreceive2_time32'
>> /usr/bin/ld: arch/x86/um/sys_call_table_32.o:(.rodata+0x764): undefined reference to `sys_mq_timedreceive2'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)
--
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
>> include/linux/syscalls.h:750:42: warning: declaration of 'struct mq_timedreceive2_args' will not be visible outside of this function [-Wvisibility]
     750 | sys_mq_timedreceive2(mqd_t mqdes, struct mq_timedreceive2_args __user *uargs,
         |                                          ^
   include/linux/syscalls.h:755:15: warning: declaration of 'struct mq_timedreceive2_args' will not be visible outside of this function [-Wvisibility]
     755 |                             struct mq_timedreceive2_args __user *uargs,
         |                                    ^
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
