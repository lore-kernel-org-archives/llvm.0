Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3EE14F90;
	Wed, 26 Mar 2025 19:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743018264; cv=none; b=nvmq+PCuOEQxGSqQkAJTbFhnHm/4aivt2JbaAdLIWK2q3iP2VKk21mBzgBGNrt7pRTwEm/whK5bbeSst4O6GOue3NFriSME3bCr9d+rhblzP0Ez+JV1CsgBn4h7LYygGYqtryR+hgvv19rtko9EgKEJZgbUdwyqs77QvDanjDgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743018264; c=relaxed/simple;
	bh=1p1OsE4OiOXEOVq4RGl/cvXjTmzJYkXXiZIi44VNBks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHqPg40U6Z8z3OIqzsYTlmMH0DIumz7sno8ilqhnhBPN7Dz5SpXIzmgav818wkeJdX4hlOYmi5idI8vFVwTeOAbZoNxG+3LhUgpfonwPFzeKhEYcG6SfwwZ9TiMiolytJIbo3D7b1Ga2tQwyXeBye3/artOgrtrMd4zeA8fVzfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVtoFYGt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVtoFYGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743018262; x=1774554262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1p1OsE4OiOXEOVq4RGl/cvXjTmzJYkXXiZIi44VNBks=;
  b=kVtoFYGtgZ1NO2lVOUt4yjy2Ew9Kx4POC63dklw6tKY8/q1ETWnqeq24
   2HTzywk5+cKe+7UpcpKgpjS3Lk1vdqkUAN3u7T4Vjz7z1ItMjhwIByEoz
   eXd8XsWwUcEfwl67+uOVjn2C8qkutefsGXmeHvggJljyuu6RPozTSxqcd
   eQTXOv/xqua00/smMt9lyVH5rKyCus4D/H25EBOrVD7+UwxCGXmpC+NoW
   ggzD8NozTvMeTCk3u+DLTf3I3q20MlqXSr4IijvfMOy6RqnT1o//HcIqS
   gBY6Apl6UVXXjgSwIT1A4SBFTXmIQ5e0b3GeiiNuEN2EFqbfcJD8GYcsO
   A==;
X-CSE-ConnectionGUID: qemxPJzxQ52aA77AsS2q9A==
X-CSE-MsgGUID: icB5RoijS1aS2I7opMoRug==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48205915"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="48205915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 12:44:21 -0700
X-CSE-ConnectionGUID: iS6pyx24SUWlGWviZxsAOQ==
X-CSE-MsgGUID: CMONghc+QEaz3231BjodGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="125720033"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Mar 2025 12:44:21 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txWfi-00061b-1h;
	Wed, 26 Mar 2025 19:44:18 +0000
Date: Thu, 27 Mar 2025 03:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 17/21] /usr/bin/ld:
 uapi.c:undefined reference to `kunit_log_append'
Message-ID: <202503270317.3gK9pNVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   c1f41508dfc38dc5750d2b2c5b29f1f819ae053a
commit: d85925dd2bcd0589dbb3c29bcf5d0b2f8daf2f83 [17/21] kunit: uapi: Introduce preinit executable
config: um-randconfig-001-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270317.3gK9pNVn-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270317.3gK9pNVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270317.3gK9pNVn-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: lib/kunit/uapi.o: in function `kunit_uapi_run_kselftest':
   uapi.c:(.text+0x2b8): undefined reference to `kunit_fail_assert_format'
   /usr/bin/ld: uapi.c:(.text+0x2c6): undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: uapi.c:(.text+0x336): undefined reference to `kunit_fail_assert_format'
   /usr/bin/ld: uapi.c:(.text+0x344): undefined reference to `__kunit_do_failed_assertion'
>> /usr/bin/ld: uapi.c:(.text+0x4f4): undefined reference to `kunit_log_append'
   /usr/bin/ld: uapi.c:(.text+0x6b3): undefined reference to `kunit_fail_assert_format'
   /usr/bin/ld: uapi.c:(.text+0x6c1): undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: uapi.c:(.text+0x71f): undefined reference to `kunit_fail_assert_format'
   /usr/bin/ld: uapi.c:(.text+0x72d): undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: uapi.c:(.text+0x78c): undefined reference to `kunit_fail_assert_format'
   /usr/bin/ld: uapi.c:(.text+0x79a): undefined reference to `__kunit_do_failed_assertion'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
