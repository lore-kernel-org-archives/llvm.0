Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145DD175AB;
	Fri, 13 Dec 2024 04:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734064405; cv=none; b=bCk+RuDRGQikcLaRNUHSBBp/bk2tQVKtqA6blr4pTLtp9TTs1YTVE8qa5CIm86fPDxSWs6xj5V4+ioBQxgCU5aoXAv1zjXn76zz/mT0luHtOaJ5YgjL8qRffSKBgFnoNOrSoR0rxWUo4ODYvOhc/qgV+uifuRdmuvdVoRt997U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734064405; c=relaxed/simple;
	bh=MqnkHmEtdW9vG+euS85WKXJ2Tgsefy22yhHOuloLbGw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MECtcgNEdzGQHg4vqAT32pXPKwzphCt//3yst/ZJ/nEkX4dBXhffOFbL8M4iwNcHm4QroUXPkM9kSwh07uyKF+OlLO/xLVMy8s5+Cks4kAGxjlRvjYUtC6vGGXZlYG+Umimnt2+H/K4fFfAWFfTs+NzGh+aEgiZvcTHCRl7o+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxzMHInO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxzMHInO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734064403; x=1765600403;
  h=date:from:cc:subject:message-id:mime-version;
  bh=MqnkHmEtdW9vG+euS85WKXJ2Tgsefy22yhHOuloLbGw=;
  b=LxzMHInO29bvGqOy9QasuCUSiruKUc/KeFcYJG1CneIPcu3IcJQG8Whn
   vjJPI14NWU56BLqh+0q8xIrl9/6DHzxiggr4oSspN6p5DCsJ+9zsfLX8R
   GNLgzJxRMMtKoe3bYt9vKSurCJweQjQGwjK+3mIIObK1B9oWo4c04Ny10
   dvugejLh+AXVgZHXT7TQyKh7m1wSd8w/ML+zWDlNiENlC8Fm8SRYYklaC
   Wv39zfD3yZ2OY1kphckaOF65fjRcQcZjjW0HGBrku4bYQiChoqc+lj66o
   jExcbjWFSFXAmi/h6dmW6qL6jMcs+jITPzgG36V7i6B8C9nnrNVkSSOak
   w==;
X-CSE-ConnectionGUID: MPg5bQ9xTcS1KTFhiHfUZw==
X-CSE-MsgGUID: oTq0AZ4wSA2v3VTtiO1I8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="51926108"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="51926108"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 20:33:22 -0800
X-CSE-ConnectionGUID: dqntju9XTUqM1wqQtFMG6w==
X-CSE-MsgGUID: CUcfYad/RgOSzci1CdDdNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100591897"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Dec 2024 20:33:21 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLxMd-000Bhj-1i;
	Fri, 13 Dec 2024 04:33:19 +0000
Date: Fri, 13 Dec 2024 12:32:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 15/28] clang: error: no such include
 directory: 'drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me'
Message-ID: <202412131227.NgQGGYB0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   8e1a88bac3fb75ee0baa8005f8bf986f276ab9b7
commit: 1909df14454d4cd1dd232d5a88305c4e5ea70c74 [15/28] CHROMIUM: media: mediatek: imgsys: ME driver moved to imgsys
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241213/202412131227.NgQGGYB0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412131227.NgQGGYB0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412131227.NgQGGYB0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: no such include directory: 'drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me' [-Werror,-Wmissing-include-dirs]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
