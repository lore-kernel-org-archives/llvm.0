Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A58A199931;
	Sun,  3 May 2026 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777819464; cv=none; b=oWcEfEkblsQcCOoBuPR6N3530+7UWINcTm20dBnA2NR1GX8M7rcok6VqodqHU4aA3D6/zqnqmOmW+o2S/OGbTBcxnALyzXXGjUI/vNZgEGwWlpoZlTHuw1YJ4CUp5AuWJzOdJFMIjbJH6syn9d3vIXVGZfL/q8l8DfLj+5fRmBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777819464; c=relaxed/simple;
	bh=N7tGi20SzbfmetaS8tbfiOf2XL2I3RUqtEQg29bqN30=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nRo7W4squSBwHfdrkowJlvZpDB5MzQ9q77efEx8NgNi6kshke8eJDcwT7ywP8VP5l+WM6dofM8TqWXLKSWs1n5TFfsRbQ0gwh9hX19VjC/e4U8+k6pZ60iPxYzySz74C0OtHENNsB5bBsxXt08HvE+3/njuwp8wwp0ZhDnanhH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9VBXRj6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9VBXRj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777819462; x=1809355462;
  h=date:from:to:cc:subject:message-id;
  bh=N7tGi20SzbfmetaS8tbfiOf2XL2I3RUqtEQg29bqN30=;
  b=j9VBXRj6AAbgCRzu/Rm8KMcK5+4ugKWOTnooKNrTfYOd/DRegIWBirAU
   ezD2butBq6ZVn7zt0aBA5tpgVND3EXwzg8ZiUwWk2r24DNT0563azPR4a
   QInE6Fb3PyqovKHLxdaR2S4cP3I+yGiDR8fvxBM5HGfTKZ5A9uwwGmy5u
   bLLS12YWy1Y/NKdioAJySNUqnkHjUgSNTx15I19k4RqgivBjqFh2zmSq1
   ukA1Ed50Omiy3cSDaqLp3H43Qp7sbTvFXT6TyY8QoOVWcaL7y//3lhq6J
   WttYGorvAt7mx2sEZ9aG6ZuVI4LH3Qe/AAqZjjXqvu03RVSwpcWZfLE6q
   A==;
X-CSE-ConnectionGUID: StGCfdY6RsGtWfhICOaeSQ==
X-CSE-MsgGUID: nqzd9yLiROmqemrvo6Cg2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="77863685"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="77863685"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 07:44:21 -0700
X-CSE-ConnectionGUID: JinsV/Z0TgmR+2D4Kh1kmg==
X-CSE-MsgGUID: CEweYO7aQWmxJxJwICi7TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235174312"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 May 2026 07:44:19 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJY3N-000000005ZP-46Gz;
	Sun, 03 May 2026 14:44:17 +0000
Date: Sun, 03 May 2026 16:43:32 +0200
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/cgroup/cgroup.c:3391:5: error: call to undeclared
 function 'kill_css_sync'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605031603.MJK6LzJs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tejun-Heo/cgroup-Defer-css-percpu_ref-kill-on-rmdir-until-cgroup-is-depopulated/20260503-165802
head:   f18fcea709e431e32f29d553290a21173d8530f6
commit: f18fcea709e431e32f29d553290a21173d8530f6 cgroup: Defer css percpu_ref kill on rmdir until cgroup is depopulated
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260503/202605031603.MJK6LzJs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031603.MJK6LzJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031603.MJK6LzJs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:3391:5: error: call to undeclared function 'kill_css_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3391 |                                 kill_css_sync(css);
         |                                 ^
   kernel/cgroup/cgroup.c:3391:5: note: did you mean 'kill_fasync'?
   include/linux/fs.h:1391:13: note: 'kill_fasync' declared here
    1391 | extern void kill_fasync(struct fasync_struct **, int, int);
         |             ^
>> kernel/cgroup/cgroup.c:3392:5: error: call to undeclared function 'kill_css_finish'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3392 |                                 kill_css_finish(css);
         |                                 ^
>> kernel/cgroup/cgroup.c:6047:13: error: conflicting types for 'kill_css_sync'
    6047 | static void kill_css_sync(struct cgroup_subsys_state *css)
         |             ^
   kernel/cgroup/cgroup.c:3391:5: note: previous implicit declaration is here
    3391 |                                 kill_css_sync(css);
         |                                 ^
>> kernel/cgroup/cgroup.c:6087:13: error: conflicting types for 'kill_css_finish'
    6087 | static void kill_css_finish(struct cgroup_subsys_state *css)
         |             ^
   kernel/cgroup/cgroup.c:3392:5: note: previous implicit declaration is here
    3392 |                                 kill_css_finish(css);
         |                                 ^
   4 errors generated.


vim +/kill_css_sync +3391 kernel/cgroup/cgroup.c

  3359	
  3360	/**
  3361	 * cgroup_apply_control_disable - kill or hide csses according to control
  3362	 * @cgrp: root of the target subtree
  3363	 *
  3364	 * Walk @cgrp's subtree and kill and hide csses so that they match
  3365	 * cgroup_ss_mask() and cgroup_visible_mask().
  3366	 *
  3367	 * A css is hidden when the userland requests it to be disabled while other
  3368	 * subsystems are still depending on it.  The css must not actively control
  3369	 * resources and be in the vanilla state if it's made visible again later.
  3370	 * Controllers which may be depended upon should provide ->css_reset() for
  3371	 * this purpose.
  3372	 */
  3373	static void cgroup_apply_control_disable(struct cgroup *cgrp)
  3374	{
  3375		struct cgroup *dsct;
  3376		struct cgroup_subsys_state *d_css;
  3377		struct cgroup_subsys *ss;
  3378		int ssid;
  3379	
  3380		cgroup_for_each_live_descendant_post(dsct, d_css, cgrp) {
  3381			for_each_subsys(ss, ssid) {
  3382				struct cgroup_subsys_state *css = cgroup_css(dsct, ss);
  3383	
  3384				if (!css)
  3385					continue;
  3386	
  3387				WARN_ON_ONCE(percpu_ref_is_dying(&css->refcnt));
  3388	
  3389				if (css->parent &&
  3390				    !(cgroup_ss_mask(dsct) & (1 << ss->id))) {
> 3391					kill_css_sync(css);
> 3392					kill_css_finish(css);
  3393				} else if (!css_visible(css)) {
  3394					css_clear_dir(css);
  3395					if (ss->css_reset)
  3396						ss->css_reset(css);
  3397				}
  3398			}
  3399		}
  3400	}
  3401	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
