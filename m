Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022051411DE;
	Mon, 27 Oct 2025 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761566815; cv=none; b=l+jOYCZw3PtDam1C36QeTl2iKE/SsSSjtnimMpCzJZ7JhvtCMBw0seAR2lCwlhQx6KISBpEu/tVAyDVG4QnJG2eLCODTNfdoKcIRgP7BgPp1p88qGCFP27J57Nlp0vnNFo82OwVOvQ84jaMLvgJXmzJZQ2KruY22GljPM/apm98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761566815; c=relaxed/simple;
	bh=1fa6avo2+XBI24M0Vdp/RCCUKGreJVGTEvFgyQX1dtI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DXRz3imMa7eTg9G5F2VjT5lkDlYsxA2BBPZw94Mo5sDXMsDzJ1gyccO/wtd5tYgUQiqgOIggdMKNmz02u+4oA2ppXW9a8fZphOxEmzl94ZPnosoxf7FCGEnYwcVlZV2reydm31UNowg0ResxQoGSdk25fjtIAeFfNc1MCF29Ifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5pcQB+R; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5pcQB+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761566814; x=1793102814;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1fa6avo2+XBI24M0Vdp/RCCUKGreJVGTEvFgyQX1dtI=;
  b=g5pcQB+R4ZYDgOtjiR58qPAVGgoM9Utz9f3zDxGMRIetapc52Gtl0HTb
   kQDkHB7ODNlsPGb0Xff76IMr0Zkl9TMZp6Rq31LPuhY3eYGrdO/PN707f
   6HkzehQcEBVW9oP8nAblCNckaNozMvYKdR84DMPc8DHMKqcaYKD25yMwK
   xfm7jSyCUFCxkV5TESc4SKfqryrT7Cka5RW0dpBYx3uqRPXQC16vCBaUN
   jiM6A8iE6KgP99R/yCKqYzpI1L3vpfb0wr6GpPplpOSh/NY30QQVCFKOT
   cVF3hd9Tn/o0aHqnDanD19tH1OjEycNfB/uSf9jcgCQOGmw9PNHHfQ/d0
   g==;
X-CSE-ConnectionGUID: kBfanF1cQ/a8DO5lXSLyfQ==
X-CSE-MsgGUID: qLcn9YxHSYaGRsF48XGFFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81067544"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="81067544"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 05:06:53 -0700
X-CSE-ConnectionGUID: 4XPxqLh1SjaRytWpwMjC7Q==
X-CSE-MsgGUID: ujqoCD4YSquiRR7nFlMv8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="185373776"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 Oct 2025 05:06:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDLzu-000Gl3-0V;
	Mon, 27 Oct 2025 12:06:50 +0000
Date: Mon, 27 Oct 2025 20:06:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 3716/4376] clang: error: linker command failed
 with exit code 1 (use -v to see invocation)
Message-ID: <202510271906.1346pSIO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Conor Dooley <conor.dooley@microchip.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
commit: 38cf9d6413142290316776c80f19eb92a4e19a9f [3716/4376] pinctrl: add pic64gx "gpio2" pinmux driver
config: um-randconfig-001-20251027 (https://download.01.org/0day-ci/archive/20251027/202510271906.1346pSIO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271906.1346pSIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510271906.1346pSIO-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pinconf_generic_dt_node_to_map_all':
   include/linux/pinctrl/pinconf-generic.h:235:(.text+0x196): undefined reference to `pinconf_generic_dt_node_to_map'
>> clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
