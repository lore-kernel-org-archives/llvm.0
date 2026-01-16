Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC9246788;
	Fri, 16 Jan 2026 19:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768591040; cv=none; b=uxkA2otXdcJWKiwoworAXZjL466qwH7tHlKL7AwxiD2hooWBUP++FdeAITW5hF5rYZ3SkABE/F8BE5MgSftmBGq4ftcMbEdV5r7BNymcFAUG5n9aTGHUStc8uZZfHKaPPW+EDEX47CsSv9zROGuwyECYssKHRMX5zCLTXJxysUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768591040; c=relaxed/simple;
	bh=unmhFEcUNpcA9RPPlVGiYlTXSMuWjqIErJfaF9ddSxU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ID2t7G2RUa2CLDNju5+8otmCNm5Kj+gd+MHveKkEvjbCy9M8s78yzckbhdg8GvW9LXW/8dKBUvbg2tvo4+vPrnDmSGJkJGhaqFJzG7BqYhb/Fl+5vxqHg/wm7PY4keBFk1Udg+WFMKNuvHAedb13YP/Ze6z081ZtsgDHy60jXCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VGLMbwoy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGLMbwoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768591039; x=1800127039;
  h=date:from:to:cc:subject:message-id;
  bh=unmhFEcUNpcA9RPPlVGiYlTXSMuWjqIErJfaF9ddSxU=;
  b=VGLMbwoyA3EQwR3l6Vl/WiS1LuGewTtHUJJ/eJl/Xo/7cOWtoHw4zPh1
   HHLx6H58kFwrKhNQ6O3oLsuj+TtoJRqe1ywGNsRT5TOBorYOT2ETeUJqr
   W01fObkUkHXlhhqxZQ874wqrNFHvvSiuQAU4P/D1QvoDTMRog7rmwRjCQ
   WauXOE4hO29bTwr7JEHbtBBXHNiNjGSiSfvkabDIIVvJIah8FpOxe+cr2
   t+bOVpCnGyfKOalt7ekB3Tn2ksgI1NzQ2zwdAPo5bb9POG1L9m6FYdwyM
   9CwkXPE7O27rZzDTzP/OI0FYzxkkwape4OxDTyzak1cLEDX413t/dPveq
   Q==;
X-CSE-ConnectionGUID: sdq2y1XtRnS+bi7wZYOlXQ==
X-CSE-MsgGUID: AlXAvQa3TGiNSo9J03upGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="57465295"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="57465295"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 11:17:19 -0800
X-CSE-ConnectionGUID: +ES7B3y5TzyCFsJEKsfG4Q==
X-CSE-MsgGUID: wMoxixBIT7OtptUbEKWzgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="242863220"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Jan 2026 11:17:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgpJp-00000000LA4-2cvd;
	Fri, 16 Jan 2026 19:17:13 +0000
Date: Sat, 17 Jan 2026 03:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: Naman Jain <namjain@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Roman Kisel <romank@linux.microsoft.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>
Subject: drivers/hv/mshv_vtl_main.c:1002:14: warning: cast from 'void
 (*)(const u8 *)' (aka 'void (*)(const unsigned char *)') to 'smp_call_func_t'
 (aka 'void (*)(void *)') converts to incompatible function type
Message-ID: <202601170352.qbh3EKH5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   983d014aafb14ee5e4915465bf8948e8f3a723b5
commit: 7bfe3b8ea6e30437e01fcb8e4f56ef6e4d986d0f Drivers: hv: Introduce mshv_vtl driver
date:   6 weeks ago
config: x86_64-buildonly-randconfig-001-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170352.qbh3EKH5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170352.qbh3EKH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170352.qbh3EKH5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hv/mshv_vtl_main.c:1002:14: warning: cast from 'void (*)(const u8 *)' (aka 'void (*)(const unsigned char *)') to 'smp_call_func_t' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
    1002 |         on_each_cpu((smp_call_func_t)mshv_vtl_synic_mask_vmbus_sint, &mask.mask, 1);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +1002 drivers/hv/mshv_vtl_main.c

   993	
   994	static int mshv_vtl_sint_ioctl_pause_msg_stream(struct mshv_sint_mask __user *arg)
   995	{
   996		static DEFINE_MUTEX(vtl2_vmbus_sint_mask_mutex);
   997		struct mshv_sint_mask mask;
   998	
   999		if (copy_from_user(&mask, arg, sizeof(mask)))
  1000			return -EFAULT;
  1001		guard(mutex)(&vtl2_vmbus_sint_mask_mutex);
> 1002		on_each_cpu((smp_call_func_t)mshv_vtl_synic_mask_vmbus_sint, &mask.mask, 1);
  1003		WRITE_ONCE(vtl_synic_mask_vmbus_sint_masked, mask.mask != 0);
  1004		if (mask.mask)
  1005			wake_up_interruptible_poll(&fd_wait_queue, EPOLLIN);
  1006	
  1007		return 0;
  1008	}
  1009	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
