Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD66C28C2BF;
	Sat, 18 Oct 2025 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760775884; cv=none; b=jJpRTr71YbVZOMrx3cxeXgT9ec/c+jI70FhS4gDiEQiTH0c+zqO43UhbxhQW89S4W3PXlVHghFYiIvarctKET4lMArX77r4O8vSTYwQ7sct/lPPVT4mSWCJ2ene/aN6JU9ZEESjCNRhXM0Hiilt3d9+UUzG7kCxpheryPwLT7qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760775884; c=relaxed/simple;
	bh=xveeeHbBkRzYTsyaDDmpSiybjRa5hkiGj6eDae8sz/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiUaFQX5XpHFuc6YwgNpOS96FWejFLYky/D3pXsoxHmhEZl64z8M4jvxzGbALmERrpEDZ749dYHJmmvSx0OpT5u/D/U3asLxlGThAVgMXI+eu0tx3cZ2ha2u/beUkmfEXjpPZGGYoTJYBD9LFTvSPqdkQF66JO7RReoke8HNXFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSQ9tcYm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSQ9tcYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760775882; x=1792311882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xveeeHbBkRzYTsyaDDmpSiybjRa5hkiGj6eDae8sz/U=;
  b=BSQ9tcYmvg61UQOhdv2yQ/YGX6r/pBWPKP2FeiuH68c25HJMm2rrZspH
   cmIkX3igYNHh+Qc3nOGnhgqsmb6yKhYn5oJGzhLmNt085Jp5zr1Ja6CQw
   NmvyNiYC/CdziEdEsAh+w5mHfcWlGyq1xhQXTkPrNcoIo1n2Of5FTHBqP
   1P+IoaPt35mw7uBj+SS6zwgLSOSzuZQu5HlfXlUxL/3kinIiw8xPn/MYb
   sjxAH95WU9t2boPYM9UdYWHdU041RtIsFlk8RytHVWz77vVM+YSleDup8
   uqb1/8sPbLszmpxsqI6YDGcJmQ1fBHG5mIgs52EiCPl/mMrKPFlbROOx4
   g==;
X-CSE-ConnectionGUID: MZaxMk95Q6ydWyFoFUH3Pw==
X-CSE-MsgGUID: vhdWj4rETl+wFrMyDcAq9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="85601631"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="85601631"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 01:24:42 -0700
X-CSE-ConnectionGUID: w+gjILSNQPaSKyWWiEmNuQ==
X-CSE-MsgGUID: ZQJmWX4mQGWqARhTuZxczA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182051693"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2025 01:24:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA2Eu-0008AF-2n;
	Sat, 18 Oct 2025 08:24:36 +0000
Date: Sat, 18 Oct 2025 16:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bill Tsui <b10902118@ntu.edu.tw>, oleg@redhat.com,
	catalin.marinas@arm.com, will@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Bill Tsui <b10902118@ntu.edu.tw>
Subject: Re: [PATCH v3 1/1] arm64: ptrace: fix hw_break_set() to set addr and
 ctrl together
Message-ID: <202510181547.dI5kyPuT-lkp@intel.com>
References: <20251016154401.35799-2-b10902118@ntu.edu.tw>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016154401.35799-2-b10902118@ntu.edu.tw>

Hi Bill,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bill-Tsui/arm64-ptrace-fix-hw_break_set-to-set-addr-and-ctrl-together/20251016-235711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20251016154401.35799-2-b10902118%40ntu.edu.tw
patch subject: [PATCH v3 1/1] arm64: ptrace: fix hw_break_set() to set addr and ctrl together
config: arm64-randconfig-r113-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181547.dI5kyPuT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181547.dI5kyPuT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181547.dI5kyPuT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/ptrace.c:449:12: warning: 'ptrace_hbp_set_addr' defined but not used [-Wunused-function]
    static int ptrace_hbp_set_addr(unsigned int note_type,
               ^~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/ptrace.c:424:12: warning: 'ptrace_hbp_set_ctrl' defined but not used [-Wunused-function]
    static int ptrace_hbp_set_ctrl(unsigned int note_type,
               ^~~~~~~~~~~~~~~~~~~


vim +/ptrace_hbp_set_addr +449 arch/arm64/kernel/ptrace.c

478fcb2cdb2351 Will Deacon 2012-03-05  423  
478fcb2cdb2351 Will Deacon 2012-03-05 @424  static int ptrace_hbp_set_ctrl(unsigned int note_type,
478fcb2cdb2351 Will Deacon 2012-03-05  425  			       struct task_struct *tsk,
478fcb2cdb2351 Will Deacon 2012-03-05  426  			       unsigned long idx,
478fcb2cdb2351 Will Deacon 2012-03-05  427  			       u32 uctrl)
478fcb2cdb2351 Will Deacon 2012-03-05  428  {
478fcb2cdb2351 Will Deacon 2012-03-05  429  	int err;
478fcb2cdb2351 Will Deacon 2012-03-05  430  	struct perf_event *bp;
478fcb2cdb2351 Will Deacon 2012-03-05  431  	struct perf_event_attr attr;
478fcb2cdb2351 Will Deacon 2012-03-05  432  	struct arch_hw_breakpoint_ctrl ctrl;
478fcb2cdb2351 Will Deacon 2012-03-05  433  
478fcb2cdb2351 Will Deacon 2012-03-05  434  	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
478fcb2cdb2351 Will Deacon 2012-03-05  435  	if (IS_ERR(bp)) {
478fcb2cdb2351 Will Deacon 2012-03-05  436  		err = PTR_ERR(bp);
478fcb2cdb2351 Will Deacon 2012-03-05  437  		return err;
478fcb2cdb2351 Will Deacon 2012-03-05  438  	}
478fcb2cdb2351 Will Deacon 2012-03-05  439  
478fcb2cdb2351 Will Deacon 2012-03-05  440  	attr = bp->attr;
478fcb2cdb2351 Will Deacon 2012-03-05  441  	decode_ctrl_reg(uctrl, &ctrl);
478fcb2cdb2351 Will Deacon 2012-03-05  442  	err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
478fcb2cdb2351 Will Deacon 2012-03-05  443  	if (err)
478fcb2cdb2351 Will Deacon 2012-03-05  444  		return err;
478fcb2cdb2351 Will Deacon 2012-03-05  445  
478fcb2cdb2351 Will Deacon 2012-03-05  446  	return modify_user_hw_breakpoint(bp, &attr);
478fcb2cdb2351 Will Deacon 2012-03-05  447  }
478fcb2cdb2351 Will Deacon 2012-03-05  448  
478fcb2cdb2351 Will Deacon 2012-03-05 @449  static int ptrace_hbp_set_addr(unsigned int note_type,
478fcb2cdb2351 Will Deacon 2012-03-05  450  			       struct task_struct *tsk,
478fcb2cdb2351 Will Deacon 2012-03-05  451  			       unsigned long idx,
478fcb2cdb2351 Will Deacon 2012-03-05  452  			       u64 addr)
478fcb2cdb2351 Will Deacon 2012-03-05  453  {
478fcb2cdb2351 Will Deacon 2012-03-05  454  	int err;
478fcb2cdb2351 Will Deacon 2012-03-05  455  	struct perf_event *bp;
478fcb2cdb2351 Will Deacon 2012-03-05  456  	struct perf_event_attr attr;
478fcb2cdb2351 Will Deacon 2012-03-05  457  
478fcb2cdb2351 Will Deacon 2012-03-05  458  	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
478fcb2cdb2351 Will Deacon 2012-03-05  459  	if (IS_ERR(bp)) {
478fcb2cdb2351 Will Deacon 2012-03-05  460  		err = PTR_ERR(bp);
478fcb2cdb2351 Will Deacon 2012-03-05  461  		return err;
478fcb2cdb2351 Will Deacon 2012-03-05  462  	}
478fcb2cdb2351 Will Deacon 2012-03-05  463  
478fcb2cdb2351 Will Deacon 2012-03-05  464  	attr = bp->attr;
478fcb2cdb2351 Will Deacon 2012-03-05  465  	attr.bp_addr = addr;
478fcb2cdb2351 Will Deacon 2012-03-05  466  	err = modify_user_hw_breakpoint(bp, &attr);
478fcb2cdb2351 Will Deacon 2012-03-05  467  	return err;
478fcb2cdb2351 Will Deacon 2012-03-05  468  }
478fcb2cdb2351 Will Deacon 2012-03-05  469  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
