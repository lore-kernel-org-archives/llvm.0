Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D3517DFF2;
	Fri, 18 Oct 2024 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729278362; cv=none; b=mOxU8rAtjMIMGpF8pHR0xcb6YG2kIhlyS0XnIOYBc7d0MHo6GPBKfAL/IcXbnk94aVCqmCLZa6HV19EouYKiIKQSaamkoKC/SWpJRXBMv9SzmflJmtCaf8pABKOhRDFHx+7YuJwfxZ7CZiKFu6+6FbQXKMhhOTYqWtksPPrXpOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729278362; c=relaxed/simple;
	bh=cuJnHKfYPHx+T7+eIrHdDccHIyJj/imfFqwvr7A2PpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKnq4xVxlLaVKms1S+b/7AWVNebkt+gaB3LiAAzo4g33RE0MK45YlzKRY0MhkA8ha2/A1rQ4WDBBzWUwzPUIFD4HAEKSEiTx9qmf8bpF0sFqPMz33hWDXJNoCG7folDhZchGr05Yu1UK7gb+mrjv0KKjT6YcrvwH0eMe/0bkGBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hrcl3MGF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hrcl3MGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729278361; x=1760814361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cuJnHKfYPHx+T7+eIrHdDccHIyJj/imfFqwvr7A2PpA=;
  b=Hrcl3MGFTc3eaInEAZ/IHEzDmOb/tP2yScuQpAEAKB3rd5RsDO66b0CB
   EjtN9OtbECcHZ2pcGflcZFK8S2dLlWIJQXlxNJ9mPuXqu+hiyx22XGnlK
   GgoQDl7r8Mj0hkPfBtlvhw/4O1HJ56v75782k/Zr0hVf01Bh1WCgJ8fAF
   o9MKy7oVJSMhVSvoSn29yGcBqAEuwlv33gIIOlvFbmlI1mCAQn/C9Ry+X
   2d6qzwBJgKDN5nd0X5vLQ296a4lyjwqxoGFLNqNjpuacfwXkLrhtvRMMm
   jcZg199woIZrKRHyhwncyHvZ9XcEhTJHYe97EI+L3e92zZodqm9U5c7Np
   w==;
X-CSE-ConnectionGUID: MabRAFgqSZyZ4CJ6IH7qSw==
X-CSE-MsgGUID: Y74hf5o8Q0G3ncRoCkgJmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="16439100"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="16439100"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 12:06:00 -0700
X-CSE-ConnectionGUID: 2YWhcCKWSnOXk+TcUBcLxw==
X-CSE-MsgGUID: 5nezl1K3SGONNPY98mSgHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="109776749"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2024 12:05:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1sIO-000OCl-14;
	Fri, 18 Oct 2024 19:05:56 +0000
Date: Sat, 19 Oct 2024 03:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] um: Fix misaligned stack in stub_exe
Message-ID: <202410190227.cYsvc9ss-lkp@intel.com>
References: <20241017231007.1500497-2-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017231007.1500497-2-davidgow@google.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on uml/next]
[also build test ERROR on next-20241018]
[cannot apply to linus/master v6.12-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/um-Fix-misaligned-stack-in-stub_exe/20241018-071148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/20241017231007.1500497-2-davidgow%40google.com
patch subject: [PATCH] um: Fix misaligned stack in stub_exe
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241019/202410190227.cYsvc9ss-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190227.cYsvc9ss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190227.cYsvc9ss-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/um/kernel/skas/stub_exe.c:84:2: error: non-ASM statement in naked function is not supported
      84 |         char *alloc;
         |         ^
   arch/um/kernel/skas/stub_exe.c:82:16: note: attribute is here
      82 | __attribute__((naked)) void _start(void)
         |                ^
   1 error generated.


vim +84 arch/um/kernel/skas/stub_exe.c

32e8eaf263d9be Benjamin Berg 2024-09-19  81  
ae9ffda02a9904 David Gow     2024-10-18  82  __attribute__((naked)) void _start(void)
32e8eaf263d9be Benjamin Berg 2024-09-19  83  {
32e8eaf263d9be Benjamin Berg 2024-09-19 @84  	char *alloc;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
