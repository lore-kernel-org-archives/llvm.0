Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BEDC2CB;
	Thu, 27 Apr 2023 19:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682623544; x=1714159544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hsETfvRRCT/qQ1dm1hVNMwYqK5ebhpqNjwpqtmUMPrQ=;
  b=e+BghhBl8gFt0Cgcn4mfpNOYJn4KJmIKD1cXqQrRXWdlUZNT+clwCrIL
   MQfdUtbf7Y/7flyHu1SS9qmi0TUzFEirxnadls6F6eT3OWzGLoIrX8okM
   s1jGIFRwVRu4gMtX49tuX/lpglI/YIDDt1frar9bqzSlCWJAB7DH/67XQ
   wocFbQPW4pxlrkCYkoAGRmyqzAnFqtfHo4/IqwjbGoSVqSu47/diZ6LKx
   8PDycG2ho56efAIdbKLTJlDuyIfXRG+cYLvsK4JrTknCE7c1ICFgJyb05
   CgHlx+BVUimKsyEY4C/8IAPEt8NYdUSbUcIyrngp4JLTlAiWvE8AstBcP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="347567012"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="347567012"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 12:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="763963995"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="763963995"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2023 12:25:24 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps7F6-00004v-0o;
	Thu, 27 Apr 2023 19:25:24 +0000
Date: Fri, 28 Apr 2023 03:24:48 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 55/57] drivers/regulator/max8660.c:502:21:
 error: use of undeclared identifier 'max8660_dt_ids'; did you mean
 'max8660_id'?
Message-ID: <202304280341.iexmDsfI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   d03f4bcb40575c1caf4deb8072eb2f9486e51b25
commit: a581a78403b6af4ee0aa9c6ee6701e92dc2555f6 [55/57] Use of_device_get_match_data
config: s390-buildonly-randconfig-r001-20230427 (https://download.01.org/0day-ci/archive/20230428/202304280341.iexmDsfI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=a581a78403b6af4ee0aa9c6ee6701e92dc2555f6
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout a581a78403b6af4ee0aa9c6ee6701e92dc2555f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/regulator/ lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280341.iexmDsfI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/max8660.c:502:21: error: use of undeclared identifier 'max8660_dt_ids'; did you mean 'max8660_id'?
                   .of_match_table = max8660_dt_ids,
                                     ^~~~~~~~~~~~~~
                                     max8660_id
   drivers/regulator/max8660.c:491:35: note: 'max8660_id' declared here
   static const struct i2c_device_id max8660_id[] = {
                                     ^
>> drivers/regulator/max8660.c:502:21: error: incompatible pointer types initializing 'const struct of_device_id *' with an expression of type 'const struct i2c_device_id[3]' [-Werror,-Wincompatible-pointer-types]
                   .of_match_table = max8660_dt_ids,
                                     ^~~~~~~~~~~~~~
   2 errors generated.


vim +502 drivers/regulator/max8660.c

   497	
   498	static struct i2c_driver max8660_driver = {
   499		.probe_new = max8660_probe,
   500		.driver		= {
   501			.name	= "max8660",
 > 502			.of_match_table = max8660_dt_ids,
   503		},
   504		.id_table	= max8660_id,
   505	};
   506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
