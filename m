Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3A427E04C;
	Wed, 25 Feb 2026 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046105; cv=none; b=J8Agu6OSjQCqh+FuZCrTHarRSXs3vDe/UCRMtez5Q9VLhY0226zfXPc+p/YkYjDGsbDaQQkdiJobuj/7gl4d2rS6v/YHYU8Pb9oR47vbJXcRBG+G6PmF3yl19WNJl8B7bVnFibMtTExOnpsh3u11cTBHsMEEKbl9CalrXzrwGHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046105; c=relaxed/simple;
	bh=9CTk22EJQzazYxhnMYkdWoYTEPWUL7mbZjBW4ZinBXk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GwwYxYgrv5Mvq1IwBkJm8hFYoYAAg/1ZdEpWs39VVaqExuOTzBRUYhEDdTZLPV5W+KgokFR5iwxN4bfpKOQB1ElqXlM17CyOoldpkbC12RyFSN3yWPs2CJs4gMao9dn8Kdx8qiSPAzHtg/xlIM6nGmgvc/qYWLiJnuCRVd8T6Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JykiVysV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JykiVysV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772046103; x=1803582103;
  h=date:from:to:cc:subject:message-id;
  bh=9CTk22EJQzazYxhnMYkdWoYTEPWUL7mbZjBW4ZinBXk=;
  b=JykiVysV53uFpXx1+IOfF76Zs2rD9fdcSvBnnSS+zi7LKvgYSFlO6f4S
   x+SbQT9qyMpdkmUYZfUwf0hKtUP9aZGpK3rH0+h8e4WoVexjTjB5GcaBU
   Cu/WPxbaiQyUKVkilMW04p/HwxAEaala2U0bB/HibC+x8AklPFo4dawMW
   4V7fq8wzThomVjs11Pr60uyFISeI+xhy0BGuTuCDZLM5fis7DFqHmw6BO
   3Pc00AWh1vznMVn+PIJseVgDhPq4q+JVnMtGDSh9AC2F5UFiQ3XxlHXFk
   UFUTFqeRdMqvurQELLx2vfrtmjzBClj148tnLJ514p6RkVlHUSP+3nJ0h
   A==;
X-CSE-ConnectionGUID: Fn88rN21QXyE/DhMlHJimg==
X-CSE-MsgGUID: 836cvMLJQC6d3V2PLqqO1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73166390"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="73166390"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 11:01:43 -0800
X-CSE-ConnectionGUID: BwgNdFYCSkKjpAxzWmUhDg==
X-CSE-MsgGUID: qnbrjQ0wQJqiGUZO7HBN3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="219711117"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Feb 2026 11:01:40 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvK8g-0000000075F-3Pbu;
	Wed, 25 Feb 2026 19:01:38 +0000
Date: Thu, 26 Feb 2026 03:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 6/23]
 kernel/bpf/syscall.c:3514:42: error: incompatible pointer types passing
 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *'
Message-ID: <202602260208.EBEgPZOJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   2e9ff5967a4f3cb4d96c1fd04944036d9961099d
commit: 8f7a9302fcb5575b82514340a6ceed2c5592a014 [6/23] bpf: Add struct bpf_tramp_node object
config: s390-randconfig-001-20260226 (https://download.01.org/0day-ci/archive/20260226/202602260208.EBEgPZOJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260208.EBEgPZOJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260208.EBEgPZOJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1543:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1549:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/bpf/syscall.c:3514:42: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Wincompatible-pointer-types]
    3514 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
         |                                                 ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bpf.h:1549:69: note: passing argument to parameter 'link' here
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                                     ^
   kernel/bpf/syscall.c:3746:33: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Wincompatible-pointer-types]
    3746 |         err = bpf_trampoline_link_prog(&link->link.node, tr, tgt_prog);
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/bpf.h:1543:67: note: passing argument to parameter 'link' here
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                                   ^
   2 warnings and 2 errors generated.


vim +3514 kernel/bpf/syscall.c

  3508	
  3509	static void bpf_tracing_link_release(struct bpf_link *link)
  3510	{
  3511		struct bpf_tracing_link *tr_link =
  3512			container_of(link, struct bpf_tracing_link, link.link);
  3513	
> 3514		WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
  3515							tr_link->trampoline,
  3516							tr_link->tgt_prog));
  3517	
  3518		bpf_trampoline_put(tr_link->trampoline);
  3519	
  3520		/* tgt_prog is NULL if target is a kernel function */
  3521		if (tr_link->tgt_prog)
  3522			bpf_prog_put(tr_link->tgt_prog);
  3523	}
  3524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
