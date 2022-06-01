Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9395563D
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654084981; x=1685620981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nSKRDSylJadLI+mvWTeZjJS7pEUMppAzFzSpmQkSgv0=;
  b=X2w7e0z+DFhavQFkWA7ebC8h8VxC72IBJhgLC88h8HtDLYg25NHTKYom
   +AjarAYM2O/9984QZGP9LnoiwnqP4Klo4aHrMfVLEEamajRckLJoP9kxf
   DOL9Ec4bvCiRJMw8v5o5g+tqBS6sc60cKW1BIUZIZ9wRvuIfgSY/mIhn1
   2yHh3/P/QGjcs5PhAkn3IWl+YXgvfoLbWymmMu81rTbc4FPU6tctpkyIP
   LBJXY9Z2Deu1N2O/L2ik6DnqZfBJYccF2Zozilkp+bwxwW3HPFAHDoDJ4
   GE1YT36iw6TavBOVk82fv0Q982KEl4Yg5L9TcxY3bfw2VpOUFSYPBs6Bd
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="256043397"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="256043397"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 05:03:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="562768394"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Jun 2022 05:02:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwN3y-0003w2-R9;
	Wed, 01 Jun 2022 12:02:58 +0000
Date: Wed, 1 Jun 2022 20:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [RFC PATCH 2/2] drm/i915: Enabling WD Transcoder
Message-ID: <202206011906.FVEKyYoi-lkp@intel.com>
References: <20220601082200.368911-3-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601082200.368911-3-suraj.kandpal@intel.com>

Hi Suraj,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/i915-writeback-enablement/20220601-162509
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220601/202206011906.FVEKyYoi-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/86bdd6544954d8a7336e5b797538677c9001d0fc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Suraj-Kandpal/i915-writeback-enablement/20220601-162509
        git checkout 86bdd6544954d8a7336e5b797538677c9001d0fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_wd.c:66:6: warning: no previous prototype for function 'print_connectors' [-Wmissing-prototypes]
   void print_connectors(struct drm_i915_private *dev_priv)
        ^
   drivers/gpu/drm/i915/display/intel_wd.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void print_connectors(struct drm_i915_private *dev_priv)
   ^
   static 
>> drivers/gpu/drm/i915/display/intel_wd.c:414:6: warning: no previous prototype for function 'intel_wd_writeback_complete' [-Wmissing-prototypes]
   void intel_wd_writeback_complete(struct intel_wd *intel_wd,
        ^
   drivers/gpu/drm/i915/display/intel_wd.c:414:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void intel_wd_writeback_complete(struct intel_wd *intel_wd,
   ^
   static 
>> drivers/gpu/drm/i915/display/intel_wd.c:422:5: warning: no previous prototype for function 'intel_wd_setup_transcoder' [-Wmissing-prototypes]
   int intel_wd_setup_transcoder(struct intel_wd *intel_wd,
       ^
   drivers/gpu/drm/i915/display/intel_wd.c:422:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int intel_wd_setup_transcoder(struct intel_wd *intel_wd,
   ^
   static 
>> drivers/gpu/drm/i915/display/intel_wd.c:587:5: warning: no previous prototype for function 'intel_wd_capture' [-Wmissing-prototypes]
   int intel_wd_capture(struct intel_wd *intel_wd,
       ^
   drivers/gpu/drm/i915/display/intel_wd.c:587:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int intel_wd_capture(struct intel_wd *intel_wd,
   ^
   static 
   4 warnings generated.


vim +/print_connectors +66 drivers/gpu/drm/i915/display/intel_wd.c

    65	
  > 66	void print_connectors(struct drm_i915_private *dev_priv)
    67	{
    68		struct drm_connector *connector;
    69		struct drm_connector_list_iter conn_iter;
    70		struct intel_connector *intel_connector;
    71	
    72		drm_modeset_lock_all(&dev_priv->drm);
    73		drm_connector_list_iter_begin(&dev_priv->drm, &conn_iter);
    74		drm_for_each_connector_iter(connector, &conn_iter) {
    75			intel_connector = to_intel_connector(connector);
    76			drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s]: status: %s\n",
    77				connector->base.id, connector->name,
    78				drm_get_connector_status_name(connector->status));
    79		}
    80		drm_connector_list_iter_end(&conn_iter);
    81		drm_modeset_unlock_all(&dev_priv->drm);
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
