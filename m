Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0889382292;
	Fri,  3 Jul 2026 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073870; cv=none; b=Ci73+vmn3IA1Gr49oEzOGuakLwOfXDwX7fxHgBGq1hl7UuvIaFdLZhq4AEMFZvk5WmZU/059A3bCwcz4TaW133jVNUmjA4m2D7+JsnH7+f4eGrSMaXr8fMTRq6WfATLCg16Ymxg7+vP1Uph6jMq9UZH2qzwfrlN5VR1HeDMizCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073870; c=relaxed/simple;
	bh=okjPfFS4ZXD/adAIx41uoBQRAPF5MO5PnVdWRID1+FA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V544Cen+mSvjoFL9m7kBI8AjDEST3fEbquB5Qup1Qk5KlYrqU6o3B+Cp0BIv44IOh2hwoiR62QFskCi3ZLXSGD07J65kOB59PfenWi8QH8U4fCDQRJPEVnURdhplC30VftPAz65yPuHAEwuJLPNbSLci3o7jzK72RmjxUVZPFnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbI/yv8V; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbI/yv8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783073868; x=1814609868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=okjPfFS4ZXD/adAIx41uoBQRAPF5MO5PnVdWRID1+FA=;
  b=CbI/yv8V4IJlVaRYhh7NJS0y+Qs0Xw4qdFg7urcdCZxX7WubwpOWURQq
   FgIBfz2H4tPK/lYhum7MQgL+cWmeQxwyTUOYa/16QBus4cvBobY+s351/
   dS2pTUeMWkDPeDt3y0kAb7o+Ht0+bRKYUdX+TD0HML388tlJL755lfvsj
   WKUHNjh8WP6P7FP6VzcANuYrR77DyDR85OghIOYMd2HjZpdLsQvoGJCHk
   xHNeNo1MIhdeOhxktaYdX20/9LFxhfCKyaXs9b16nOENjkrrGNSZvejel
   NvoQbdwpRxSPVFANCd3AWGGlue8qtK+Xw1QyjfkhSbBePGSAkalxiUroI
   A==;
X-CSE-ConnectionGUID: veYAn4i/Tl2Eh+wI1e4wWw==
X-CSE-MsgGUID: 73RUwppURiSKBUCJy6mhaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="71348980"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="71348980"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 03:17:34 -0700
X-CSE-ConnectionGUID: e0lhnupxQKSxZSztviBnhg==
X-CSE-MsgGUID: vx0J+772SZOz8LgdizaElw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="256972515"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Jul 2026 03:17:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfaxd-00000000Bz3-3CWo;
	Fri, 03 Jul 2026 10:17:29 +0000
Date: Fri, 03 Jul 2026 18:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu.o: error: objtool:
 amdgpu_vm_handle_fault+0x16b: sibling call from callable instruction with
 modified stack frame
Message-ID: <202607031837.HSmBj8pr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2c9a99135da931377240942d44f3dea104cedb8
commit: 7152b248dc3c8d5fa8629e99ed5655dd41b51562 drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_format
date:   2 weeks ago
config: x86_64-randconfig-004 (https://download.01.org/0day-ci/archive/20260703/202607031837.HSmBj8pr-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031837.HSmBj8pr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7152b248dc3c ("drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031837.HSmBj8pr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu.o: error: objtool: amdgpu_vm_handle_fault+0x16b: sibling call from callable instruction with modified stack frame

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
