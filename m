Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9323EAB8;
	Mon,  1 Dec 2025 20:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621819; cv=none; b=tpcJelxOfwHVAkh5xmvrpdVZuI82DKZPWnsRQIs/VVQPwHHsjK2zr43JH3Ce6smgPHPrpixHilpKKKwVIF6/vPcbJkG9/piAgEdZwr6h8j5/PrtW2MNOzI1dmSSbxYDz87+beo9Yx8NigEJxUwQzPbw37yTdKEpI9lb6UtpijHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621819; c=relaxed/simple;
	bh=4RzztMo3TTms4SW4HoZntA0jhmrAjdotQlg2W/hknuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvjE+0PAwPb+tspmXZHjgBERS82WTKcyfI/8ADh62OsqmctN9tkKHJlhH+WLpR2nKIfFduw3Wd73yWwDcxL+s1jY5AlRlyVH1nI4N7M3ytWByc7bmrSVm3m93QSkCYTiycICCLZB2oh0tG9UY7oS9gPOUOFm3w1QltG+oUuQ/V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ns++ojE0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ns++ojE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764621817; x=1796157817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4RzztMo3TTms4SW4HoZntA0jhmrAjdotQlg2W/hknuw=;
  b=ns++ojE0lIWjpsNYILNlfORcehcMGNrcXsxWh65oVtV7pM3iMEznqJnc
   TNgqbOrGfsvPQuFhHNHQHJajNltWKd9hILpyy69J2xv2ooPYgXhoUnNmK
   p/NMy/hdsnhxD1UIO6LThpEiKmQYiBqE4IKzMTfsOqu5I52zXD9heF8lM
   qPjz7LYcEESAEmwRsgbCCChh9bxzwAd7jP4D7D8PtznVjC9nfxbKaLUpq
   pvvTZg09xGC1ZqjsqFpC3ynHqNxk7PAEJ5bK0AlOknOvu1g3cl0a5Tpj6
   nFzmtqOOR5Ttk5h09cZ/RgfrVCsOmLrFHp9zTzUfAmH8vst6Le44kSpC4
   w==;
X-CSE-ConnectionGUID: AMK8831aQ4maPE0PgK1wtA==
X-CSE-MsgGUID: WMXwiJaIR2eWsArb/ZR1Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77205168"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="77205168"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 12:43:36 -0800
X-CSE-ConnectionGUID: Y6VyFdwZQaSzrgqwBRMVAQ==
X-CSE-MsgGUID: NPt3kvPORauyruiXvuEFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="193448318"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Dec 2025 12:43:35 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQAk8-00000000989-2PH0;
	Mon, 01 Dec 2025 20:43:32 +0000
Date: Tue, 2 Dec 2025 04:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: <instantiation>:7:11: error: expected an immediate
Message-ID: <202512020410.BDXzDjrc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marco,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
commit: 56651128e2fbad80f632f388d6bf1f39c928267a MIPS: Fix idle VS timer enqueue
date:   7 months ago
config: mips-bcm47xx_defconfig (https://download.01.org/0day-ci/archive/20251202/202512020410.BDXzDjrc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020410.BDXzDjrc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020410.BDXzDjrc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:7:11: error: expected an immediate
    ori $26, r4k_wait_idle_size - 2
             ^
   <instantiation>:10:13: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
               ^
   <instantiation>:10:29: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
                               ^
>> <instantiation>:7:11: error: expected an immediate
    ori $26, r4k_wait_idle_size - 2
             ^
   <instantiation>:10:13: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
               ^
   <instantiation>:10:29: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
                               ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
