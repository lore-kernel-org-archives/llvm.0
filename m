Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031E42D7DD5;
	Thu, 19 Mar 2026 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773885301; cv=none; b=NulJ3PV+kgh3Ekhvh0eiclCKHKlEJ/HzmaAkCVo1Yoa327/WIMaXcilG3R7jxT6YFPGH9wCXPwrt3eYB03HYE3v/BYtaoPGWwStWHm4vagt0N6SElCQq+JXCokqjOqfw7wrLBDw/tLRqAq+zTUUU50cdvnF7FF0wVE24H4oUUNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773885301; c=relaxed/simple;
	bh=xOqFZex+b1X/Wd5nti3IxGFhSOwnjIhNul3qZM6DJCo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JcOqnEC195flJDp1PTxx51aQ3Sp0nJHrtKNr25tCT87kPZhqsFHvjXcRgORr0oufoxx1+prcgthybbsG8U1KxhDURrvlzywq1NxzMKKfmZblOoPqS3ErJRHQZa/2oG0ApVxgALjEST1Rb7NrHiSgHEpFkphxCnTr7SBR/Tm8+6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFTPLPn1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFTPLPn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773885298; x=1805421298;
  h=date:from:to:cc:subject:message-id;
  bh=xOqFZex+b1X/Wd5nti3IxGFhSOwnjIhNul3qZM6DJCo=;
  b=FFTPLPn1igYpy6hfwNTxfWzd/AdFkBCZ5dirKYZDOncIs4nxZVlUBgoQ
   07RPZcUsEwE4/6x6VmEs9s73C9UWjRuqYeraZL0TB7cEsRzFhzKBgmLbW
   Kb7LxKTwBNpnB7yetY7Y28ohLWhX4+GfQBCe3+Q59rhQ7fo8xPlc/j0gy
   0ApPRangcVFdwJgVsa5+22UP5TBI2u0z1bMvkpMSx/iVpjjfREuGDLAiJ
   6l5mU1YjAit1uR2pOrQWrE/mMZC23uO1Y98Ku1NomAUMaBLjnJQOvMmup
   8LCkADyt0oN/rwuSfAXGRtfUkWlpgMGkIb0Ml7ZMG5aRNf2bRWDWv35YP
   w==;
X-CSE-ConnectionGUID: 0hRJBXXDT/29wqpRezl+9A==
X-CSE-MsgGUID: S9w1BApeS0OsiXf0+nFmPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86430495"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="86430495"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 18:54:57 -0700
X-CSE-ConnectionGUID: o94INmWnSR6427nj0uflEw==
X-CSE-MsgGUID: fG+lxW20TgevoR6L9YnnmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="260705206"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 18:54:55 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w32az-000000000Bp-0QEA;
	Thu, 19 Mar 2026 01:54:53 +0000
Date: Thu, 19 Mar 2026 09:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [linux-next:master 6002/7246]
 drivers/gpu/drm/xe/xe_lrc.c:1922:7: error: format specifies type 'unsigned
 long' but the argument has type 'int'
Message-ID: <202603190925.XTQEcJ0B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: 65fcf19cb36bf43c893c3444d5bd120006cb843d [6002/7246] drm/xe: Include running dword offset in default_lrc dumps
config: i386-randconfig-017-20260319 (https://download.01.org/0day-ci/archive/20260319/202603190925.XTQEcJ0B-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190925.XTQEcJ0B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190925.XTQEcJ0B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_lrc.c:1922:7: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    1921 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_NOOP (%d dwords)\n",
         |                                    ~~~~~
         |                                    %#5x
    1922 |                            dw - num_noop - start, inst_header, num_noop);
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:1927:7: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    1926 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_TOPOLOGY_FILTER\n",
         |                                    ~~~~~
         |                                    %#5x
    1927 |                            dw - start, inst_header);
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:1932:7: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    1931 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_BATCH_BUFFER_END\n",
         |                                    ~~~~~
         |                                    %#5x
    1932 |                            dw - start, inst_header);
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:1947:7: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    1946 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_LOAD_REGISTER_IMM: %d regs\n",
         |                                    ~~~~~
         |                                    %#5x
    1947 |                            dw - start, inst_header, (numdw - 1) / 2);
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:1950:8: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    1949 |                         drm_printf(p, "LRC[%#5lx]  =  - %#6x = %#010x\n",
         |                                            ~~~~~
         |                                            %#5x
    1950 |                                    &dw[i] - start, dw[i], dw[i + 1]);
         |                                    ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:1955:7: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    1954 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_LOAD_REGISTER_MEM: %s%s\n",
         |                                    ~~~~~
         |                                    %#5x
    1955 |                            dw - start, inst_header,
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:1960:8: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    1959 |                         drm_printf(p, "LRC[%#5lx]  =  - %#6x = %#010llx\n",
         |                                            ~~~~~
         |                                            %#5x
    1960 |                                    dw - start,
         |                                    ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:1964:8: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    1963 |                         drm_printf(p, "LRC[%#5lx]  =  - %*ph (%s)\n",
         |                                            ~~~~~
         |                                            %#5x
    1964 |                                    dw - start, (int)sizeof(u32) * (numdw - 1),
         |                                    ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:1970:7: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    1969 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_FORCE_WAKEUP\n",
         |                                    ~~~~~
         |                                    %#5x
    1970 |                            dw - start, inst_header);
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:1975:7: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    1974 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] unknown MI opcode %#x, likely %d dwords\n",
         |                                    ~~~~~
         |                                    %#5x
    1975 |                            dw - start, inst_header, opcode, numdw);
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:2010:2: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    2010 |         MATCH(STATE_BASE_ADDRESS);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:2002:7: note: expanded from macro 'MATCH'
    2001 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] " #cmd " (%d dwords)\n", \
         |                                    ~~~~~
    2002 |                            dw - start, *dw, numdw); \
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:2011:2: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    2011 |         MATCH(STATE_SIP);
         |         ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:2002:7: note: expanded from macro 'MATCH'
    2001 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] " #cmd " (%d dwords)\n", \
         |                                    ~~~~~
    2002 |                            dw - start, *dw, numdw); \
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:2012:2: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    2012 |         MATCH(GPGPU_CSR_BASE_ADDRESS);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:2002:7: note: expanded from macro 'MATCH'
    2001 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] " #cmd " (%d dwords)\n", \
         |                                    ~~~~~
    2002 |                            dw - start, *dw, numdw); \
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:2013:2: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    2013 |         MATCH(STATE_COMPUTE_MODE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:2002:7: note: expanded from macro 'MATCH'
    2001 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] " #cmd " (%d dwords)\n", \
         |                                    ~~~~~
    2002 |                            dw - start, *dw, numdw); \
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:2014:2: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
    2014 |         MATCH3D(3DSTATE_BTD);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:2007:7: note: expanded from macro 'MATCH3D'
    2006 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] " #cmd " (%d dwords)\n", \
         |                                    ~~~~~
    2007 |                            dw - start, *dw, numdw); \
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_lrc.c:2015:2: error: format specifies type 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]


vim +1922 drivers/gpu/drm/xe/xe_lrc.c

  1902	
  1903	static int dump_mi_command(struct drm_printer *p,
  1904				   struct xe_gt *gt,
  1905				   u32 *start,
  1906				   u32 *dw,
  1907				   int remaining_dw)
  1908	{
  1909		u32 inst_header = *dw;
  1910		u32 numdw = instr_dw(inst_header);
  1911		u32 opcode = REG_FIELD_GET(MI_OPCODE, inst_header);
  1912		int num_noop;
  1913	
  1914		/* First check for commands that don't have/use a '# DW' field */
  1915		switch (inst_header & MI_OPCODE) {
  1916		case MI_NOOP:
  1917			num_noop = 1;
  1918			while (num_noop < remaining_dw &&
  1919			       (*(++dw) & REG_GENMASK(31, 23)) == MI_NOOP)
  1920				num_noop++;
  1921			drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_NOOP (%d dwords)\n",
> 1922				   dw - num_noop - start, inst_header, num_noop);
  1923			return num_noop;
  1924	
  1925		case MI_TOPOLOGY_FILTER:
  1926			drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_TOPOLOGY_FILTER\n",
  1927				   dw - start, inst_header);
  1928			return 1;
  1929	
  1930		case MI_BATCH_BUFFER_END:
  1931			drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_BATCH_BUFFER_END\n",
  1932				   dw - start, inst_header);
  1933			/* Return 'remaining_dw' to consume the rest of the LRC */
  1934			return remaining_dw;
  1935		}
  1936	
  1937		/*
  1938		 * Any remaining commands include a # of dwords.  We should make sure
  1939		 * it doesn't exceed the remaining size of the LRC.
  1940		 */
  1941		if (xe_gt_WARN_ON(gt, numdw > remaining_dw))
  1942			numdw = remaining_dw;
  1943	
  1944		switch (inst_header & MI_OPCODE) {
  1945		case MI_LOAD_REGISTER_IMM:
  1946			drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_LOAD_REGISTER_IMM: %d regs\n",
  1947				   dw - start, inst_header, (numdw - 1) / 2);
  1948			for (int i = 1; i < numdw; i += 2)
  1949				drm_printf(p, "LRC[%#5lx]  =  - %#6x = %#010x\n",
  1950					   &dw[i] - start, dw[i], dw[i + 1]);
  1951			return numdw;
  1952	
  1953		case MI_LOAD_REGISTER_MEM & MI_OPCODE:
  1954			drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_LOAD_REGISTER_MEM: %s%s\n",
  1955				   dw - start, inst_header,
  1956				   dw[0] & MI_LRI_LRM_CS_MMIO ? "CS_MMIO " : "",
  1957				   dw[0] & MI_LRM_USE_GGTT ? "USE_GGTT " : "");
  1958			if (numdw == 4)
  1959				drm_printf(p, "LRC[%#5lx]  =  - %#6x = %#010llx\n",
  1960					   dw - start,
  1961					   dw[1], ((u64)(dw[3]) << 32 | (u64)(dw[2])));
  1962			else
  1963				drm_printf(p, "LRC[%#5lx]  =  - %*ph (%s)\n",
  1964					   dw - start, (int)sizeof(u32) * (numdw - 1),
  1965					   dw + 1, numdw < 4 ? "truncated" : "malformed");
  1966			return numdw;
  1967	
  1968		case MI_FORCE_WAKEUP:
  1969			drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_FORCE_WAKEUP\n",
  1970				   dw - start, inst_header);
  1971			return numdw;
  1972	
  1973		default:
  1974			drm_printf(p, "LRC[%#5lx]  =  [%#010x] unknown MI opcode %#x, likely %d dwords\n",
  1975				   dw - start, inst_header, opcode, numdw);
  1976			return numdw;
  1977		}
  1978	}
  1979	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
