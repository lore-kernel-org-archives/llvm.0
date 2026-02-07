Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9901E2FE58D;
	Sat,  7 Feb 2026 20:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770496199; cv=none; b=u3aVXGkiHhJZIVtiB5h97aE/+yJ4v2KJlnwrtZ8EnhFRfoTuNukiKDcxb4P0XKiiLIcanjx3zTOctQ5ecnR8EY4KSc9AJt9uDjdqeF5R93uqb0N+nBZioHut7e2MZSkIk0jSeGLiEbsRlG3w7cn19P2bUNdPgps8sF1TVT0kjVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770496199; c=relaxed/simple;
	bh=h/Yyc3/KbPfNEfnxuIA2xL/lbQXbE7Ne6YIKWdHmwjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XGic48kbF7RKgMzDrlo/2d0Mr8pfbF0GSQR6D1cUFfTHkl4Q0wr8r2QJKUKRtMXhEZD90CVwByjQpYXfrn+Nv6gWDo0+xYhUOU9+k22bBaXdpJHZA2gEdRr8VZ+YDeDdUAbeBfkMnHDIq41RkHaD2yENoxJtE/KJbjFYdgT3Ezw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kzu92g6x; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kzu92g6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770496199; x=1802032199;
  h=date:from:to:cc:subject:message-id;
  bh=h/Yyc3/KbPfNEfnxuIA2xL/lbQXbE7Ne6YIKWdHmwjI=;
  b=Kzu92g6xSkPbKmh0ex8W8wptEi/bLDAn9bikm1Nk7et+Q3I6qPtnuu7P
   dudFWWXE4cxXdxlR6pGMfp/ruu+OePAsOvPfbPyLGXm0JgwtIfr8mjniL
   kkAKpu6lZPiGroHR/z9atlsB5M2GhR5cwlKz6gob9GQBuhp9TddpTToYc
   olIJ55EBaInMMr7/RkcBLTkHpQCZ3jNiJdXC9hoSdjzoG8vOBPWB5f6iU
   zBqgzN9iaANTz/rDC5GUKeJKy6WWC4bGeavElymnzB+qnuCGLtMd2mtsi
   rOgCgZCLkVMaY+hNFgqlly2voHjxF+HcCNiXWri+bJ/waJFLhTzzYQJVN
   Q==;
X-CSE-ConnectionGUID: baY/vUhATB+ySb57DZw5AA==
X-CSE-MsgGUID: YeYNFrHSRB2lVqzNIlGhzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="97124649"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="97124649"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 12:29:58 -0800
X-CSE-ConnectionGUID: FmjZqN12S524eLDzzT8fPg==
X-CSE-MsgGUID: A++TGofMQW2QPosbqbosqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="216162398"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Feb 2026 12:29:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voowD-00000000ls8-3Obl;
	Sat, 07 Feb 2026 20:29:53 +0000
Date: Sun, 08 Feb 2026 04:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: Flora Cui <flora.cui@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Bob Zhou <bob.zhou@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:baseline0 1871/3826]
 ./usr/include/drm/amdgpu_drm.h:1340:4: error: unknown type name 'uint32_t'
Message-ID: <202602080438.izPtoys8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: 28c5a7d23bf4df99d894ebf9c28c56b82d0df19a [1871/3826] drm/amdgpu: [hybrid] add query for aperture va range
config: powerpc64-randconfig-002-20260207 (https://download.01.org/0day-ci/archive/20260208/202602080438.izPtoys8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080438.izPtoys8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080438.izPtoys8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/drm/amdgpu_drm.h:1340:4: error: unknown type name 'uint32_t'
    1340 |                         uint32_t aperture;
         |                         ^
   ./usr/include/drm/amdgpu_drm.h:1341:4: error: unknown type name 'uint32_t'
    1341 |                         uint32_t _pad;
         |                         ^
>> ./usr/include/drm/amdgpu_drm.h:1686:2: error: unknown type name 'uint64_t'
    1686 |         uint64_t start;
         |         ^
   ./usr/include/drm/amdgpu_drm.h:1687:2: error: unknown type name 'uint64_t'
    1687 |         uint64_t end;
         |         ^
   4 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
