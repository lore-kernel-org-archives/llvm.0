Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A300E29CA
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 08:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642752580; x=1674288580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4yBx8LdBo+vXMgx9kJkilhCP8msDKPnUTq6/VkqwpmU=;
  b=VxxYdwB/J/SerO6cuGaRw9+FU0jiYqrICGey0Rwf/+nOFG6qkyJHH6Rh
   CjRNlxHrJ7q60sNMZfWcnrNe5G12r2nJOQkx7zdpFo/U7yhXp0/Bquth6
   FOyTx7XrKi5VdSlHd3aQkgu3CDFOgtIW4G0KlD9s1+vlC7QnM5mmm32aL
   LIiheIhXyHcOzkyeNmDXyzGQd13UPxXqlB1srkmFFhnH+VjGPtbjKT54D
   nTXwZOkp6vuk9MO3j0aUZjM49zJ+/GWAGQOOAxbnfQb7BSNP80Wp9MLf7
   pbbK5qGPdzV3SdWKTITwzzhvl8trQk1Th9Ur9XZojUAfwwIXpP0GuZKZ4
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="226270061"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="226270061"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 00:09:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="561784554"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Jan 2022 00:09:38 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAozK-000F5Q-6r; Fri, 21 Jan 2022 08:09:38 +0000
Date: Fri, 21 Jan 2022 16:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] drm: allow passing a real encoder object for wb
 connector
Message-ID: <202201211623.L8JFrG3B-lkp@intel.com>
References: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Abhinav,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.16 next-20220121]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Abhinav-Kumar/drm-allow-passing-a-real-encoder-object-for-wb-connector/20220121-103231
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-randconfig-r005-20220120 (https://download.01.org/0day-ci/archive/20220121/202201211623.L8JFrG3B-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ce1d81913d9146f6e753c39f41929266a5885f99
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Abhinav-Kumar/drm-allow-passing-a-real-encoder-object-for-wb-connector/20220121-103231
        git checkout ce1d81913d9146f6e753c39f41929266a5885f99
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/vkms/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/vkms/vkms_writeback.c:143:38: error: member reference type 'struct drm_encoder *' is a pointer; did you mean to use '->'?
           vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
                                               ->
   1 error generated.


vim +143 drivers/gpu/drm/vkms/vkms_writeback.c

dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  138  
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  139  int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  140  {
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  141  	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  142  
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30 @143  	vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
