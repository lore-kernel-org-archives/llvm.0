Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3B6A23
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 08:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653467750; x=1685003750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0DXbn3ndBFHNjG8eF07NLSI46YIpzf8ytZ0vydcZhFE=;
  b=VGvRGCLOscQik4i68bcPNsGiL75BgvWbKtTocZhuvKaQUxGbvPF6DkQw
   5fccaPN6Ewu4UNSmf9edHj5Ghm9Xiz4e/WLpH0zCCNmo7fcoISpA7ceON
   zU2Eyx2TYw/iN27EgfYbPsFCWPugCOJtT9Nt3AXRcxmUPC41w0BHdhdHf
   cmisVTKLFMfG0o757tc0FYmf6JGZox4vifRzqPwExU9X8AT/f/iusyDlt
   hwGBDhNwcqw16rWeAVDFMGNmAi+8sTyStJElpBNia1ig7PX1ZtmXupWnj
   RZ2BAJVLYIwUTQQixZdilWk8zrkTZWSFN43ur3dGkWoxEIN4BQBnUCttn
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="272574208"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="272574208"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 01:35:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="559551482"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 May 2022 01:35:48 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntmUd-0002sI-Cw;
	Wed, 25 May 2022 08:35:47 +0000
Date: Wed, 25 May 2022 16:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 2/20] drivers/dma/apple-admac.c:260:5:
 warning: no previous prototype for function 'admac_cyclic_read_residue'
Message-ID: <202205251600.AqjYQGzD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   401ef594286e6abfe89c2d92664087bc5d6ca657
commit: d2b3a34a7f529cd3e338989d7b4c71981180ad30 [2/20] dmaengine: apple-admac: Add Apple ADMAC driver
config: arm64-buildonly-randconfig-r005-20220524 (https://download.01.org/0day-ci/archive/20220525/202205251600.AqjYQGzD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d52a6e75b0c402c7f3b42a2b1b2873f151220947)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/d2b3a34a7f529cd3e338989d7b4c71981180ad30
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/070-audio
        git checkout d2b3a34a7f529cd3e338989d7b4c71981180ad30
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma/apple-admac.c:260:5: warning: no previous prototype for function 'admac_cyclic_read_residue' [-Wmissing-prototypes]
   u32 admac_cyclic_read_residue(struct admac_data *ad, int channo, struct admac_tx *adtx)
       ^
   drivers/dma/apple-admac.c:260:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 admac_cyclic_read_residue(struct admac_data *ad, int channo, struct admac_tx *adtx)
   ^
   static 
   1 warning generated.


vim +/admac_cyclic_read_residue +260 drivers/dma/apple-admac.c

   256	
   257	/*
   258	 * Read from hardware the residue of a cyclic dmaengine transaction.
   259	 */
 > 260	u32 admac_cyclic_read_residue(struct admac_data *ad, int channo, struct admac_tx *adtx)
   261	{
   262		u32 ring1, ring2;
   263		u32 residue1, residue2;
   264		int nreports;
   265		size_t pos;
   266	
   267		ring1 =    admac_peek(ad, REG_REPORT_RING(channo));
   268		residue1 = admac_peek(ad, REG_RESIDUE(channo));
   269		ring2 =    admac_peek(ad, REG_REPORT_RING(channo));
   270		residue2 = admac_peek(ad, REG_RESIDUE(channo));
   271	
   272		if (residue2 > residue1) {
   273			// engine must have loaded next descriptor between the two residue reads
   274			nreports = admac_ring_noccupied_slots(ring1) + 1;
   275		} else {
   276			// no descriptor load between the two reads, ring2 is safe to use
   277			nreports = admac_ring_noccupied_slots(ring2);
   278		}
   279	
   280		pos = adtx->reclaimed_pos + adtx->period_len * (nreports + 1) \
   281							 - residue2;
   282	
   283		return adtx->buf_len - pos % adtx->buf_len;
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
