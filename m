Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7688D4207D;
	Tue,  2 Apr 2024 23:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712100493; cv=none; b=bs3Js+uIYAsigWKQHnP/mjje8P5HweZxz/e2rSh6sjkMi2zV59EeqBivDQZI6mKs4w455Maq7bC9LivtecIAUX7OO1XCb3oV7mgmvesd/fpz8b+hjXD1TW3WMyfiEQMJatkSN5n6UlmRezltIeDmkr36rq04HSNqBTC2HSJM/RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712100493; c=relaxed/simple;
	bh=znAnZElW3HhdrPFD8m6JNH/pRGieKQYD0c5LGW72PNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ujAQFV1bP66P495bZaPUuLPHXBkSZXmFgtQMRqrzYQ2lYNQ8BVW7pAdztI6SQ0+6whPKZTbnIMA8ds4Xi/4FH7m2qP6bENjmu4mzJzjRSkL+d+dsPKG+SLvSjv+nWrUHhq6nC+2qB49yf7W/OlWhAuw2R/N+9a4RcqN3d069SGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbAUuJMb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbAUuJMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712100492; x=1743636492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=znAnZElW3HhdrPFD8m6JNH/pRGieKQYD0c5LGW72PNU=;
  b=FbAUuJMb46NNejCvyXm/WMETrPaMnAxhLVdmL7pPsjelBZbTTBIqn6Pt
   SVYPj0IWDvA+LYFbLUvnHr1wE9YhfJ0GWyvwd60qed65zy7Wwn/XBa2Zq
   FnSvUtM1frU483yzoq7ua/uJhxyidi6qzF+BkbbD79UTALx9jTT2EtI0h
   BYap8/HP8WzKKzH53MZitczCfx+sCVUJQ5xxIIWW40TOcVTqVs2AWT29L
   72Bj1ZZvS7/+sPvnZSjTNaALNfte89xcAEWZEMoeufR/9ufNjGZ5LcsJe
   79ti6DkZJYoJSW31JlvaJkMAHCoJBBodtxJetfSzSXD1HL4TuM+sgBUPD
   g==;
X-CSE-ConnectionGUID: EfRcmB08SLm+3w6i/jE1fQ==
X-CSE-MsgGUID: 1w0Vrum0RlOMH89eMnaksA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7528486"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7528486"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 16:27:43 -0700
X-CSE-ConnectionGUID: BSopshwbS4G3LLPrYfdkcQ==
X-CSE-MsgGUID: gZgoGCGgR7ylTrcN4HlBDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18348504"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Apr 2024 16:27:41 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrnXX-0001cn-08;
	Tue, 02 Apr 2024 23:27:39 +0000
Date: Wed, 3 Apr 2024 07:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:kvm_pmu_snapshot_v5 12/26]
 arch/riscv/kernel/paravirt.c:65:13: error: use of undeclared identifier
 'SBI_STA_SHMEM_DISABLE'
Message-ID: <202404030746.BC3MI8IG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_pmu_snapshot_v5
head:   cdddc91e3f95ed945d275254a88f64fc64b62f96
commit: b02b0545bb76e198b4a7e481866b42596e15bb00 [12/26] RISC-V: KVM: Rename the SBI_STA_SHMEM_DISABLE to a generic
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20240403/202404030746.BC3MI8IG-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030746.BC3MI8IG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030746.BC3MI8IG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/paravirt.c:65:13: error: use of undeclared identifier 'SBI_STA_SHMEM_DISABLE'
      65 |                 if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
         |                           ^
   arch/riscv/kernel/paravirt.c:65:44: error: use of undeclared identifier 'SBI_STA_SHMEM_DISABLE'
      65 |                 if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
         |                                                          ^
   arch/riscv/kernel/paravirt.c:87:38: error: use of undeclared identifier 'SBI_STA_SHMEM_DISABLE'
      87 |         return sbi_sta_steal_time_set_shmem(SBI_STA_SHMEM_DISABLE,
         |                                             ^
   arch/riscv/kernel/paravirt.c:88:10: error: use of undeclared identifier 'SBI_STA_SHMEM_DISABLE'
      88 |                                             SBI_STA_SHMEM_DISABLE, 0);
         |                                             ^
   4 errors generated.


vim +/SBI_STA_SHMEM_DISABLE +65 arch/riscv/kernel/paravirt.c

323925ed6dbb0e Andrew Jones 2023-12-20  56  
fdf68acccfc6af Andrew Jones 2023-12-20  57  static int sbi_sta_steal_time_set_shmem(unsigned long lo, unsigned long hi,
fdf68acccfc6af Andrew Jones 2023-12-20  58  					unsigned long flags)
323925ed6dbb0e Andrew Jones 2023-12-20  59  {
fdf68acccfc6af Andrew Jones 2023-12-20  60  	struct sbiret ret;
fdf68acccfc6af Andrew Jones 2023-12-20  61  
fdf68acccfc6af Andrew Jones 2023-12-20  62  	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_STEAL_TIME_SET_SHMEM,
fdf68acccfc6af Andrew Jones 2023-12-20  63  			lo, hi, flags, 0, 0, 0);
fdf68acccfc6af Andrew Jones 2023-12-20  64  	if (ret.error) {
fdf68acccfc6af Andrew Jones 2023-12-20 @65  		if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
fdf68acccfc6af Andrew Jones 2023-12-20  66  			pr_warn("Failed to disable steal-time shmem");
fdf68acccfc6af Andrew Jones 2023-12-20  67  		else
fdf68acccfc6af Andrew Jones 2023-12-20  68  			pr_warn("Failed to set steal-time shmem");
fdf68acccfc6af Andrew Jones 2023-12-20  69  		return sbi_err_map_linux_errno(ret.error);
fdf68acccfc6af Andrew Jones 2023-12-20  70  	}
fdf68acccfc6af Andrew Jones 2023-12-20  71  
323925ed6dbb0e Andrew Jones 2023-12-20  72  	return 0;
323925ed6dbb0e Andrew Jones 2023-12-20  73  }
323925ed6dbb0e Andrew Jones 2023-12-20  74  

:::::: The code at line 65 was first introduced by commit
:::::: fdf68acccfc6af9497c34ee411d89af13b6516ed RISC-V: paravirt: Implement steal-time support

:::::: TO: Andrew Jones <ajones@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
