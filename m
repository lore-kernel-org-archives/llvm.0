Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249523C51D;
	Thu, 16 Apr 2026 19:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367730; cv=none; b=hNlsX2dektH+FMUarlQkkG/n9SPVQviRVq0U5Q05k8StRhgnrEKL7IesoNS8uBJentZgDtgPRXQv5zFYroie99iLFc1Hy6cUCSl3AJ4bC8h8RlwalUF4ZUUwAcN6/CzdLivBdiH5MhhPnzIFCM9Uvo8TVFexbREm96uTpwd4vsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367730; c=relaxed/simple;
	bh=fF6InFzbCA6Ly37TEtBQwxYdHJNasGoTQCud6V7BxLE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f/eM0LC4tF3qw4Y3JsvnzgbehJahS9A8DLsnHaxOzQ2CJqgvy3bM/yQc9QnLuJr2LI2k94l4EMgM8zelLHNfokcDGAiJ4dN9vbkjPwEvw1wYzJxwKIZUQozi4mBXIJr8ekzS1AODHobtG7sHVWHqWoE/Iz58IG6gx/uKNtsJwHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDEW/flY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDEW/flY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776367725; x=1807903725;
  h=date:from:to:cc:subject:message-id;
  bh=fF6InFzbCA6Ly37TEtBQwxYdHJNasGoTQCud6V7BxLE=;
  b=EDEW/flYPxX+dxHrsC4jHEEHR1GYXb+R9QjjHch4LZ8AGKkjb3oDes1G
   uvYFf8VXQNPpzsGLtBEgclYz+zpo0tZNcRZym38UMk/ybvSgNiwjLLlv2
   T6QlSYQfE9G9PDR04j44qlZgvye9PLRp7a3FJ0jY1/drFO5GNaSDsPkYz
   bZFj+EYJgG9/OmrQS5l225fX0La9EDaS9TE79cbu0Tz7yIkuQ996TNaQe
   r0BaEySbMQ2Hef8ZsbQdd07NRx37aRthvNxvjyp0M4HkqmAAHhBO/Azjc
   2ZJXw9oh7f/IP7l3Aja2QyGYJw3QssomkZ5YfrzYOWqUHqGvywjqH0TGv
   A==;
X-CSE-ConnectionGUID: WCGCIrRiTZqhuE4aMCy0Og==
X-CSE-MsgGUID: MfjCdGlVRvS1K2iRaTECDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="80978406"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="80978406"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 12:28:42 -0700
X-CSE-ConnectionGUID: cYcOC6omQoKoRYlswuKrKA==
X-CSE-MsgGUID: gwRrGsW7TeaqoctF+H86Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="268829363"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Apr 2026 12:28:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDSOE-0000000015F-1gbI;
	Thu, 16 Apr 2026 19:28:38 +0000
Date: Thu, 16 Apr 2026 21:27:45 +0200
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Qu Wenruo <wqu@suse.com>
Subject: [btrfs:ci-kvm-misc-next 143/160] fs/btrfs/ioctl.c:4179:6:
 warning: unused variable 'ret'
Message-ID: <202604162130.a7ymx66r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/btrfs/linux.git ci-kvm-misc-next
head:   8e37b8ffd9d4e4c1e43f45dd91f5c53e19520811
commit: ef0c33ef0f4020b31bca106645340968f1a497bb [143/160] btrfs: convert ioctl handlers to AUTO_KFREE
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260416/202604162130.a7ymx66r-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604162130.a7ymx66r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604162130.a7ymx66r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/ioctl.c:4179:6: warning: unused variable 'ret' [-Wunused-variable]
    4179 |         int ret;
         |             ^~~
   1 warning generated.


vim +/ret +4179 fs/btrfs/ioctl.c

2eaa055fab4e31 Jeff Mahoney   2013-11-15  4175  
4e043cd196c85b David Sterba   2025-03-03  4176  static int _btrfs_ioctl_send(struct btrfs_root *root, void __user *argp, bool compat)
2351f431f72722 Josef Bacik    2017-09-27  4177  {
ef0c33ef0f4020 David Sterba   2026-04-14  4178  	struct btrfs_ioctl_send_args AUTO_KFREE(arg);
2351f431f72722 Josef Bacik    2017-09-27 @4179  	int ret;
2351f431f72722 Josef Bacik    2017-09-27  4180  
2351f431f72722 Josef Bacik    2017-09-27  4181  	if (compat) {
2351f431f72722 Josef Bacik    2017-09-27  4182  #if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)
9147b9ded499d9 Josef Bacik    2023-09-26  4183  		struct btrfs_ioctl_send_args_32 args32 = { 0 };
2351f431f72722 Josef Bacik    2017-09-27  4184  
2351f431f72722 Josef Bacik    2017-09-27  4185  		ret = copy_from_user(&args32, argp, sizeof(args32));
2351f431f72722 Josef Bacik    2017-09-27  4186  		if (ret)
2351f431f72722 Josef Bacik    2017-09-27  4187  			return -EFAULT;
bf4afc53b77aea Linus Torvalds 2026-02-21  4188  		arg = kzalloc_obj(*arg);
2351f431f72722 Josef Bacik    2017-09-27  4189  		if (!arg)
2351f431f72722 Josef Bacik    2017-09-27  4190  			return -ENOMEM;
2351f431f72722 Josef Bacik    2017-09-27  4191  		arg->send_fd = args32.send_fd;
2351f431f72722 Josef Bacik    2017-09-27  4192  		arg->clone_sources_count = args32.clone_sources_count;
2351f431f72722 Josef Bacik    2017-09-27  4193  		arg->clone_sources = compat_ptr(args32.clone_sources);
2351f431f72722 Josef Bacik    2017-09-27  4194  		arg->parent_root = args32.parent_root;
2351f431f72722 Josef Bacik    2017-09-27  4195  		arg->flags = args32.flags;
5de0434bc06460 David Sterba   2023-11-14  4196  		arg->version = args32.version;
2351f431f72722 Josef Bacik    2017-09-27  4197  		memcpy(arg->reserved, args32.reserved,
2351f431f72722 Josef Bacik    2017-09-27  4198  		       sizeof(args32.reserved));
2351f431f72722 Josef Bacik    2017-09-27  4199  #else
2351f431f72722 Josef Bacik    2017-09-27  4200  		return -ENOTTY;
2351f431f72722 Josef Bacik    2017-09-27  4201  #endif
2351f431f72722 Josef Bacik    2017-09-27  4202  	} else {
2351f431f72722 Josef Bacik    2017-09-27  4203  		arg = memdup_user(argp, sizeof(*arg));
2351f431f72722 Josef Bacik    2017-09-27  4204  		if (IS_ERR(arg))
2351f431f72722 Josef Bacik    2017-09-27  4205  			return PTR_ERR(arg);
2351f431f72722 Josef Bacik    2017-09-27  4206  	}
ef0c33ef0f4020 David Sterba   2026-04-14  4207  	return btrfs_ioctl_send(root, arg);
2351f431f72722 Josef Bacik    2017-09-27  4208  }
2351f431f72722 Josef Bacik    2017-09-27  4209  

:::::: The code at line 4179 was first introduced by commit
:::::: 2351f431f727223b4d82851ee8fc045bf51edd34 btrfs: fix send ioctl on 32bit with 64bit kernel

:::::: TO: Josef Bacik <josef@toxicpanda.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
