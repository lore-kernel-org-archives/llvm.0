Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A714230C360;
	Fri, 20 Mar 2026 17:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029397; cv=none; b=O4cyZkb/Eyp4AZeXrdKDR9do5ZO/XGqv+fkwrZbph9T8JTn64yJFxrwlo1ALObrHoeBIIQR4qdE2Ns0PwH8zKxU6OIB0KlYPsmdfORhvAl2LNuMKqPEP4eSd5f3jj5992F+7ubrYQr2NuChtjf4V14PvdYFhXDwQUrIMmH+VYc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029397; c=relaxed/simple;
	bh=fQsHOZsTcm/+D2tuDGUQ+SoCD+nZWXn0CvMhtnAF7FY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hwTaJVfvM/p+R+fe9Io80QDC1njY7uAjMkyB6nyOIwzUmADWUuR+lv4PdyBqqiGQHjUeXRsMeVNMH+DCxgFcObFfKNYvyfiBSZuLxtEwX2nQ4yhxc36DmW9bjIY0d34sn7tuJ6oJTWivlq1aMeCxGrzSh2RihRv6PAZMDZUU3NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXdVghUa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXdVghUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774029396; x=1805565396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fQsHOZsTcm/+D2tuDGUQ+SoCD+nZWXn0CvMhtnAF7FY=;
  b=bXdVghUaVfgSFVAR7DT51gm7KqfYfbmr8/aYQVBJM/1LORUD2zj6kCBl
   6yVSa1F655F6CtTH4GJc1Jnz+zrYCs63J8gS/J9CDJyR9A1K3YG39IA1L
   tVF+ulLkwvkqCPQhHBDpOtT/sAn9hEI8jyeCuOm/HizCsldSI9X7zTyM+
   QL/4KnlwnUphDrY8Slr8xeFM/0O3R/y2H9vE3doUPjkFcUTlNW3GFA8Gv
   eaWXCKLP1dwn/9pRq6v7jyPTi86wQhit6b9y2SKRNKKJOJAozYn3a7yQZ
   O5wNScsOdxlWEjM1/v47qXMJ7Kbpxqr0JOXskrBjq3d5nEo4szQ9S55nJ
   Q==;
X-CSE-ConnectionGUID: 47eRn6kATFaowDI1tNEPhg==
X-CSE-MsgGUID: aJIl4b4iRvmjdSYxUj/rbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86484995"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86484995"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 10:56:36 -0700
X-CSE-ConnectionGUID: iYxQ1t3QRhOd+Z0m2NdHJg==
X-CSE-MsgGUID: iBUbfSrhTQK5hvO2Sl1vrQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Mar 2026 10:56:35 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3e5I-0000000055R-3nWC;
	Fri, 20 Mar 2026 17:56:32 +0000
Date: Fri, 20 Mar 2026 18:56:24 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 18/44]
 kernel/time/benchmarks.c:38:3: warning: variable 'count' is uninitialized
 when used here
Message-ID: <202603201851.3zVB9KXq-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260320/202603201851.3zVB9KXq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201851.3zVB9KXq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201851.3zVB9KXq-lkp@intel.com/

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
