Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D94D29A2;
	Thu,  2 Oct 2025 22:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759443419; cv=none; b=rjQNnl4IfnJck0dxGsJ6RQ39hxhOjqNN3CZg/m7JTQfNXy2zdzeRDEGfsU+ZDbGXpcVYr+S/Qv5MVd5c8IK4MwisUYMk2MfL9wrZiknrC6WjvL98thkK1sWQfflpf6ONaSrfb1n4Z1CVclm/OpC2rDux4dv92ma0EKmMm9xmrJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759443419; c=relaxed/simple;
	bh=k3Hae/V9zV/uZyyYuMhwMt9YvZyWv8GoP358PTCI95k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hq0e9W7cIXno8Us1IGLbHx0rPTsJhW5CzbueVRE4Zd245lc3Iyzm2hRDvdtIp3hxrkee2qzB+FVajLi5pxrIu1LSWLml7ABr2qKgezL5w92sZq5BryG/gaPyyEZPwPMHyoSwRbjg+eK/3xHG0aVLb/bmwC/+YGvt76hWZpECsTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFYge2nO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFYge2nO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759443417; x=1790979417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k3Hae/V9zV/uZyyYuMhwMt9YvZyWv8GoP358PTCI95k=;
  b=dFYge2nOSwAuCxk++96k9hABnEpEo5YhBUuJYOt5429hljJV+/AJl3jc
   Fm8C7Gz3Mi+NMl3s4ZhQwOnxtm9pItIb6xZ0vhCW4SdIkyrXm4QQAty51
   fmIlwVCowTs3h2nIOSQ6DVbH6TNcrKy+Tfi3agjvzDG9nzktj8few9v3t
   6DgOxtLmVs0WplmxPt+UjjtP5BLI6VGjiPgPzVbi/7ak5eSmYq5nkMtA7
   nKzHUi2LvtNoAq2g5/uk4g4KSyamim1Ea96sVO1H4kJNvhJ1CRN8M97Nb
   bsUa+zBvOQ8yj2Sd0GJxkXLvl3MpuUucRzlL/Wgs2H+o97pu0nd00GrvD
   g==;
X-CSE-ConnectionGUID: rXKNE3t3S9WLXomspnwimQ==
X-CSE-MsgGUID: DtHASMqUT6yFanpNpp032g==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="72411334"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="72411334"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 15:16:56 -0700
X-CSE-ConnectionGUID: my8NznnrRFyUsndP+62A0A==
X-CSE-MsgGUID: mebeAvHPSYqILViA1fUkRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="179093840"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2025 15:16:55 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4RbZ-00049V-22;
	Thu, 02 Oct 2025 22:16:53 +0000
Date: Fri, 3 Oct 2025 06:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:unwind/sframe-test 10/14] kernel/unwind/sframe.o: error:
 objtool: sframe_find+0x381: call to __asan_memset() with UACCESS enabled
Message-ID: <202510030619.2bWpgQ34-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace unwind/sframe-test
head:   d6d0be1c9daa56454204449f43054df8337cc7fe
commit: 1805faa8f6c99382fa6c9d17d45c0d8137b7fc3d [10/14] unwind_user/sframe/x86: Enable sframe unwinding on x86
config: x86_64-randconfig-075-20251003 (https://download.01.org/0day-ci/archive/20251003/202510030619.2bWpgQ34-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510030619.2bWpgQ34-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510030619.2bWpgQ34-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/unwind/sframe.o: error: objtool: sframe_find+0x381: call to __asan_memset() with UACCESS enabled

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
