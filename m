Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868A03659E5;
	Wed, 21 Jan 2026 04:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768971457; cv=none; b=HFpcDrpDPrdsWP3mlIlk3TqB9F/gaj7u0Fhs2VE0oW4zRqz5jjKhB7xxbyjwUN81byfPtAGiLxXcffprNj5RTY5WCBZxvv2DmQZD8G1gUW2YYmt+bZvPOwauBtJLgiWdCFFDy1+yKzZaKAAnDmtc1LAMNfkRi8ji/Ai2IHrhS7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768971457; c=relaxed/simple;
	bh=GIT0JXLtzHau/BWSlIoC9YCgdzfrB8oIKkigY13+HaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HVEO6cswxROGpVBTNnU5I2fQJjSveKjfK+q254jmiul3tDEKJKafHtuZm+l+cfihh+jZkkQYMwmNrYcqNm/MigmjGUYog+y1pBP4loXwAWWnBbgS8tI30Wt4lINtgaTOMu2vzhYOyxtPQRRYISJvJyv/F8yNvzHdZHQj5UEfk48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMUzT6xd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMUzT6xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768971455; x=1800507455;
  h=date:from:to:cc:subject:message-id;
  bh=GIT0JXLtzHau/BWSlIoC9YCgdzfrB8oIKkigY13+HaY=;
  b=SMUzT6xdvjv94C130rTCXxG9vMQFwN2NQDDmcI+sTlVl7pkzw7/XkzY7
   Wo7qUrPyqs3CCgx+qYamLzb4fyVTYG/SOMayxEGiY/jn7NxNXiW2zluKf
   8Yq0bfYapyVmN1tmkx0f3EoxZ/uT/PdmaOi9DarQcAV5VhDyustc5vBXj
   QEFELw7yK9VUpmz+ztIz/Qi/KuGOKatv7rv8ZUSQUy/QaisLbSj5nGK7M
   e8EJhf5IYpM0Wyqav8au/DDG8OpBh/ilnl3aOmYUjr5YIVr6UJqqXhrfS
   jRz5XAnc6RWoy1WTo8z+Hm3m1Ri+nfdwT8jvP0V2F99HTFUMDAr7IFvnr
   w==;
X-CSE-ConnectionGUID: CGKyrMkoTCe+SZt6CyXDJA==
X-CSE-MsgGUID: mxB7wrLOQIqKzv9tm+0zJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="57754705"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="57754705"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 20:57:34 -0800
X-CSE-ConnectionGUID: J+3WM+jwRxOXmjm6JVWU8A==
X-CSE-MsgGUID: d31Jqif9RfKBbZhxjbCfcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206570206"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jan 2026 20:57:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viQHZ-00000000Q01-1Jeq;
	Wed, 21 Jan 2026 04:57:29 +0000
Date: Wed, 21 Jan 2026 12:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrey Konovalov <andreyknvl@gmail.com>
Subject: [linux-next:master 7687/8302] ERROR: modpost:
 "vrealloc_node_align_noprof" [mm/kasan/kasan_test.ko] undefined!
Message-ID: <202601211250.6uQzZrQp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   053966c344dbd346e71305f530e91ea77916189f
commit: 22228c860d2633a22656cc506022c657fec15194 [7687/8302] mm/kasan/kunit: extend vmalloc OOB tests to cover vrealloc()
config: x86_64-randconfig-121-20260120 (https://download.01.org/0day-ci/archive/20260121/202601211250.6uQzZrQp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211250.6uQzZrQp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211250.6uQzZrQp-lkp@intel.com/

Note: the linux-next/master HEAD 053966c344dbd346e71305f530e91ea77916189f builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "vrealloc_node_align_noprof" [mm/kasan/kasan_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
