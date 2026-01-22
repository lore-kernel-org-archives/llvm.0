Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DAD37F0FA;
	Thu, 22 Jan 2026 03:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769051676; cv=none; b=E3dqAKyHjicpCUkkOEPD6eKaHPXTY24q9OfqONkOn+m99bnCRGMZEW85FPKDfaWGPCj9jm+VZnHbucGHxb8RLltk5oHdZ6aWc/sQV7GOtd42qOsgqsT3RdbKJGQqylN2gfiBsBw2P/wnXfuIa2ZoFnjcsrsza9pmP2/tXs54SIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769051676; c=relaxed/simple;
	bh=SUUGhtsWYNRt1mzbywmh35H8RFFLv4Aamt6gt5gFuBQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ohebgMWkGy1Oz2kTf/rzaraPppdwLgs+9ye07VrhoVqjshYRaZr079SShAq/BHL3FLGdmFpO1ZJCl7kWFTYYWkmjbgsTrocRy24Oa+jQeLU1KOyltaPW6eut0RVoXjyZSvoDyekbSc3OYBVmDXR0ddDDn7rRWETE0cA5+3/hDMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDY0HHq+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDY0HHq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769051674; x=1800587674;
  h=date:from:to:cc:subject:message-id;
  bh=SUUGhtsWYNRt1mzbywmh35H8RFFLv4Aamt6gt5gFuBQ=;
  b=HDY0HHq+V0KbLi+CD+1jO8X96Bls8E+5b4TeOlsdi2gbqnqmY7sWBbRU
   LgNmkCtkYZbeAZgY3bE4VYeU1YDmeGSexCRcLRY3N02Cv3EEP8qGAeawl
   OKGK2nhHGB1s8Ji+/cZXySmOnDUcWbA4aMQZMiqW1LDwfeVXeXsSZogaQ
   G+FsWcehY8Q894thyTM5HQtKYfNt69WqZ3AxhkBPou9dfGCiGYtcgj1+e
   gVGgGemx55mWnktEQDHJd1yCcKBaNqfjwRKdfjEmMzKUhmMpUAcI/YlFs
   JhpMH5MjS+bCAYv4g1rjCheXtMrRPDtXa7sBSgDSk1b2f8hfVYwknBgBe
   Q==;
X-CSE-ConnectionGUID: 0A7ijH2cSZOMkYggyB8mWg==
X-CSE-MsgGUID: mmsVuqkkQja7Dz2kDJD22A==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="72878967"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="72878967"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 19:14:32 -0800
X-CSE-ConnectionGUID: x8Nk3fdQRCK7kG3CvvunJg==
X-CSE-MsgGUID: W590BPFBSASqTrQBnanwwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="229592876"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jan 2026 19:14:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vil9Q-00000000SMn-1I5v;
	Thu, 22 Jan 2026 03:14:28 +0000
Date: Thu, 22 Jan 2026 11:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:zero-page/v0 1/1] ERROR: modpost: vmlinux:
 'empty_zero_page' exported twice. Previous export was in vmlinux
Message-ID: <202601221150.JsPp145b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git zero-page/v0
head:   53d07913878ea27d6fe4224e8581729185291278
commit: 53d07913878ea27d6fe4224e8581729185291278 [1/1] dev: arch, mm: consolidate empty_zero_page
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260122/202601221150.JsPp145b-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221150.JsPp145b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221150.JsPp145b-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: vmlinux: 'empty_zero_page' exported twice. Previous export was in vmlinux

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
