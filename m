Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C65F14A4DA;
	Fri,  2 Feb 2024 17:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706895032; cv=none; b=ojKex3A43oF6nND7URAbFFmZrMkluY7vMOaU6rLjbJNdD+aAkrK8QowE3XAWSAQNGaV7Yh2dqXdVOfq3p1khXel6NR5HS+jS+05QUqkyVDTJ3fxJWEPYvXioQsLnqGekuT9666P6noGUPSBlpMTqIk4MT02EgiTuODLlxScOdgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706895032; c=relaxed/simple;
	bh=hc4+mX/Qq785OMnsFXt5NC8kmZObcUqMz13vZkJzH80=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CiITVeIZ8mR8Lpf6ZycjjJoXLpa/NnZ8dPNnnqJTKiQrYyj/1lEt5F6kjO06kKD9z8zJ5Wq7jCCqSkOd00X1HDxZMuMgbH6jDHXMsxBQIIG0NDGCxHrCOlXswvwPdt94rTLe/euAZN1A51Z8tbYBL45D5dAlgXR9eegoGGVk4K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nR3UmXL1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nR3UmXL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706895029; x=1738431029;
  h=date:from:cc:subject:message-id:mime-version;
  bh=hc4+mX/Qq785OMnsFXt5NC8kmZObcUqMz13vZkJzH80=;
  b=nR3UmXL1pFbMwvf+C9wGoF2ovakRONGC4F08zFJzIoyGNiVS5iw7Xvsg
   RMs5yzrUBB42WULBVJ0/hRjUtwndpTnS8mERaERFs615uDsSq/pRjjm07
   U1HbFXG3v3FQDC7/VyFffKQtpm4UYBbv00wTIrWvky/ER1XV/4jH6Krvb
   dwY7fyy7Hrdlu8PyNtLVoCyGQPa1t4EESBFrUt6B5yWQyqJLyIG2UiEDw
   i4wdDTZfBlbFc51Hdp0RaCLELkD732x20vGmF1pavxEIgVJbrpNh5ucYe
   5ZjrKGvj8dqQfgtixI0WENJqVaRFgfxKxryJbRDywR0+N6lh43xr4w9fF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11565240"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="11565240"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:30:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="118136"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Feb 2024 09:30:27 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVxMs-00046j-1C;
	Fri, 02 Feb 2024 17:30:23 +0000
Date: Sat, 3 Feb 2024 01:29:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v4 12/21] vmlinux.o: warning: objtool:
 cr4_init_shadow+0x0: stack state mismatch: cfa1=4+8 cfa2=-1+0
Message-ID: <202402030124.2ATrwQC8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v4
head:   a2c57e6c70798f62230ccdc90e6a5fd6799489ea
commit: fd4f7a550c99eb7f5e414ab9bdbbba3d578f7f8b [12/21] x86/head64: Move early startup code into __pitext
config: x86_64-buildonly-randconfig-001-20240202 (https://download.01.org/0day-ci/archive/20240203/202402030124.2ATrwQC8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030124.2ATrwQC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030124.2ATrwQC8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: cr4_init_shadow+0x0: stack state mismatch: cfa1=4+8 cfa2=-1+0


objdump-func vmlinux.o cr4_init_shadow:
0000 00000000001a3640 <cr4_init_shadow>:
0000   1a3640:	0f 20 e0             	mov    %cr4,%rax
0003   1a3643:	65 48 89 05 00 00 00 00 	mov    %rax,%gs:0x0(%rip)        # 1a364b <cr4_init_shadow+0xb>	1a3647: R_X86_64_PC32	cpu_tlbstate+0x14
000b   1a364b:	c3                   	ret
000c   1a364c:	cc                   	int3
000d   1a364d:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
001c   1a365c:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
002b   1a366b:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
003a   1a367a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
