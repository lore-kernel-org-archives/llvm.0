Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D058834;
	Sat, 27 Dec 2025 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766829284; cv=none; b=TjOXmiBFj6zmtUuUl8FZUc+P7eaY8vP7pwYmuxYtT1K9xLq7gfYGyjPs+2gitR140qdGYiDtVxiDXeFEU2uM1l0iTDe2AtfW+krnN19Hahe0+QQSZL0YlChMwLxjzYPg43Fmcmvx+AtFjU/p8w8PW3ddOXE2LHMRzCSMR6QOACQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766829284; c=relaxed/simple;
	bh=Z4hEcfTd03HpQqhFJjKS6Zd8Mq2M601UKoOd9wkasa8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UcD7iaAbo32Xqt9/h0ocNm/OriMeA1NNXdSeqaRaxsZJts1bRpDQd7rPCSpYA2JUPU89oMOXnXBMNpbaAk8wDMSnrbrK4yMg/9NW7oDMy3lGxHQEGLsgjYqSvT1m3QtOXfiy+3C1N9bchM4tMULR+789XXEnVBBA4Cq4Za0YNuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGyen8yy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGyen8yy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766829283; x=1798365283;
  h=date:from:to:cc:subject:message-id;
  bh=Z4hEcfTd03HpQqhFJjKS6Zd8Mq2M601UKoOd9wkasa8=;
  b=iGyen8yyso5CHU1q9orb0pkWatV26snvHfy4kt9sHk0sIi9rTjromkY2
   HPRkfx7IJaJW+MBAECDqhm7wOIc0g1qfKYnY7HkB+AoYM1GqwzJ5aWDer
   uSX38iD7cR9Oz1dpFixx5QDE/D7Q+jtscFPODJcFCWBJGhpQJ8H75Fmbi
   cykGgzpxMZoQ7ECbUsYJ2MXlL9d98mcSd4G5+G+GSFM3DDyn7QxI4Au/m
   dDuZ/vfkoIud+jigJUwUKbUSBYI1s2GampDHyIy5tvOdjhioKTdRXDow6
   ZFd7OJgm2T5Urwc194+2FaB8/d7zFhcEvSk3bn8VqQOyp5zGos5kSsmgZ
   Q==;
X-CSE-ConnectionGUID: L3XZgZokS521l1b1RqCJNA==
X-CSE-MsgGUID: 1t8l1OkxRhSDPglihmcFPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68429891"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68429891"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 01:54:43 -0800
X-CSE-ConnectionGUID: jo/QVopSSw6o+lutSZHpdg==
X-CSE-MsgGUID: tK5SsiHGTuq9m/6/exC+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="199665800"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Dec 2025 01:54:41 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZR0Q-000000005ix-1dgo;
	Sat, 27 Dec 2025 09:54:38 +0000
Date: Sat, 27 Dec 2025 17:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 11/11] fs/f2fs/checkpoint.c:33:6:
 warning: variable 'i' set but not used
Message-ID: <202512271700.z6xbW9KW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   76d9d8ea13699c3b05f129b7bff8b8be75a3ceac
commit: 76d9d8ea13699c3b05f129b7bff8b8be75a3ceac [11/11] f2fs: sysfs: introduce inject_timeout_type
config: powerpc-randconfig-002-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271700.z6xbW9KW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271700.z6xbW9KW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271700.z6xbW9KW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/checkpoint.c:33:6: warning: variable 'i' set but not used [-Wunused-but-set-variable]
      33 |         int i = 0;
         |             ^
   fs/f2fs/checkpoint.c:70:18: error: variable has incomplete type 'struct rq_flags'
      70 |         struct rq_flags rf;
         |                         ^
   include/linux/sched.h:640:8: note: forward declaration of 'struct rq_flags'
     640 | struct rq_flags;
         |        ^
   fs/f2fs/checkpoint.c:73:7: error: call to undeclared function 'task_rq_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |         rq = task_rq_lock(t, &rf);
         |              ^
   fs/f2fs/checkpoint.c:75:2: error: call to undeclared function 'task_rq_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      75 |         task_rq_unlock(rq, t, &rf);
         |         ^
   1 warning and 3 errors generated.


vim +/i +33 fs/f2fs/checkpoint.c

    27	
    28	static void inject_timeout(struct f2fs_sb_info *sbi)
    29	{
    30		enum f2fs_timeout_type type = sbi->inject_timeout_type;
    31		unsigned long start_time = jiffies;
    32		unsigned long timeout = HZ;
  > 33		int i = 0;
    34	
    35		switch (type) {
    36		case TIMEOUT_TYPE_RUNNING:
    37			while (!time_after(jiffies, start_time + timeout)) {
    38				if (fatal_signal_pending(current))
    39					return;
    40				i++;
    41			}
    42			break;
    43		case TIMEOUT_TYPE_IO_SLEEP:
    44			f2fs_schedule_timeout_killable(timeout, true);
    45			break;
    46		case TIMEOUT_TYPE_NONIO_SLEEP:
    47			f2fs_schedule_timeout_killable(timeout, false);
    48			break;
    49		case TIMEOUT_TYPE_RUNNABLE:
    50			while (!time_after(jiffies, start_time + timeout)) {
    51				if (fatal_signal_pending(current))
    52					return;
    53				schedule();
    54			}
    55			break;
    56		default:
    57			return;
    58		}
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
