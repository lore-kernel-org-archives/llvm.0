Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB94633A02B;
	Fri, 21 Nov 2025 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763713176; cv=none; b=MKysj1MvFncbls81G2COgOUIk+PaCODcVNwuAb3bFe9/hL7oQNRYwT01Pcr2Bhg3L6FUqlfik04nJWPyoiNmxgZCB1jynFc4xnvsSodp9+Hx046g1V1e4Xei+52PQuq4+L5MJ46Kbl722cO44YJj9LdAaDqVTUZdiF5D65ROJOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763713176; c=relaxed/simple;
	bh=WeVw2cCpWAsE+cWVQTJqe+lGXQDau9BLYcHjtMMTsuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PVKr4jF2LsvSlB7sXr422H7hyEpguWCVDRbtHq3xQujzCCDuuDHqPP8tZxl1YZqc8ciDFAirDbCbBjNsu97+CeSO/KXBKfS3K0K3aYijtFFsJMAWwHmOHjQizt6xBWpP3r8B0K/xuiuSvbYhqwCqqENF23zKnga4SBhj2ABwVyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9ZhtGZE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9ZhtGZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763713173; x=1795249173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WeVw2cCpWAsE+cWVQTJqe+lGXQDau9BLYcHjtMMTsuY=;
  b=f9ZhtGZEDDPiq3zG71qpcKtjt+9FocNBqzvTSu3iMfwEgWmXbesY3Au1
   H2G9DhJ0xMmn3zCTI9akLk8odE40PVepXZPrsxLl79H53dkiIdf20oy1y
   AY70M4/iMHris+sRCXizutRbMNkNfNI0hh43vjHrCqBvS4svhZ5CcD5E9
   d4XPSqNehVWnopQGDYFrBNJ4lsJ9WvUjgn76BSZ5DDOVPtL1zWk617lGJ
   OAEkU0eRGzRijKd6CeQb1IpA11eewQ8yuQRTSNasTUbPHh7npoN0Wwvuc
   zENLD+lnKwGAs9vUYxJ24yoYqU+NbgfdpqJwj6d+Q12jqvsbyEw5R8r1u
   A==;
X-CSE-ConnectionGUID: awZZfwjRRmq5vxxm/tA37g==
X-CSE-MsgGUID: 3lOfUzlmTn2ac7qRHjYRyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65832240"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65832240"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 00:19:33 -0800
X-CSE-ConnectionGUID: HTBF3ikrSh2Ahc3R5u9vEw==
X-CSE-MsgGUID: nl3biUymQHaIUQATLHU5NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="190844894"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Nov 2025 00:19:32 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMMMZ-00056J-30;
	Fri, 21 Nov 2025 08:19:27 +0000
Date: Fri, 21 Nov 2025 16:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops_ci 11/11]
 kernel/bpf/trampoline.c:331:9: error: call to undeclared function
 'direct_ops_del'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202511211659.KNKOM3Kt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops_ci
head:   60a0e23f31d3e7eb62bf1ff14f9efef8de96ac0d
commit: 60a0e23f31d3e7eb62bf1ff14f9efef8de96ac0d [11/11] bpf, x86: Use single ftrace_ops for direct calls
config: s390-randconfig-002-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211659.KNKOM3Kt-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211659.KNKOM3Kt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211659.KNKOM3Kt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:331:9: error: call to undeclared function 'direct_ops_del'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     331 |                 ret = direct_ops_del(tr->fops, tr->ip, old_addr);
         |                       ^
   kernel/bpf/trampoline.c:331:9: note: did you mean 'direct_ops_free'?
   kernel/bpf/trampoline.c:281:13: note: 'direct_ops_free' declared here
     281 | static void direct_ops_free(struct bpf_trampoline *tr) { }
         |             ^
>> kernel/bpf/trampoline.c:345:9: error: call to undeclared function 'direct_ops_mod'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     345 |                 ret = direct_ops_mod(tr->fops, tr->ip, new_addr, lock_direct_mutex);
         |                       ^
   kernel/bpf/trampoline.c:345:9: note: did you mean 'direct_ops_free'?
   kernel/bpf/trampoline.c:281:13: note: 'direct_ops_free' declared here
     281 | static void direct_ops_free(struct bpf_trampoline *tr) { }
         |             ^
>> kernel/bpf/trampoline.c:367:9: error: call to undeclared function 'direct_ops_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     367 |                 ret = direct_ops_add(tr->fops, tr->ip, new_addr);
         |                       ^
   kernel/bpf/trampoline.c:367:9: note: did you mean 'direct_ops_free'?
   kernel/bpf/trampoline.c:281:13: note: 'direct_ops_free' declared here
     281 | static void direct_ops_free(struct bpf_trampoline *tr) { }
         |             ^
   3 errors generated.


vim +/direct_ops_del +331 kernel/bpf/trampoline.c

   324	
   325	static int unregister_fentry(struct bpf_trampoline *tr, void *old_addr)
   326	{
   327		void *ip = tr->func.addr;
   328		int ret;
   329	
   330		if (tr->func.ftrace_managed)
 > 331			ret = direct_ops_del(tr->fops, tr->ip, old_addr);
   332		else
   333			ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, old_addr, NULL);
   334	
   335		return ret;
   336	}
   337	
   338	static int modify_fentry(struct bpf_trampoline *tr, void *old_addr, void *new_addr,
   339				 bool lock_direct_mutex)
   340	{
   341		void *ip = tr->func.addr;
   342		int ret;
   343	
   344		if (tr->func.ftrace_managed) {
 > 345			ret = direct_ops_mod(tr->fops, tr->ip, new_addr, lock_direct_mutex);
   346		} else {
   347			ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, old_addr, new_addr);
   348		}
   349		return ret;
   350	}
   351	
   352	/* first time registering */
   353	static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
   354	{
   355		void *ip = tr->func.addr;
   356		unsigned long faddr;
   357		int ret;
   358	
   359		faddr = ftrace_location((unsigned long)ip);
   360		if (faddr) {
   361			if (!tr->fops)
   362				return -ENOTSUPP;
   363			tr->func.ftrace_managed = true;
   364		}
   365	
   366		if (tr->func.ftrace_managed) {
 > 367			ret = direct_ops_add(tr->fops, tr->ip, new_addr);
   368		} else {
   369			ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, NULL, new_addr);
   370		}
   371	
   372		return ret;
   373	}
   374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
