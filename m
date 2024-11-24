Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2DF2500AF;
	Sun, 24 Nov 2024 16:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732466202; cv=none; b=RzUfB30vrEDxjgBgiH0XzN2emhgoQPfrUmK412TRCTPNfODu1/Pi7sZBaKOzAqYzb2THcT1EM5tor8bWLd8pYG4ijrACxxkBMxVZtIVmER0TnZywK1XtyS21u09oehKP4c0w40sAfmAVTEthmcq4uJrFcrXiRvlaPcea2nkU4HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732466202; c=relaxed/simple;
	bh=t3SBt+Qyj4Z+I2WSguu6tXp0GL9B7KONMP2tsEBtlC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mdvAsdGzlkjSoIbUvpGzODl3XSI/RhxM3KgyombhlirK5UXOT9HhmBqrZuzuEMGhqjNfEjzF/MCCAb+ScpkSb8ztF2KhNc/Fr7QHPGSq6ANXqnYF14XB9kyPgPryzRyKvKYMA+mLi+P3QoqWDSUjzEJrqzzQ3ozUM46q9/SYwUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4uHCE/i; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4uHCE/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732466200; x=1764002200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t3SBt+Qyj4Z+I2WSguu6tXp0GL9B7KONMP2tsEBtlC0=;
  b=V4uHCE/i7Y1lL4WXZu84QothxWY4Ar4JlWNWyStN9eDDkriIHzQQpBGJ
   l0v/MVpeZvayg+GOTn8Et9yRSX51aSolbU0stRYiV2XunDzHQ8QfvdPAW
   vrVu+uB393vCRZJZ0SMB9qe3w7F79PyweGPoEClNzqdzQzAwTh5xTFsXj
   r8sKQZHyM6BIc4BWyFfSmu9mSXUvtLwhQNsQcJEWO4Oee1h9s4f/TBo+C
   JVwfejOxxuo7oxisb2FGaTs4pjbVfxHfUivxLc3qXcR8t0rOPPHVa0lg0
   rDb0yzoOfEmV45syL2GCpqeGEGfmPCr87G0Q5FCBw4g4E6ABTAlgzZgsU
   Q==;
X-CSE-ConnectionGUID: d69/yWNpSKuOStGq0nX0xA==
X-CSE-MsgGUID: om55FVkvS6yGAXT5iiRg3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32620689"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="32620689"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 08:36:39 -0800
X-CSE-ConnectionGUID: HZQO4HJCRVeX9cf3ZNvN6g==
X-CSE-MsgGUID: cwJQ1duHSu+8DGmpvBuSVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="90677293"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Nov 2024 08:36:38 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFFb9-000569-1x;
	Sun, 24 Nov 2024 16:36:35 +0000
Date: Mon, 25 Nov 2024 00:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.cred 1/27] io_uring/io_uring.c:1707:45: error:
 passing 'const struct cred *' to parameter of type 'struct cred *' discards
 qualifiers
Message-ID: <202411250024.1IJ2Exmf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.cred
head:   a617a3cb721d5c4fdc88889c7d80936831efe7df
commit: 52ef01ce9c2dafcc67b4657dd2991d097ab2f0a7 [1/27] tree-wide: s/override_creds()/override_creds_light(get_new_cred())/g
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241125/202411250024.1IJ2Exmf-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250024.1IJ2Exmf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250024.1IJ2Exmf-lkp@intel.com/

Note: the brauner-github/work.cred HEAD a617a3cb721d5c4fdc88889c7d80936831efe7df builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2225:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> io_uring/io_uring.c:1707:45: error: passing 'const struct cred *' to parameter of type 'struct cred *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1707 |                 creds = override_creds_light(get_new_cred(req->creds));
         |                                                           ^~~~~~~~~~
   include/linux/cred.h:214:54: note: passing argument to parameter 'cred' here
     214 | static inline struct cred *get_new_cred(struct cred *cred)
         |                                                      ^
   1 warning and 1 error generated.
--
   In file included from io_uring/sqpoll.c:9:
   In file included from include/linux/mm.h:2225:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> io_uring/sqpoll.c:177:46: error: passing 'const struct cred *' to parameter of type 'struct cred *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     177 |                         creds = override_creds_light(get_new_cred(ctx->sq_creds));
         |                                                                   ^~~~~~~~~~~~~
   include/linux/cred.h:214:54: note: passing argument to parameter 'cred' here
     214 | static inline struct cred *get_new_cred(struct cred *cred)
         |                                                      ^
   1 warning and 1 error generated.


vim +1707 io_uring/io_uring.c

  1696	
  1697	static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)
  1698	{
  1699		const struct io_issue_def *def = &io_issue_defs[req->opcode];
  1700		const struct cred *creds = NULL;
  1701		int ret;
  1702	
  1703		if (unlikely(!io_assign_file(req, def, issue_flags)))
  1704			return -EBADF;
  1705	
  1706		if (unlikely((req->flags & REQ_F_CREDS) && req->creds != current_cred()))
> 1707			creds = override_creds_light(get_new_cred(req->creds));
  1708	
  1709		if (!def->audit_skip)
  1710			audit_uring_entry(req->opcode);
  1711	
  1712		ret = def->issue(req, issue_flags);
  1713	
  1714		if (!def->audit_skip)
  1715			audit_uring_exit(!ret, ret);
  1716	
  1717		if (creds)
  1718			revert_creds(creds);
  1719	
  1720		if (ret == IOU_OK) {
  1721			if (issue_flags & IO_URING_F_COMPLETE_DEFER)
  1722				io_req_complete_defer(req);
  1723			else
  1724				io_req_complete_post(req, issue_flags);
  1725	
  1726			return 0;
  1727		}
  1728	
  1729		if (ret == IOU_ISSUE_SKIP_COMPLETE) {
  1730			ret = 0;
  1731			io_arm_ltimeout(req);
  1732	
  1733			/* If the op doesn't have a file, we're not polling for it */
  1734			if ((req->ctx->flags & IORING_SETUP_IOPOLL) && def->iopoll_queue)
  1735				io_iopoll_req_issued(req, issue_flags);
  1736		}
  1737		return ret;
  1738	}
  1739	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
