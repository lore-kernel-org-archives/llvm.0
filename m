Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6316F191;
	Fri, 10 Apr 2026 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844074; cv=none; b=aEYsluZqIHoZ2uDZAmhxmnp8v6CxB9Vzi7hBCwrNyPF5jFUMkSU/FqMyDskY8z8IOTyf79QwMiWFF53xA3GNKNZUq4zLxwdXe9YlpbA9x7au5Mw+3D0Z4aqkGOseiMA23v3TjMG4VWSHtVwVqYRq8bHXpatOH5ntSICabzu5KtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844074; c=relaxed/simple;
	bh=hzp8iWNjwh1Y1c6l5nijPgKRLLYMAColTYJ16xintF4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DqAnKK2A3yrEHcEYWhQNi3iUzCrfKHtYn1ShEOzN9o6rH3tl+Nt3DCgNImq65RqcwgxhMcn6UyLQZ8pRCKfxDXh8IUrJpwxLkY+BAWV95pQPqSAcD78cXzn2fG4snV674FizkQfloJk/4xbYOsTd1EA/jaKuhoxct8cKdxsKTlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THO0O73C; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THO0O73C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775844073; x=1807380073;
  h=date:from:to:cc:subject:message-id;
  bh=hzp8iWNjwh1Y1c6l5nijPgKRLLYMAColTYJ16xintF4=;
  b=THO0O73CyAq10A8S9vjo1FeRVv9NWjMK1mlxjL3XES7LHQ1GZmz1Q8TF
   cfn0+oTpmc6o7CO7jJf9xhtlwfv9WhQqcwVxn6b/V7gQANJwCK1PjyeFS
   lIN4ItjsecxxroeDCtuw7rlQw8XewbwNJcinhmy78v0LyciAPs/cr800E
   wijRAyw7aTNP+o4GU0usPzNU5hB/vzIFs0KiUXLzPurK+evKx0HR5nQTs
   S9cuPrE6Tt3ojMumLtKsNFmrDAssD1szhey/kU7vSsJxk5TZ+KJUAKYwl
   2/gXlickLpHVnqql2+pFOBay6mUqBuL6Rt/WrU09tCmrccptEH/0WduDa
   g==;
X-CSE-ConnectionGUID: QRuCKtEmTO6DczYNOWF8gg==
X-CSE-MsgGUID: Bb8WFsQzTE6nWAM+8sHxow==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88256761"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="88256761"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 11:01:12 -0700
X-CSE-ConnectionGUID: Qrj98qnfTf6dHmWhKDoDMA==
X-CSE-MsgGUID: flWQyYWQQC+xL4uWBzYdKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="230876908"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2026 11:01:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBGAH-00000000Avh-1iAs;
	Fri, 10 Apr 2026 18:01:09 +0000
Date: Fri, 10 Apr 2026 20:00:42 +0200
From: kernel test robot <lkp@intel.com>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Warning: fs/iomap/buffered-io.c:1197 expecting prototype for
 iomap_writethrough_begin(). Prototype was for
 iomap_folio_prepare_writethrough() instead
Message-ID: <202604101906.2hS8zSW9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ojaswin-Mujoo/mm-Refactor-folio_clear_dirty_for_io/20260410-201946
head:   97f848afc87b3d743b0b4cb27f081bfa48c2329a
commit: c85ff7e2dd1ce5c4d380ea54527f307059e3fbd9 iomap: Add initial support for buffered RWF_WRITETHROUGH
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260410/202604101906.2hS8zSW9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101906.2hS8zSW9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101906.2hS8zSW9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/iomap/buffered-io.c:1197 expecting prototype for iomap_writethrough_begin(). Prototype was for iomap_folio_prepare_writethrough() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
