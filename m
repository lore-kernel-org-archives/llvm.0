Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E1B42848F;
	Thu, 26 Feb 2026 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772136779; cv=none; b=hTt0BFCuWynzNiGNi8HocyRlUztJNxTVT8HwvkFqVvD8Y7mosvKmo7368AJq3yF5bMSmvsNbT6CBSitG5Ah8uw214hsqR6FKSLmjs9acjBwuosFniybqemqIAH3YXVENGoIJw9H7KgoEuk9ucFhZ6Tfxg+a12nEkkl+SSFHmK00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772136779; c=relaxed/simple;
	bh=9OFYc7/h++jDkGBrAiQaOfKDDCV3IHoIdPAmPT6VQxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKFyVSNqVUJDKkUkA9qPMFMQj9OpG2KNd9V8dWwS3jsqOrY3OEHEQoQ9VT1uhLbtw4MMXl9JRDEtVFmY78Qp4uow615sBo9BW+RTM3obnDmpzVga0iT0jvbP5BmaPYRc0hArRQhb+EQqip71DStoeOnBWUnYCjsZg+BLJ2jC43g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4LDZqHs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4LDZqHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772136776; x=1803672776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9OFYc7/h++jDkGBrAiQaOfKDDCV3IHoIdPAmPT6VQxA=;
  b=a4LDZqHsr/cXGQ5Ee4PFduaTFvCedsED0FA9K5GtIRccLBkYr7NN1jgL
   I1XHk3fIqWbhgz5yekFD1NtPZhLrptZd08RT7WSb+L8NHXkcxyokGkZhu
   AiO29CRqaGtb4cmnwB1Q+MSTQAlRx6q17MEpVqfK9jtq1nLl5zISa2s6o
   WRjVwCqNWj76sAATe5LgDg8XVd3fj4CrRti62jPYI307DwP0W8RYLvmD2
   /JXCAhv2JIgygMRSlRBDTQyXa+fZ2RLv3ku0QDGGjv2LdCdchKywe1xaW
   wwWwOVIVimyqV8DI4drqbp/AlWlTg2vZIoAeaomgfrxj4OK5ut/pLqDjW
   g==;
X-CSE-ConnectionGUID: sVNBiEwwTliHkszSAosJiA==
X-CSE-MsgGUID: 9FCMaNoVSpOtT0fn72qfBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77047800"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="77047800"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 12:12:56 -0800
X-CSE-ConnectionGUID: Y9maAb1rQBWdLr1ZlUQ0fA==
X-CSE-MsgGUID: lNF4cNnmTuu215y+0Ad3Lg==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="220806691"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Feb 2026 12:12:56 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvhjB-000000009qV-10To;
	Thu, 26 Feb 2026 20:12:53 +0000
Date: Fri, 27 Feb 2026 04:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mathura_Kumar <academic1mathura@gmail.com>, brauner@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-ipc@vger.kernel.org,
	Mathura_Kumar <academic1mathura@gmail.com>
Subject: Re: [PATCH] mqueue: introduce new  do_mq_timedreceive2() [ mq_peek
  syscall] for non-destructive receive             and inspection
Message-ID: <202602270456.TzgUn6Fv-lkp@intel.com>
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
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260227/202602270456.TzgUn6Fv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270456.TzgUn6Fv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270456.TzgUn6Fv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> <stdin>:1633:2: warning: syscall mq_timedreceive2_time64 not implemented [-W#warnings]
    1633 | #warning syscall mq_timedreceive2_time64 not implemented
         |  ^
   1 warning generated.
--
>> ld.lld: error: undefined symbol: __x64_sys_mq_timedreceive2
   >>> referenced by syscall_64.c
   >>>               arch/x86/entry/syscall_64.o:(x64_sys_call) in archive vmlinux.a
   >>> referenced by syscall_64.c
   >>>               arch/x86/entry/syscall_64.o:(sys_call_table) in archive vmlinux.a
   >>> did you mean: __x64_sys_mq_timedreceive
   >>> defined in: vmlinux.a(kernel/sys_ni.o)
--
>> <stdin>:1633:2: warning: syscall mq_timedreceive2_time64 not implemented [-W#warnings]
    1633 | #warning syscall mq_timedreceive2_time64 not implemented
         |  ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
