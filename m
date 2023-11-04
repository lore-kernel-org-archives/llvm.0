Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EDA210A;
	Sat,  4 Nov 2023 05:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c82W/qpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699076509; x=1730612509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vc1iUvmDts0qIXChLj9EtSGhuTu5laukXgdBHBkxPiA=;
  b=c82W/qpyHin1zHXDZP8ausO5w83YuHEge3CysHsBSmX0tAprjJ3bp59L
   PuPi7GFg3sQzH47IVcpO7Huke7V8wSTFzDVwWM8fMHIiWlhc5f8pB+CJz
   4TvMF5aI2YyU2BYrimH0KKvWNeTJwHE9+z/gcpwVzkJiwv6ssAll+jy7S
   pAYVr1MiNFJ2EstkEEaQnDi/SltIJd66DM01hPl7om/Ut0w+Cw4g7Qfq/
   A1oIGmIOp9B9a32S83VsUyXvDsovDi7mqhctViQpelXc9H9MPCR9NyZaO
   Uk84y6Qx1KcTjwDHE/hkK40Du7b1AZr+sgjvOIQ6AXjrgKuUavLpZFXxK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="386238468"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="386238468"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 22:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="827702780"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="827702780"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Nov 2023 22:41:47 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz9Pl-0003Vj-1K;
	Sat, 04 Nov 2023 05:41:45 +0000
Date: Sat, 4 Nov 2023 13:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 3/3] kernel/unwind/user.c:92:14: error: implicit
 declaration of function 'frame_pointer' is invalid in C99
Message-ID: <202311041315.dV5sxOVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   32e88f45d843ad800e1ff01230eccd93849d2dda
commit: 32e88f45d843ad800e1ff01230eccd93849d2dda [3/3] todo
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041315.dV5sxOVS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041315.dV5sxOVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041315.dV5sxOVS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/unwind/user.c:92:14: error: implicit declaration of function 'frame_pointer' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           state->fp = frame_pointer(regs);
                       ^
   1 error generated.


vim +/frame_pointer +92 kernel/unwind/user.c

    66	
    67	int user_unwind_start(struct user_unwind_state *state,
    68			      enum user_unwind_type type)
    69	{
    70		struct pt_regs *regs = task_pt_regs(current);
    71	
    72		might_sleep();
    73	
    74		memset(state, 0, sizeof(*state));
    75	
    76		if (!current->mm || (current->flags & PF_KTHREAD)) {
    77			state->done = true;
    78			return -EINVAL;
    79		}
    80	
    81		if (type == USER_UNWIND_TYPE_AUTO) {
    82			state->type = sframe_enabled_current() ? USER_UNWIND_TYPE_SFRAME
    83							       : USER_UNWIND_TYPE_FP;
    84		} else {
    85			if (type == USER_UNWIND_TYPE_SFRAME && !sframe_enabled_current())
    86				return -EINVAL;
    87			state->type = type;
    88		}
    89	
    90		state->sp = user_stack_pointer(regs);
    91		state->ip = instruction_pointer(regs);
  > 92		state->fp = frame_pointer(regs);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
