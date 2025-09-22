Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5B28F4;
	Mon, 22 Sep 2025 00:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758501199; cv=none; b=gAdhU95cZqwcTMu7lGWEg9rN8SvKDC9tB0jLpVqNU425QjPH1PlkJxcOe/Kkuk7bJD8TU/OWkdPfnM7PTjD5TgqFU0VbzjB/IYdsscE4LHDyVbsETTWzF4PKZKBwphboRsDvtsPstYTjADIq3+1fnmDVmFmcV9Yvl9o5i3ScCdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758501199; c=relaxed/simple;
	bh=awpE36ikUPb0lLSYteeAWPcKy+83wGuoBNtXyy6Ox0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VKDC1+EWmq8h5jv+EH77bhR7iKwIDO60hkg9WP59o5fwgQD22OsAEAR1WPrjkVjrZi7gfmBIBDEVg36kGYIRTLlMfF0EKjYPq5hJFMHXCagdEnvFBgvFUG32f2rXZ79/hnDb97oSDP2sc+H9QdGqVSF493C/afG0rwtE3uUvAso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1AakOOp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1AakOOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758501197; x=1790037197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awpE36ikUPb0lLSYteeAWPcKy+83wGuoBNtXyy6Ox0Q=;
  b=L1AakOOpwbbInPRzXiGh5rkM9+XfGDdwPcttJjn+mFi+FiCNALsFty0K
   Y2YCx82R9JkI9QrYbug5m71sqln/eaS6j+G7tyypRwhbmkJNGa4i6rgqa
   p0bYbMSaOV00if+GiDQY18WpsrDKD09JwTmRPe67wq231RGAAzeRgnUgu
   PtNArrcS6MhL5MauMtxkOsJe5wGu/n8/kh2J5GqQSC8/h2chOqck7yH6k
   lSZY9CYh7VtYjNW4zYS25+ynPJhic7FKpd6ztOm8gGjOFbqMkfrAPZkUH
   BN4pOl1yeodsHYJGjmbGcDvQOJJvUNUxXViLzIJGLSCr2BPFQHZnZ29+Z
   g==;
X-CSE-ConnectionGUID: 1OdJwYxJRbiMwcOOLSLpfQ==
X-CSE-MsgGUID: LeMH45YbSjO5aqezPfgVfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="59978240"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="59978240"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 17:33:16 -0700
X-CSE-ConnectionGUID: BorouL+uQ0yTkm3q15tq3A==
X-CSE-MsgGUID: UwJYpMEPQXCMS5Lz9gUoHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="175939910"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Sep 2025 17:33:15 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0UTq-000189-1b;
	Mon, 22 Sep 2025 00:32:55 +0000
Date: Mon, 22 Sep 2025 08:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [avpatel:riscv_trace_support_v1 90/112]
 ./include/generated/asm-offsets.h:334:9: warning: 'NR_CPUS' macro redefined
Message-ID: <202509220823.kj1Ly6Dl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   51cf336923f3dbd94a86c3dd03443e207aab7f8a
commit: 8b3427f4b14a75a64861188d771ad5fe6b32443b [90/112] drivers: firmware: add riscv SSE support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250922/202509220823.kj1Ly6Dl-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509220823.kj1Ly6Dl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509220823.kj1Ly6Dl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from samples/ftrace/ftrace-direct.c:7:
   In file included from arch/riscv/include/asm/asm-offsets.h:1:
>> ./include/generated/asm-offsets.h:334:9: warning: 'NR_CPUS' macro redefined [-Wmacro-redefined]
   #define NR_CPUS 64 /* NR_CPUS */
           ^
   include/linux/threads.h:21:9: note: previous definition is here
   #define NR_CPUS         CONFIG_NR_CPUS
           ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
