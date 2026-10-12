Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790A3A3E72;
	Mon, 12 Oct 2026 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823850; cv=none; b=h0zlLy3PfN23JAM8ouLjMdLKRJYWLdh8tupVHlQjbvqqOW8oaktrEkftyA1lUehufC4MT4VrdHq2BVz/Shk5LzRV9WByNqDEcRETD7vN7ZWGuz1ueRLAC+V3XpfWFMcSgokYYNzFNjVilCfGqs8jh827RsDvXytADHGaxyujFlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823850; c=relaxed/simple;
	bh=E+ro2ZrnmTJ8dTc56MO6AUi8sFdarGaHq8mAfmTXuwo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XR6Be7ruAYlgIDwGOEJcRrl3iErs/+FVDUjfOrr3+84W2uq+qYDTRSC9uYPW8keHqQVa1JbbaIDsWfbvBN33FYOwZbXo11CJ/rrBzlpSQdbw2lL85x7ZT/o6qoO5GER8YcfbY+EvpV2NrPLPESCNtRHf85cv71gxAsJWmgmPBQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEReF6UE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEReF6UE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791823847; x=1823359847;
  h=date:from:to:cc:subject:message-id;
  bh=E+ro2ZrnmTJ8dTc56MO6AUi8sFdarGaHq8mAfmTXuwo=;
  b=HEReF6UE3OhbFfBuld9JzxjfwPDWOYxNVtdxvb2UclmopyFgg80TrMN0
   +ZFthP2EdKuYxx6gI/Uq7+VeczGGgEtTMfQv/fQllrVtjR+IKu2JLr5bw
   B2aDkc0PbD8O+UUxtXQbi48awFhF2PHUXtFIkGXr+48u24jH7Z0fYikZZ
   5NLrt6PG/udoUTnznI/jbry3GAld4e0jxoCu10525xDdoRJhZ5g4xxTBz
   0z+tODZBjqyL+KkuhNZ7E2jPya7VrOlS0c03zeu/Tskp5sANY85IaoaD3
   rvr7Hd+n3e71IQ4TwBAkQRCzsOVpxjcdUeFdriaaUnCWLJIeLdIxK8VEl
   A==;
X-CSE-ConnectionGUID: Gh5DxpfATGKhUrDW3NZlYg==
X-CSE-MsgGUID: 6+3IlmVwRLuVHeYEMZmP9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="434918"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="434918"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:50:46 -0700
X-CSE-ConnectionGUID: Qmm7Z39nSoKrAw38epfuJg==
X-CSE-MsgGUID: LSMgysKHQCqG94WawhNxzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="982313"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 12 Oct 2026 09:50:44 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGJEY-00000000A8J-11SE;
	Mon, 12 Oct 2026 16:50:42 +0000
Date: Mon, 12 Oct 2026 18:50:35 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/fpsimd/cleanup 9/10]
 arch/arm64/kernel/ptrace.c:1971:11: error: use of undeclared identifier
 'uregs'
Message-ID: <202610121801.9l8bpBTW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/fpsimd/cleanup
head:   5515c91b8b8000d4011b76d8fdfba6751874f943
commit: 3514e4de75688ac8b8d28238e6b432a06942eca4 [9/10] arm64: ptrace: Flush state early in compat_vfp_set()
config: arm64-randconfig-2000-20261012 (https://download.01.org/0day-ci/archive/20261012/202610121801.9l8bpBTW-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610121801.9l8bpBTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610121801.9l8bpBTW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/ptrace.c:1971:11: error: use of undeclared identifier 'uregs'
    1971 |         fpscr = (uregs->fpsr & VFP_FPSCR_STAT_MASK) |
         |                  ^~~~~
   arch/arm64/kernel/ptrace.c:1972:4: error: use of undeclared identifier 'uregs'
    1972 |                 (uregs->fpcr & VFP_FPSCR_CTRL_MASK);
         |                  ^~~~~
   2 errors generated.


vim +/uregs +1971 arch/arm64/kernel/ptrace.c

  1955	
  1956	static int compat_vfp_set(struct task_struct *target,
  1957				  const struct user_regset *regset,
  1958				  unsigned int pos, unsigned int count,
  1959				  const void *kbuf, const void __user *ubuf)
  1960	{
  1961		struct user_fpsimd_state newstate;
  1962		compat_ulong_t fpscr;
  1963		int ret, vregs_end_pos;
  1964	
  1965		if (!system_supports_fpsimd())
  1966			return -EINVAL;
  1967	
  1968		fpsimd_flush_task_state(target);
  1969	
  1970		newstate = target->thread.uw.fpsimd_state;
> 1971		fpscr = (uregs->fpsr & VFP_FPSCR_STAT_MASK) |
  1972			(uregs->fpcr & VFP_FPSCR_CTRL_MASK);
  1973	
  1974		vregs_end_pos = VFP_STATE_SIZE - sizeof(compat_ulong_t);
  1975		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &newstate, 0,
  1976					 vregs_end_pos);
  1977		if (ret)
  1978			return ret;
  1979	
  1980		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &fpscr,
  1981					 vregs_end_pos, VFP_STATE_SIZE);
  1982		if (ret)
  1983			return ret;
  1984	
  1985		newstate.fpsr = fpscr & VFP_FPSCR_STAT_MASK;
  1986		newstate.fpcr = fpscr & VFP_FPSCR_CTRL_MASK;
  1987		target->thread.uw.fpsimd_state = newstate;
  1988	
  1989		return 0;
  1990	}
  1991	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
