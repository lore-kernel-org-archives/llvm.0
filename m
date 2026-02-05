Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEE23ACF14;
	Thu,  5 Feb 2026 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770294969; cv=none; b=UJDT7vTBJ3RudaTOue3hfbme/TFLOXqmMFOMkuwlxQLBh1SgAHIrggKKWR0D5yTYWRfGy8MD8WEnmVHZUXz5i0r9J5Pyfw3NlnN3iyXPFFgURF1Wyu3RZAELhuBwjXAELyKUBTrvDChbFtK6b9J10Ne1cDnTjWGuTgQzbdRXJ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770294969; c=relaxed/simple;
	bh=KK+2b2Ds6w1H9m7CtaKEoUVQM1D+ZQeG/C5QOEND5sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBTN7tEc2fxnH09606K9DDjRHM4V3CSpdEM/3tgqAWd0uxuAi+SndyVnexH4eJmIc2n+ZJWjiVxLb16YtF4lwCiAp/Eo7/VbnMSMYTtd+SrdpASZKpzmxcEal6vblm/KZrm8DnNLvezaqKgRB+KrVA2H68qbzZ+OGnUD8GSb39Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnAGGuav; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnAGGuav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770294970; x=1801830970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KK+2b2Ds6w1H9m7CtaKEoUVQM1D+ZQeG/C5QOEND5sQ=;
  b=TnAGGuavOdhPXTYn2wfzDnIlWqssJQznzydsw3xCHDqi/FVC4WNy2LIN
   qFL/d+q/Kb74l7UYMWTZaehULhsSfTIGbItmowgbvSwWuIo8IT38ia4Oo
   qpVu+nqadj49AGvPeqflg/RSWr9BFyfRK0L5MBHfIHR16MRRJPPu/ChnH
   c38sGhOog671Trp2OEvL45TShOxiOEIABtLGYei7aJocbNti2sMFjKRVZ
   T6WocnCmzCZ0ZOHR1cibdWlLFtpub/uDKxDuUG0YzkBWIzsfp/SKFTw2m
   5yps1/6FAKS7bcPIYU6BsqWgW8gLnB/fScJJEX3e3MK+DRB4iICx0OUQc
   A==;
X-CSE-ConnectionGUID: 97STho+sRzuP1pgA4Ml02w==
X-CSE-MsgGUID: /k3XTRkhR8WDeikXA3k1HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94141596"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="94141596"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 04:36:09 -0800
X-CSE-ConnectionGUID: EICD+6SyQz+4P9ebl51jHg==
X-CSE-MsgGUID: Vg6fowkPSLah/Sj4SBdcgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="209789180"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Feb 2026 04:36:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnyab-00000000joY-0gfK;
	Thu, 05 Feb 2026 12:36:05 +0000
Date: Thu, 5 Feb 2026 20:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <202602052045.wrd8TaGb-lkp@intel.com>
References: <20260203081403.68733-4-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203081403.68733-4-phasta@kernel.org>

Hi Philipp,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on linus/master v6.19-rc8]
[cannot apply to tip/locking/core next-20260204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/rust-list-Add-unsafe-for-container_of/20260203-162013
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260203081403.68733-4-phasta%40kernel.org
patch subject: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
config: x86_64-buildonly-randconfig-004-20260205 (https://download.01.org/0day-ci/archive/20260205/202602052045.wrd8TaGb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602052045.wrd8TaGb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602052045.wrd8TaGb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: creating a shared reference to mutable static
   --> rust/doctests_kernel_generated.rs:16156:18
   |
   16156 |         unsafe { CHECKER.store(true, atomic::Ordering::Relaxed); }
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ shared reference to mutable static
   |
   = note: for more information, see <https://doc.rust-lang.org/nightly/edition-guide/rust-2024/static-mut-references.html>
   = note: shared references to mutable statics are dangerous; it's undefined behavior if the static is mutated or if a mutable reference is created for it while the shared reference lives
   = note: `#[warn(static_mut_refs)]` on by default
--
>> warning: creating a shared reference to mutable static
   --> rust/doctests_kernel_generated.rs:16182:21
   |
   16182 | unsafe { assert_eq!(CHECKER.load(atomic::Ordering::Relaxed), true); }
   |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ shared reference to mutable static
   |
   = note: for more information, see <https://doc.rust-lang.org/nightly/edition-guide/rust-2024/static-mut-references.html>
   = note: shared references to mutable statics are dangerous; it's undefined behavior if the static is mutated or if a mutable reference is created for it while the shared reference lives

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
