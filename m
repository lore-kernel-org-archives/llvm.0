Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D02512EE;
	Thu, 16 Oct 2025 05:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760593391; cv=none; b=POV1XmcyOsy/kw0luvdRgcJ85U52y7m9I3+kkJ+XjyEH+cAuEg2GlMRksABZqsmpOyj9KxwBWqOAvjw++7+uwlLieqMQH2QuvuaCfQKldcAZgsDEAI+b3ilj3LNnBnnfzT4z5ckw2k/IsbRSUnTrTPZBxQfNAPGaG+YdGn2kHY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760593391; c=relaxed/simple;
	bh=Ipa8qV0efCECwgzKq4FblvXAdYnccj+iLOD7WIHQy6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJLzGRATbuvvQfRFkS8Xp1+Up7AKlwj2vFUK5mhvzGkc1Ty2pp0afN5beqrvnY5AlItX8XegLoipVGbBMTVTyGquPe4CvgJ4DJQ1X5ZZ1tfS3FI+zfpliZZNB8VjCkkKOLNkbMiw3U0jIbF3vmxxag3ulIeaM3RTEtocEGCy22Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlMKu6nT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlMKu6nT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760593390; x=1792129390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ipa8qV0efCECwgzKq4FblvXAdYnccj+iLOD7WIHQy6U=;
  b=RlMKu6nTtnJVHtMi6kluJf+UhIWk7efFW9iXfGpUvFHEaPuhvh7QqPnC
   +dtKydTMFRyr1UqLZfJyx5OlYkBupoQ0CngCL6IrovQm9BvnBx/oEacsz
   vMchaLPo5W33WyNdhu/LXUo/S+0qOXCVDX/0Ea09dgbpNqcrlilha4C37
   NRSUAVTa65yLQOPIgoodVTqh+/WZnCHX38sBUkV8RwjfUqNZwaoyDOTxA
   tsYI6+lUzBPDKbEEchHAobWC9GN9QXdVQ0AB+rEiQzZOHbPJyb6Pp+rVO
   VdL12jzGwTrfL8utrkJ58lnjaC1RJmSRMY6cY3oMaqH72hVjc7PYbhT9J
   Q==;
X-CSE-ConnectionGUID: 1xnP4QsGRSWbd5Qf35lfnw==
X-CSE-MsgGUID: OzTOajquQRGJuVV9G8DK+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62926564"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="62926564"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 22:43:08 -0700
X-CSE-ConnectionGUID: iqtsBzrHQmGF1CFJ/vjIgg==
X-CSE-MsgGUID: 0F1/6AvgQ/ysJEbjAnyRZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="182764966"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2025 22:43:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9GlU-0004UN-0T;
	Thu, 16 Oct 2025 05:43:04 +0000
Date: Thu, 16 Oct 2025 13:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v10 mm-new 3/9] mm: thp: add support for BPF based
 THP order selection
Message-ID: <202510161309.BGt3TeL9-lkp@intel.com>
References: <20251015141716.887-4-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015141716.887-4-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/mm-thp-remove-vm_flags-parameter-from-khugepaged_enter_vma/20251015-222537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251015141716.887-4-laoar.shao%40gmail.com
patch subject: [RFC PATCH v10 mm-new 3/9] mm: thp: add support for BPF based THP order selection
config: x86_64-buildonly-randconfig-001-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161309.BGt3TeL9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161309.BGt3TeL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161309.BGt3TeL9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/fork.c:1133:2: error: call to undeclared function 'bpf_thp_exit_mm'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1133 |         bpf_thp_exit_mm(mm);
         |         ^
   kernel/fork.c:1133:2: note: did you mean 'bpf_thp_retain_mm'?
   include/linux/huge_mm.h:296:1: note: 'bpf_thp_retain_mm' declared here
     296 | bpf_thp_retain_mm(struct mm_struct *mm, struct mm_struct *old_mm)
         | ^
   1 error generated.


vim +/bpf_thp_exit_mm +1133 kernel/fork.c

  1124	
  1125	static inline void __mmput(struct mm_struct *mm)
  1126	{
  1127		VM_BUG_ON(atomic_read(&mm->mm_users));
  1128	
  1129		uprobe_clear_state(mm);
  1130		exit_aio(mm);
  1131		ksm_exit(mm);
  1132		khugepaged_exit(mm); /* must run before exit_mmap */
> 1133		bpf_thp_exit_mm(mm);
  1134		exit_mmap(mm);
  1135		mm_put_huge_zero_folio(mm);
  1136		set_mm_exe_file(mm, NULL);
  1137		if (!list_empty(&mm->mmlist)) {
  1138			spin_lock(&mmlist_lock);
  1139			list_del(&mm->mmlist);
  1140			spin_unlock(&mmlist_lock);
  1141		}
  1142		if (mm->binfmt)
  1143			module_put(mm->binfmt->module);
  1144		lru_gen_del_mm(mm);
  1145		futex_hash_free(mm);
  1146		mmdrop(mm);
  1147	}
  1148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
