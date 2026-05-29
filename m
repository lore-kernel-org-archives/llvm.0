Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4033612F8;
	Fri, 29 May 2026 18:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780077641; cv=none; b=SyYQOR188oJPK1YALyN0cflDia617yQXqZ0oU45gg+k2/yxgMpJH4k0eayhVvupwb5hMWy1GB4CF/lOzoEitQIn0zNg5hrZ+NQsesBAgq1iLmvwpLmYwxWTHH5w8vz8CmOwnNZEYuQYpvmBvXmRcbmz4DUReSGv+KhxoK3m7L9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780077641; c=relaxed/simple;
	bh=U18HE6s1nIUNcZLoOifyH+0a+S519C7SIn5dTwYT64o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NuJbg4QDbl4CKywFq7ou8MZCb81oWhuXV6UAr1dqCyWJoQ3Na5wJ9Y6kYGGpu+pJKJoayW30ery9hYzz04imJ2l2qNrBifp0BRjoRf9mBY24+NDEQQgtIjgh5w6geaj7+A9Jt2YSUfB0GeSU3TdFwK353NjVE0OumAU/wXE+kL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9pkjnaZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9pkjnaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780077640; x=1811613640;
  h=date:from:to:cc:subject:message-id;
  bh=U18HE6s1nIUNcZLoOifyH+0a+S519C7SIn5dTwYT64o=;
  b=M9pkjnaZacuQXlHGCAm/xkBu/il2goU6bNK85glDOLPsGR9AWnl4k+og
   L2OblEfYxECNWlXk0uo613XWvhGm20YjDRaEDXWAJXjHt350v3N0Pczx0
   ChOzS8+fcYogEWXeLS3R9bVQi4a5B8PVmqc/Mfdm6ZIWHt45QR7e3xwCo
   bDOd1IbbXyjesI+1cJpOzr6+lm1NJCE/g6NRD/dkqjcnG55lK22flM9L/
   WgOCJXeDJPlQmkD/gpLBrY9O5rqWea5WzbgoaE1oqolV4u0IFJNpkXc44
   nEv1jWjmk2ftedcgkfKi+JTQ08O8Y12ZGio321mecDc79UBNPHRwyD1g4
   w==;
X-CSE-ConnectionGUID: dp5Q2TLmTOy6hVv1kD5x3A==
X-CSE-MsgGUID: DQoB5EDZQxamRhpqSz2uFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="92317763"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="92317763"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 11:00:39 -0700
X-CSE-ConnectionGUID: 7vvR/ShDS2WPZIxzKSisig==
X-CSE-MsgGUID: SGuAmygKRIOg5CbYKU8GRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="236555635"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 29 May 2026 11:00:38 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT1Vc-000000000vN-0WeV;
	Fri, 29 May 2026 18:00:36 +0000
Date: Fri, 29 May 2026 20:00:25 +0200
From: kernel test robot <lkp@intel.com>
To: Tomas Glozar <tglozar@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglozar:rtla-for-next 17/26]
 tools/tracing/rtla/tests/scripts/lib/get_workload_pids.sh: warning: ignored
 by one of the .gitignore files
Message-ID: <202605291919.eszupseg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglozar/linux.git rtla-for-next
head:   db956bcf8d681b5a01ebe04c79f6a7b29b9934f9
commit: 48209d763c22354c78f6138f4a83814c2f2a3578 [17/26] rtla: Add libsubcmd dependency
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260529/202605291919.eszupseg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291919.eszupseg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291919.eszupseg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> tools/tracing/rtla/tests/scripts/lib/get_workload_pids.sh: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
