Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565B01714C6;
	Fri, 28 Mar 2025 02:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743127448; cv=none; b=iphPKPLO3x6V1KhecXJ63jpZ/RWbtJUgsuk7KFAoAGqh7wmtJpMsw4pkbs0W6v69mrsnSEcPknYG68yR2EO+oec64w9CmzUyjqyH+R0K88NyYBCAxByfPSSToanOUMhEvY+CJ+Zyc22fF/KM+iWSgXjDrTVHg3Hj+2M687fw8DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743127448; c=relaxed/simple;
	bh=ydAfFR2QyoIlAay2PemZpZg7AC2VjaggoCXfQdMnP40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oa1o+btmeX2uhgDYHNQFSPM9be8WzjseiK6Nmc6Y5tN6wJv126FjdwnFTefGhBU1F960aYoNnS01PyLLccwE1faiCvsA+0+vepsVszbdTqNik075GeZRT/u9jUSjLDUkW+wKh5QiOQB6q72zbH8kgG2CiOlT7iRxZNJSp+SiXf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AI6hOgWt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AI6hOgWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743127447; x=1774663447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ydAfFR2QyoIlAay2PemZpZg7AC2VjaggoCXfQdMnP40=;
  b=AI6hOgWtotaR/FvTKxdnMd7a42G9Toypsx3Q5ksd5B98Eh8eRhQdB9Fn
   iiNB6M+SB2Es0lXoQUE+4mx1UfI3QCgiV3Xl1gikEffjy15SmMA4l3KIA
   phHKxHrPOCKAeYAfB0QSKixPJDulIHmFlG4FmG0AsbrBY1rgVCo6jVhg0
   RJhsjha2LtrQSez3RWBJpUOnPi04hVhE3MvJp3l/OEAT8WzwA0FGfT/50
   frIcxGOzSBMFiZiNfy29h6NJuEk9GBbGbf1JKA8H30lT0LKz1C/zz4+UC
   4h3LToUey2LYSHpo5q1fEl1stD9KEjlgFgDFLWZI0MjiohRpr95zWkHaJ
   g==;
X-CSE-ConnectionGUID: Ufxtz5c9SfmompqBEzAuMA==
X-CSE-MsgGUID: /LbSVsXFReK5GvjJ2oxeQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48141011"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="48141011"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 19:04:06 -0700
X-CSE-ConnectionGUID: rCG89HRRQYWssfxLOo+tEw==
X-CSE-MsgGUID: NJ6XsOe1RpOKop/9tTD5PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="126125279"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2025 19:04:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txz4d-00074x-1F;
	Fri, 28 Mar 2025 02:03:57 +0000
Date: Fri, 28 Mar 2025 10:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:WIP.x86/alternatives 32/43] vmlinux.o: warning: objtool:
 text_poke_int3_handler+0x15: call to try_get_tp_array() leaves .noinstr.text
 section
Message-ID: <202503280943.gnyusUlI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/alternatives
head:   89555c4754bde7a509d7992c1ecefeb00229fac9
commit: 2559956f36daa294cc4c3beef0a2853cfe02f230 [32/43] x86/alternatives: Simplify try_get_tp_array()
config: x86_64-buildonly-randconfig-004-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280943.gnyusUlI-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503280943.gnyusUlI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280943.gnyusUlI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: text_poke_int3_handler+0x15: call to try_get_tp_array() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
