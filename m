Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7026ED4F;
	Tue, 24 Mar 2026 19:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380729; cv=none; b=nrv/ENb2epbIPna29IIDmqdZ6hjy/70aZ/G1oRX4fvnGKO9YLd0z1hBCHoyao7UiHqkCqwhiT0E/AiJa4Rp6iTzpKg4dttqhwj8BM/26lZHWPOSmYAbo2qzC0qyByldFW0z/7K7QWEj+f94qTwr3D7v1oTPj5xOCXe5Qk91KBb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380729; c=relaxed/simple;
	bh=7zIHJv77EOTJAqcCZSvyswoLbZopEbkgXMF+9ayujNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3RPzdAn6WgZ5HnJ/drp2K0EDu9oHkWn62xLQ5NLLo4JKpKa8GNq4fmhUYAvjtKZaE5VBOuw854rnFDYHWvfKefFmizmctlfAZ6AYmVfdUUHnJLnRY3uSzT+StnFUhxpsRmv9nFRaoi8M0qHQaQyn8jsnTh+V2b0vQ81lx1ZVk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsFD/Rvy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsFD/Rvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774380727; x=1805916727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7zIHJv77EOTJAqcCZSvyswoLbZopEbkgXMF+9ayujNE=;
  b=bsFD/RvyfdjsRk+ggATegJMhQT550JnS/+nnV/f4Z7s3WuU2s2dnWu0r
   BpkiwnFoA5B1MmqtrQ8ISlgKA2V7wYW/GHycjzlWDA8Xptn5SDaBPKadu
   RLtH/FbtBaj/oZAiSt1GcKkKHw/lvE7iTOZUlpXokxcN/Ob4MjavpLsux
   c4UekyObd+3sWOv4ghCeexMux/kN8ZmHRdG82TSpYyRCzDYA8fX+eThc7
   cIsuxrF2L8v0SwCFvbpRvIlWMBY5ai2Z3Xov122d5Y+BG32hba1xBxK7T
   8IY0yxxhIkJlRhrNSrC/EB05fBpe+RLsKuIWEBPCx6MEpEdht7cGE1PUY
   A==;
X-CSE-ConnectionGUID: ZMTKpkz5Q2a1Y6lNGSZoyg==
X-CSE-MsgGUID: 0jTcYIuAQI+htDe/bp9wKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="92793514"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="92793514"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 12:32:07 -0700
X-CSE-ConnectionGUID: R8FL05HLR1qA1sTdl4F8KA==
X-CSE-MsgGUID: +00yFionSKiU5ktS0S6AAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247502691"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Mar 2026 12:32:04 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w57Tu-000000005LV-3DGb;
	Tue, 24 Mar 2026 19:32:02 +0000
Date: Wed, 25 Mar 2026 03:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/2] lsm: add backing_file LSM hooks
Message-ID: <202603250333.LaZDZOEq-lkp@intel.com>
References: <20260323042510.3331778-5-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323042510.3331778-5-paul@paul-moore.com>

Hi Paul,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pcmoore-selinux/next]
[also build test WARNING on xiang-erofs/dev-test xiang-erofs/dev xiang-erofs/fixes linus/master v7.0-rc5 next-20260323]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Moore/lsm-add-backing_file-LSM-hooks/20260324-111550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git next
patch link:    https://lore.kernel.org/r/20260323042510.3331778-5-paul%40paul-moore.com
patch subject: [RFC PATCH v2 1/2] lsm: add backing_file LSM hooks
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260325/202603250333.LaZDZOEq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250333.LaZDZOEq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250333.LaZDZOEq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
>> include/linux/security.h:1149:5: warning: no previous prototype for function 'security_backing_file_alloc' [-Wmissing-prototypes]
    1149 | int security_backing_file_alloc(void **backing_file_blobp,
         |     ^
   include/linux/security.h:1149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1149 | int security_backing_file_alloc(void **backing_file_blobp,
         | ^
         | static 
>> include/linux/security.h:1155:6: warning: no previous prototype for function 'security_backing_file_free' [-Wmissing-prototypes]
    1155 | void security_backing_file_free(void **backing_file_blobp)
         |      ^
   include/linux/security.h:1155:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1155 | void security_backing_file_free(void **backing_file_blobp)
         | ^
         | static 
   2 warnings generated.
--
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
>> include/linux/security.h:1149:5: warning: no previous prototype for function 'security_backing_file_alloc' [-Wmissing-prototypes]
    1149 | int security_backing_file_alloc(void **backing_file_blobp,
         |     ^
   include/linux/security.h:1149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1149 | int security_backing_file_alloc(void **backing_file_blobp,
         | ^
         | static 
>> include/linux/security.h:1155:6: warning: no previous prototype for function 'security_backing_file_free' [-Wmissing-prototypes]
    1155 | void security_backing_file_free(void **backing_file_blobp)
         |      ^
   include/linux/security.h:1155:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1155 | void security_backing_file_free(void **backing_file_blobp)
         | ^
         | static 
   2 warnings generated.


vim +/security_backing_file_alloc +1149 include/linux/security.h

  1148	
> 1149	int security_backing_file_alloc(void **backing_file_blobp,
  1150					const struct file *user_file)
  1151	{
  1152		return 0;
  1153	}
  1154	
> 1155	void security_backing_file_free(void **backing_file_blobp)
  1156	{ }
  1157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
