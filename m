Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B1D9455;
	Thu, 30 Mar 2023 20:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680207267; x=1711743267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nsqTBpirzpSOeI5sEKfiVokP7Bkns8vweeFOhUIkkB4=;
  b=SClPT10mBnc/M5ugs7/wnkulMnSo+rzRUf/ZqZr0zsUFPxJ2ir+mWM8C
   fpvZcBQZ12gwqCepeaid1e/WzxG2aeG0jQWsGnKLPYg3MDqu9h2aycyvp
   8fs/Iscvl1uP1Dkl0qeuYN/XGscTt+dINFSxxwlfwPnn1RDQz4Ohc328G
   OQA8TRBC8FbH1f6WrM6QGMmbeJami2byUPoaE7q2Av7BmQhRvhIXecWW/
   +D27++umUaBYDzWI0SBTVf8w6f3PI8U0Moh6DgiYFDHKxIogAg61gAw1D
   Jbe2QKpraFpvd0FgFkxpRs2pteCGM16XyRLnBdH+zKO4rQBPnA+lHLxi2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="338778300"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="338778300"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 13:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635049783"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="635049783"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Mar 2023 13:14:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phyeu-000LBC-2H;
	Thu, 30 Mar 2023 20:14:08 +0000
Date: Fri, 31 Mar 2023 04:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
	Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org
Subject: Re: [PATCH 04/12] drm/radeon: remove radeon_connector_edid() and
 stop using edid_blob_ptr
Message-ID: <202303310412.bgDHaLy4-lkp@intel.com>
References: <e4cb7b0c7217511429e69c1c78729f0e864c5b24.1680190534.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4cb7b0c7217511429e69c1c78729f0e864c5b24.1680190534.git.jani.nikula@intel.com>

Hi Jani,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-exynos/exynos-drm-next linus/master v6.3-rc4 next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-edid-parse-display-info-has_audio-similar-to-is_hdmi/20230330-234201
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/e4cb7b0c7217511429e69c1c78729f0e864c5b24.1680190534.git.jani.nikula%40intel.com
patch subject: [PATCH 04/12] drm/radeon: remove radeon_connector_edid() and stop using edid_blob_ptr
config: riscv-randconfig-r042-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310412.bgDHaLy4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/ad73d8b0ebf2124b058e95ef5831caa8f2d34229
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-edid-parse-display-info-has_audio-similar-to-is_hdmi/20230330-234201
        git checkout ad73d8b0ebf2124b058e95ef5831caa8f2d34229
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310412.bgDHaLy4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/radeon_audio.c:312:30: error: use of undeclared identifier 'radeon_connector'
           sad_count = drm_edid_to_sad(radeon_connector->edid, &sads);
                                       ^
   drivers/gpu/drm/radeon/radeon_audio.c:335:45: error: use of undeclared identifier 'radeon_connector'
           sad_count = drm_edid_to_speaker_allocation(radeon_connector->edid, &sadb);
                                                      ^
   2 errors generated.


vim +/radeon_connector +312 drivers/gpu/drm/radeon/radeon_audio.c

   301	
   302	static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
   303	{
   304		struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
   305		struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
   306		struct cea_sad *sads;
   307		int sad_count;
   308	
   309		if (!connector)
   310			return;
   311	
 > 312		sad_count = drm_edid_to_sad(radeon_connector->edid, &sads);
   313		if (sad_count < 0)
   314			DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
   315		if (sad_count <= 0)
   316			return;
   317		BUG_ON(!sads);
   318	
   319		if (radeon_encoder->audio && radeon_encoder->audio->write_sad_regs)
   320			radeon_encoder->audio->write_sad_regs(encoder, sads, sad_count);
   321	
   322		kfree(sads);
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
