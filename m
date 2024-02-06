Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E448F61;
	Tue,  6 Feb 2024 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707241277; cv=none; b=ZCnM3/srZ5DnO8QgYHF4ildGDuqoe7qvKzxqtE5ECFL0aZypGsqHvOiK5d6wSC1spc1vb2lILpeTf9h+i0lk2vo3tPpcvCWIKZkFKiG1kAbYCnW8BsLGx+3jAMxNDO++RtS4tmA6++wgNJPHndHgc4wgx35PwzCy0iL+fMlRXmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707241277; c=relaxed/simple;
	bh=wLLe4KL6p2bgqfg9oMK9zu9hvGZJ/dKkhSZc0NFE5zA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c3MJJH3+qe5VlQgNrYCGpLhFisJKwmd/9oeAebyTMLJz+gTFA99chTiCiolwQxdxswYELGZVNptTl3WyqNW+t8rS/Ug2xecv9VSh6SnP4VG3A4kMttlLSR7MGcD3vt+QsHfJO6NyFAJgE2xWj7urN3KzbdBJmA4wfldFBJBUSmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYuAlieE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYuAlieE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707241276; x=1738777276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wLLe4KL6p2bgqfg9oMK9zu9hvGZJ/dKkhSZc0NFE5zA=;
  b=VYuAlieESO4XM+SXur16e8EPklix6tiMeYZMpRkBLzd8K750twu/AV9i
   xVuKnuMHrs3JZ9GldaN3cWJEWXeVupt/aL/AmjiF9TIv4nyAaIMMseTh8
   tt3rJRty3tYMPW4PGo8DFrmuTYieJHWtzScygLdo8OS3ZuQweTOxUi3n3
   lCNjY+GhC74ICwbCemcTQF/V2LQ12IagMR+HoeK42eriOiHdQpikJDC+I
   VDBVKZeqYnvRZK/+055Y9BY22267QsYHUd67obdcnyUTT9Bl9f3/4NxLg
   F5IZJ4bqJzeRhwdt062X9ZrLwn6F+It+38/4PTLmXLqKyIulUgb+Xj0Ca
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1075903"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1075903"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 09:41:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="933538029"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933538029"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2024 09:41:13 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXPRX-0001eK-0Q;
	Tue, 06 Feb 2024 17:41:11 +0000
Date: Wed, 7 Feb 2024 01:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-misfit-update 1/1] kernel/sched/core.c:2008:3:
 error: call to undeclared function 'update_misfit_status'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202402070148.B7ZYrEl9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-misfit-update
head:   795964ba3482de02426331d23c50241a1d20898b
commit: 795964ba3482de02426331d23c50241a1d20898b [1/1] sched/uclamp: update_misfit_task() when a uclamp value changes
config: x86_64-buildonly-randconfig-002-20240206 (https://download.01.org/0day-ci/archive/20240207/202402070148.B7ZYrEl9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402070148.B7ZYrEl9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070148.B7ZYrEl9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:2008:3: error: call to undeclared function 'update_misfit_status'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2008 |                 update_misfit_status(p, task_rq(p));
         |                 ^
   1 error generated.


vim +/update_misfit_status +2008 kernel/sched/core.c

  1961	
  1962	static void __setscheduler_uclamp(struct task_struct *p,
  1963					  const struct sched_attr *attr)
  1964	{
  1965		enum uclamp_id clamp_id;
  1966		bool uclamp_updated = false;
  1967	
  1968		for_each_clamp_id(clamp_id) {
  1969			struct uclamp_se *uc_se = &p->uclamp_req[clamp_id];
  1970			unsigned int value;
  1971	
  1972			if (!uclamp_reset(attr, clamp_id, uc_se))
  1973				continue;
  1974	
  1975			/*
  1976			 * RT by default have a 100% boost value that could be modified
  1977			 * at runtime.
  1978			 */
  1979			if (unlikely(rt_task(p) && clamp_id == UCLAMP_MIN))
  1980				value = sysctl_sched_uclamp_util_min_rt_default;
  1981			else
  1982				value = uclamp_none(clamp_id);
  1983	
  1984			uclamp_se_set(uc_se, value, false);
  1985			uclamp_updated = true;
  1986	
  1987		}
  1988	
  1989		if (likely(!(attr->sched_flags & SCHED_FLAG_UTIL_CLAMP)))
  1990			goto out;
  1991	
  1992		if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP_MIN &&
  1993		    attr->sched_util_min != -1) {
  1994			uclamp_updated = true;
  1995			uclamp_se_set(&p->uclamp_req[UCLAMP_MIN],
  1996				      attr->sched_util_min, true);
  1997		}
  1998	
  1999		if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP_MAX &&
  2000		    attr->sched_util_max != -1) {
  2001			uclamp_updated = true;
  2002			uclamp_se_set(&p->uclamp_req[UCLAMP_MAX],
  2003				      attr->sched_util_max, true);
  2004		}
  2005	
  2006	out:
  2007		if (uclamp_updated && task_on_rq_queued(p))
> 2008			update_misfit_status(p, task_rq(p));
  2009	}
  2010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
