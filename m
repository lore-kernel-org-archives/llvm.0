Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BE1B640;
	Sat, 20 Jun 2026 01:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781918378; cv=none; b=Jfh6QFsciSvvGr8Ab/b39/pLKilzgzKc+xGZLqq/qcRJL0ul2irACm1Q340/YBGTtClDSIfDwn41+1Luf4rKE05ftD20PeXkCIn8qEn6MGg94OrkEyDKNRA73D76AD5jDeatrMKQ/61I+uh/lEgEJ+rqfHizhSRuO3N5A2SQP90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781918378; c=relaxed/simple;
	bh=oLq71T8q9DjQVmUom0Do3zNp7mINMT0ft3yFf0mMyiE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E16M2ep7zHZKsb4GkscU2fSQf1IBI3yyvoWoRrS5fOvIHq8akNpuZBUWP8Skqp1GECYtTT4TZ+lFPABQJFAWllRDYPibaxpTXFOoVnJo+psoMCHnEFXUel37ffT8aGe02Ztyae6MoIipy2/+WuIRUtWNrpRtDQJyltwlvSX6pS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZzDOM03; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZzDOM03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781918376; x=1813454376;
  h=date:from:to:cc:subject:message-id;
  bh=oLq71T8q9DjQVmUom0Do3zNp7mINMT0ft3yFf0mMyiE=;
  b=EZzDOM03N6eAC9bvNc5p0aOi6qyAwGOZN6hV6kLfN/tHbxRux5gKxfaC
   Xc96iqUVlpVntQdUIOQRiclhEZ/Oj1C106ppVEXHbWZIe2+8JFbyCVVtW
   qprL73Jnqg/2YAXeCIU9hDKEcpzpUaCFA6O7VG6RVQrvf8WZ75bh4IhL3
   EukA4eMRpVdlqUszrabJc8L9dQvmH6cIFauZqnrJm7h+flyiUHRNyyNl+
   bO/YFOkFG7L+5XwmfGOh48zGoK99leypjiZYwAFO/WSHqImx6lWQpVB1C
   hNuXBRfuOxq+8p9AuZ4ovvN/yr5gtduH3QJJ7upYgoL0BX8e1kHnbkhNd
   w==;
X-CSE-ConnectionGUID: SpSejkyuTsSqRppdSO16bA==
X-CSE-MsgGUID: jT1Hy9gMRWCyInrnyVoCHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82790143"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="82790143"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 18:19:34 -0700
X-CSE-ConnectionGUID: rt0pQJblQBSWJ2TCLjVN5Q==
X-CSE-MsgGUID: euC7envSToqtemorcWPSHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="252646141"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 Jun 2026 18:19:33 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wakMs-000000005iP-25HT;
	Sat, 20 Jun 2026 01:19:30 +0000
Date: Sat, 20 Jun 2026 03:19:10 +0200
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/syscall 4/4] vmlinux.o: warning: objtool:
 .export_symbol+0x138: data relocation to !ENDBR: x86_entry_from_kvm+0x0
Message-ID: <202606200333.ITkShSz0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/syscall
head:   47c2508c2db3f83600b4d5e8f7a83226213b6cc1
commit: 47c2508c2db3f83600b4d5e8f7a83226213b6cc1 [4/4] x86_64/entry: Mark C noinstr __noendbr
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260620/202606200333.ITkShSz0-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260620/202606200333.ITkShSz0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606200333.ITkShSz0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .export_symbol+0x138: data relocation to !ENDBR: x86_entry_from_kvm+0x0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
