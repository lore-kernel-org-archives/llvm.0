Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2734CDD;
	Fri, 28 Aug 2026 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916777; cv=none; b=nVDL/P96WjToskJu5PhzgnTG24QaXdUQPvMWglc/UzdorS7RKMIT4KNgk2umXO/3OAueKtIgW+qgBCq8wakZWXjZj90DAPc/RJYEoEmSweWU5AK7LdU+K9adWuZmXZx4/gzX2Z2oirXlfMsA7Vnxrlpxn+MnBSaHb6gN3CNofrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916777; c=relaxed/simple;
	bh=D7Vq+uQRBQDSR1sF7n9yauajBeuXyUzgq7BOzcFFxHI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HP0XAlZ8EaU/k4oFR4XXJ4nbzxfBCF5qPtaxGjEeSI+R4slFsg6jWiDDWcRgS+rITiAkFE8xFpxzYofN36HKXdE23p5FQqPL2hU8TS1tGV6v4JZwxVQ6sy6Nbs/fUlqHff6fBqkSye/TZ/AyUXEe5jpMfH/Tgqi/jRik+35CGkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLNczxzZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLNczxzZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787916774; x=1819452774;
  h=date:from:to:cc:subject:message-id;
  bh=D7Vq+uQRBQDSR1sF7n9yauajBeuXyUzgq7BOzcFFxHI=;
  b=lLNczxzZyGc1HU7ISqQPI5CJtS7v+17QraubZsRowUDvFTT1gq4qEeCa
   AzKXoaL19I7heBqOQ4ZX1oNPZSg3M9RS+ar/02xMcRCX0GrBhrnt/ajB6
   0P510sf0qjcxVRwnXywIy9UPLDxvhQwiRWZX//oWuDsFh36101mSI6o48
   p9DXiq2Nb2e7EVflvb9QYwIvQFFIp/+TbVI01PWfmmZOgTHgH95EPpdAk
   yF8kNZP1eiQ31+mXd9yOofl3JstQPyXcYdkKKVI5/Y3/30uwpHLYMsQfy
   dia8Qb7Pv917RhBKOGZ/SyyE1gPF26ebyx+uiy6cZbieaPTngrPcdBeHS
   w==;
X-CSE-ConnectionGUID: STG0Wg/jQYONgHLOcPObrA==
X-CSE-MsgGUID: +p4SWS8tRIu9+74yuKZ8Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="87554980"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="87554980"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 04:32:52 -0700
X-CSE-ConnectionGUID: K46FgUv4RY6FinGPik9mpw==
X-CSE-MsgGUID: yYhr0RKaTzaZRUkbm+LpDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="298024175"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Aug 2026 04:32:50 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzupD-00000000Ayj-2RlI;
	Fri, 28 Aug 2026 11:32:47 +0000
Date: Fri, 28 Aug 2026 19:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Page <sam@bynar.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Miklos Szeredi <mszeredi@redhat.com>
Subject: fs/fuse/fuse.o: error: objtool: fuse_emit+0x5cf: unknown CFA
 base reg -1
Message-ID: <202608281903.emmwNWEY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Samuel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   73e3f0710014fe6d4ed98cfc02292f6121db7558
commit: 51a8de6c50bf947c8f534cd73da4c8f0a13e7bed fuse: reject oversized dirents in page cache
date:   4 months ago
config: x86_64-buildonly-randconfig-004-20260828 (https://download.01.org/0day-ci/archive/20260828/202608281903.emmwNWEY-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260828/202608281903.emmwNWEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 51a8de6c50bf ("fuse: reject oversized dirents in page cache")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281903.emmwNWEY-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fuse/fuse.o: warning: objtool: fuse_emit+0x5d6: undefined stack state
>> fs/fuse/fuse.o: error: objtool: fuse_emit+0x5cf: unknown CFA base reg -1

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
