Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1822F2A
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647442648; x=1678978648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kTGZ0hW/g3PXt3SUzliJA8jAzYcgOScjrfZP28K19oI=;
  b=DJqrqD9pQI9ej2fXC5lP+wUp7mvUF4JmC4FlhFgnvrobTd7Sz2Fqrt+F
   75YqQ9ywRGgM0NruLKvGl7p4kMlqEzrkkpkrB2EWitth13yB0h/gSFjN/
   F65JBubnd52HtxxawwFIqaUFB0oQmV5xZKQfSK47eLTK2of4brwTDkrRj
   H9E96jbsAJCL4vgnPh7S1fzbB7GAmCM8m3iB5mFEwb0MR8m526QSChK0R
   gBikkNeXQq8maUbdnu9BRWUsC9+skSzwNNO7eKO6Zvk3IBJiMSwcuRjSo
   TymgBBSK2Vgy9Jp7+YwI26auRQZ+0EBNFMtYfwBvnt4vo+RGTxV5gHnjS
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256346416"
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; 
   d="scan'208";a="256346416"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 07:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; 
   d="scan'208";a="714637026"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Mar 2022 07:51:02 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUUzN-000CW2-0E; Wed, 16 Mar 2022 14:51:01 +0000
Date: Wed, 16 Mar 2022 22:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [RFC PATCH 1/3] drm/i915: Creating writeback
 pipeline to bypass drm_writeback framework
Message-ID: <202203162207.xVTqzi0V-lkp@intel.com>
References: <20220316093740.652925-2-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316093740.652925-2-suraj.kandpal@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Suraj,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip v5.17-rc8 next-20220315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Suraj-Kandpal/i915-writeback-private-framework/20220316-174317
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220316/202203162207.xVTqzi0V-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5683a14535c9ba3bfd04906488c10a89e0fedacd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Suraj-Kandpal/i915-writeback-private-framework/20220316-174317
        git checkout 5683a14535c9ba3bfd04906488c10a89e0fedacd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_wb_connector.c:195:29: error: no member named 'job' in 'struct intel_digital_connector_state'
           wb_job = intel_conn_state->job;
                    ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_wb_connector.c:196:20: error: no member named 'job' in 'struct intel_digital_connector_state'
           intel_conn_state->job = NULL;
           ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_wb_connector.c:207:69: error: no member named 'wb_conn' in 'struct intel_connector'
           struct intel_writeback_connector *wb_connector = &intel_connector->wb_conn;
                                                             ~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_wb_connector.c:212:25: error: no member named 'job' in 'struct intel_digital_connector_state'
           if (!intel_conn_state->job) {
                ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_wb_connector.c:213:21: error: no member named 'job' in 'struct intel_digital_connector_state'
                   intel_conn_state->job =
                   ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_wb_connector.c:214:38: error: no member named 'job' in 'struct intel_digital_connector_state'
                           kzalloc(sizeof(*intel_conn_state->job), GFP_KERNEL);
                                           ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_wb_connector.c:215:26: error: no member named 'job' in 'struct intel_digital_connector_state'
                   if (!intel_conn_state->job)
                        ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_wb_connector.c:218:21: error: no member named 'job' in 'struct intel_digital_connector_state'
                   intel_conn_state->job->connector = wb_connector;
                   ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/i915/display/intel_wb_connector.c:221:44: error: no member named 'job' in 'struct intel_digital_connector_state'
           drm_framebuffer_assign(&intel_conn_state->job->fb, fb);
                                   ~~~~~~~~~~~~~~~~  ^
>> drivers/gpu/drm/i915/display/intel_wb_connector.c:236:6: warning: no previous prototype for function 'cleanup_work' [-Wmissing-prototypes]
   void cleanup_work(struct work_struct *work)
        ^
   drivers/gpu/drm/i915/display/intel_wb_connector.c:236:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void cleanup_work(struct work_struct *work)
   ^
   static 
   1 warning and 9 errors generated.


vim +/cleanup_work +236 drivers/gpu/drm/i915/display/intel_wb_connector.c

   202	
   203	int intel_writeback_set_fb(struct drm_connector_state *conn_state,
   204				 struct drm_framebuffer *fb)
   205	{
   206		struct intel_connector *intel_connector = to_intel_connector(conn_state->connector);
   207		struct intel_writeback_connector *wb_connector = &intel_connector->wb_conn;
   208		struct intel_digital_connector_state *intel_conn_state =
   209			to_intel_digital_connector_state(conn_state);
   210		WARN_ON(conn_state->connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK);
   211	
   212		if (!intel_conn_state->job) {
   213			intel_conn_state->job =
   214				kzalloc(sizeof(*intel_conn_state->job), GFP_KERNEL);
 > 215			if (!intel_conn_state->job)
   216				return -ENOMEM;
   217	
   218			intel_conn_state->job->connector = wb_connector;
   219		}
   220	
   221		drm_framebuffer_assign(&intel_conn_state->job->fb, fb);
   222		return 0;
   223	}
   224	
   225	void intel_writeback_cleanup_job(struct intel_writeback_job *job)
   226	{
   227		if (job->fb)
   228			drm_framebuffer_put(job->fb);
   229	
   230		if (job->out_fence)
   231			dma_fence_put(job->out_fence);
   232	
   233		kfree(job);
   234	}
   235	
 > 236	void cleanup_work(struct work_struct *work)
   237	{
   238		struct intel_writeback_job *job = container_of(work,
   239							struct intel_writeback_job,
   240							cleanup_work);
   241	
   242		intel_writeback_cleanup_job(job);
   243	}
   244	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
