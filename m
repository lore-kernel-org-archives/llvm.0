Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE08D24A076;
	Fri, 26 Jun 2026 04:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782449700; cv=none; b=SyKi0L3VdwKcV8Zr18ZXUnSgaPPu80AxyRgc5SF0xQBGiexjuupb85IZLzBOgYwv1pPh6Oc1sbCSHdonPp98KcZUSDP2bLK7iyau+1uKSDdFjyJIPzcBEciB9638Ruilf7CCSpcKlsFQLmyWv6h2q4rKoU0Jmk+7VSS0oF3+M/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782449700; c=relaxed/simple;
	bh=Ph97+QbvBbcufChYnurDSohcP22hoOVDdPb4UCqhVjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+8EFq2wH1q2DgMc7dl+4SQG9QfZblS+/FBfsqgMwImufZUf51esY/NGKrmadDBqjqOxiNv3lIRGbworD1Vrr/ETS8AsXkTJ+JZwYHKx9Lc76j3Gng2PnD7VHHxYbdszzukwTj945Mwdi+GnIZ2SvfDQMoKMmEeuJgkchWZGy38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PaAGxikn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PaAGxikn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782449699; x=1813985699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ph97+QbvBbcufChYnurDSohcP22hoOVDdPb4UCqhVjo=;
  b=PaAGxiknGPPOJMaCaViK2AoY64/xQPCxJMe3NO1pFatbOxmLNOgn/vdD
   +NDYMJHCWWdFceewlpOkROcHEAuXo5scE0BwZA9t2e5JCB76D8N6aUydM
   WFgQ/tIBxf+cQtEUapOEpt75eL65wvb9bE71gDYC+aSAE68wFAIeysfYQ
   9sYi2Z3a/vsDg2LBlAYKqioR3hV25ECBoYZHpO+yp9AmKi4Rst72horFz
   On24NBFYtZ7YSlU7Nxb0pIDFiP5Hkl55rN8TYR/PZOKXuqNExM40zUw7G
   gQktVd3wJ638f8hA40cso06evZAULzXjQxMyFynyqs+axNg8CZoIXWZyu
   w==;
X-CSE-ConnectionGUID: Y6fURPVOQOC6ImkG0Mq4uw==
X-CSE-MsgGUID: TRiKyw1lR1iEVSgjejJtMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100675472"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="100675472"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 21:54:59 -0700
X-CSE-ConnectionGUID: MA5R9x/gT4O7EFxpR5rVbQ==
X-CSE-MsgGUID: usDeWcdXRIKMfkGZAwT0qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="251894018"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Jun 2026 21:54:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcyaY-000000004mL-3RQw;
	Fri, 26 Jun 2026 04:54:50 +0000
Date: Fri, 26 Jun 2026 12:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH v7] mm: assert exclusive nid/zonenum bits at the
 page/folio access sites
Message-ID: <202606261253.X4CwKZZJ-lkp@intel.com>
References: <20260626032012.1049667-1-hui.zhu@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626032012.1049667-1-hui.zhu@linux.dev>

Hi Hui,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Zhu/mm-assert-exclusive-nid-zonenum-bits-at-the-page-folio-access-sites/20260626-112119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260626032012.1049667-1-hui.zhu%40linux.dev
patch subject: [PATCH v7] mm: assert exclusive nid/zonenum bits at the page/folio access sites
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260626/202606261253.X4CwKZZJ-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606261253.X4CwKZZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606261253.X4CwKZZJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5680: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5909: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_build
     from /zdci/src/kernel-tests/lib/kbuild.sh:6419: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
>> include/linux/mm.h:2:2: error: unterminated conditional directive
       2 | #ifndef _LINUX_MM_H
         |  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
>> include/linux/mm.h:2:2: error: unterminated conditional directive
       2 | #ifndef _LINUX_MM_H
         |  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
>> include/linux/mm.h:2:2: error: unterminated conditional directive
       2 | #ifndef _LINUX_MM_H
         |  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:13:
   In file included from include/linux/pagemap.h:8:
>> include/linux/mm.h:2:2: error: unterminated conditional directive
       2 | #ifndef _LINUX_MM_H
         |  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:13:
   In file included from include/linux/pagemap.h:17:
   In file included from include/linux/hugetlb_inline.h:5:
>> include/linux/mm.h:2:2: error: unterminated conditional directive
       2 | #ifndef _LINUX_MM_H
         |  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:9:
>> include/linux/mm.h:2:2: error: unterminated conditional directive
       2 | #ifndef _LINUX_MM_H
         |  ^
   6 errors generated.
   make[3]: *** [scripts/Makefile.build:184: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1390: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +2 include/linux/mm.h

^1da177e4c3f41 Linus Torvalds 2005-04-16 @2  #ifndef _LINUX_MM_H
^1da177e4c3f41 Linus Torvalds 2005-04-16  3  #define _LINUX_MM_H
^1da177e4c3f41 Linus Torvalds 2005-04-16  4  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
