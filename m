Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4A73A9DB6;
	Sat, 11 Apr 2026 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775922881; cv=none; b=Rm21ZCO/inMfsS5QrgjMbiEJsMTyC0615q/fnegoouAbp/Dt+OcWvNsI5V+o49cpGAELzL/eAoD+pPWePth0jWN554NAiUPoZ4fqCDUxGrpa/x0Mb+cUQRES7sifgs+IQdKRghyU9A7F8+3E8mkAZk+lgc6OvNWHkfJbxb7cU2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775922881; c=relaxed/simple;
	bh=lifU0usr5LQPGxlBBfxhCblln0K8Cg1yutKpZuZC4kw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T/z4eAwZ983a9UnjrOWHK/0IEkzqEGgxfEu70Y1OBq4jvjE4AB/lOYchFjDOprQb7WopTWpS1p21X0YRq+PcaprebiR6yllpxQPo1HE6MAZi8d/OMRAk6zbIKr1sInVvDZ/MNqeSEIMuLDXrVVxVN2X5nabdk66aJRhwj3PduGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPWYQG7n; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPWYQG7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775922879; x=1807458879;
  h=date:from:to:cc:subject:message-id;
  bh=lifU0usr5LQPGxlBBfxhCblln0K8Cg1yutKpZuZC4kw=;
  b=bPWYQG7n+jC4sh7EPjj/CkWAhRyxtQfZmkJLPG75uSvSTt+fTtHjyJyz
   3AOf9gVOaCm9d5mMlTkyXgrbTchYAm7Q5T6fTNLOuN0wSH3HMkcCI+khr
   AJq9W7KEb5ziTotcTIJR4Upk8RRVJEE2QjE8ICQ1F5mxoHkWrRZxBYp4u
   9U6PnW0rMWD2K62z91gAW3DvWqOakVIliKmpia0ORwrDQ9Ktkdy5zppVe
   /5iXDciqKXJJ+zC1tDSUKceWfEdmhHnpPYnFgRycsSqfijH2zd2lRZoOZ
   z0PEXRJUNmwgZjNexHsjItthY5+cDhGGR+qGPA8p/48iqF8LPtPowMk15
   Q==;
X-CSE-ConnectionGUID: BkS8SzJNRkK4UFwPSlAvMQ==
X-CSE-MsgGUID: wkie263ZRvefeW9oCeYgPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="102376017"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="102376017"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 08:54:39 -0700
X-CSE-ConnectionGUID: gBn3RGSiQb6bhGnObeKrnA==
X-CSE-MsgGUID: ukk/CcboRo6Y+GT9OKEziw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="229249548"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2026 08:54:38 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBafL-000000001FB-0hHN;
	Sat, 11 Apr 2026 15:54:35 +0000
Date: Sat, 11 Apr 2026 23:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Helge Deller <deller@gmx.de>
Subject: [deller-fbdev:for-next-v7.1 17/22] ERROR: modpost:
 "__end_rodata" [lib/fonts/font.ko] undefined!
Message-ID: <202604112326.kWhH8Y7A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git for-next-v7.1
head:   26484b2fa418a002d099608e681aef86fc90990c
commit: a76e4bfc4b3586b47ede8e83bdb6050cd6b16025 [17/22] lib/fonts: Compare font data for equality with font_data_is_equal()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604112326.kWhH8Y7A-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604112326.kWhH8Y7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604112326.kWhH8Y7A-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__end_rodata" [lib/fonts/font.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
