Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323282D7DFE;
	Thu, 22 Jan 2026 01:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769043747; cv=none; b=DcC2PWki3GBLdflW6G+gd5JVroTQtRhmFm9u9yooqD0slsMjB3xCojh/0+3sPbNkTIVEcTsqCXaRBdgsTJho+nNnsJjrORsL8HyGH93niWsFHUFQy4GylmCCdfxesTSSCxQP91VYW6hgQmWjp37kxGZP5vufCy7jl2VeEJhUvOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769043747; c=relaxed/simple;
	bh=irmdqQqaeW9eWMg4tslEgtnUl7Z17EL7bWFi6oiAXwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i67BNXvPZc1M0FNcRl7IqCC9lpwm70fkOeDmOzD65vfxqaiRvDh5ukrCRMzaqcBYXkwpj+/hWcPSeP6Q1wpZFW/dobJDOuMgVCPrWf8lXSe2HIcTgEryNs0tqxR83U9XUan5GgHaiunmTHor3YjsAHwWeB5hEqCepCMW4EKy1Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EA1JTIHw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EA1JTIHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769043745; x=1800579745;
  h=date:from:to:cc:subject:message-id;
  bh=irmdqQqaeW9eWMg4tslEgtnUl7Z17EL7bWFi6oiAXwE=;
  b=EA1JTIHwNZk1Gy+gCLRQmPd2xuiFo/u2BBA5CoAEw+7y7heNte4RNW1r
   PBYXJsvf2pb0S/oEsF3Uj1XKvsioRYCpjQ5T52rs77VfoPhzKq8sYTgQu
   n9qxeunspXypDb4tvhSL67q46uuWJZe9Td6Y0jPcwITLmSMKw+eteW9wF
   8m1g5tSbc8akaOvkgj82z/mFYkHlEVeRi+WafDr95/6SN91+Xq79xbXXt
   0qpVMQqiquw85zF3fy2SsGmkf810AP4UVE/8Mhu3lCY4xpOll6+4jMS6o
   kvDMbk25+8h6xw7zRGFBLwbkla/CkmsVfxKLz0zvYegCtcijwcvM9WJ5B
   Q==;
X-CSE-ConnectionGUID: tAoxgQk5QOCj9BVdPG0KwA==
X-CSE-MsgGUID: yEG7YSC5TKWjTU5UwmzvZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80904049"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="80904049"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:02:24 -0800
X-CSE-ConnectionGUID: BZzBE2RZSx2nj3zCaoDsjQ==
X-CSE-MsgGUID: 2XSrve9/QxKxB5PWXsltMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206646354"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Jan 2026 17:02:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vij5Y-00000000SEF-0rqn;
	Thu, 22 Jan 2026 01:02:20 +0000
Date: Thu, 22 Jan 2026 09:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/alternatives/info 1/1]
 arch/arm64/kernel/alternative.c:147:13: warning: stack frame size (2096)
 exceeds limit (2048) in 'summarize_alternatives'
Message-ID: <202601220850.IkhfN9qs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/alternatives/info
head:   ee8dd3d5de66e92a98896d6f316a71ec815cd51e
commit: ee8dd3d5de66e92a98896d6f316a71ec815cd51e [1/1] HACK: arm64: alternatives: dump summary of alternatives
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260122/202601220850.IkhfN9qs-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220850.IkhfN9qs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220850.IkhfN9qs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/alternative.c:147:13: warning: stack frame size (2096) exceeds limit (2048) in 'summarize_alternatives' [-Wframe-larger-than]
     147 | static void summarize_alternatives(const struct alt_region *region)
         |             ^
   1 warning generated.


vim +/summarize_alternatives +147 arch/arm64/kernel/alternative.c

   141	
   142	#define for_each_region_alt(region, alt)		\
   143		for (struct alt_instr *alt = (region)->begin;	\
   144		     (alt) < (region)->end;			\
   145		     (alt)++)
   146	
 > 147	static void summarize_alternatives(const struct alt_region *region)
   148	{
   149		unsigned int entries[ARM64_NCAPS] = { 0 };
   150		unsigned int orig_len[ARM64_NCAPS] = { 0 };
   151		unsigned int repl_len[ARM64_NCAPS] = { 0 };
   152		unsigned int callbacks[ARM64_NCAPS] = { 0 };
   153	
   154		unsigned int total_entries = 0;
   155		unsigned int total_orig = 0;
   156		unsigned int total_repl = 0;
   157		unsigned int total_callbacks = 0;
   158	
   159		for_each_region_alt(region, alt) {
   160			int cap = ALT_CAP(alt);
   161	
   162			entries[cap]++;
   163			total_entries++;
   164	
   165			orig_len[cap] += alt->orig_len;
   166			total_orig += alt->orig_len;
   167	
   168			repl_len[cap] += alt->alt_len;
   169			total_repl += alt->alt_len;
   170	
   171			if (ALT_HAS_CB(alt)) {
   172				callbacks[cap]++;
   173				total_callbacks++;
   174			}
   175		}
   176	
   177		pr_info("Alternatives summary:\n"
   178			"    entries:      %6u (%6zu bytes)\n"
   179			"      standard:   %6d\n"
   180			"      callback:   %6d\n"
   181			"    instructions: %6u (%6u bytes)\n"
   182			"    replacements: %6u (%6u bytes)\n",
   183			total_entries,	total_entries * sizeof (struct alt_instr),
   184			total_entries - total_callbacks,
   185			total_callbacks,
   186			total_orig / AARCH64_INSN_SIZE, total_orig,
   187			total_repl / AARCH64_INSN_SIZE, total_repl);
   188	
   189		for (int i = 0; i < ARM64_NCAPS; i++) {
   190			if (!entries[i])
   191				continue;
   192	
   193			pr_info("cpucap %3d => entries: %6d, orig: %6d, repl: %6d, cb: %6d\n",
   194				i,
   195				entries[i],
   196				orig_len[i] / AARCH64_INSN_SIZE,
   197				repl_len[i] / AARCH64_INSN_SIZE,
   198				callbacks[i]);
   199		}
   200	}
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
