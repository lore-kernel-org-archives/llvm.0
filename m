Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D451FAC33;
	Fri, 21 Feb 2025 04:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740111972; cv=none; b=dRFjCogEXXJO/0QyZ0A8wfxm3EOxlByr9lLJMqhAdFhVMZFgV4RNhDUJaj+Yl01JL/r1sh+DRaSpqo7YsM9k3WiYY9BbppZyXozbvUTll+6QfMfLQN8uhTVcuyIj7vg6YFR1n79l91F1WkGZ/inGK8jN2rkmWXHbt5oriQXE7a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740111972; c=relaxed/simple;
	bh=bt02CuM4KdhyT164TSON2y8X1yWDPYrWXVid/i7x2NY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FUh+ob+TvXsmc7YTYAIUwoW2OY/0Lo/jYk/xfujmULjbm9y+s1jBWg1Wh0Ebo9TX3Y8h8NWugwHsPSyGaxT93WK5MtSGpy8vL1Y8bB/2B+j63pjwTks/ZU7qUn57dKPcbM1P5G00EijWg96rAg00FThniVRluJuB9OFoP/C5+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jb4VShQH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jb4VShQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740111970; x=1771647970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bt02CuM4KdhyT164TSON2y8X1yWDPYrWXVid/i7x2NY=;
  b=jb4VShQHXhE8uQzkAtBDONdHCXv2FpVZUimO1R187SlWEUiZtRaMuGcI
   M+zFjmbgR1E2a6SiBVGSxhB9OTc+uY/uwetvpRIC/FQCSfHaVyk0k6Wmw
   1tYZwtH3a96Cu3qaH0Twsh3O3fzEV66YkQHv6N+otdqHEBT5B7Vidtr2R
   FrZjUP1jU7N0sj/kvSOWY0uOT/FI0Oxv7I7RyVqe94HKfI1laM4c9Uny7
   OcH4xrpHzUHznyhNGoP3OLG/o7aadZmFKS5WLUpIefpo51oyF0TFbAqri
   zn08brwUETvljRvs2y3p4BHxh0D15mwUGiAQovZhkZLuEWWeTDS0RARu/
   w==;
X-CSE-ConnectionGUID: 2Xcx31CNRZKS7RFNOvN5dQ==
X-CSE-MsgGUID: k8i8aeUpTKCmswDWw7cfng==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41182294"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="41182294"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 20:26:09 -0800
X-CSE-ConnectionGUID: T9LgCSM5R02IK+Tqy/p1Pw==
X-CSE-MsgGUID: zqlqrFpYTQGeo+v3yGenoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="115452539"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2025 20:26:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlKc1-00056o-1f;
	Fri, 21 Feb 2025 04:26:05 +0000
Date: Fri, 21 Feb 2025 12:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4579/5164]
 arch/x86/kernel/cpu/mce/severity.c:305:15: error: call to undeclared
 function 'FIELD_GET'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202502211226.wBvLAdwM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   50a0c754714aa3ea0b0e62f3765eb666a1579f24
commit: 599382062e7b91fb049e339db93c3a0b840d2b6e [4579/5164] x86/mce: add EX_TYPE_EFAULT_REG as in-kernel recovery context to fix copy-from-user operations regression
config: i386-buildonly-randconfig-006-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211226.wBvLAdwM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211226.wBvLAdwM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211226.wBvLAdwM-lkp@intel.com/

Note: the linux-next/master HEAD 50a0c754714aa3ea0b0e62f3765eb666a1579f24 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/mce/severity.c:16:
   In file included from arch/x86/include/asm/traps.h:6:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2318:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/kernel/cpu/mce/severity.c:305:15: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     305 |         fixup_type = FIELD_GET(EX_DATA_TYPE_MASK, e->data);
         |                      ^
   1 warning and 1 error generated.


vim +/FIELD_GET +305 arch/x86/kernel/cpu/mce/severity.c

   275	
   276	/*
   277	 * If mcgstatus indicated that ip/cs on the stack were
   278	 * no good, then "m->cs" will be zero and we will have
   279	 * to assume the worst case (IN_KERNEL) as we actually
   280	 * have no idea what we were executing when the machine
   281	 * check hit.
   282	 * If we do have a good "m->cs" (or a faked one in the
   283	 * case we were executing in VM86 mode) we can use it to
   284	 * distinguish an exception taken in user from from one
   285	 * taken in the kernel.
   286	 */
   287	static noinstr int error_context(struct mce *m, struct pt_regs *regs)
   288	{
   289		const struct exception_table_entry *e;
   290		int fixup_type, imm;
   291		bool copy_user;
   292	
   293		if ((m->cs & 3) == 3)
   294			return IN_USER;
   295	
   296		if (!mc_recoverable(m->mcgstatus))
   297			return IN_KERNEL;
   298	
   299		e = search_exception_tables(m->ip);
   300		if (!e)
   301			return IN_KERNEL;
   302	
   303		/* Allow instrumentation around external facilities usage. */
   304		instrumentation_begin();
 > 305		fixup_type = FIELD_GET(EX_DATA_TYPE_MASK, e->data);
   306		imm  = FIELD_GET(EX_DATA_IMM_MASK,  e->data);
   307		copy_user  = is_copy_from_user(regs);
   308		instrumentation_end();
   309	
   310		switch (fixup_type) {
   311		case EX_TYPE_UACCESS:
   312			if (!copy_user)
   313				return IN_KERNEL;
   314			m->kflags |= MCE_IN_KERNEL_COPYIN | MCE_IN_KERNEL_RECOV;
   315			return IN_KERNEL_RECOV;
   316		case EX_TYPE_IMM_REG:
   317			if (!copy_user || imm != -EFAULT)
   318				return IN_KERNEL;
   319			m->kflags |= MCE_IN_KERNEL_COPYIN | MCE_IN_KERNEL_RECOV;
   320			return IN_KERNEL_RECOV;
   321		case EX_TYPE_FAULT_MCE_SAFE:
   322		case EX_TYPE_DEFAULT_MCE_SAFE:
   323			m->kflags |= MCE_IN_KERNEL_RECOV;
   324			return IN_KERNEL_RECOV;
   325	
   326		default:
   327			return IN_KERNEL;
   328		}
   329	}
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
