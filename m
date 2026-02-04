Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B95286A4;
	Wed,  4 Feb 2026 00:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770163924; cv=none; b=L4pFYGbzoU4b86fekzsz6vP+jeqrVq0XGqkzMMGMs6JhB4CdTRmLnBDaVGqhVa2r4rNtfqOl+eWV7HVEZ2/I3sSdCZ2WjC56IcuVyV6A2WjQl0Ew6zsoH03dBPGoVcB2KYMJPImITfCuQj9f/mpKehybdFKeHSMSm81EWzHoldA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770163924; c=relaxed/simple;
	bh=fAzvCF2oTHcWD4Et395ZiguCf24azv7afztDly9G4gk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kv44nBmCFybAhmJdFkYFB0ajaHP/7fj9yN0tU40kAjqlUJPe4izkOaqMPAVxPk/33ubhqzeYNC20WmIy6baQjOICbST0J4StbTDe4yiWJR48co6NMAnmYfuJ9/BXpiZGLeer7ewai0tXv69L1xf4+X6lWqbMkyC03tJeq5b858Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2ejfkpG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2ejfkpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770163923; x=1801699923;
  h=date:from:to:cc:subject:message-id;
  bh=fAzvCF2oTHcWD4Et395ZiguCf24azv7afztDly9G4gk=;
  b=Y2ejfkpGZMvyc/3ppybQlSRKL+8I7SxUueJC35WQiNv9fFcW94PsxFAD
   OvVSc2bVEbZFyuvDXW+T2td3Kc0InvCCgIj+qne6CGgCY1+41rLA3jTOM
   qW8pDD9rg+oFTrEdVi03i9WxqFB7APHuCsTg0R1ZIcOAUqX7T9IZEjHQC
   Q+7sSmNsqGAH7pqm4pFLV5e2dy/Z+cjKRDXYVWp6JthbLD0wMcG28qptH
   EXTStdWJbRtesyjCgkC3H2KGqw34ufjaOTx2/Bh78EJZjQX+pXNVjf+Y1
   gLisAHtPIcZY6YzrywHKSPR9WdhnynCttdUf2Xb+qNsCwfN77ruspp8NI
   A==;
X-CSE-ConnectionGUID: hqopGtOITo2dytNpJVIn/A==
X-CSE-MsgGUID: /1+t9w4NSEybjQBwqS0yEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="58924454"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="58924454"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 16:12:00 -0800
X-CSE-ConnectionGUID: fzftN4RZT6eXsRC4shPrfA==
X-CSE-MsgGUID: fTYNxzWRT2SVkxgrq8luxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="209801802"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2026 16:11:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnQUu-00000000hJg-1Qzx;
	Wed, 04 Feb 2026 00:11:56 +0000
Date: Wed, 04 Feb 2026 08:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi 6/12] ld.lld: error: undefined
 symbol: bpf_check_attach_target
Message-ID: <202602040833.jRDsHtWK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi
head:   ae091d7daa68f465679351da2b52a948a8beab4b
commit: 892424c1e07f243e850e0611bf3e2b990a684a1d [6/12] bpf: Add bpf_trampoline_multi_attach/detach functions
config: x86_64-randconfig-006-20260204 (https://download.01.org/0day-ci/archive/20260204/202602040833.jRDsHtWK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040833.jRDsHtWK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040833.jRDsHtWK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_check_attach_target
   >>> referenced by trampoline.c:1478 (kernel/bpf/trampoline.c:1478)
   >>>               kernel/bpf/trampoline.o:(bpf_trampoline_multi_attach) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: btf_obj_id
   >>> referenced by bpf_verifier.h:916 (include/linux/bpf_verifier.h:916)
   >>>               kernel/bpf/trampoline.o:(bpf_trampoline_multi_attach) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
