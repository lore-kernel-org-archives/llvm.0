Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76174BA96;
	Mon,  5 Feb 2024 21:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707168947; cv=none; b=dVuIEnKav9H/BSLF0KDaJM6f1iEF2rIiJ9s2UUC3Rl5BaDyU60AyifjHY1rhjQ5E1TY28SxtEjNuszMLjWKCRI1Ai4BY4MXXccW6MwdUlSxxSiQHqFFuUUmV3vwO7+euZjSaCGE9m/WBoKhJyek4VIWbYMv5ldPJgu0fuu8M/SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707168947; c=relaxed/simple;
	bh=oKd03zA9kV0EspGNEn2Jelv+ubxlGhHDbCXRgj4xhhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kXcaeGgbZQjgbBawH5NaodEZ5kEPrcuu4l2oJi/QQPircawlsFZSihrL9wwCs0bvLHSxpajp+12a74jvG37yZY2jMp7Vli5XPXY8Q1teyE0KnH+QCRJzmfci8wEpjCRcuuEQZFck7m6/Ls/lSdj61pcXhuMxd5DE+iIHGV2Baqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpkcCE+c; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpkcCE+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707168945; x=1738704945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oKd03zA9kV0EspGNEn2Jelv+ubxlGhHDbCXRgj4xhhw=;
  b=FpkcCE+c86oFo57Evc3kXz9tGGfp94GoxRPNsf66X7UlZfDtUt0lX6gz
   a7ULsFss3J+Zr4A2PHd8xskIpsM0HzIGlE9d5Fy/5YPAfU6imbm3ds6Mo
   uZKWJri7Gc2g2dlDtradKOSZDcMuwnk5XAUwxx56RLxEHJo945o/YUgbh
   X/Dz7J4M+vduUSqPWF57iyKGR1P1Uvy5TCLLbRfHu7svLRi+7SNcHb+ry
   UI7nHb0Zp19gXRjy++OzmdpwOIfb0BIkzXvEbxOiKSgIPGGceHaE7mx7J
   nCo8r0KnlPMjbsGca+Mwf5w260DeqkmgxoI5JZlimp/UowJPXRqUMwPzV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="23090893"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="23090893"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 13:35:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="38253076"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Feb 2024 13:35:43 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX6cu-0000pE-03;
	Mon, 05 Feb 2024 21:35:40 +0000
Date: Tue, 6 Feb 2024 05:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Brauner <brauner@kernel.org>, NeilBrown <neilb@suse.de>
Subject: [linux-next:master 3180/4021] fs/ocfs2/stack_user.c:747:11: error:
 call to undeclared function 'lock_is_unlock'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202402060540.iVHnOa7m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   23e11d0318521e8693459b0e4d23aec614b3b68b
commit: a336b91b2340eb6fe29f4a5898dd103b55c92091 [3180/4021] ocfs2: convert to using new filelock helpers
config: riscv-randconfig-001-20240205 (https://download.01.org/0day-ci/archive/20240206/202402060540.iVHnOa7m-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060540.iVHnOa7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060540.iVHnOa7m-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ocfs2/stack_user.c:747:11: error: call to undeclared function 'lock_is_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     747 |         else if (lock_is_unlock(fl))
         |                  ^
   fs/ocfs2/stack_user.c:747:11: note: did you mean 'lock_pin_lock'?
   include/linux/lockdep.h:254:26: note: 'lock_pin_lock' declared here
     254 | extern struct pin_cookie lock_pin_lock(struct lockdep_map *lock);
         |                          ^
   1 error generated.


vim +/lock_is_unlock +747 fs/ocfs2/stack_user.c

   728	
   729	static int user_plock(struct ocfs2_cluster_connection *conn,
   730			      u64 ino,
   731			      struct file *file,
   732			      int cmd,
   733			      struct file_lock *fl)
   734	{
   735		/*
   736		 * This more or less just demuxes the plock request into any
   737		 * one of three dlm calls.
   738		 *
   739		 * Internally, fs/dlm will pass these to a misc device, which
   740		 * a userspace daemon will read and write to.
   741		 */
   742	
   743		if (cmd == F_CANCELLK)
   744			return dlm_posix_cancel(conn->cc_lockspace, ino, file, fl);
   745		else if (IS_GETLK(cmd))
   746			return dlm_posix_get(conn->cc_lockspace, ino, file, fl);
 > 747		else if (lock_is_unlock(fl))
   748			return dlm_posix_unlock(conn->cc_lockspace, ino, file, fl);
   749		else
   750			return dlm_posix_lock(conn->cc_lockspace, ino, file, cmd, fl);
   751	}
   752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
