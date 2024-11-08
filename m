Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A46C1C1F2B;
	Fri,  8 Nov 2024 23:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731108326; cv=none; b=B3HchMeqXGhOpgceJxC/7Uw8CYFUhHguTiG50OnJmS2cInXM2+1Qyy584TwGQIGUYbCRUx59fyN6XBKykqUMm3FoW302jvmm/PSpeI51TYU/yndkxz4Wo8ShQZJAkNmgEPMzSB8F1/jKFFbLJWLjtPCOVxQWDSb341gbGIg0rEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731108326; c=relaxed/simple;
	bh=HB9UhES9AjUTvhUzMFfVMWvR01v2sLg4cCRufVUx/GQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ROAmkQ77y8ndCil4bfDJButjbxC6RvJ23wWq72NujFDy24Y3UBqThnvaBQuJYKH3CLNTwhBAzwhKuXx6baUhzGFqrUSuZtrZAaUd7N4hUzjTIa1nzw46espZy6uxmvdVaV1pyPyFAazYV17I7ynRx52440RE/Eh0EUGTAvUrHQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFt+UgHM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFt+UgHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731108324; x=1762644324;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HB9UhES9AjUTvhUzMFfVMWvR01v2sLg4cCRufVUx/GQ=;
  b=GFt+UgHMTcbMtFc4nHc51zsQnd9ajS+zJFfjgRdkHBAMajNhJPWS9UeG
   nsPMrs4hX6pCBxonsuAOIXGwWClAHnAhED3JZcqdpmuTIFX8jWFtkqQEo
   DXYsuomndTbdcv0GqrLgI1OyE/YNAyrZOdp2YKJnLZhY3ywThcuvkUThC
   Jz4wqIJWZebSDk+1lx68XCXvhSKaiH2CGUqVXqeMsNZHN68yOH+zdxBUc
   zJ1a/LgameIBoYwFGPi8AULmk2RhwDYLHkLGmG7lqdmPHftLEktkFvLwh
   WZf8OhevoZX0arFwhwBpTOEmJ5GJyfV90zFiY9AVzmmuYGwj7CNz58Oog
   A==;
X-CSE-ConnectionGUID: zV/U4LgqRPy1oK+ynqmIrA==
X-CSE-MsgGUID: 2vIgcL4aTKuHiwhgNjxDNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34792147"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="34792147"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 15:25:23 -0800
X-CSE-ConnectionGUID: gRnmPKODTJ21lryzlGX73Q==
X-CSE-MsgGUID: lUwxVXkrRvSrrJFtPIK3ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="85281508"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Nov 2024 15:25:22 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9YLw-000rsZ-1F;
	Fri, 08 Nov 2024 23:25:20 +0000
Date: Sat, 9 Nov 2024 07:24:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:x86/kvm 2/11] arch/x86/kvm/kvm.o: warning: objtool:
 .discard.annotate: dodgy linker, sh_entsize != 8
Message-ID: <202411090753.2itRAFAt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   1b808dd4afc876a60f23ccd0dbf4557009acb47c
commit: 436d055217f93f2ec67fd3fb015e10b5d3905e64 [2/11] objtool: Convert ANNOTATE_NOENDBR to ANNOTATE
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241109/202411090753.2itRAFAt-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090753.2itRAFAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090753.2itRAFAt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/kvm.o: warning: objtool: .discard.annotate: dodgy linker, sh_entsize != 8
--
>> drivers/nvme/host/nvme-core.o: warning: objtool: .discard.annotate: dodgy linker, sh_entsize != 8
--
>> drivers/ufs/core/ufshcd-core.o: warning: objtool: .discard.annotate: dodgy linker, sh_entsize != 8
--
>> drivers/nvme/target/nvmet.o: warning: objtool: .discard.annotate: dodgy linker, sh_entsize != 8
--
>> net/wireless/cfg80211.o: warning: objtool: .discard.annotate: dodgy linker, sh_entsize != 8
--
>> net/mac80211/mac80211.o: warning: objtool: .discard.annotate: dodgy linker, sh_entsize != 8
--
>> drivers/scsi/pm8001/pm80xx.o: warning: objtool: .discard.annotate: dodgy linker, sh_entsize != 8
--
>> drivers/scsi/qla2xxx/qla2xxx.o: warning: objtool: .discard.annotate: dodgy linker, sh_entsize != 8
--
>> fs/ext2/ext2.o: warning: objtool: .discard.annotate: dodgy linker, sh_entsize != 8
--
>> fs/nfsd/nfsd.o: warning: objtool: .discard.annotate: dodgy linker, sh_entsize != 8
--
>> fs/fuse/fuse.o: warning: objtool: .discard.annotate: dodgy linker, sh_entsize != 8
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
