Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7298120CCD8;
	Tue,  8 Apr 2025 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106781; cv=none; b=jLkC7YtXUA5HdfL3WskiWEWajftADcSVGZCsK8X/NarmJ4swNR9rj0RGspdm2zgETqD3AxHlpDqIMaoSH4aiHitAG9TiIk28gZzfmIQRzHh8bP9mYarvnno0uTvcXyAl8hc1fS1doFLFcsBe+W0s0SmRKLaK5KU7yuyUAM5Gyro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106781; c=relaxed/simple;
	bh=s3ewf70GUtyRkVUZxjwHUTDIHL5XEAWZvrDiWPV2Byc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fFVMYGRVZqMtZ5vaTVGdXBgnk61L/2Xet2LbTVAQxlPwO+td62RoPqewcw7rw/ojlm9mhJRY8V7o1iQYBCe2UZcdCeYa9NdeYoO8+ihjBxwTo3mMuEBP2Jn5VK2Liqwaz7GURbCwYmpE9pvAV64H4LIuTqeSqPkMC2Zmb/XWFSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OO/AQn6j; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OO/AQn6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744106780; x=1775642780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3ewf70GUtyRkVUZxjwHUTDIHL5XEAWZvrDiWPV2Byc=;
  b=OO/AQn6j0U5S0YygzTa8fIxhU8yaBE4s306v1ZHGyQ5PtRPlwc8TNtm9
   EmVQ69drbkdIXn76+ThZoLX+HifE0eR3a3Wptz3I1RjIYiBVvDvzJjMpn
   WQcjyuGMK3R9WthygchE9v44/3Jgk7+KRBOfk8nEr/MFGfhmOK3Xn5/ld
   V9/Pj/Ic58279qjr0kM+Jj73sJsiWU6Mg9vBbH/wTBdFXxrnKTRBs15/K
   VSwT6gZgj2Qtv8gvSAv4hDz7XMxx9/l6B/yJzAtM2v/4RhrfMetUVLbb/
   5EahKsb9+7UozTHaBCGS8waZBQhja+dSJ1L/jV+xz5aA+vCkl6jBSuc17
   A==;
X-CSE-ConnectionGUID: i8V15KAUQmKvMs4dsGPPrQ==
X-CSE-MsgGUID: V+YoohKLTlarJ/pvXqRvUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56900217"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="56900217"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 03:06:17 -0700
X-CSE-ConnectionGUID: MQU1NfxCQwOYawB8aI4fxg==
X-CSE-MsgGUID: qwngGTGaSRChjQM16XR/mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="127963960"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Apr 2025 03:06:15 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u25qO-0004Qd-1w;
	Tue, 08 Apr 2025 10:06:12 +0000
Date: Tue, 8 Apr 2025 18:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tim Chen <tim.c.chen@linux.intel.com>, Baoquan He <bhe@redhat.com>
Subject: [linux-next:master 1753/1936] mm/swapfile.c:1517:20: warning:
 function 'swap_is_last_ref' is not needed and will not be emitted
Message-ID: <202504081841.jbL7yL0r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7702d0130dc002bab2c3571ddb6ff68f82d99aea
commit: 6bb001b6b64ec20d900d0d81294a0f031af59c3e [1753/1936] mm: swap: enable swap_entry_range_free() to drop any kind of last ref
config: hexagon-randconfig-001-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081841.jbL7yL0r-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081841.jbL7yL0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081841.jbL7yL0r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:1517:20: warning: function 'swap_is_last_ref' is not needed and will not be emitted [-Wunneeded-internal-declaration]
    1517 | static inline bool swap_is_last_ref(unsigned char count)
         |                    ^~~~~~~~~~~~~~~~
   1 warning generated.


vim +/swap_is_last_ref +1517 mm/swapfile.c

  1512	
  1513	/*
  1514	 * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
  1515	 * caller have to ensure all entries belong to the same cgroup and cluster.
  1516	 */
> 1517	static inline bool swap_is_last_ref(unsigned char count)
  1518	{
  1519		return (count == SWAP_HAS_CACHE) || (count == 1) ||
  1520		       (count == SWAP_MAP_SHMEM);
  1521	}
  1522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
