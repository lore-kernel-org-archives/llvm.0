Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727423529E;
	Sat, 16 Dec 2023 22:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Poz+NZKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702764784; x=1734300784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dCAXdtuf13ueYNiOWRnuGDFeBNaCemvPyP2dlZUjh7g=;
  b=Poz+NZKKaKtWUV2pKWFlrFczAyTWsT/ZSQsjwuVe2vmbmqRQ9u/DwxNI
   qfkBIv+xG+J6XKHuPCsgX6kM6x/sSUjnh30vhz+at45bCnLYb/tGJZYpM
   OCMPzBsbQNi+VUOdKFQhT76OZSPzMdWYmp6baZFQeS6BJzCdpVn8fqyWb
   lj72iiHoMjLnp89JlE2Lh7swrazoMKH++okGylbQNkGF9CG3kQbORXvO0
   Qk/W7UUoVBhNTWFVwMQ0r1ZWnq4De/YQ37xwZFQyy7BLZCogkHGL4yBRz
   n0pwSJdzEMHlmbrW2Lm2/XEbWtGdrLkYgcrMS2tDELYMicfOOHWkB/cAI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="8815298"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="8815298"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 14:13:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="845504174"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="845504174"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2023 14:13:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEcu3-0002Ge-17;
	Sat, 16 Dec 2023 22:12:59 +0000
Date: Sun, 17 Dec 2023 06:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [linux-next:master 6261/8213] scripts/kernel-doc:
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:212: warning: Excess struct
 member 'debugfs_root' description in 'dpu_encoder_virt'
Message-ID: <202312170641.5exlvQQx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: 62d35629da807d3a0729980e8012263ff84a0966 [6261/8213] drm/msm/dpu: move encoder status to standard encoder debugfs dir
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231217/202312170641.5exlvQQx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170641.5exlvQQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170641.5exlvQQx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   scripts/kernel-doc: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb' description in 'dpu_encoder_virt'
   scripts/kernel-doc: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb_data' description in 'dpu_encoder_virt'
>> scripts/kernel-doc: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:212: warning: Excess struct member 'debugfs_root' description in 'dpu_encoder_virt'
>> scripts/kernel-doc: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:212: warning: Excess struct member 'debugfs_root' description in 'dpu_encoder_virt'
   scripts/kernel-doc: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb_data' description in 'dpu_encoder_virt'
   scripts/kernel-doc: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb' description in 'dpu_encoder_virt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
