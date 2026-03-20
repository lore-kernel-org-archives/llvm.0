Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0C82FDC27;
	Fri, 20 Mar 2026 19:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774036552; cv=none; b=L/7IpLQwbxpYbwB+AmFVzpZFgKPLf6ZVLWL4nT4jfq5PGEDjT368U68Os6Jy08ZrHs9qyS3VA9vCu/+srMYerW1C+IdnlsOsLh1++C8VOIFjmQR6hUo9mERLtdFuyxXzhzTAWgb8B3DQd1qsg9yC9irsLRkkjFDH2/iENwwlaWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774036552; c=relaxed/simple;
	bh=6FhfuhqhEKEdsCiTMlrnIL4lm9HgYZh/+htB/xPduXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NQxI40uwaMINzUIRfL0KDFR6wJ92XHlMxxA1h9qiDFJ+2a5f86IwRRZzNEkjoDt3nIhQesBZ372E1wY/blFJul7vL/TMKOhyYvOhQf4jIwTQLjyE6Uk2gFN97utOciHAcNnhCncSLKNZS9ueWse3rrWAkUaBlrXTH+zjTXDCXYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6+FOtWJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6+FOtWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774036551; x=1805572551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6FhfuhqhEKEdsCiTMlrnIL4lm9HgYZh/+htB/xPduXQ=;
  b=G6+FOtWJmuGQa8qPic9zTO35Rm/zxImAEahdbqim/YOWA6Z2otv5/nNe
   g95Drd/cb0q+12lFv2nJnaaNK6nMo7SJG+nJNq9OAX0ie0yvWQUnPGbJV
   iVa2KmnL69RfXaSboDs8qGssIuZHKOve9bQn/QbLtD8T+4IMdRU89ZWr3
   rsfsvhfBzYxS9D2GM9erZpGKo3ThtfDVIFwAQkGdVPGuU2QI1F/fAbFgf
   Dmnz4L4CcotiTLxAFVkgG9SmSXcGkk3Uzen8sMPSH0ZVztAzK4XkE7wtc
   sn1orha8wS+x9iiHD4Qsbluk6g0ZGcQ18gTMBj8qGleU6gIhY8opQ0kyV
   w==;
X-CSE-ConnectionGUID: mqNOXNN3RF6BDo8RB1puMQ==
X-CSE-MsgGUID: xNDDN9+7Tjmh+UMjLKZE2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86204373"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86204373"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 12:55:51 -0700
X-CSE-ConnectionGUID: rBOXCgQmQmWG/PKpxLkrpg==
X-CSE-MsgGUID: 9J/InkcTS26BxtqS4F17/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223414496"
Received: from lkp-server02.sh.intel.com (HELO ef9b23065726) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 Mar 2026 12:55:49 -0700
Received: from kbuild by ef9b23065726 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3fwg-0000000009R-1TXU;
	Fri, 20 Mar 2026 19:55:46 +0000
Date: Sat, 21 Mar 2026 03:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 18/44]
 kernel/time/benchmarks.c:38:3: warning: variable 'count' is uninitialized
 when used here
Message-ID: <202603210311.uHxUmzdy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   40e3ab4d08362c43874fd99e70d6ef6f57f086ef
commit: 7fe24e0ff2f96db84d1ce465aca76bd42c169ab7 [18/44] benchmarks
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260321/202603210311.uHxUmzdy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210311.uHxUmzdy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210311.uHxUmzdy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/benchmarks.c:38:3: warning: variable 'count' is uninitialized when used here [-Wuninitialized]
      38 |                 count++;
         |                 ^~~~~
   kernel/time/benchmarks.c:33:11: note: initialize the variable 'count' to silence this warning
      33 |         u64 count;
         |                  ^
         |                   = 0
   kernel/time/benchmarks.c:56:3: warning: variable 'count' is uninitialized when used here [-Wuninitialized]
      56 |                 count++;
         |                 ^~~~~
   kernel/time/benchmarks.c:50:11: note: initialize the variable 'count' to silence this warning
      50 |         u64 count;
         |                  ^
         |                   = 0
   2 warnings generated.


vim +/count +38 kernel/time/benchmarks.c

    29	
    30	static int benchmark_ktime_get_read(void *data, u64 *value)
    31	{
    32		ktime_t end;
    33		u64 count;
    34	
    35		end = ktime_get() + BENCHMARK_TIME;
    36	
    37		do {
  > 38			count++;
    39		} while (ktime_get() < end);
    40	
    41		*value = count;
    42		return 0;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
