Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BD978F3A;
	Tue, 19 May 2026 00:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779150251; cv=none; b=JAsj7Bng+4ftgrAs1i7O7N0UhT7XPC/jeWvpF9Dg65JbvcBZwl/RNHm6ZqsUc+4aRkB9PptF4IIIC6YjgSyCKHU35Q1iErC9w+qIKnGfuNqEiAZ7JcVkqVgGEJCqZCCRnMeIaw53wt1YToVmpgBDsnGk7orhwykOzj4QkaQVKr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779150251; c=relaxed/simple;
	bh=jqiri8fRYoUgwKQOj9PizGg7LdzMPJoB/dTx7TlSWBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rus/2j17NuRxwYumlc7s5kJHzBmHiNkk5m6Y98KSTdC7ZbhBT+Jws5a0ZZTOkRs90R1kYgLrk5f29xPckspxjDGY5OwJ9VinaoByUm3xdqBW1VfdvAiOwUAgcAcbWa/wReNfSCYtBrVjCe8kBse5kYEdITn3IPp5IQQJAWFBpfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNx5/WBU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNx5/WBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779150249; x=1810686249;
  h=date:from:to:cc:subject:message-id;
  bh=jqiri8fRYoUgwKQOj9PizGg7LdzMPJoB/dTx7TlSWBY=;
  b=lNx5/WBUucStZnhWd5eLn5Ar/PfvXFcKk+yUg7wTndOEbhYSMn2EatfU
   RN/Y79VhjBGd1XPt8XUBuj8txOD626CXyt9Y8iq14HJyK0pC23whfxQxe
   cbFOarOmHIWADeln6ccjZib/mA/pSf00FKXFodhnJDFD4V1xSMv6mL3Nd
   eQPIyygQMGamZJrIqp13Bbtq2qmXWEThpie5Ocqa5eQc0LGzMXXm93tOP
   y/GmI/M+1lriF4w+BC37WMo/7b0/YGZrPP9HuXCPSWhy8ibggfcSP4h7k
   zXKTgoNdrm0V6ri9BTJdy72OSs2AvUiM1tLB2dXY7StRakeVFeY4eA2J6
   w==;
X-CSE-ConnectionGUID: Lm/68KbWTSGRGQe6Q0WCAg==
X-CSE-MsgGUID: DaDP04p6TbOKnK0xjzWqxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="105478135"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="105478135"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 17:24:09 -0700
X-CSE-ConnectionGUID: cRwEVNKvQ+qylHyKVCNVGA==
X-CSE-MsgGUID: XKTohS1qQUC4buvqG8hLyg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 18 May 2026 17:24:07 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP8Fh-00000000A1J-2C2x;
	Tue, 19 May 2026 00:24:05 +0000
Date: Tue, 19 May 2026 02:23:17 +0200
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 76/238]
 arch/x86/kvm/vmx/sgx.c:4:9: warning: 'pr_fmt' macro redefined
Message-ID: <202605190247.x7A3vjsY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 9f39e5e1674188b92a32f709a9c3225553110dc0 [76/238] KVM: VMX: replace __get_free_page() with kmalloc()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260519/202605190247.x7A3vjsY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190247.x7A3vjsY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190247.x7A3vjsY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/sgx.c:4:9: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
       4 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |         ^
   include/linux/printk.h:401:9: note: previous definition is here
     401 | #define pr_fmt(fmt) fmt
         |         ^
   1 warning generated.


vim +/pr_fmt +4 arch/x86/kvm/vmx/sgx.c

8d20bd63816703 Sean Christopherson 2022-11-30 @4  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
9798adbc04cf1b Sean Christopherson 2021-04-12  5  

:::::: The code at line 4 was first introduced by commit
:::::: 8d20bd6381670382669d9bb39b5fd566a84cdbef KVM: x86: Unify pr_fmt to use module name for all KVM modules

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
