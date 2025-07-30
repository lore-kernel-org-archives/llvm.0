Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759BC1D54EE;
	Wed, 30 Jul 2025 20:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753907835; cv=none; b=fmIkFUf7EL7XzxNkNMYoq2ZakDo63ftX5OEfLiPoAF+Er+sDgC5UIkthJH4M+DdXm8slYEcZnlAcLhXrk8aq/sIswXCsZr/yj8UK0/9KTI8M28eQTphfukiri2VLwpgtJ1yB3O41hyiQZQFIgTU+yoW05wl3vKvdUMtghNWxpnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753907835; c=relaxed/simple;
	bh=MSD+aAztBdAAKBXztvDrkqUyPWXfjAgP+iiFdUQfPJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbphd2/sTyBywgraweamvDwWRa/nyGcPWnj44DHoB3EGlUGjD1x4VkqD9WTo9Gb012i8maMDqec+35KQMjkTgaYilMEtNI5gPLdsefFdp9/q8d/0fiuSEHbdkjRwbkJ7GsUfyzWHA82rZE7wav1FIG7ux15anmSDnGwvu4UsliM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwWDYcVb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwWDYcVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753907834; x=1785443834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MSD+aAztBdAAKBXztvDrkqUyPWXfjAgP+iiFdUQfPJ8=;
  b=dwWDYcVbMc7fw9vtV/8rmB6hfyjNfa2fFnYg5YINbRat2EYWr4DKJXDA
   B7FpTNgpyJ+HhUpDrrIAsis7zgpEsYKtVXR7dNV2tfQNZsZVIr8o3NTrg
   VBFP7VPMye3aSG1qJGT73Cki7/RoQyWWqL++Oad1Gw0BQAY74Qu9vGypY
   PwtJkkt6xIv8q/u7RRlrwNjB/aD1Z4nBw4V7uRd0cJDcojaZf8q3OVIfE
   uFYeUXXgbYQA1xPn6ekwkh+KAk/80BfayVr2ZO9I/KwUnTRQBx453JVl4
   2QIzLqRwtGQolO5zs9MTI1uYsOlMZuGC8pkLKM8775pQUzPsuAe+ZV4HR
   Q==;
X-CSE-ConnectionGUID: n13NGImtTOGWKBPbb2TpJQ==
X-CSE-MsgGUID: 8gUPKow6Q0iVnWACNCK4Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67582638"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="67582638"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 13:37:12 -0700
X-CSE-ConnectionGUID: +OBJsn8uQsmFtW6M8ng84g==
X-CSE-MsgGUID: cge6p5FRRIqnAeTcxC/LLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167335107"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jul 2025 13:37:11 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhDXx-00038M-0C;
	Wed, 30 Jul 2025 20:37:09 +0000
Date: Thu, 31 Jul 2025 04:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [linux-next:master 12600/12889] ld.lld: error: undefined symbol:
 __builtin_memcmp
Message-ID: <202507310411.hPONKDTa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   79fb37f39b77bbf9a56304e9af843cd93a7a1916
commit: c4b487ddc51f4c5946d310a977cbdf73d1f95b09 [12600/12889] modpost: Create modalias for builtin modules
config: i386-buildonly-randconfig-006-20250731 (https://download.01.org/0day-ci/archive/20250731/202507310411.hPONKDTa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310411.hPONKDTa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310411.hPONKDTa-lkp@intel.com/

Note: the linux-next/master HEAD 79fb37f39b77bbf9a56304e9af843cd93a7a1916 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __builtin_memcmp
   >>> referenced by .vmlinux.export.c
   >>>               .vmlinux.export.o:(___ksymtab+__builtin_memcmp+0x0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
