Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD0136607D;
	Mon, 22 Jun 2026 23:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782172114; cv=none; b=OC45RS1N8x3OAgpRXeQp0+nR2fGJGTshb3D57kCfvT8MDUmVDBrs3DM/RuLEuwFAEUPfKaFVF7PjkeenaUsrTAwek739ZHRfq00zfkOR7+89EsOta5qLvUh+Fmx6fpltSwDHriOxwWHtdsrEjolWflxeYnuOBOA7BqKc8wmkEU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782172114; c=relaxed/simple;
	bh=SULa2HS8f6/6TpJLUA3MkTcDo9zk8jm2qGzh1CvTESQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uH/jqNfCy6eyT7caWboEj62PVFONVjiYPyGjBDtv9hqOyS+wB7deiFv39DoV2IJ+g+olWsmEtd/WoTqS9VRalJR7fZMzPc74/QwP6cEQUnhIeWBRy29qXQ6xGDD0YCGhYquIpshnW8GSHTPy1Geo0uwXLQrFUV45MgIRJLrIszw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+eTUvb4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+eTUvb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782172113; x=1813708113;
  h=date:from:to:cc:subject:message-id;
  bh=SULa2HS8f6/6TpJLUA3MkTcDo9zk8jm2qGzh1CvTESQ=;
  b=L+eTUvb4pYHuDBdAhuNz4er0HlzvVGyyzrEFSN6ckK7RX44j65dsv/57
   sBs4HeCk617GPsgQC+PaYJB5xJzKLmtQHJlem13wvs1TH21nBiiUBDmpm
   twOJgoQawwDXKh2veV0yqKmd4MhcBFP/71PtUSX5LqRNnJJvNR/T7cCR5
   rFRMPWhKe+Ozfv/uR55erz4UiWGf28tYN4AAjX1Wfvylchow+N2iWtM4s
   c2E1QVelh+D933Ur2X1A7gpDrlmv26quNhu2GMu5MMXjuowEeU1qGFauy
   K+SIOiAFeyn+F3WbwgcCg9/s4TmaDVF4Do40QrP9ZEX9rB3QHFvgRgtxA
   g==;
X-CSE-ConnectionGUID: gDdrIOmXSOug8b2mB+RFpA==
X-CSE-MsgGUID: doL6NREUS3WEl62TVO3ttg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108453515"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="108453515"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 16:48:32 -0700
X-CSE-ConnectionGUID: CzrQETFWSX+bkN0IxSuuRw==
X-CSE-MsgGUID: NBOkJXRCSIeGVnYTK090ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="273050085"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Jun 2026 16:48:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wboNM-0000000024D-2dui;
	Mon, 22 Jun 2026 23:48:25 +0000
Date: Tue, 23 Jun 2026 07:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/syscall 2/4] vmlinux.o: warning: objtool:
 x64_sys_call+0x1b9c: return with instrumentation enabled
Message-ID: <202606230732.Aowkv8Mi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/syscall
head:   47c2508c2db3f83600b4d5e8f7a83226213b6cc1
commit: 9056c35af120a6bba4e4532eb34a00533f6f73c3 [2/4] x86_64/entry: Make syscall dispatch noinstr
config: x86_64-randconfig-011-20260622 (https://download.01.org/0day-ci/archive/20260623/202606230732.Aowkv8Mi-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230732.Aowkv8Mi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230732.Aowkv8Mi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: x64_sys_call+0x1b9c: return with instrumentation enabled
>> vmlinux.o: warning: objtool: ia32_sys_call+0x1b34: return with instrumentation enabled

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
