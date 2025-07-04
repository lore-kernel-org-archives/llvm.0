Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819181BE238;
	Fri,  4 Jul 2025 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639045; cv=none; b=WTx6iVjfg++mn6Epn4CwHjU9dWwHG9apXz3P9WXwIflzciGe2PeC8G3n9d19YjEM/PT70mjzFe8+MkfBtw/g/j9UP5QbrBFlo2c0HgA4niIvuJ6xKCzTzyPgOlkl5nlaBYw+DPiPVX3XwiHrtUvxsKn1XH9iuvO+ZIw618vD7nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639045; c=relaxed/simple;
	bh=z/fpFp3C57D5zsiDOMOhZGP8+ZvQdPEfkKOjBj3KX58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8kHK+05BOIwmEgF8aAe8skutJHvVWWRpv5KbOjGIKXr4rdeHM8hBI9g29kcEVYFzorkSMzZxNvOMgEnfbuVU2gYoH7XGIjZyO7lMk9ATeu6k7TqUqbJfHNSgrd7aEqNGz96oYcBNVMUPmgOn/u6BFuN03ksgb/Z4fIk+9Y+MNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsF+6IBd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsF+6IBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751639044; x=1783175044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z/fpFp3C57D5zsiDOMOhZGP8+ZvQdPEfkKOjBj3KX58=;
  b=LsF+6IBdn5N5wdJ2hdLI+8U5F2Tuu+dDIWvLccJOm3iBtU/42sCdRtZy
   h+T2GQdWfvtHL7bK8sWjKl5pHXVFmxCrimL9Z+NDg1DxCUF1mgyO3V20F
   JDwj6w6qYXcETjeMxhMGMrdlFhVKxneF9yYbwacoVhb6ios6kRdEyyHfh
   NZD/+zL+NfmGeedUvjC1F0XwWpeGHPyhfS+ZQkKNVk7NUG8G3SophjCxu
   S28Y+TQR2XDhEZEnpWZfygnuJrbhR4AIFjQaPd1zn8NOJPJEO0FUvdCUB
   86HK8WS1GeXXIBpdJ7vowv5mfrIMNa0EfCfBXrH1FIXGi6ACpYD71vhPP
   A==;
X-CSE-ConnectionGUID: L9pL8QsUSmqb+JZm4PNUyg==
X-CSE-MsgGUID: xQvT2Q+yRgCZqJGNee9QQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="65030802"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="65030802"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 07:24:03 -0700
X-CSE-ConnectionGUID: Nv/ibLK0QM6j9ScZxt9p3A==
X-CSE-MsgGUID: EJtADhggRxWmKnIG5CTl7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="178317909"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jul 2025 07:24:01 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXhKZ-0003nJ-1s;
	Fri, 04 Jul 2025 14:23:59 +0000
Date: Fri, 4 Jul 2025 22:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 2/2] mm: Fix OOM killer inaccuracy on large
 many-core systems
Message-ID: <202507042202.J2ui1z8Y-lkp@intel.com>
References: <20250703173813.18432-3-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703173813.18432-3-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on trace/for-next kees/for-next/execve linus/master v6.16-rc4]
[cannot apply to akpm-mm/mm-everything dennis-percpu/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/lib-Introduce-hierarchical-per-cpu-counters/20250704-013915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20250703173813.18432-3-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH v5 2/2] mm: Fix OOM killer inaccuracy on large many-core systems
config: x86_64-buildonly-randconfig-003-20250704 (https://download.01.org/0day-ci/archive/20250704/202507042202.J2ui1z8Y-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507042202.J2ui1z8Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507042202.J2ui1z8Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: percpu_counter_tree_precise_compare_value
   >>> referenced by fork.c:590 (kernel/fork.c:590)
   >>>               vmlinux.o:(__mmdrop)
   >>> referenced by fork.c:590 (kernel/fork.c:590)
   >>>               vmlinux.o:(__mmdrop)
   >>> referenced by fork.c:590 (kernel/fork.c:590)
   >>>               vmlinux.o:(__mmdrop)
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: percpu_counter_tree_destroy
   >>> referenced by fork.c:694 (kernel/fork.c:694)
   >>>               vmlinux.o:(__mmdrop)
   >>> referenced by fork.c:694 (kernel/fork.c:694)
   >>>               vmlinux.o:(__mmdrop)
   >>> referenced by fork.c:694 (kernel/fork.c:694)
   >>>               vmlinux.o:(__mmdrop)
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: percpu_counter_tree_precise_sum
   >>> referenced by fork.c:591 (kernel/fork.c:591)
   >>>               vmlinux.o:(__mmdrop)
   >>> referenced by fork.c:591 (kernel/fork.c:591)
   >>>               vmlinux.o:(__mmdrop)
   >>> referenced by fork.c:591 (kernel/fork.c:591)
   >>>               vmlinux.o:(__mmdrop)
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: percpu_counter_tree_init
   >>> referenced by fork.c:1084 (kernel/fork.c:1084)
   >>>               vmlinux.o:(mm_init)
   >>> referenced by fork.c:1084 (kernel/fork.c:1084)
   >>>               vmlinux.o:(mm_init)
   >>> referenced by fork.c:1084 (kernel/fork.c:1084)
   >>>               vmlinux.o:(mm_init)
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: percpu_counter_tree_add_slowpath
   >>> referenced by percpu_counter_tree.h:93 (include/linux/percpu_counter_tree.h:93)
   >>>               vmlinux.o:(filemap_map_pages)
   >>> referenced by percpu_counter_tree.h:93 (include/linux/percpu_counter_tree.h:93)
   >>>               vmlinux.o:(copy_page_range)
   >>> referenced by percpu_counter_tree.h:93 (include/linux/percpu_counter_tree.h:93)
   >>>               vmlinux.o:(unmap_page_range)
   >>> referenced 27 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
