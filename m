Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A2C306B3B;
	Tue, 19 May 2026 02:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156799; cv=none; b=qhavSPWH1k7MHYF/Nfu4WMk6gJMD1EiFqe+qAKoVErvi9sVXPLRO1BXsZkWMhsFtOss7eKgrWUsDiCFL0HMzHiQXaad8q2Yb6hO6VM91/R2hzO/oWJsW5MMW0X9uh4ow4TOKVYltG5XMfWUEnn68BLbs2zN1QMAXDmrvOHnuu90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156799; c=relaxed/simple;
	bh=Iu3kdft3cd19O//8SPTgqAvo9j5vvVlhypuNE8YW2QQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ps8QKTx/VE9Blu/BXqfzZ7gHx8BbHsXmIt7Kho69g+z1tOourN4Q/iTTs8gMnAEWixaMuN/JYvwMvdxD9hXi9ybEeZ735o2ud+Aj9jboloDTbYLHWLdofbbJwXboG/NUd10w5n3wbVCZF5ntYE4SvJQ3BY2mt9qKmXnpD+K0L9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juP/b3QO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juP/b3QO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156798; x=1810692798;
  h=date:from:to:cc:subject:message-id;
  bh=Iu3kdft3cd19O//8SPTgqAvo9j5vvVlhypuNE8YW2QQ=;
  b=juP/b3QOajaenkk3MxuafsXIrjzqUxCOHt/jQfCil7piOqzFGCzs/J/z
   0sKNROKxl3rphuUq+Ug8Np/5rqLATPvLPtUTRR0PWw8Lmwti2MigMoq18
   Pae2JuqWikcHFRPrCOJpVxJ0eeh50VLEyfll6P/JZFNsGul8hJbgSEUNl
   iH0HEorpjrmuOHzCin6v86t6N/REppJB/+KlYfcgsf8vMRx9iFdI65ujo
   bhuo0Fmlk7A7iL8Z/BuKHBWJzAKQqPqwqQTnAr6sODEOQ3US1/ronb1Lt
   cTgxBVZ9TbFgWrg77gPP/h0iOYCQVWmEK1m4Qg6Z7uthkziBoklJm9Miv
   w==;
X-CSE-ConnectionGUID: SVWV08WbT3yuJSIC2dX8KQ==
X-CSE-MsgGUID: qw7Nj3KKS36+62X8EWkd1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79876130"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79876130"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:16 -0700
X-CSE-ConnectionGUID: AcvOKHRgRmCO0YnAyNCL6w==
X-CSE-MsgGUID: GByMvHkoTI6VORzV/i3t7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235167851"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 19:13:14 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xI-0000000004I-0JjE;
	Tue, 19 May 2026 02:13:12 +0000
Date: Tue, 19 May 2026 08:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 76/238]
 arch/x86/kvm/vmx/sgx.c:4:9: warning: 'pr_fmt' macro redefined
Message-ID: <202605190859.5TIBA761-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 9f39e5e1674188b92a32f709a9c3225553110dc0 [76/238] KVM: VMX: replace __get_free_page() with kmalloc()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260519/202605190859.5TIBA761-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190859.5TIBA761-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190859.5TIBA761-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/sgx.c:4:9: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
       4 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |         ^
   include/linux/printk.h:401:9: note: previous definition is here
     401 | #define pr_fmt(fmt) fmt
         |         ^
   1 warning generated.


vim +/pr_fmt +4 arch/x86/kvm/vmx/sgx.c

8d20bd638167038 Sean Christopherson 2022-11-30 @4  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
9798adbc04cf1b1 Sean Christopherson 2021-04-12  5  

:::::: The code at line 4 was first introduced by commit
:::::: 8d20bd6381670382669d9bb39b5fd566a84cdbef KVM: x86: Unify pr_fmt to use module name for all KVM modules

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
