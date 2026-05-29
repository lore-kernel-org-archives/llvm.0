Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECA33DF00E;
	Fri, 29 May 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056340; cv=none; b=CzMcH85mMqxtBhB0iPgMI2U6c3F6J2ZQVlyX7Ozb9NaowwGMYfMiSBALCF/NhHzlAFmmsnnSFHJA9n70FEO6eDceKJCQssAnP3lcaZn+S7SNDgleqMqt8AXRAbuGRrYhRjxLoXoAC85CezebSwExWSQmRd1AOubqh//RvY7mX6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056340; c=relaxed/simple;
	bh=skF7TRNZ9CRqTAZpFygYXwBWW8Ij6lBEXOK/Qxd96Tw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RAU1eMQUY2TOeD2VrQlbBUbz/+ZVNB8LtB0SoGAWZdCvfeeHkSAFsXx2Xzy4UHE38+Yts/mW8A3EEnlYb9rknAFgP+LOK6tljUBzEFRpV735kP/QUPsIJO8u0Cn8cRZ5TWX1Bav/sb0U/1uNKqXne7e58dzVJHmT3LaeS+TlVVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YdvusVtT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YdvusVtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780056340; x=1811592340;
  h=date:from:to:cc:subject:message-id;
  bh=skF7TRNZ9CRqTAZpFygYXwBWW8Ij6lBEXOK/Qxd96Tw=;
  b=YdvusVtTz9tCKbcylQMatiSO7RpFElZM74Ec8loK5u9aCUPc6ZB3eWBF
   vL0XnBFnA8fshHbJSr6RQjQnGF5a8Jao7qNxG55+SThPBpRaZtkFHkV33
   3eeCvHip8+XxTO82HVDutI0EAJN+m7HRNihYBk/SZbyrDBkm/+IvtqzO7
   ZFsDCq9fpGZ9wiMhKGFkvlvQ2zO/exdmy95NJmmvU15UnhYkOdrjFwe8c
   EALRvc6tf0OAE058o6tZwnZ3QFv3JfY3Z/7+X52OgPaeTF8OWyjy9gkzT
   zch4Ra0MXGudY66SHK6CIZ1vJOIg/Ed0WN+fy9Kmk6sS3VB2zmuFoeY+B
   g==;
X-CSE-ConnectionGUID: HjSUTeSZTPmiwKhs1EaPww==
X-CSE-MsgGUID: 9/4gC4ZvSQiv2qvdPwttDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="84793382"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="84793382"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 05:05:38 -0700
X-CSE-ConnectionGUID: 6imhKN9pTZiJf6JIffoWRg==
X-CSE-MsgGUID: OgsV9xzaToa0nEnwZkBOBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="247773280"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2026 05:05:36 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSvy1-000000000st-3Yf8;
	Fri, 29 May 2026 12:05:33 +0000
Date: Fri, 29 May 2026 14:05:00 +0200
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: drivers/ata/libata-core.c:5027 function parameter
 'ap' not described in 'ata_qc_complete'
Message-ID: <202605291323.oWhQ5Kvg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/ata-libata-Fix-ata_exec_internal/20260522-024512
head:   ca9420d376532f757f27a9e97c6ec88d83982c88
commit: f51a8e254c560f1aa294735e150829a1005fc4c8 ata: libata: Pass the ATA port argument directly to ata_qc_complete()
date:   8 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260529/202605291323.oWhQ5Kvg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291323.oWhQ5Kvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291323.oWhQ5Kvg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/ata/libata-core.c:5027 function parameter 'ap' not described in 'ata_qc_complete'
>> Warning: drivers/ata/libata-core.c:5027 function parameter 'ap' not described in 'ata_qc_complete'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
