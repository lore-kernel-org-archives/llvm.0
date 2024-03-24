Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1646A28E7;
	Sun, 24 Mar 2024 11:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711279598; cv=none; b=VCX1SrCoO8d0zDx/FZ8vZcCYyg812LjpQng4niKR+kCyHLT+Fk9r08ZLXFhwwxCOAJgWTNd498i6enWqhfA11xeFSqV0lb9+obo9m6AJK9gEZc1Iubmcm6o0F8UwMHz7/i+wt1B7O1aYaxpEsNroVwfW7jbJbWYME5WeaNRo4p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711279598; c=relaxed/simple;
	bh=CExg+la76sIR1qkpm2KxEgcLr3rpl4q2ho2HMwdpUjg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rOaybdkI3fvaW9vzInpMvg3LzooUxojo52sPOKomzme4rGsXQpr6QbCY82ke+eZanIsG2UyOwtBo3Qj5G5xDCI8bAz6U9Q06Xdh3WW0Jp+KB/LjUNa1pj1CXXh5+T+cK2TAQ6GPFIazxA9t4UScXTkhonFS9ybAWFAshJ5XHHfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aM3tQjzM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aM3tQjzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711279596; x=1742815596;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CExg+la76sIR1qkpm2KxEgcLr3rpl4q2ho2HMwdpUjg=;
  b=aM3tQjzMRIlTp62CL+pLgvI33XcHhLkZBUgejB9P8EnpnxkAlWWLIt/1
   Q+EU81/l7kLmextuUHjaaCJdvfXdCK4D15jdau103CrB18aaGn7iNG1FM
   pkeC+hqenp0ULIXIL2KBlAZyXlsKgwj5v2TQpvL4eo3h9d+Bu6109wInt
   Y4cxclK6P+dyJlKbebZafnPwih+t/xIokZe0HftPch0h0b5eu8CdXBVfH
   BX0Apt9ZuoCsvj81BzX8s5MfvVZppu+Ghrxyr7OM2Mz8HTlnVdLx2uRV9
   dlfhlq3LmnsdStGhA3T5LsDIloS7I0KqMSNdriXtmFbzoRStHB2T0s5Hh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6111248"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="6111248"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 04:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="20012031"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Mar 2024 04:26:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roLzi-000Lnr-10;
	Sun, 24 Mar 2024 11:26:30 +0000
Date: Sun, 24 Mar 2024 19:26:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to
 !ENDBR: hpet_clkevt_set_state_shutdown+0x2e
Message-ID: <202403241953.HelI1OMA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>
CC: Florent Revest <revest@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70293240c5ce675a67bfc48f419b093023b862b3
commit: fee86a4ed536f4e521f3a4530242e152dd2a466b ftrace: selftest: remove broken trace_direct_tramp
date:   1 year ago
config: x86_64-buildonly-randconfig-006-20240324 (https://download.01.org/0day-ci/archive/20240324/202403241953.HelI1OMA-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241953.HelI1OMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241953.HelI1OMA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to !ENDBR: hpet_clkevt_set_state_shutdown+0x2e


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 0000000000072760 <set_ftrace_ops_ro>:
0000    72760:	f3 0f 1e fa          	endbr64
0004    72764:	41 57                	push   %r15
0006    72766:	41 56                	push   %r14
0008    72768:	41 54                	push   %r12
000a    7276a:	53                   	push   %rbx
000b    7276b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 72772 <set_ftrace_ops_ro+0x12>	7276e: R_X86_64_PC32	ftrace_ops_list-0x4
0012    72772:	e8 00 00 00 00       	call   72777 <set_ftrace_ops_ro+0x17>	72773: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0017    72777:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	7277a: R_X86_64_32S	ftrace_list_end
001e    7277e:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	72781: R_X86_64_32S	ftrace_regs_caller
0025    72785:	48 f7 d8             	neg    %rax
0028    72788:	4c 8d 3c 05 00 00 00 00 	lea    0x0(,%rax,1),%r15	7278c: R_X86_64_32S	ftrace_regs_caller_end+0x1008
0030    72790:	49 c1 ef 0c          	shr    $0xc,%r15
0034    72794:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	72797: R_X86_64_32S	ftrace_caller
003b    7279b:	48 f7 d8             	neg    %rax
003e    7279e:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	727a2: R_X86_64_32S	ftrace_caller_end+0x1008
0046    727a6:	49 c1 ec 0c          	shr    $0xc,%r12
004a    727aa:	48 8b 43 10          	mov    0x10(%rbx),%rax
004e    727ae:	a9 00 08 00 00       	test   $0x800,%eax
0053    727b3:	74 15                	je     727ca <set_ftrace_ops_ro+0x6a>
0055    727b5:	a8 04                	test   $0x4,%al
0057    727b7:	48 8b bb 90 01 00 00 	mov    0x190(%rbx),%rdi
005e    727be:	44 89 fe             	mov    %r15d,%esi
0061    727c1:	41 0f 44 f4          	cmove  %r12d,%esi
0065    727c5:	e8 00 00 00 00       	call   727ca <set_ftrace_ops_ro+0x6a>	727c6: R_X86_64_PLT32	set_memory_ro-0x4
006a    727ca:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
006e    727ce:	e8 00 00 00 00       	call   727d3 <set_ftrace_ops_ro+0x73>	727cf: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0073    727d3:	48 85 db             	test   %rbx,%rbx
0076    727d6:	74 05                	je     727dd <set_ftrace_ops_ro+0x7d>
0078    727d8:	4c 39 f3             	cmp    %r14,%rbx
007b    727db:	75 cd                	jne    727aa <set_ftrace_ops_ro+0x4a>
007d    727dd:	5b                   	pop    %rbx
007e    727de:	41 5c                	pop    %r12
0080    727e0:	41 5e                	pop    %r14
0082    727e2:	41 5f                	pop    %r15
0084    727e4:	c3                   	ret
0085    727e5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
