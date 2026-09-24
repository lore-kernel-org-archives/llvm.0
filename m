Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5EA3CFF77;
	Thu, 24 Sep 2026 02:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790216482; cv=none; b=OeHevRr8f1frUvLxkziu5/eofBoC4FlframjGkYo5oKhz7xwJDZy9h4vm32mfQ1dkmFnTgV6ArcFF4FPOI6hajMjdQBcUmir0QjvABfAKei6CmY0K1zaszOq9A6KI1Ac26wg2Q5f+FrzmyLNZRw/4/zuH8z4ipVuTLt1p/S+fFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790216482; c=relaxed/simple;
	bh=Zzs2PA+p3eu+HgEgY1ALuCZHajidqQ8imhe2EUOpEFI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c2dWTtu9nKycLjKnYwTz/XSZZqU7FiPDtJL6q+Cgt6KG6XO3+WNQn8CbGQk4GTAM8kh/59cBk+E7h2Ylw50HWL2uav0/UUcu4jln/Wgo25TSQt6Y9t4XZsK1oyOhQtFzK8ICJKzB9LetZyuMWbspV2lTrBQVV9ULQgKUIgEwTuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwE2vdaN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwE2vdaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790216481; x=1821752481;
  h=date:from:to:cc:subject:message-id;
  bh=Zzs2PA+p3eu+HgEgY1ALuCZHajidqQ8imhe2EUOpEFI=;
  b=iwE2vdaNXMx4z7uAKKbAv/thGi0RhIYXtwkqhZ4ndgai2OUgIQ4dgNYT
   Fcl4RynS5kuQN78TmWcdZt/lcNnnmHknvFXiigcnqFtGn81g8uA49c9Pw
   XZM0Hn+BWsNOh1MqLt+upTYf35ZcjxmybTmAq1Eoa3NA9p1aubux4wHIN
   DLxgHhXyuBdCiCA+K2o2KRm5Sqn8GARNdAzdPHx+UVVKSijgTgWS9+xax
   RnRqJ/U0vCcLIlLkwlp7yvm+eFKybBUPh/asHHhZsDTqtmGk2bZx375QY
   CJClHZ9JJmxDe1fimCO9ExjBuf4HNkxhsqt4I5NTZG0HmHHgJ8cDofnY8
   Q==;
X-CSE-ConnectionGUID: /KPg2wmtSoCMZIF2Z46xlA==
X-CSE-MsgGUID: 4KjioG8hSIKz6p9LoDIyMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="116494351"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="116494351"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 19:21:20 -0700
X-CSE-ConnectionGUID: ff/Pyq3DTUaNyMUFRxC7kg==
X-CSE-MsgGUID: ULfpu5SFSfeGRB88ZJRcyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="270377700"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 19:21:18 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Z5I-00000000I6k-0rVe;
	Thu, 24 Sep 2026 02:21:16 +0000
Date: Thu, 24 Sep 2026 10:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bokun Zhang <Bokun.Zhang@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 760/8910] Warning:
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:440 function parameter 'adev' not
 described in 'jpeg_v5_0_2_start_sriov'
Message-ID: <202609241019.lpgr7ETj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: 4052b52a301caaa1ae651f40a4178dbd399e166a [760/8910] drm/amdgpu: Add JPEG v5.0.2 SRIOV code path
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260924/202609241019.lpgr7ETj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241019.lpgr7ETj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241019.lpgr7ETj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:440 function parameter 'adev' not described in 'jpeg_v5_0_2_start_sriov'
>> Warning: drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c:440 function parameter 'adev' not described in 'jpeg_v5_0_2_start_sriov'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
