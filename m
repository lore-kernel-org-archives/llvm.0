Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645271A9F9B;
	Tue, 27 Jan 2026 00:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769474670; cv=none; b=mwbDOXTUCBcBI/4TYxAZFnuLys5rcn/VnCGAnGJvoIFpOTFs2hjkArPSZ5slT3OhLnMnyN4Rp2t1TA4h7d3pJvcBJak8ykDCe1NE1f3z8Q264jgZw2tgay0vWSy/QaRwR1kL4mzWnw9gQ3QJbuYneCdtKTFnQETi+X+wiAar5rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769474670; c=relaxed/simple;
	bh=SX29ljktqS4p0j18wvhLNMKtr/+Z4ad+LKKu1ZhdHHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D2oFm4UOlWRq8FHnvUizJ86CHUMxvMfbUTL8iwRWJBkmI5yqpLY4KmbePBfNDNTVrEgKWK0Lb7hDs5CEywW4UpGUskX9kYJGlnnnHcccv7RrmHyr64B/gBCdRQ51tlL6qwlAeZsyBfNigMahO0UvkKCwLWezZhP3x8oiU5RgR00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ol9QdVyM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ol9QdVyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769474668; x=1801010668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SX29ljktqS4p0j18wvhLNMKtr/+Z4ad+LKKu1ZhdHHI=;
  b=Ol9QdVyMdbHrqlKm5TOGnDqqcpLlIpu/UMoQW+vr9JIb8H9L+BbkKmdc
   t033mTn6emx+astSotj39piaRniOfavyjr0VLlwy640hgXpm+YEZ+kQwR
   Lh6U+MQvFKiE2GVLTK86jP0vCUACEGdgtz0TxGjXfkJfQh6HSFz34L0aO
   6MT31JGMHvjMvJTpMh9VG68CTPIBCp9WDVEfoyFSRU+xWmOFJkLZMyvDP
   vmapea7UV/cIu6of+VED0KhGzv6Yep91+gdk7Kun+AsYalOuY0VQT2+g9
   Hmk0o4UhOQusOR+ImeIlasanVqsoVp8ILsKeKDpeymG/GtXZHltMqS+yt
   A==;
X-CSE-ConnectionGUID: hz3/79gPRWurulnzGvhK1Q==
X-CSE-MsgGUID: Mq0wf8GJTqm+k/DTLXXmsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70563927"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70563927"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 16:44:28 -0800
X-CSE-ConnectionGUID: uTXzeD4+RXuY2kowtxkm8A==
X-CSE-MsgGUID: hI0erCRxQ3i+gQanvafJ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207848094"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Jan 2026 16:44:26 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkXBv-000000001e5-3LbM;
	Tue, 27 Jan 2026 00:44:23 +0000
Date: Tue, 27 Jan 2026 01:43:24 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 41/42]
 kernel/time/hrtimer.c:121:45: error: static assertion expression is not an
 integral constant expression
Message-ID: <202601270157.7meA0n5c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   80461d79725e9de0ffda5d621552a2db3608f64d
commit: 2969d9693803a8bfd1c8bfcf3943af5a920be88f [41/42] hrtimer: Add support for auxiliary clocks
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260127/202601270157.7meA0n5c-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270157.7meA0n5c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270157.7meA0n5c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/hrtimer.c:121:45: error: static assertion expression is not an integral constant expression
     121 | static_assert(HRTIMER_BASE_MONOTONIC_SOFT - HRTIMER_BASE_AUX0 == MAX_AUX_CLOCKS);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +121 kernel/time/hrtimer.c

   120	
 > 121	static_assert(HRTIMER_BASE_MONOTONIC_SOFT - HRTIMER_BASE_AUX0 == MAX_AUX_CLOCKS);
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
