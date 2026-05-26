Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0921935B653;
	Tue, 26 May 2026 18:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818657; cv=none; b=Gq1HVdleaWxIuxduw+t0F7vXsjJSd0E0TR27zyxs2VMH7xTGLQj+9N5t+UFQ38HQIofXP5xTBixwc4gUK4p1p9tDOEavmNju0sFpimrFJaz4l5QqhCib7WLI/GdHbJl7IIKwLuWefi7f8ewlnPFZWU7yn4Z6GMqyBKHNb9h005A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818657; c=relaxed/simple;
	bh=hY1fCSDsAVyidhLB+OchBan6ZrQEGXwmSvtYRL859uo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UhUjRstNlB95dvkVevFloNrfKc7LgKv6ESrmNCq4atwYj8EQE2wgJS3a/88EK5QqYI1bIurmcuW8xfpiKxBMZyDlNjZ0XpQRPYR0F4gdPX0LfoJkboZh+88OId8mxUOTfDNtzUy9lUoqmDitt8p509dz4zX0BOtZ6UKDD2zTkMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WsRooTZ0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsRooTZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779818656; x=1811354656;
  h=date:from:to:cc:subject:message-id;
  bh=hY1fCSDsAVyidhLB+OchBan6ZrQEGXwmSvtYRL859uo=;
  b=WsRooTZ06Z+B1Y866pTJUEvO/v3sn3uJ3egmzt0bEnFSWznq0ilDot5u
   TGZ5N9Zdwk7oseKhAGNs5NK4/f4kPqckai33qB/mAnr/oTYvxYR1q9/Hx
   72OKbLo/GdVRgYByB3HOdawMMNQY0Gfx1K76RllQX+PejGPXUP1f8x8jy
   iBJbcBLroC7+A8MXHJKpIGGHairZ0C1DJTyzDCanVAuvsp14h2O0eb2M7
   v5eJSJNqiTlQs/lvq+Omj6ThoLHa2g3Mwi6JPekFoiAC5SyyCMswJ0AVx
   djBHjd5ecMKsxpoz23MPxPGIQYcUJkMoZ+PL60EnUB4lnQZaNj1XKMX50
   g==;
X-CSE-ConnectionGUID: R+jF0jtORMWBET/2H7J3YQ==
X-CSE-MsgGUID: 3uLCxZQqQwaErF6cGLIs8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80490428"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80490428"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 11:04:15 -0700
X-CSE-ConnectionGUID: e3caSa1iQ6Klq1aflrSCxQ==
X-CSE-MsgGUID: ZpqmSzlkRL+1gPLDS994nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="243825098"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 May 2026 11:04:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRw8Q-000000002ty-40a7;
	Tue, 26 May 2026 18:04:10 +0000
Date: Wed, 27 May 2026 02:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 16/40] make[3]: *** No rule to make
 target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/'.
Message-ID: <202605270141.G8y1kM20-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   35eb04372bf7b3ef31afcde7c3336a0ff690d16c
commit: 92ffe54f0f99ec61fbcf52c66862fb29d279ac9a [16/40] hexagon: add device tree support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260527/202605270141.G8y1kM20-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270141.G8y1kM20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605270141.G8y1kM20-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/'.
   make[3]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
