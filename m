Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBE9A945;
	Sat,  2 Sep 2023 19:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693683811; x=1725219811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IgB99TdG2SuuozKrExqAgnya1Q+atmqx+F/TA2WJ42A=;
  b=QAM2Oe/Cvb5VvOu5dHAbGVaHnUbdRfATQhLtw7eu/dd8ToRaB6k3uC2c
   VRRlOrjsbzig+GkXqrZ5J6EEMvLZwcKJPTQ2CAkV2MNa54CaySfJp1rgb
   +EM6LnkQFanMKJRBarsGX6uflo2maQpsKdI1Ee0LKz6O0KHSZvXXoK+Fc
   qDTsipl32EM2EvAodHUo6lhnmAUwkN5thqo6Ytw/0K/IGMAULKavineLD
   A8NUmWo1GUo36rBI+aOtAZsXZCbYDVgD0l6l65MSYKzTeQPy1qLsK3EKn
   8HBsNaUFu3+sEaxKjobc4rCAmRsvQaBRKOMocGdfVIVckFUIijPpD/tAb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="462762156"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="462762156"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 12:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="863909204"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="863909204"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Sep 2023 12:43:28 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcWWk-0002Yu-1Q;
	Sat, 02 Sep 2023 19:43:26 +0000
Date: Sun, 3 Sep 2023 03:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [drm-misc:drm-misc-next 3/3] drivers/gpu/drm/tegra/dc.c:1757:59:
 error: too many arguments to function call, expected 3, have 4
Message-ID: <202309030330.vlG5kwoZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   38df905b642688c1bd4ea7c644f6852a00ab38c6
commit: 8e455145d8f163aefa6b9cc29478e0a9f82276e6 [3/3] drm/debugfs: rework drm_debugfs_create_files implementation v2
config: i386-buildonly-randconfig-004-20230903 (https://download.01.org/0day-ci/archive/20230903/202309030330.vlG5kwoZ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309030330.vlG5kwoZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030330.vlG5kwoZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tegra/dc.c:1757:59: error: too many arguments to function call, expected 3, have 4
           drm_debugfs_remove_files(dc->debugfs_files, count, root, minor);
           ~~~~~~~~~~~~~~~~~~~~~~~~                                 ^~~~~
   include/drm/drm_debugfs.h:162:19: note: 'drm_debugfs_remove_files' declared here
   static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
                     ^
   1 error generated.
--
>> drivers/gpu/drm/tegra/hdmi.c:1120:32: error: too many arguments to function call, expected 3, have 4
                                    connector->debugfs_entry, minor);
                                                              ^~~~~
   include/drm/drm_debugfs.h:162:19: note: 'drm_debugfs_remove_files' declared here
   static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
                     ^
   1 error generated.
--
>> drivers/gpu/drm/tegra/dsi.c:260:6: error: too many arguments to function call, expected 3, have 4
                                    connector->dev->primary);
                                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_debugfs.h:162:19: note: 'drm_debugfs_remove_files' declared here
   static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
                     ^
   1 error generated.
--
>> drivers/gpu/drm/tegra/sor.c:1712:6: error: too many arguments to function call, expected 3, have 4
                                    connector->dev->primary);
                                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_debugfs.h:162:19: note: 'drm_debugfs_remove_files' declared here
   static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
                     ^
   1 error generated.


vim +1757 drivers/gpu/drm/tegra/dc.c

  1756	
> 1757		drm_debugfs_remove_files(dc->debugfs_files, count, root, minor);
  1758		kfree(dc->debugfs_files);
  1759		dc->debugfs_files = NULL;
  1760	}
  1761	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
