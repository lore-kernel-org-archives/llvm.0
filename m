Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEB52C18C;
	Mon, 19 Aug 2024 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724101699; cv=none; b=qG/WD8bNA2oVOu/cdQrS7GtdjJ0f9X2mN1RcIFprJvL1y9jUbz7hmcGP/i0sNJMWGz2syedHDyaKxRwZTlNtX1oSBRVcPTSxHozckt9SEynT9lIhN3CH0Hr6/COOOuhDNVOARkAF5rEJwSOwjaGrTuji0oLZvoeH6SyAtaIKEBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724101699; c=relaxed/simple;
	bh=lytjRLon1XJb0B1D07mDRFN+cn66eCpzKUqIoHJ1pGE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DMsDJ3TURyUGAvrE//f32JhIwz7xEi2SpCrbXbxE6tG1o0kcw7bFtG727P7dk+zuS76N01dNEl73/t7AV5/rO9X38CjvM98/4d6MfAOtkWyMB/QK1tBLcTKuWqdgogUYLDb8fnFJN7kAEsb1MwVQLVgquClBIFU3w2IOjIUO1M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWk+7tzv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWk+7tzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724101697; x=1755637697;
  h=date:from:cc:subject:message-id:mime-version;
  bh=lytjRLon1XJb0B1D07mDRFN+cn66eCpzKUqIoHJ1pGE=;
  b=KWk+7tzvm84sjD027y6wfSK986Rgyl+WbqmugSIzUI81wUnQHf2uPLWJ
   SPmLh3YE4BX0Gw0QtkkAUwfyGOwWuhLc5yPQ8j/Zm+8yt7eDdzVYV/0Lg
   gKZyxt9etczshAyiH6zQyybhvt8Yp/qVnPgmqk93FfMvczlkSMF4Ghi5c
   aLHZHmS+PBRtBfJLfqDszyJR2/Y7464Gq9rNRfQ+4TIy4mSU3KmICT1RH
   8TboCFNA03tWH3Qj0uIEL7fMxy9jMoOku/oFVAjJVBb8PlGs95Pq1VuKt
   fkM9HDVZW7/wmopnsJshEPJ3HjF0esABQxyMF7s5rADcKEdfBnlaiFR48
   A==;
X-CSE-ConnectionGUID: 8g3TQlWySj2TAYkljrfIAQ==
X-CSE-MsgGUID: KJ03YUFFTOu/BbkgSKltcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="32947371"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="32947371"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 14:08:04 -0700
X-CSE-ConnectionGUID: 6Mt2gHGtRASBX4A6XWU7ag==
X-CSE-MsgGUID: EV+eOtqtR6ifso5aNRZMRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="60478346"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Aug 2024 14:08:03 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg9bd-0009Qd-0d;
	Mon, 19 Aug 2024 21:08:01 +0000
Date: Tue, 20 Aug 2024 05:07:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: arch/x86/kernel/alternative.o: warning: objtool: BUG_func+0x3:
 unreachable instruction
Message-ID: <202408200555.Q0svMs2r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Juergen Gross <jgross@suse.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6e4436539ae182dc86d57d13849862bcafaa4709
commit: 9824b00c2b58f9e1072ef3ece571a2cfc71089d4 x86/paravirt: Move some functions and defines to alternative.c
date:   8 months ago
config: x86_64-buildonly-randconfig-001-20240820 (https://download.01.org/0day-ci/archive/20240820/202408200555.Q0svMs2r-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200555.Q0svMs2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200555.Q0svMs2r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/alternative.o: warning: objtool: BUG_func+0x3: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
