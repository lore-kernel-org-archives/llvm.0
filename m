Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57939173
	for <llvm@lists.linux.dev>; Tue,  6 Sep 2022 01:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662426331; x=1693962331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6E9vEXGnWSLw8272iZYzcSnfvmq3epErU3w1jy4p1xc=;
  b=Ows8CK9ep9Cc7dkfTWVu3djHftIXmlMPwCM+pBPbbq2wscoUmwyjJcad
   oz0hGg1U5nYCNfCbsHfvJ4gstCJBiszYWEuTK/BF3egG27RqAg6Je3BJ5
   tNT9Zc+gX4iKzwPUfS1oYdUjR51KzmQuV5/2w+ABoj/6CnsAf0QLDmjDC
   ZI3xg3IItoQuKkTD59lvOlS8oLHknCB1i9HeuGCqE1rig8lRt41o1ILPN
   cRjsMIXZeVPCL25bYyCEZj8LculEPDqlsLxCrEEaO6pMCUnBduDOf9qKL
   KjhTN+YMQsMS992OYUJG30sAPTqzeGpQi3aJghQxYpyVIVExIhBo00nfF
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="283468962"
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="283468962"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 18:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="643964143"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Sep 2022 18:05:05 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oVN1U-0004hI-1t;
	Tue, 06 Sep 2022 01:05:04 +0000
Date: Tue, 6 Sep 2022 09:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Torrente <igormtorrente@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	dri-devel@lists.freedesktop.org,
	Melissa Wen <melissa.srw@gmail.com>
Subject: [drm-misc:for-linux-next 3/9]
 drivers/gpu/drm/drm_atomic_helper.c:802: warning: expecting prototype for
 drm_atomic_helper_check_wb_connector_state(). Prototype was for
 drm_atomic_helper_check_wb_encoder_state() instead
Message-ID: <202209060828.2Q6b2EhU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   396369d6754993e40f1c84b2e22e40e92dfa4c49
commit: 254fe9c106ed69245fbe0beac582054c98a91482 [3/9] drm: drm_atomic_helper: Add a new helper to deal with the writeback connector validation
config: i386-randconfig-a011-20220905 (https://download.01.org/0day-ci/archive/20220906/202209060828.2Q6b2EhU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc for-linux-next
        git checkout 254fe9c106ed69245fbe0beac582054c98a91482
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_atomic_helper.c:802: warning: expecting prototype for drm_atomic_helper_check_wb_connector_state(). Prototype was for drm_atomic_helper_check_wb_encoder_state() instead


vim +802 drivers/gpu/drm/drm_atomic_helper.c

   787	
   788	/**
   789	 * drm_atomic_helper_check_wb_connector_state() - Check writeback encoder state
   790	 * @encoder: encoder state to check
   791	 * @conn_state: connector state to check
   792	 *
   793	 * Checks if the writeback connector state is valid, and returns an error if it
   794	 * isn't.
   795	 *
   796	 * RETURNS:
   797	 * Zero for success or -errno
   798	 */
   799	int
   800	drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
   801						 struct drm_connector_state *conn_state)
 > 802	{
   803		struct drm_writeback_job *wb_job = conn_state->writeback_job;
   804		struct drm_property_blob *pixel_format_blob;
   805		struct drm_framebuffer *fb;
   806		size_t i, nformats;
   807		u32 *formats;
   808	
   809		if (!wb_job || !wb_job->fb)
   810			return 0;
   811	
   812		pixel_format_blob = wb_job->connector->pixel_formats_blob_ptr;
   813		nformats = pixel_format_blob->length / sizeof(u32);
   814		formats = pixel_format_blob->data;
   815		fb = wb_job->fb;
   816	
   817		for (i = 0; i < nformats; i++)
   818			if (fb->format->format == formats[i])
   819				return 0;
   820	
   821		drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
   822	
   823		return -EINVAL;
   824	}
   825	EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
   826	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
