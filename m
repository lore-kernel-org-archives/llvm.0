Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61775B1FB;
	Sat, 21 Dec 2024 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734783995; cv=none; b=bs2TnUxX93rDE9YlCrw+tn+HbXKvPPiwg+EOJVvdWIuBV7kQ042a6Ce2rHiqb0wZ0Jh7TLVIeMuvvKhztbjtQm0svg2QZXLGnA7ddQe4V9PCDaqoKp1RLp9SeD5yu1RIM6FSzdr74dapCPV8yjE8GgV+4SFdfEPwHacdix/8BPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734783995; c=relaxed/simple;
	bh=6BNvFWTvz6Ubqh4BkpwKnniQ/ZPSwafQdkyFaYUC6Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEbm2+w+17CdC8LhhQSKXIX4eJ9WXLDNQL1ksjk587uh/wllRlUYD3ykrbmrriVYcW5seJ9GHfCXRYe4Wand11wspt/EFRYPDhb7kIXQ0uX9aTCFvN9HaH3+R7MbKNqsgw44AYB4uiqQQZO08pUKGuFIF2kLfMmubucQndaK5zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JwyK6OW7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JwyK6OW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734783994; x=1766319994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6BNvFWTvz6Ubqh4BkpwKnniQ/ZPSwafQdkyFaYUC6Fk=;
  b=JwyK6OW7b/XnrsZ7NvIuV0y8POpyE0Knsnrz8x2K1ZO1HlieO0ag0y6t
   NH9p7iXq1gMbVSnNFEZ1SztxHqOFLrpSrdL78O3IpDz2Ga+VDVFkLO8W+
   G+IWbOIoNqLOMEDL8pA/LKzjT8XQi6P3DKOLr1MCaBwygiMXXHIOcR1pa
   t7xy6CKBxFc0hN3P8DT2hj+HdiNqArhbqkoBo7GSJd0J8aF6N54AeDmiM
   1oFFUSPrxLgVkhFF1FWuES6iGVVjBIcvfxiElVcTeM+1bfp5Kz89LK+cm
   wscU0wv8yHpJ6U/n8UUiZULuqqk8dlja1mMnJDuC7oVbLOI0l33Qqnxhe
   Q==;
X-CSE-ConnectionGUID: 2WOcbTGNSliQzbxrNXIkbw==
X-CSE-MsgGUID: Mngf5wFJSGqK/o3b3qs1YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35347378"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="35347378"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 04:26:33 -0800
X-CSE-ConnectionGUID: b6hqGX+3QamObENaty3wRw==
X-CSE-MsgGUID: GyRYOxqyRR6SDqsmgfigzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="98535547"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2024 04:26:31 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOyYv-0002AZ-23;
	Sat, 21 Dec 2024 12:26:29 +0000
Date: Sat, 21 Dec 2024 20:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>
Subject: fs/gfs2/glock.c:1213: warning: Function parameter or struct member
 'ip' not described in '__gfs2_holder_init'
Message-ID: <202412212036.wYxgeNuQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   499551201b5f4fd3c0618a3e95e3d0d15ea18f31
commit: b016d9a84abdd2efaa273814eaeb59e112ecffbd gfs2: Save ip from gfs2_glock_nq_init
date:   3 years, 2 months ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241221/202412212036.wYxgeNuQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412212036.wYxgeNuQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412212036.wYxgeNuQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/gfs2/glock.c:1213: warning: Function parameter or struct member 'ip' not described in '__gfs2_holder_init'
   fs/gfs2/glock.c:1213: warning: expecting prototype for gfs2_holder_init(). Prototype was for __gfs2_holder_init() instead


vim +1213 fs/gfs2/glock.c

b3b94faa5fe596 David Teigland      2006-01-16  1201  
b3b94faa5fe596 David Teigland      2006-01-16  1202  /**
b3b94faa5fe596 David Teigland      2006-01-16  1203   * gfs2_holder_init - initialize a struct gfs2_holder in the default way
b3b94faa5fe596 David Teigland      2006-01-16  1204   * @gl: the glock
b3b94faa5fe596 David Teigland      2006-01-16  1205   * @state: the state we're requesting
b3b94faa5fe596 David Teigland      2006-01-16  1206   * @flags: the modifier flags
b3b94faa5fe596 David Teigland      2006-01-16  1207   * @gh: the holder structure
b3b94faa5fe596 David Teigland      2006-01-16  1208   *
b3b94faa5fe596 David Teigland      2006-01-16  1209   */
b3b94faa5fe596 David Teigland      2006-01-16  1210  
b016d9a84abdd2 Andreas Gruenbacher 2021-09-30  1211  void __gfs2_holder_init(struct gfs2_glock *gl, unsigned int state, u16 flags,
b016d9a84abdd2 Andreas Gruenbacher 2021-09-30  1212  			struct gfs2_holder *gh, unsigned long ip)
b3b94faa5fe596 David Teigland      2006-01-16 @1213  {
b3b94faa5fe596 David Teigland      2006-01-16  1214  	INIT_LIST_HEAD(&gh->gh_list);
b3b94faa5fe596 David Teigland      2006-01-16  1215  	gh->gh_gl = gl;
b016d9a84abdd2 Andreas Gruenbacher 2021-09-30  1216  	gh->gh_ip = ip;
b1e058da50f793 Pavel Emelyanov     2008-02-07  1217  	gh->gh_owner_pid = get_pid(task_pid(current));
b3b94faa5fe596 David Teigland      2006-01-16  1218  	gh->gh_state = state;
b3b94faa5fe596 David Teigland      2006-01-16  1219  	gh->gh_flags = flags;
b3b94faa5fe596 David Teigland      2006-01-16  1220  	gh->gh_error = 0;
b3b94faa5fe596 David Teigland      2006-01-16  1221  	gh->gh_iflags = 0;
b3b94faa5fe596 David Teigland      2006-01-16  1222  	gfs2_glock_hold(gl);
b3b94faa5fe596 David Teigland      2006-01-16  1223  }
b3b94faa5fe596 David Teigland      2006-01-16  1224  

:::::: The code at line 1213 was first introduced by commit
:::::: b3b94faa5fe5968827ba0640ee9fba4b3e7f736e [GFS2] The core of GFS2

:::::: TO: David Teigland <teigland@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
