Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98DF1843;
	Sun, 16 Jun 2024 06:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718517802; cv=none; b=U18AItz71mwbxi6OmD/diuwt6LTkjxBegF6XW9to1EYAdSdYwscewdf+YiTIxOugX8Z7d1rVvvadNzAROtRLiKEkfNnd92w2YZE/ZKidBX4XfC2wOkaAQZpFcQCBnRX7gCbYGQbfeBVBr7oa7PwwkaCYa9AdQfkmPQmM74gAWLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718517802; c=relaxed/simple;
	bh=K/ni8LSVOYgXxTrdjn8CCbKK4xGr4LQCEH5An9qKEvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ar4zgLX3wr616OKRM9+tU/ZeZiaaWS8rLizokI41yBKkijPSJpZAf2ytQlhRSTKWdTFq66YIr2B75jTFDSxseUn2EPMjuDpoq4j8u2I/Wb6cTobOlnoUI3ipC4o3OVR2oXJYo59G+ikuMaCt23HO1V4FfpSutEekuRAH5dm6C8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQbDXXr9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQbDXXr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718517800; x=1750053800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K/ni8LSVOYgXxTrdjn8CCbKK4xGr4LQCEH5An9qKEvA=;
  b=jQbDXXr9HfHEkdKI4YR2S7SzaBJEOqsyM+yEvaXwmkdIavvpnvmNhdDl
   GqixwRwEBCIWvLK3pJd3tpg/iuTgmhP/OHFnX3PktNaypgUu1a8xXm6Xu
   7VYnZot/1kTi7ERweDmsqeQl83EYJObim8nF+L9D6OkRyX2NrHkuBjm8u
   77UvwwBDWjPbaOYgE4k/CazLW2WfTPPoF0gATyB0bG5p9dhCw+z9fIhAl
   ESbANZDgS72WQbQXQJtcTTYJHXxkKEZ5JdRjMKJGRZYcRUqtEgQqTsqi6
   oVkRa/p54xGDrqksuwtzKwKENvQtvTIWB9lrFxzSYNCoxp2qCH/oaKREV
   g==;
X-CSE-ConnectionGUID: 2ReZbIByQGytxpI+iJpG5w==
X-CSE-MsgGUID: mgtUmczTRqurMxJIuqafjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15597987"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15597987"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 23:03:20 -0700
X-CSE-ConnectionGUID: q9yjWNs8Q/ipO5p6yzHukA==
X-CSE-MsgGUID: Hlhb8nUdSEaL7VfZN7Fpvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="45825662"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jun 2024 23:03:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIiyy-0000vO-34;
	Sun, 16 Jun 2024 06:03:16 +0000
Date: Sun, 16 Jun 2024 14:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 9/47] mm/damon/core.c:705: warning: expecting
 prototype for damon_commit_quota_goals(). Prototype was for
 damos_commit_quota_goals() instead
Message-ID: <202406161331.PjF4uMpc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   dc8dc5011c1230b2f3b20c53eec91368ee9836b4
commit: 7b2776f2db539d498b8ed2c9e4e40c5f2c42296d [9/47] mm/damon/core: implement DAMOS quota goals online commit function
config: i386-buildonly-randconfig-001-20240616 (https://download.01.org/0day-ci/archive/20240616/202406161331.PjF4uMpc-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406161331.PjF4uMpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406161331.PjF4uMpc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.c:705: warning: expecting prototype for damon_commit_quota_goals(). Prototype was for damos_commit_quota_goals() instead


vim +705 mm/damon/core.c

   691	
   692	/**
   693	 * damon_commit_quota_goals() - Commit DAMOS quota goals to another quota.
   694	 * @dst:	The commit destination DAMOS quota.
   695	 * @src:	The commit source DAMOS quota.
   696	 *
   697	 * Copies user-specified parameters for quota goals from @src to @dst.  Users
   698	 * should use this function for quota goals-level parameters update of running
   699	 * DAMON contexts, instead of manual in-place updates.
   700	 *
   701	 * This function should be called from parameters-update safe context, like
   702	 * DAMON callbacks.
   703	 */
   704	int damos_commit_quota_goals(struct damos_quota *dst, struct damos_quota *src)
 > 705	{
   706		struct damos_quota_goal *dst_goal, *next, *src_goal, *new_goal;
   707		int i = 0, j = 0;
   708	
   709		damos_for_each_quota_goal_safe(dst_goal, next, dst) {
   710			src_goal = damos_nth_quota_goal(i++, src);
   711			if (src_goal)
   712				damos_commit_quota_goal(dst_goal, src_goal);
   713			else
   714				damos_destroy_quota_goal(dst_goal);
   715		}
   716		damos_for_each_quota_goal_safe(src_goal, next, src) {
   717			if (j++ < i)
   718				continue;
   719			new_goal = damos_new_quota_goal(
   720					src_goal->metric, src_goal->target_value);
   721			if (!new_goal)
   722				return -ENOMEM;
   723			damos_add_quota_goal(dst, new_goal);
   724		}
   725		return 0;
   726	}
   727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
