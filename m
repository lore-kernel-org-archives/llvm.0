Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD25367
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 10:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652524960; x=1684060960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=owL2E8dN4WOVXiXSAA2t80U2WaZOkvUVbpuMiP4wVM8=;
  b=KUAzKCDAXWM/iIy2SdyQhKsV+PVroS/hVY8Me9Cq62SI3LHFrTslyW8F
   EQ7Mpv86ZP1zHmJIRg6b/KKXC/vw2B9Ezx7B+ngIEHOpOlyd9hUswG5WG
   nP/JGlH0W6U5wpDLKzGhQJvdjRIsb8jTQWrSsD2kwn9Jj5pNS6DML0WBu
   rCJ9FbVnqY7E7F34ZHG7hTM0cYc3C+yo5POgPgKlGFPTBbcMjXDF/hmEd
   NCaTK1Yf3OMG1dG8qSOD62wtrxbe8Aq4gO088x47m/O0QdCbMfSG3VZLo
   sZxzn+SnVvHEdBoHkioCJsYnKXFtXbEczKS7VzvfA0zeuUDmJ52vE+/JC
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="250402860"
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="250402860"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2022 03:42:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="595648948"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 May 2022 03:42:36 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nppEJ-0000Vx-Ds;
	Sat, 14 May 2022 10:42:35 +0000
Date: Sat, 14 May 2022 18:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Marvin Lin <milkfafa@gmail.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, openbmc@lists.ozlabs.org,
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	kwliu@nuvoton.com, kflin@nuvoton.com
Subject: Re: [PATCH v2 5/5] drivers: media: platform: Add NPCM Video
 Capture/Encode Engine driver
Message-ID: <202205141815.QVBWWaqM-lkp@intel.com>
References: <20220513033450.7038-6-kflin@nuvoton.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513033450.7038-6-kflin@nuvoton.com>

Hi Marvin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linux/master linus/master v5.18-rc6]
[cannot apply to media-tree/master next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Marvin-Lin/Support-Nuvoton-NPCM-Video-Capture-Encode-Engine/20220513-113806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220514/202205141815.QVBWWaqM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7fa1f7750e7317479ce2c2c043b44fa19c46b1a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marvin-Lin/Support-Nuvoton-NPCM-Video-Capture-Encode-Engine/20220513-113806
        git checkout 7fa1f7750e7317479ce2c2c043b44fa19c46b1a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/platform/nuvoton/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/nuvoton/npcm-video.c:1776:6: warning: variable 'empty' set but not used [-Wunused-but-set-variable]
           int empty;
               ^
   1 warning generated.


vim +/empty +1776 drivers/media/platform/nuvoton/npcm-video.c

  1773	
  1774	static void nuvoton_video_buf_queue(struct vb2_buffer *vb)
  1775	{
> 1776		int empty;
  1777		struct nuvoton_video *video = vb2_get_drv_priv(vb->vb2_queue);
  1778		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
  1779		struct nuvoton_video_buffer *nvb = to_nuvoton_video_buffer(vbuf);
  1780		unsigned long flags;
  1781	
  1782		dev_dbg(video->dev, "%s\n", __func__);
  1783	
  1784		spin_lock_irqsave(&video->lock, flags);
  1785		empty = list_empty(&video->buffers);
  1786		list_add_tail(&nvb->link, &video->buffers);
  1787		spin_unlock_irqrestore(&video->lock, flags);
  1788	}
  1789	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
