Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A31421420B;
	Sun, 18 Jan 2026 06:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768716252; cv=none; b=fEgmKUqGLsEFIMCEC1pH9haloRyA6lu/gWCHkNOfqXFjeFw5L7ksmFBQREpTB0+tfP+fD8MCHJvTBKnUMzEOrEf4hNDIdizV3K7YLSZ6yQ5ixoJl/efsq5j8ywjUqdh4t/MvAB1x5SnDbPGag9o1IembBVUEvOuVaigp+pM+GFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768716252; c=relaxed/simple;
	bh=vjuTpa8FQPCKXk27Dd2CXMdPASu9VmjTA/8+qKJdnn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iq8J9VAGGzdtKWmjTHFf4YRb/liWRt6tlfRFMzhM8oVoeoVgCVOEITmbrV61J3DlRiSSZTaLaatE5iZhVfl16RVf9FPJLufaG6kA7OA1Yfi99Omvir5eNgFXSezxsgyVo/ikpRam1yQVo3DBMI3oq7GgJB6syoSiSv38bZ54GgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/RmGfqk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/RmGfqk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768716251; x=1800252251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vjuTpa8FQPCKXk27Dd2CXMdPASu9VmjTA/8+qKJdnn4=;
  b=e/RmGfqkY/gtDEplaZ1e5dSQu05bmhpToaqju8/kOJ0zDPGDSUpXFLS5
   Fwm3VPf717dC9i7rVzjj0Cqg4WabZFoumWF9Gk3DZ3I7Zq6sXv1Ykmhpr
   EmIr136NDZ5Q7JHP+pWhQCMv2WdfpUuXYQdhurlz3ErosSABa1nrtK3SX
   8xCffcj+YvYPFgM0GH3+loCT2HNToav32SFsfj8uDYS/PwFlfqovO9bFv
   ite7HLJmk/uemk1w7PjgivaFQi0OeLeVppDvBLw/Ax9aY4sLM+S39ltHA
   9nKlElHRH8l7XH4z3Y1/K03IejObUALGfhf2yJQWA2u8bkxPREoN97IzF
   w==;
X-CSE-ConnectionGUID: Zdz3ScE+ShGkyfOBRdk7NA==
X-CSE-MsgGUID: vKJLnK2WQ/iZU4kBTsq9YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73597533"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="73597533"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 22:04:08 -0800
X-CSE-ConnectionGUID: P5PEZA2YTmKwkBsvouE99w==
X-CSE-MsgGUID: aLPQ4iIyTO6+5Rb2dYnCSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205860251"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jan 2026 22:04:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhLtL-00000000MhU-3Qt3;
	Sun, 18 Jan 2026 06:04:03 +0000
Date: Sun, 18 Jan 2026 14:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: Coiby Xu <coxu@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] s390x/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <202601181322.wUUqO1Ok-lkp@intel.com>
References: <20260116103347.523747-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116103347.523747-1-coxu@redhat.com>

Hi Coiby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 7f98ab9da046865d57c102fd3ca9669a29845f67]

url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/s390x-kdump-pass-dm-crypt-keys-to-kdump-kernel/20260116-183709
base:   7f98ab9da046865d57c102fd3ca9669a29845f67
patch link:    https://lore.kernel.org/r/20260116103347.523747-1-coxu%40redhat.com
patch subject: [RFC] s390x/kdump: pass dm-crypt keys to kdump kernel
config: s390-defconfig (https://download.01.org/0day-ci/archive/20260118/202601181322.wUUqO1Ok-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181322.wUUqO1Ok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181322.wUUqO1Ok-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/crash_dump_dm_crypt.c:55:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      55 |         int ret;
         |             ^
>> kernel/crash_dump_dm_crypt.c:432:6: warning: variable 'r' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     432 |         if (!is_dm_key_reused) {
         |             ^~~~~~~~~~~~~~~~~
   kernel/crash_dump_dm_crypt.c:461:9: note: uninitialized use occurs here
     461 |         return r;
         |                ^
   kernel/crash_dump_dm_crypt.c:432:2: note: remove the 'if' if its condition is always true
     432 |         if (!is_dm_key_reused) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/crash_dump_dm_crypt.c:424:7: note: initialize the variable 'r' to silence this warning
     424 |         int r;
         |              ^
         |               = 0
   2 warnings generated.


vim +/ret +55 kernel/crash_dump_dm_crypt.c

    51	
    52	static int __init setup_dmcryptkeys_size(char *arg)
    53	{
    54		size_t keys_size;
  > 55		int ret;
    56	
    57		if (dm_crypt_keys_addr == 0) {
    58			pr_warn("dmcryptkeys=0\n");
    59			return -EINVAL;
    60		}
    61	
    62		if (!arg)
    63			return -EINVAL;
    64	
    65		ret = kstrtoul(arg, 0, &keys_size);
    66		memblock_reserve((phys_addr_t)dm_crypt_keys_addr, keys_size);
    67		return 0;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
