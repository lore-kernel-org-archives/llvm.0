Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD6321B905;
	Sat, 21 Feb 2026 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771669626; cv=none; b=mwHwCJ2+fkTtnl4EiMvxwh3UV/UO1vyRoDwp2Gz0zQ4nozKW4RgUiykKEBR7z4s7LqLVy+kum5UymEzpjxODnvL6kiHFOIdQR75YanXjWOslugSqSoaTOArVO1d1YHIaPXDdlM7AGX/fpBPRfbCMziDj6A+wCnRJXa5m6NP4kBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771669626; c=relaxed/simple;
	bh=3J6hIeGJAfmJSdGahJJtXM1K6WS/p+Fuyg08p3aVToo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XMVoTbgsxU15aNw/FZJB9eAh9tVEldZYPr+vjJjFLaxSnAy1AkqemHczHX2T138iL7jSCA2cB9aPpIF646zQ3GB7IaQySQ5EDqPcDzrb1d3aLFejPk+A9wr4s+SyA0aQmeU1NQstd5fyahl7DE/upPoCrWjSx02ULXDtfqUq2rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khb7AySL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khb7AySL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771669624; x=1803205624;
  h=date:from:to:cc:subject:message-id;
  bh=3J6hIeGJAfmJSdGahJJtXM1K6WS/p+Fuyg08p3aVToo=;
  b=khb7AySLEKUslVUJviulOTZUa0HER2UHujeEdxokuYxau/K3KiWc/eTr
   I3CP+ked/jcqJuE6IHpM0xIdqdUMDEODxwvAcYZh9To4w8k0JX5SSz4Ok
   7cqrnaP2BZEpLoIbMr6M7rjnc3rff4HpUaBVpc5TNDykJWQTterqcD72D
   G+91SQ0JR74+NQr4zarZL65JZ5UfsTRbAv/rV24s5HAAoXdyZ6jx4DlNs
   5pjSGSH+CFP332JkoriHBiJTAkPXxGTDeTa3ChmXtfuXZ2VhDMCU3NHSW
   /eaArpTqDFVFwfDMzMbxF6nNRjiP8xLmlgJhOAl0TZh094T8leBRrtjHa
   w==;
X-CSE-ConnectionGUID: q4UFrTxHSoKCUNqOTax/bw==
X-CSE-MsgGUID: RhiMnomjTaGUs1NmoC9dHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76577716"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="76577716"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 02:27:04 -0800
X-CSE-ConnectionGUID: Q8LsCs7cQEyjdPlLlRRA+w==
X-CSE-MsgGUID: ri+qetULSRaJQyvahYJ3wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="215093488"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Feb 2026 02:27:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtkCS-000000014qe-0Tny;
	Sat, 21 Feb 2026 10:27:00 +0000
Date: Sat, 21 Feb 2026 18:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 20/20] ld.lld: error: relocation
 R_X86_64_32S cannot be used against local symbol; recompile with -fPIC
Message-ID: <202602211813.TRAbOPW5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   f4536209da12a51a798128b7a8361c67e17c1e91
commit: f4536209da12a51a798128b7a8361c67e17c1e91 [20/20] x86/kernel: Switch to PIE linking for the relocatable kernel
config: x86_64-buildonly-randconfig-002-20260221 (https://download.01.org/0day-ci/archive/20260221/202602211813.TRAbOPW5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602211813.TRAbOPW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602211813.TRAbOPW5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_X86_64_32S cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by hv_crash.c:163 (arch/x86/hyperv/hv_crash.c:163)
   >>>               vmlinux.o:(hv_crash_c_entry)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
