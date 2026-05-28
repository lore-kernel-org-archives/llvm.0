Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403F63B9942;
	Thu, 28 May 2026 10:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964400; cv=none; b=A4+t1xQzMR2fjqbyrWT9FIETQf0F7l3vyhMHWGFZaYDKoSKovM5aAFrBChI42GMqLObCFOFMX/26EYRQ6YvIan12ajOTs+p2Bdoo18s6rTlMivNaksHY5/aZcWrHgUqJjwR/40+Lm4LoDU4ou9fjDxcudnJ9sUjxM0feTvkmWck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964400; c=relaxed/simple;
	bh=+h8BiDyEGUTaX5dkltOlb6CAZB4QJkd09eu9rd4ZL7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdUurbeBghT5GtQujAl3hFTFBPrm5cIeDE6JP8IY3xt5eNV8p6UiYqhZzRngXNtlB2pwwbAGcc9xefPaP3rPxWdcTH5u5rl/lB4yZwUHY+9rucGNaWiQt4vO+inCS9ZLk1085qvRkfA+OT05YZpEeg58bCmyGYEYcnKkxCDa6Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEABsABb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEABsABb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779964398; x=1811500398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+h8BiDyEGUTaX5dkltOlb6CAZB4QJkd09eu9rd4ZL7I=;
  b=WEABsABbI4qCyWR/suuTCBZ0CowISKo1OnmLfmdb6Ltv6Bbyzu3ez2EB
   u71FRdIhXHIMAynnP3bjeGvH1/jXxHQtiFnKh6UHZqsAepsKOLeTFLiiy
   wFoITHeTgLrz0HcK+S5OKPNpVpJy2rF7HJWHZkNje2K4C4u9Q/8N0mXIL
   jA/FioRBYbdRb3yzf9VPeJirw7+a0OyoteWTwUMmSKt/ZhcS9F4jF26z5
   MzS3z3Yh+rQd8DBekaVy4qAIeNhnjxwUIz8BP69gP1fWMYlbovY79t2qc
   VIFOZc7LJ4jpRtJOjnw2EZK6BEDgWq2j+CSlBdKv8XxEx3MQ5pCLD12yj
   w==;
X-CSE-ConnectionGUID: +64hfVbhQ8urGOHIHDER0A==
X-CSE-MsgGUID: OMNapIcIT0G7/fX/R75l4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="106256609"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="106256609"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 03:33:16 -0700
X-CSE-ConnectionGUID: iNrAHOncSZy9ngJMnGgBWg==
X-CSE-MsgGUID: ypfIc8BbS7eMVXf3AkLkJg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2026 03:33:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSY35-000000005qk-30Rp;
	Thu, 28 May 2026 10:33:11 +0000
Date: Thu, 28 May 2026 18:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Guan <guanwentao@uniontech.com>, masahiroy@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	petr.pavlu@suse.com, linux-kernel@vger.kernel.org,
	Wentao Guan <guanwentao@uniontech.com>
Subject: Re: [PATCH v2] genksyms: Support arm64 CRC32 hardware acceleration
Message-ID: <202605281815.1Z1xCVpw-lkp@intel.com>
References: <20260525070344.1564886-1-guanwentao@uniontech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525070344.1564886-1-guanwentao@uniontech.com>

Hi Wentao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.1-rc5 next-20260527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Guan/genksyms-Support-arm64-CRC32-hardware-acceleration/20260525-151229
base:   linus/master
patch link:    https://lore.kernel.org/r/20260525070344.1564886-1-guanwentao%40uniontech.com
patch subject: [PATCH v2] genksyms: Support arm64 CRC32 hardware acceleration
config: um-randconfig-002 (https://download.01.org/0day-ci/archive/20260528/202605281815.1Z1xCVpw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281815.1Z1xCVpw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281815.1Z1xCVpw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/genksyms/genksyms.c:122:12: warning: variable 'crc32_hw_available' set but not used [-Wunused-but-set-global]
     122 | static int crc32_hw_available;
         |            ^
   1 warning generated.
--
>> scripts/genksyms/genksyms.c:122:12: warning: variable 'crc32_hw_available' set but not used [-Wunused-but-set-global]
     122 | static int crc32_hw_available;
         |            ^
   1 warning generated.


vim +/crc32_hw_available +122 scripts/genksyms/genksyms.c

   118	
   119	/*
   120	 * Architecture-specific CRC32 hardware acceleration.
   121	 */
 > 122	static int crc32_hw_available;
   123	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
