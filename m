Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89E225B09C;
	Fri,  3 Jul 2026 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783100311; cv=none; b=kG01s583yGTYSAmjCrRsk6DMwdDIuGKqvk4HpO58ltib4BvG/0y4vMJQFrijUKRpo04teZSVXOADT+P+sz2/0i86wZfPA6aJ5+gFrGmTb5aKRWEfYk2kcu5puhokRbiTioztb7SDsvSX+ry9zPrFvCIr2Mn3Z5NCUBmbXiPKmZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783100311; c=relaxed/simple;
	bh=Qvz2ZBpKY96vXNRdZAm8mtgNTkrMlOGXNtkGTIFWDIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BFJ4FktZ9Ndl41eCqa+ueAVY6PJ8n3wuBb0U60Ystl5LkG0bnFuCMEsumdDjJZ7yFD+i2Khq1/GQmCrcSG8SZuwqwwt0NNBc0hbBKIAshvK9SMM1/en1RNeYruHyoWNYffjYUd5PAyWZjizFhtIUVfFL1gL7C1+E4JpsbB6ozOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCc/AI3M; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCc/AI3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783100310; x=1814636310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qvz2ZBpKY96vXNRdZAm8mtgNTkrMlOGXNtkGTIFWDIY=;
  b=KCc/AI3MFj8akf6I46MSFZ7y9hckZ+NJsBQyuCBxWHeZbKNr3M3CxWKF
   O5l/fPKbnuate6Xk9QyBffpBFz0zSd4sCpF1Q9Mw26gWO0LGK89PuHSAH
   eTlMibO3QKc4/Avwvx6b7kz+3Ca23duUHLZQ6vraNT1ac6wu0j3kzdHWk
   FhRJoneNZZu39MinYsBTZ6DXUgVqIoj+XqN2H5MuH28wbCHBmxNRkXekB
   pHMD0KZI8nwDcMT1RVwcbndP0pKfL4dwekzb2wRnyQwL1Ov3hEuylW9hw
   h8I6YcC8+O95GowVftLr1Mt1P5gwNA0DTXXzkuDUfAWvqFxQPrYAX+pf9
   A==;
X-CSE-ConnectionGUID: tRUhqrGsRRelcY3pwRh1Vg==
X-CSE-MsgGUID: /9TEVesNScKZf3XetimMyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83946875"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83946875"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 10:38:29 -0700
X-CSE-ConnectionGUID: In/n3TebR2GmkmSyMYphtA==
X-CSE-MsgGUID: mBo2TAK9TzKv+8Tlo1CK3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="291303775"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Jul 2026 10:38:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfhnt-00000000COv-19Uq;
	Fri, 03 Jul 2026 17:36:33 +0000
Date: Sat, 04 Jul 2026 01:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: vmlinux.o: error: objtool: amdgpu_vm_handle_fault+0x186:
 sibling call from callable instruction with modified stack frame
Message-ID: <202607040159.GopyEswS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Mikhail,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2c9a99135da931377240942d44f3dea104cedb8
commit: 9920249a5288e7cbec222cd52996bbd9aac7ec9e drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to drm_exec
date:   2 weeks ago
config: x86_64-randconfig-006 (https://download.01.org/0day-ci/archive/20260704/202607040159.GopyEswS-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607040159.GopyEswS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9920249a5288 ("drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to drm_exec")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607040159.GopyEswS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with modified stack frame

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
