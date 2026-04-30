Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E07B36215A;
	Thu, 30 Apr 2026 04:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777524287; cv=none; b=GqGi513hu6J6XzLEKfJE/ygev+NqYhF+kPA4ptzCKPqFP9Ki5Doczytr5NxIsHZyoT/FVMStKIoHQ6WpAQYx1VLwg5uWL5Xqu65MDAk9EjsSSUsWhRIuHjSjrIDpsTQ1eJwH6I802niE/TRf6yIwOV1VIUPljIgcWsyQ8B+A1zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777524287; c=relaxed/simple;
	bh=VzKkW+OnmDBe6YfzTqe9Bhk7uVwgK/iuRQZ6VaN7dEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UdgPPR/pHE/U7SHmhY2n7A+iVF3utsPBcpzmgRoVVvv+mBqBazerxA8ZqSrpijmaMniOQLB2MGb3hRd41vulKIBZnM6G4242RdXz7fHSuLOO/NF5RkuhSEJaGWKN/5L5YjHpjZTKwVv4KwGNSMHCLQTMG1dFfCrVxzhICqKC3ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iny7nv4R; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iny7nv4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777524286; x=1809060286;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VzKkW+OnmDBe6YfzTqe9Bhk7uVwgK/iuRQZ6VaN7dEc=;
  b=iny7nv4RlOK39PeD9L9Jk/3fV08WZdOUcxpyfypNAwGaO9IV+753rV7y
   edRmRRO9HIX0tiZfH3Kb3g2b5V0AyV5AshtcTi+AOVdaKsQRmbr2rHDLz
   zF9cWTgeuFMHuC2MUiiAHopKVU4vNfMdp+WvTnUgHFVTaXlZPD9MG1z1p
   BJmDDLZpqaBEmHMppvA0lmaiZ8ReCLdO2TU0puZkQFgclNfmqulGTZttZ
   Beqb/8Zd8AFZjD+JTodDzc8EkFqDa4hEVlYSHFEeziIf7gM9Cj7y7Ug6N
   639/PVYupen+LJEgqmN6ANQ1YFqKsvXmd3Zm4d+GjwFUuFCsnNuyAY7pG
   w==;
X-CSE-ConnectionGUID: RDZZYtcHSFmlOvtaZfnC7Q==
X-CSE-MsgGUID: oDQNKXAmT2CUdWAlIwChuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82071708"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="82071708"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 21:44:44 -0700
X-CSE-ConnectionGUID: xQwzfGwAQlyB6yHFE1oQhw==
X-CSE-MsgGUID: LIoJoSFNTS6Rr+MKjHeaHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="239455437"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2026 21:44:42 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIJGR-00000000BxA-35Rt;
	Thu, 30 Apr 2026 04:44:39 +0000
Date: Thu, 30 Apr 2026 12:43:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:rust-bpf 7/14] kernel/bpf/arena.c:927:15: error:
 unknown token in expression
Message-ID: <202604301210.c9phvLSr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git rust-bpf
head:   1623628cc9588b205a0e913c5e62d267ef0f6d70
commit: 57b8503e842e4c2843af80176ba6fd68b478c5d0 [7/14] bpf_arena_memcmp
config: arm64-randconfig-003-20260430 (https://download.01.org/0day-ci/arch=
ive/20260430/202604301210.c9phvLSr-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260430/202604301210.c9phvLSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301210.c9phvLSr-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/arena.c:927:15: error: unknown token in expression
     927 |         asm volatile("movq %%r12, %0" : "=3Dr"(base));
         |                      ^
   <inline asm>:1:7: note: instantiated into assembly here
       1 |         movq %r12, x8
         |              ^
>> kernel/bpf/arena.c:927:15: error: invalid operand
     927 |         asm volatile("movq %%r12, %0" : "=3Dr"(base));
         |                      ^
   <inline asm>:1:7: note: instantiated into assembly here
       1 |         movq %r12, x8
         |              ^
>> kernel/bpf/arena.c:927:15: error: unknown token in expression
     927 |         asm volatile("movq %%r12, %0" : "=3Dr"(base));
         |                      ^
   <inline asm>:1:7: note: instantiated into assembly here
       1 |         movq %r12, x8
         |              ^
>> kernel/bpf/arena.c:927:15: error: invalid operand
     927 |         asm volatile("movq %%r12, %0" : "=3Dr"(base));
         |                      ^
   <inline asm>:1:7: note: instantiated into assembly here
       1 |         movq %r12, x8
         |              ^
   4 errors generated.


vim +927 kernel/bpf/arena.c

   912=09
   913	/*
   914	 * bpf_arena_memcmp / bpf_arena_memcpy =E2=80=94 memcmp/memcpy over =
arena memory.
   915	 *
   916	 * Both pointers are arena user VAs. The JIT sets %r12 to arena_vm_s=
tart at
   917	 * prog prologue and the x86 ABI marks %r12 as callee-saved, so at t=
he first
   918	 * instruction of this kfunc %r12 still holds that base. Read it via=
 inline
   919	 * asm before the compiler has a chance to reuse the register, rebas=
e the
   920	 * user-VA low-32 into the kernel VMA range, then call the regular
   921	 * memcmp()/memcpy(). No per-prog context lookup needed.
   922	 */
   923	static __always_inline unsigned long arena_kern_base(void)
   924	{
   925		unsigned long base;
   926=09
 > 927		asm volatile("movq %%r12, %0" : "=3Dr"(base));
   928		return base;
   929	}
   930=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
