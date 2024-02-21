Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772CA2E842;
	Wed, 21 Feb 2024 03:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708485719; cv=none; b=UoSgLKVjkiE0v5NjeYnKiw5xCNjV3QttsRHTboGjeDay6K/YZw58aD3Fu56c9CXvH43gMb9j88M4+ZJNLCXsgg8pRX8YckWC5TvbGbGAuc1EdSCcq+HvHRLCZAiYEgJGMNJGLiysl4zVrZe2hqI7NhOToZsS6N8hTX3Pg7Lajw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708485719; c=relaxed/simple;
	bh=roR4IWUrlyRBsXjWspybLv8S9RaU5stZ0s47JU/M4dU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p0E8tCI2aA1QZKYT2GO4gBFYzEkDZEPCxk/JM/FIfhPoqf6TLRVoXqsd66NKNg4bbt9ZSXCf6tdGCDWNvoPjicgq8buLGKcMvat+7s6burH0qZCz1fhP1N5kXPvMBv5DvtF3wdBuAO4I1QzeVRVJyBjxZK+7cEP602f08/b2jVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbDjbaT2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbDjbaT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708485717; x=1740021717;
  h=date:from:cc:subject:message-id:mime-version;
  bh=roR4IWUrlyRBsXjWspybLv8S9RaU5stZ0s47JU/M4dU=;
  b=dbDjbaT2hbrrtdlnlTpZUje7Q3Nvx6GdIAdc8B52oZ1nrC8ByTL+SUPy
   r4TiKtYEHkAq+0rZFHJAm6sS9UphqpjDq39SwDmQIdStNU0dxglrwAzNU
   DZhqggvGllRyu3g/HuQpf1Zlnx3re5JMNi47SjmGPpqsltaDBQ5mF2Ukk
   iuIDLPykUq8/suhgO9i1ZGvl0MXsJ8rY6m2t0yEE9dYX0ud6oa6fU05Pf
   BL/3GttKbgpygqreF8oiHxGAUKZabVxpbjJ82HSvbvk41/7t5HENs4WA5
   H3xYiEnZy/Tg5yuZxKNmzq2oXObZVay4owO9v5BrPVs+JcXeYOaH1gT+0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6407674"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="6407674"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 19:21:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9649698"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Feb 2024 19:21:55 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcdAo-0004y8-1z;
	Wed, 21 Feb 2024 03:21:38 +0000
Date: Wed, 21 Feb 2024 11:20:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v5 10/16] vmlinux.o: warning: objtool:
 early_setup_idt+0x4: call to startup_64_load_idt() leaves .noinstr.text
 section
Message-ID: <202402211150.wwhC4QA1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v5
head:   0cc3d2ea8faa59cc6406f95460e42ae5987ee35b
commit: 821c593f3d856b83c39d1572b1633b0c9ff6fa9c [10/16] x86/startup_64: Simplify virtual switch on primary boot
config: x86_64-randconfig-004-20240220 (https://download.01.org/0day-ci/archive/20240221/202402211150.wwhC4QA1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402211150.wwhC4QA1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402211150.wwhC4QA1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: early_setup_idt+0x4: call to startup_64_load_idt() leaves .noinstr.text section


objdump-func vmlinux.o early_setup_idt:
0000 0000000000000940 <early_setup_idt>:
0000      940:	f3 0f 1e fa          	endbr64
0004      944:	e9 00 00 00 00       	jmp    949 <early_setup_idt+0x9>	945: R_X86_64_PLT32	.head.text+0x4bc
0009      949:	cc                   	int3
000a      94a:	cc                   	int3
000b      94b:	cc                   	int3
000c      94c:	cc                   	int3
000d      94d:	cc                   	int3
000e      94e:	cc                   	int3
000f      94f:	cc                   	int3
0010      950:	cc                   	int3
0011      951:	cc                   	int3
0012      952:	cc                   	int3
0013      953:	cc                   	int3
0014      954:	cc                   	int3
0015      955:	cc                   	int3
0016      956:	cc                   	int3
0017      957:	cc                   	int3
0018      958:	cc                   	int3
0019      959:	cc                   	int3
001a      95a:	cc                   	int3
001b      95b:	cc                   	int3
001c      95c:	cc                   	int3
001d      95d:	cc                   	int3
001e      95e:	cc                   	int3
001f      95f:	cc                   	int3
0020      960:	90                   	nop
0021      961:	90                   	nop
0022      962:	90                   	nop
0023      963:	90                   	nop
0024      964:	90                   	nop
0025      965:	90                   	nop
0026      966:	90                   	nop
0027      967:	90                   	nop
0028      968:	90                   	nop
0029      969:	90                   	nop
002a      96a:	90                   	nop
002b      96b:	90                   	nop
002c      96c:	90                   	nop
002d      96d:	90                   	nop
002e      96e:	90                   	nop
002f      96f:	90                   	nop
0030      970:	90                   	nop
0031      971:	90                   	nop
0032      972:	90                   	nop
0033      973:	90                   	nop
0034      974:	90                   	nop
0035      975:	90                   	nop
0036      976:	90                   	nop
0037      977:	90                   	nop
0038      978:	90                   	nop
0039      979:	90                   	nop
003a      97a:	90                   	nop
003b      97b:	90                   	nop
003c      97c:	90                   	nop
003d      97d:	90                   	nop
003e      97e:	90                   	nop
003f      97f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
