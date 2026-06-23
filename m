Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAE93D1CC3;
	Tue, 23 Jun 2026 10:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212302; cv=none; b=oUblrl+JqTi7l2g2epAktOozP+WQtB1IVXhA1+YTUJZc5m4yMPwIV0TgnsxSLvQOhXao4ToSuCAnKsSd6iq5mQFqTISxuMZyPaChWl9uIU328jNqoZsfdIgYJkcBRWtco310iinVOUgnUKCfGy3iTglIHwVFn5FTM5WkZJY9gMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212302; c=relaxed/simple;
	bh=gHgb62IHkq1Tw/LdV6f9xo7OfXfUWtcXlTE47QisxEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Vic3Raj0etyfe9i7CDMTxbrRa6J+6J3HakJRyo9lNEwrUfhzaQoacx5+xvFQCVwuZf188MBuKiG3E9dSZAUygLso1as0fEbtW/1vfiHpwtcmHDKevBlCH4uqenqs2pKv91HgxzRXmadp/V/2lgFj4GBGvsdZo8QmSAODTbcUZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlpAX9Fr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlpAX9Fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782212300; x=1813748300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gHgb62IHkq1Tw/LdV6f9xo7OfXfUWtcXlTE47QisxEo=;
  b=PlpAX9FrCVniMHUShYNIHGMCSo2eBgLLkgswoHbgHsP9VVSbxXGEDY/4
   UYu//XZo0qmLq2+JsBKq6DpdYU1Ien/F1IsfmXYatB1X2qVaz7gbSv+P1
   cs7PZV9IZ0BN2TdR44k+CIkVyfduDIZa7dw7lJ8a/u2ZOAiQfR1Z6FFzN
   ryA7jjNvco1jJMCYAccP5Kv1crK16CMx6t0cj3348s5RcsCsHmspephJV
   pVEWgF9lxw9Us7WFdy47s3fDV4RRIPN/7IqAzcW9wrb5XIBSYOb5cCaFi
   Vzd5hkIIJ3QRyjx4y3nFGOJYRaBkAbzyZfAbWhk2rYU9RT7bzEa731iTO
   g==;
X-CSE-ConnectionGUID: Mq2ro9AFQf2vgoMmVAQbJw==
X-CSE-MsgGUID: QXpjm7oMQt+EzXTE+oQq0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108494800"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="108494800"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:58:20 -0700
X-CSE-ConnectionGUID: eW4sPXrrSvGGUvk3a4L6Dg==
X-CSE-MsgGUID: XrmT2MtzTqqKPgPC3px+Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="253831168"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Jun 2026 03:58:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbypY-000000002T7-0LZR;
	Tue, 23 Jun 2026 10:58:13 +0000
Date: Tue, 23 Jun 2026 18:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: [linux-next:master 14192/14955]
 drivers/gpu/drm/amd/amdgpu/amdgpu.o: error: objtool:
 amdgpu_vm_handle_fault+0x16b: sibling call from callable instruction with
 modified stack frame
Message-ID: <202606231854.7LeCtlLe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   948efecf22e49aa4bf55bb73ec79a0ddcfd38571
commit: d6bf4242731219ee08ce54c365631e395486651e [14192/14955] drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_format
config: x86_64-randconfig-004 (https://download.01.org/0day-ci/archive/20260623/202606231854.7LeCtlLe-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231854.7LeCtlLe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231854.7LeCtlLe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu.o: error: objtool: amdgpu_vm_handle_fault+0x16b: sibling call from callable instruction with modified stack frame

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
