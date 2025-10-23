Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E163C17332C;
	Thu, 23 Oct 2025 02:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761185008; cv=none; b=JwmPWXeuYU5h8z9+TddVVjFKCp08efeATzLPXaZo6y9tAaOE6qn9wtwIF1BEWo2RxZzxMcLZNf7/voDfpa72m55k8s+VQkdiyJ/41SN5gFTM8AyWOeEbVE9SgmftGzmfeEBLktizwIu8uQcX9XcqbeJCZ/abb2phT2cKHj1m9dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761185008; c=relaxed/simple;
	bh=xee3scmYv12wYg/dwuM/tRD9Eo6wJ8vKhtPSrFUPVV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qK8DtADzbinjyh78LmRg8W4I/hBL37Fq7aGckZuD55oqHL4vQz94z8TGUE2l8rC4vthcG2H/AZtIjex/DxjDqz1IEJWIhHT9Aq2a02nAbIbAwLAuNWM7DbymKmERqGe9/U9G80R07fRx2MGOWuGSqjRpCkalFEb/IRKXHDItNLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQksfZJu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQksfZJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761185008; x=1792721008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xee3scmYv12wYg/dwuM/tRD9Eo6wJ8vKhtPSrFUPVV0=;
  b=GQksfZJuJN8fmHLx4rQlPtLrbEAseMtUqb+9pfaETLUXXii/XUPzPrCx
   dawt/j6VxpK55qb3aVYjT0GFWhAdLIrHk99n/BzAB5FcmsldR5ozx8oDu
   gTLGXPNzxK0xNQqOl/wDLZ6stNbo0b0mENiQ9dTuyeJwcoIFsq6e8xp+k
   Xr5Vj5u0h0IroD484v/qJ7yDoa1FI39aBjXZ3b+akZkrCtiVn2a5bv1Bq
   +8JZirnOuS8ta4/yoYc0p1TFzxeScALij1AMI1uXlgDMLZXUX21s9NDou
   53774Mn7R9yEUm9TbcCghwYNqRamiDbbZ31sBfaBvVoPXzFres3Ezs63c
   g==;
X-CSE-ConnectionGUID: VlHAbLZkSIOYtcg1VMwVkA==
X-CSE-MsgGUID: M7M5lmLeRmGZVx4i52IKFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80783048"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="80783048"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 19:03:27 -0700
X-CSE-ConnectionGUID: a9Uj5Y2eSR+mqMKSOu3iMA==
X-CSE-MsgGUID: T1JY8sHqSxut4eDcSJS7tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="188426371"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2025 19:03:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBkfj-000Cv7-0e;
	Thu, 23 Oct 2025 02:03:23 +0000
Date: Thu, 23 Oct 2025 10:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 3/9] ld.lld: error: duplicate
 symbol: update_ftrace_direct_del
Message-ID: <202510230943.BgZkTX4q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   3d31a310468694e4395d61e15c65edaa618fbb5c
commit: 6fc33ce4c35edf7fb4fd8c760ad1bb2e472d82cb [3/9] ftrace: Add update_ftrace_direct_del function
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251023/202510230943.BgZkTX4q-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230943.BgZkTX4q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230943.BgZkTX4q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: update_ftrace_direct_del
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_del) in archive vmlinux.a
   >>> defined at do_mounts.c
   >>>            init/do_mounts.o:(.text+0x10) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_del
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_del) in archive vmlinux.a
   >>> defined at vsyscall_64.c
   >>>            arch/x86/entry/vsyscall/vsyscall_64.o:(.text+0x10) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_del
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_del) in archive vmlinux.a
   >>> defined at core.c
   >>>            arch/x86/events/core.o:(.text+0x10) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_del
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_del) in archive vmlinux.a
   >>> defined at utils.c
   >>>            arch/x86/events/utils.o:(.text+0x10) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_del
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_del) in archive vmlinux.a
   >>> defined at core.c
   >>>            arch/x86/events/amd/core.o:(.text+0x10) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_del
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_del) in archive vmlinux.a
   >>> defined at lbr.c
   >>>            arch/x86/events/amd/lbr.o:(.text+0x10) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_del
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_del) in archive vmlinux.a
   >>> defined at noinitramfs.c
   >>>            init/noinitramfs.o:(.text+0x10) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_del
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_del) in archive vmlinux.a
   >>> defined at init_task.c
   >>>            init/init_task.o:(.text+0x10) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_del
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_del) in archive vmlinux.a
   >>> defined at syscall_64.c
   >>>            arch/x86/entry/syscall_64.o:(.text+0x10) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: update_ftrace_direct_del
   >>> defined at main.c
   >>>            init/main.o:(update_ftrace_direct_del) in archive vmlinux.a
   >>> defined at extable.c
   >>>            arch/x86/entry/vdso/extable.o:(.text+0x10) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
