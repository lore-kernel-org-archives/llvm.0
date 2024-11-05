Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBD71FDF95;
	Tue,  5 Nov 2024 07:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730791756; cv=none; b=msT6EiihYVMykn1B31leu1vrr8YtlEFajcI2esGdbDYdTT0iRMMyuypOPWO5Ze5WKRWRTzGrIaGELepzm0N/Et8bVeyp7jAvANgqgt6Q82gbyKkxhFRzMfxDZEwGBZ02sxuISM9YU+Akqt7V8nEMc2Hgs1PiKsmthID3M2JKEqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730791756; c=relaxed/simple;
	bh=X+z7msgLpX9JB56ZQQIwgKPcWw5GynzBptx5KReF1FM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VMz8O7WJRGkjlItVLSjUyKb/yxAyr4rHlR2n7fzxl/Z2AlSRG8DdwKnZP5a2DjbdcnrHGWGI/WqVcpqaZJnWMpwYFONjPQu7CYHi//DJbV+JnRKWo2SYnsBP502/qKuozBkno34d9lJ8v5VTfeMfwXrW85d+rmy8BwjE7KYfwrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwNNhj7y; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwNNhj7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730791754; x=1762327754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X+z7msgLpX9JB56ZQQIwgKPcWw5GynzBptx5KReF1FM=;
  b=lwNNhj7yQP8PtahtZAYuNcYh3nacKNYkLJC+JuXkFtLw5ZeicEhciwzB
   sWsZDU5vPNp0bYU/dDGBC/CD3f9KLW8WAGcWXytTpJmkDEpQQdsqbZyJz
   S/i7Uln4SVsUrhVgX80ZOP7wZWKKGyIrbmUj0cKEf7XTBNadaasL4tulo
   +JSM6DJ31oZQL3/Jxy5k9IyhdRplfTQmnD1NY74EdlfMwjY3dubvMvVQA
   yAABw0VWW/AsGFM48CWubM+hei3qY2akpQz3i0fHRIuIJAuYajtgX60cv
   Sr62831fEJjk1mwlMBDKTHNFBmxQJ2ko6cohUanQYhUa1wQIlCQNaLmbp
   w==;
X-CSE-ConnectionGUID: M79YHTeLTkyG/9XZKofqjQ==
X-CSE-MsgGUID: SO9SpDW7Ti6SN9/zyU3DaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30681936"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30681936"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 23:29:14 -0800
X-CSE-ConnectionGUID: 4K81liZHQF24TeLDOuE5kw==
X-CSE-MsgGUID: hFdpWcGrT6exJJqDxw79LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84007254"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Nov 2024 23:29:13 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Dzz-000llx-0J;
	Tue, 05 Nov 2024 07:29:11 +0000
Date: Tue, 5 Nov 2024 15:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 10/11]
 arch/x86/um/../kernel/module.c:undefined reference to
 `apply_direct_call_offset'
Message-ID: <202411051526.d40oDzdu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   62e8598e1d31c62fc827b23173786c9a5a525fb0
commit: f8c0cdd341a8c29884b35532fd9638a2b320b286 [10/11] x86/ibt: Implement IBT+
config: um-defconfig (https://download.01.org/0day-ci/archive/20241105/202411051526.d40oDzdu-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051526.d40oDzdu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051526.d40oDzdu-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: arch/x86/kernel/module.o: in function `module_finalize':
>> arch/x86/um/../kernel/module.c:(.ltext+0x4c5): undefined reference to `apply_direct_call_offset'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
