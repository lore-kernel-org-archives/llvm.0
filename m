Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A758FBE71;
	Thu, 29 Jun 2023 10:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688033303; x=1719569303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cJnfwKoeppgJFPc6BnrVb0UuqQEB9zcBMz/ejH3fh+I=;
  b=leUu+7VkJSEeVBBGN79CFgUcSHTZnS8olpG7zdSpMkE6Cl2m4gh8ZEOB
   dQCdwPYeixqKgfCwPRcNB6nn2mP8AWS3aD/qberBr+nPls/L/r+NbXtvR
   tmWr/H3VLfMZ5dSEUpqaMRcCZW7t65PWTa/Q1ayUkv2vev3NoiTYhbZGQ
   UwI+cA350rh/ckcz9CJrhtAWzOC9ilUH/KMsuGG7UXy3UZm68rcu7zjfA
   7Lp5Dqt4PaJ4TReVenLdx5yQke6V6sm58jZjN6SLXigZ4h6lv809hMRvr
   8ZhdrJuVkpeT0ku022XjkCiWV//qojLrPg3d02xJwV5T+gKSQcQZTgGN+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="448450999"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="448450999"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 03:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963934184"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="963934184"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jun 2023 03:08:21 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEoZZ-000E2t-0G;
	Thu, 29 Jun 2023 10:08:21 +0000
Date: Thu, 29 Jun 2023 18:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] media: i2c: Select V4L2_FWNODE and
 VIDEO_V4L2_SUBDEV_API for sensors
Message-ID: <202306291843.tI7Gg9WV-lkp@intel.com>
References: <20230629081116.919253-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629081116.919253-1-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on sailus-media-tree/streams linus/master v6.4 next-20230629]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-i2c-Select-V4L2_FWNODE-and-VIDEO_V4L2_SUBDEV_API-for-sensors/20230629-162047
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230629081116.919253-1-sakari.ailus%40linux.intel.com
patch subject: [PATCH 1/1] media: i2c: Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for sensors
config: hexagon-randconfig-r045-20230629 (attached as .config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306291843.tI7Gg9WV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306291843.tI7Gg9WV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/Kconfig:28:error: recursive dependency detected!
   drivers/media/i2c/Kconfig:28:	symbol VIDEO_CAMERA_SENSOR depends on MEDIA_CONTROLLER
   drivers/media/Kconfig:170:	symbol MEDIA_CONTROLLER is selected by VIDEO_AR0521
   drivers/media/i2c/Kconfig:44:	symbol VIDEO_AR0521 depends on VIDEO_CAMERA_SENSOR
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +28 drivers/media/i2c/Kconfig

    27	
  > 28	menuconfig VIDEO_CAMERA_SENSOR
    29		bool "Camera sensor devices"
    30		depends on MEDIA_CAMERA_SUPPORT
    31		depends on MEDIA_CONTROLLER
    32		select V4L2_FWNODE
    33		select VIDEO_V4L2_SUBDEV_API
    34		default y
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
