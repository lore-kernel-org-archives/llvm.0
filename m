Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B73F301493;
	Mon, 18 May 2026 22:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779144129; cv=none; b=I6QBpbA4o1qqb+zo7lrNRqtJ1yR9W/7gY9QgEyWPnw+7nZL3wUP5k9PGC1bRMCtq9LRJZMTz/v2Dg3WDPKX6ZuIfjjENkln3XDH4RE5Aqj09FOayN1D30PNI4JC7wZP4+5Z49YVsn9oa5OG1ykhSFimswroPvzG8UROFNhe7+kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779144129; c=relaxed/simple;
	bh=QUF3qlbovQZFCQJ4/y8rs4c5u/HMKog2D6YBkY63KjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QmEfV+31uzFvE1SE5iS8z/5Cs1drIkc27Omr086F/lS4GLw4OuhN9WECPINWcxiEidtDe2hW5rN4puwghdBnNpqiDG5QakEVtN3NYbwq5KcRmSnQk9iblu/TDSSQ2dFJW52IWoO3fmZesssgpi27amGUHLFcuMaruNZrNIqSvCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGbbeiga; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGbbeiga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779144128; x=1810680128;
  h=date:from:to:cc:subject:message-id;
  bh=QUF3qlbovQZFCQJ4/y8rs4c5u/HMKog2D6YBkY63KjI=;
  b=FGbbeiga9o8gsxRl49qJeTkqKuygC5P7R4fCUWVO5TqYQo5d6TTpx+nh
   lwfpFRwl9yS/r46/5/9wklFR9rzWevnQ/iOc92TMIK+v3Z16txdS5PNGN
   n0VrvaxzRf0b/gvtZzYLyrNd38CIOqXHnMj1OB/NpVULKjzdeeV0V10VY
   BHr61SaOHVO4w/aheDN17ohlbiqAt3LCFi56AF9HG4XIdJwFftUE+0vSf
   mGBZ1RTmFvw+tPRuDSWvjy/CNjczmFfArzn3ILiVhdWrOmf700aGtlUDW
   STbr+WEhd0hCWhzThGXU/2HHyu4Pr/KfoJh1fS3FjA9ALKvbmP++7+DKe
   A==;
X-CSE-ConnectionGUID: pEv2jYgySg+cwX4ak/1teg==
X-CSE-MsgGUID: sCsRS+9OTBaTLr0P1ezbxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90319584"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="90319584"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 15:42:07 -0700
X-CSE-ConnectionGUID: mciIrCEbS1K2ZZ8Lw6qQuw==
X-CSE-MsgGUID: Np2Iro2XRE6hkXix7PSSsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="238743944"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 18 May 2026 15:42:05 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP6ex-000000009yx-2JKf;
	Mon, 18 May 2026 22:42:03 +0000
Date: Tue, 19 May 2026 00:41:36 +0200
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 22/238]
 drivers/cpufreq/amd-pstate-ut.c:46:1: error: unterminated function-like macro
 invocation
Message-ID: <202605190039.7ffnGQhe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 378df8f85b52efc8ab80beabeb3d4a7d8290840c [22/238] cpufreq/amd-pstate-ut: replace __get_free_page() with kmalloc()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260519/202605190039.7ffnGQhe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190039.7ffnGQhe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190039.7ffnGQhe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/amd-pstate-ut.c:46:1: error: unterminated function-like macro invocation
      46 | DEFINE_FREE(cleanup_page, void *, if (_T) kfree((void *)(unsigned long)_T)
         | ^
   include/linux/cleanup.h:210:9: note: macro 'DEFINE_FREE' defined here
     210 | #define DEFINE_FREE(_name, _type, _free) \
         |         ^
   1 error generated.


vim +46 drivers/cpufreq/amd-pstate-ut.c

    41	
    42	static char *test_list;
    43	module_param(test_list, charp, 0444);
    44	MODULE_PARM_DESC(test_list,
    45		"Comma-delimited list of tests to run (empty means run all tests)");
  > 46	DEFINE_FREE(cleanup_page, void *, if (_T) kfree((void *)(unsigned long)_T)
    47	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
