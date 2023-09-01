Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEBE8F5F;
	Fri,  1 Sep 2023 16:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693584590; x=1725120590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xUGO65F/KEp2EO+wOMe+9W6a1PbQd5YQGPJqO85cEfQ=;
  b=gEcgVal9/+OAEyqixtsIGxk+hVchsKj+nk3UB0lCDwlXdMUGaF6eEREs
   i8tLMPQeanzKrZ+Xv/JRR00Jolp7CRb0adTyd+mKADfGCGZHqJ3xccKUh
   jBMlZxz6av/eFqEK8obvFdHzdBRr0adZ2O3RIPRXF7a8oi2K/hXVvmeVo
   iMZs90Rv8iEL//mMbFkRJQy00XpN3fnbraaJf0gKMgIyeYgEI4vKDkCHu
   nDNno7V2rhGPUq5bwcRIDJY8HvVvZUSFl91tMmWNYuUldahGNPxjeJkvX
   3zLRXqKJAtf6jjNfiQVqBm5WWrhQ1YamsWVAL6SuscEcZU+8N3RrN9nKA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375155497"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="375155497"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 09:09:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733567052"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="733567052"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Sep 2023 09:09:45 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc6iN-0001RX-1s;
	Fri, 01 Sep 2023 16:09:43 +0000
Date: Sat, 2 Sep 2023 00:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch to
 drm_do_get_edid()
Message-ID: <202309020015.A2hvv45r-lkp@intel.com>
References: <20230901102400.552254-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901102400.552254-1-jani.nikula@intel.com>

Hi Jani,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5 next-20230831]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-bridge-megachips-stdpxxxx-ge-b850v3-fw-switch-to-drm_do_get_edid/20230901-182521
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230901102400.552254-1-jani.nikula%40intel.com
patch subject: [RFC] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch to drm_do_get_edid()
config: x86_64-randconfig-072-20230901 (https://download.01.org/0day-ci/archive/20230902/202309020015.A2hvv45r-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020015.A2hvv45r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020015.A2hvv45r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c:101:65: error: too many arguments to function call, expected 3, have 4
           return drm_do_get_edid(connector, stdp2690_read_block, client, NULL);
                  ~~~~~~~~~~~~~~~                                         ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   include/drm/drm_edid.h:568:14: note: 'drm_do_get_edid' declared here
   struct edid *drm_do_get_edid(struct drm_connector *connector,
                ^
   1 error generated.


vim +101 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c

    93	
    94	static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
    95						    struct drm_connector *connector)
    96	{
    97		struct i2c_client *client;
    98	
    99		client = ge_b850v3_lvds_ptr->stdp2690_i2c;
   100	
 > 101		return drm_do_get_edid(connector, stdp2690_read_block, client, NULL);
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
