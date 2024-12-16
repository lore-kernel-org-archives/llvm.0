Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD115256E;
	Mon, 16 Dec 2024 00:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734309653; cv=none; b=UtRLzYj0OydgJkGU3X16hp/f1aCxUB/VWmY+6WSnQXAbH5+HvfF4prpplONgJvekbs8YFRpn7lF1vm72M1n3SF/e065qYb1vnl6RvhJlNcHco68QcyKXqrzyb6xuWNGwST/Da8n5+iACkWHowk3no8ptvEDaEqI8Y6SXJqzssV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734309653; c=relaxed/simple;
	bh=H7QgqzQTLdyfSzdLspoiZFKaNSJFZNQq8zAXI6ifDXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PgNgwWTDiQ/jSuCauSI5Q6gNUi4Bxwxj/dwtfikYvzbXkbUieNbOCUfd82JCKtAeuz25t5IQKGmTSgAnb7PXrhG3SsrQu0fc6rwK7peNU1b9omct1al9/JbpzlaSF5kqzuZWpBJObsDUgZjs9cyln1SZpE0Rso+IxZyOPCtbhqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jO0r1Vn2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jO0r1Vn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734309651; x=1765845651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H7QgqzQTLdyfSzdLspoiZFKaNSJFZNQq8zAXI6ifDXQ=;
  b=jO0r1Vn2K82H09cd+IyVLUmcJrEQHMYIj2+H1y85mEDHlePAdgH1QCrF
   Kc5SdjW4gSYKoIhIqp74DEkL+e3JT980+C5VSvV6l6mkNIGPA4PZIPWQb
   udc1Z/NbZwnkuhsjAt6+R4C0GCey7uvc+DE/hnPVRdiybYpxEHKseXYpE
   NBMzYD/N3s2u5ErALI2rrxP2+i35KZ2pPKLoC5y2GXljLlrqpx6XOFcAe
   FzQ3O2S1KiwnTTpctNFhJeI+k+qDniAadc2fPfzNfD8ZUAB8va50GWkHc
   cpxC3MVebZSOyF72tOxs9ZsqVdvZp2FMH1HY1W6RW84i3s53dY50Ha0Eo
   w==;
X-CSE-ConnectionGUID: Uu3OG6zeSRu4Ba+99IBTJg==
X-CSE-MsgGUID: B/PvxZWYQpG1PIkkR3docQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="57166194"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="57166194"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 16:40:50 -0800
X-CSE-ConnectionGUID: xOpOrJR0RQGNg2Llnc5dNQ==
X-CSE-MsgGUID: xGWRpBL+R/yU6PEGPfkn0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="96948416"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Dec 2024 16:40:48 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMzAD-000Duw-0p;
	Mon, 16 Dec 2024 00:40:45 +0000
Date: Mon, 16 Dec 2024 08:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 56/239]
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c:35:19: error: unused function
 'rcar_cmm_read'
Message-ID: <202412160831.5xPilPXv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   2563d17c641922648007b2abfe3406e2a9a7faf8
commit: d39928f4ecbaf71fa2249fa75473f0349910d21c [56/239] mm/vmstat: fix a W=1 clang compiler warning
config: powerpc-randconfig-002-20241216 (https://download.01.org/0day-ci/archive/20241216/202412160831.5xPilPXv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412160831.5xPilPXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412160831.5xPilPXv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c:35:19: error: unused function 'rcar_cmm_read' [-Werror,-Wunused-function]
      35 | static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
         |                   ^~~~~~~~~~~~~
   1 error generated.


vim +/rcar_cmm_read +35 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c

e08e934d6c289ed drivers/gpu/drm/rcar-du/rcar_cmm.c Jacopo Mondi 2019-10-17  34  
e08e934d6c289ed drivers/gpu/drm/rcar-du/rcar_cmm.c Jacopo Mondi 2019-10-17 @35  static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
e08e934d6c289ed drivers/gpu/drm/rcar-du/rcar_cmm.c Jacopo Mondi 2019-10-17  36  {
e08e934d6c289ed drivers/gpu/drm/rcar-du/rcar_cmm.c Jacopo Mondi 2019-10-17  37  	return ioread32(rcmm->base + reg);
e08e934d6c289ed drivers/gpu/drm/rcar-du/rcar_cmm.c Jacopo Mondi 2019-10-17  38  }
e08e934d6c289ed drivers/gpu/drm/rcar-du/rcar_cmm.c Jacopo Mondi 2019-10-17  39  

:::::: The code at line 35 was first introduced by commit
:::::: e08e934d6c289ed0d6bc222271f69dc35fb2caa5 drm: rcar-du: Add support for CMM

:::::: TO: Jacopo Mondi <jacopo+renesas@jmondi.org>
:::::: CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
