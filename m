Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D15A1BFE0C;
	Mon, 25 Nov 2024 21:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732568478; cv=none; b=NGozrHNPik0m2Eo3wPxzCbeU39xbXA4E2GDDuF4BWPFJFHeogxbyPaBiJs789xwCRKC/UYQBr0rh/MT2+cvBhVJjnKpFspqmUfeZTL7VIAX7jrV3RltFgLSEnBiKwklijzFrk6JRKgXKr5ePWYg6tP2VlT4uy7svHZ7HJm/vdxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732568478; c=relaxed/simple;
	bh=XAwiMozoNLPS8mjHOorPqrFiU28vaKiYB4yk9iHltBU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ejsp4V2H9jQ+aOkpifS92EzWZlDGW8wSGJ4pWeDjq11CV6wWAa1FDGocgjYpJG9UvUf1LI3KwSSsxvLJ6QqUgp9cq/jBSgwvdUh3jr/C8+hIuVBNOi3V+yeWImMteR5IrimC64eeSUMLnZCQUCbYOaMRg/SWvlalEg3gwcA4eEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MC4R0u0o; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MC4R0u0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732568476; x=1764104476;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XAwiMozoNLPS8mjHOorPqrFiU28vaKiYB4yk9iHltBU=;
  b=MC4R0u0oqpxnXwsqxvjSL9Hq9eQVORLEuN7J1I7hXx4dOEOwEb+sQEyV
   f2ID7ztcJ8ylvQe1gU53+9y8bI4KGC91rLVfvla+0ly8l1uNC2ArBRfMZ
   R+gb8ssA8b1Prkz4HT/ATuPA7f/jpzhLymDo1P3QLybLin1szXagne5ma
   T+D8P0x0v58vUOkCkBx2SQhs5Rha+hUV9IvNnDZ8Mh+8dxPpbPR5eiscr
   XuuOXw17kLvHRNy9taMiQZy9VBT3zs1xqsqgk293vO4XswPdzBqCXzw0W
   K2h+l0rb1ciMvyaRpSsBsQzPcPkxTpOGOnr73zJmZ+GTJplSecSR+C8Ez
   g==;
X-CSE-ConnectionGUID: tQzYVxfXQ0ymTqkCIhUzug==
X-CSE-MsgGUID: /Y6+snoDTt6TjzprCSzbMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36481836"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="36481836"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 13:01:16 -0800
X-CSE-ConnectionGUID: 7o9SDh7XSfu0Y2lO2rW6IQ==
X-CSE-MsgGUID: lDk20KUtT/S6F73iGxtVlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="91340615"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Nov 2024 13:01:15 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFgCm-0006nP-3B;
	Mon, 25 Nov 2024 21:01:12 +0000
Date: Tue, 26 Nov 2024 05:00:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:objtool/core 3/12] arch/x86/kvm/kvm.o: warning:
 objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202411260421.4JBdFPW5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   a5091c456d5d4e22f5729d7600080b18a37f10a2
commit: f4b16a1d266666624331222f640e9de652bc1dd4 [3/12] objtool: Convert ANNOTATE_NOENDBR to ANNOTATE
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241126/202411260421.4JBdFPW5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260421.4JBdFPW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260421.4JBdFPW5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/kvm.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/nvme/host/nvme-core.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/nvme/target/nvmet.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> net/wireless/cfg80211.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> net/mac80211/mac80211.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/ufs/core/ufshcd-core.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/scsi/pm8001/pm80xx.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/scsi/qla2xxx/qla2xxx.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> fs/ext2/ext2.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> fs/nfsd/nfsd.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> fs/fuse/fuse.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
