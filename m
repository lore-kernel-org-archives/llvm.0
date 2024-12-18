Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E6B15C15C;
	Wed, 18 Dec 2024 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734510806; cv=none; b=CSp+o5gjypAm00bgcc0uhT6MsGcwYlSD5s5/OhucTRIeNdz/hS4m5B46wQ+P06hx9bIz6wE4d4EFVc3jX6dKyqXNhzWKb6tgy/9daxr5pqtyo3xljKEJtpfodGH42hoXhZjjH07yrcEmTtgS1y45xHaq9ve62lKF5BwOBOlX+qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734510806; c=relaxed/simple;
	bh=Ry7q31mgqgtXCefZQH3sjqVvO3JnB08nmuzE5txrfs0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPSmHGroTbgnOSms2j7VSHGhZx4h5jJSrGn1jv+IWIrAFVZ9nochsJO7jfrmqChG+jhJIZbgsPYjRpCpTMdVjNi9tIz455+0TlTiM3VbWF/lqRwY49bgXsd5xfxCyfouEucJD6ZGFlLU1o0WdHcDkPwujjTHXJ0Q9AFesYcgyKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MujnsnmF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MujnsnmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734510805; x=1766046805;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Ry7q31mgqgtXCefZQH3sjqVvO3JnB08nmuzE5txrfs0=;
  b=MujnsnmF5LzckoBShGgYLJnR7/zzcNz78uBjX/H9YtqQ3rCk1QSU3ACw
   kBoq5/hAxkMKxVJuXflAm7Iw+r9saRzDLIEq4I5XsMiwJjeabAlH7WNDg
   R79jaaUccmxsxvU0+O5aYhZZ8a0b4zAc1SD79Mga1X6ZnKwpsBczzmGy8
   DdI623kzkKzV4Bb8or1BoA1V3r9Z3y76gG6wE9ioZMqeVRb+77J5XDS68
   NlD0ilEKPNPSlcQWNzg9SGHOy98mssJyKQogM0dr0FkeF3vsKuAzMl4v5
   +xj6FjsrySftTKmDkicBIR1Bt1xW38ihljdIcad0nYJeELChNxp3CXkbp
   A==;
X-CSE-ConnectionGUID: XytA+uttTvSGRPMSsLPMnQ==
X-CSE-MsgGUID: U+CBpqbyQv6+urJoOeOXZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45669657"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45669657"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:33:24 -0800
X-CSE-ConnectionGUID: +yiK0ToWSNiyxYQiysxH7Q==
X-CSE-MsgGUID: CVCK6IjGSCekz7ddjuTnag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="97854970"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Dec 2024 00:33:23 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNpUf-000GCe-0F;
	Wed, 18 Dec 2024 08:33:21 +0000
Date: Wed, 18 Dec 2024 16:32:31 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 3146/3192] drivers/gpu/drm/tiny/cirrus-qemu.o:
 warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202412181637.Fha5A3SP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fa366f1b6e376c38966faa42da7f0f2e013fdab
commit: a346a3280fbc15df5e1496cb0d4c9187d7faae0e [3146/3192] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: x86_64-randconfig-076-20241212 (https://download.01.org/0day-ci/archive/20241218/202412181637.Fha5A3SP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181637.Fha5A3SP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181637.Fha5A3SP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tiny/cirrus-qemu.c:22:
   In file included from include/linux/pci.h:1644:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2287:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/gpu/drm/tiny/cirrus-qemu.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
