Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7C035949;
	Sat,  6 Jun 2026 05:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780725219; cv=none; b=dnVoKbNJM5THzJI2CM09+9hmJKMMFKi/jlmjLyK3nbQfJzJI1sUSQ74F7ODU4GRpcT11XeErsnvx0jynIHq7NsKAWFL3fhYRX/uMekuSEb1BRdDeQZxMuPB/Psa0s0roe2GxYbdD5yog9tjy42+c7943nxwM2aNEM3KS8sliW6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780725219; c=relaxed/simple;
	bh=gvOohcgxP+DgF2jMC5ghswmVcORSlUZ+yR/rp0dmeFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fs0rFF05T68Bj80LiNOYLv7xhHJuH0jgum1sl9x8CXtGTZrguMxQt+8uLnGO63iYQteTpvtpmJ9KjPLrGu7swumaRNDagoBdXPgjhIx+dxLDai8SsWDqijqRGlzddGMc5ZGbmZo3lqqlE85eiXQtbf3AZNiEDSNgvMUMz9WLUMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9UKaU2m; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9UKaU2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780725218; x=1812261218;
  h=date:from:to:cc:subject:message-id;
  bh=gvOohcgxP+DgF2jMC5ghswmVcORSlUZ+yR/rp0dmeFg=;
  b=S9UKaU2mMl07/a44JPok1DPyArdYVrH/YXDnULXKXbyu439Jx1igcrjl
   wGyU/k/NJvt75PUdywtlQ3uQbaomOtodfYRtkqXNQFJo6G+5owhBW6Z2o
   zZdLpkkmpBKZMvlzMIogEK/C4QtLvsfPqWWCzozGK9EZ65T++Kljq6NFR
   C5o7Js31Vlmkrb5Qa9w7zRCewax1Kwjj6zj0LVT0nCFj4BaCoHazO82pq
   XlqLY0ilBshlvykqnddRQyY36kE4nL7O4KCmTsIB59mVAl/dCzC9Avcbj
   3l5NHeL5J0KpbKbvAxjuOi7jNgdiQC1HkbTu5HajJH/YXRnjQW4ONnpNg
   w==;
X-CSE-ConnectionGUID: nWtkl3hoRlKQKa7LK1G7xw==
X-CSE-MsgGUID: U+0rRCDLSZmma6cH1vuoiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="85438402"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="85438402"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 22:53:37 -0700
X-CSE-ConnectionGUID: nwbau5vRS361H7fruU7Eqw==
X-CSE-MsgGUID: SL2LoenLQ4CY8t3f51RRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="242563207"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 22:53:28 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVjyH-00000000GmI-1GPu;
	Sat, 06 Jun 2026 05:53:25 +0000
Date: Sat, 06 Jun 2026 13:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hrushikesh Salunke <hsalunke@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8165/11755] mm/page_alloc.o: error:
 objtool: get_page_from_freelist+0x1584: unknown CFA base reg -1
Message-ID: <202606061342.et6zQdGM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
commit: b001cf7d16dd18f14bd372a8018ecbf48197289d [8165/11755] mm/page_alloc: replace kernel_init_pages() with batch page clearing
config: x86_64-buildonly-randconfig-001-20260606 (https://download.01.org/0day-ci/archive/20260606/202606061342.et6zQdGM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606061342.et6zQdGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606061342.et6zQdGM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/page_alloc.o: warning: objtool: get_page_from_freelist+0x1586: undefined stack state
>> mm/page_alloc.o: error: objtool: get_page_from_freelist+0x1584: unknown CFA base reg -1

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
