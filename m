Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A523C9;
	Sat, 10 Jun 2023 03:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686366849; x=1717902849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=22wlGtvnkcZQ6jlJ5SN7zk2MGQjexWL5yrO+Q2cWQws=;
  b=Kf2Uu8ipTlfJkPv9e5CduuZ7Ic4r+xQOCbUbW65a4BcjEoivzvi1whqL
   e3qzV01wdym0nC19qEomzTtf7cUVbPlL3g7Tv1OrVQPc5O+My6tXdFwmS
   pSzivEpvJ9HUnokhECzCBKKToW3vD4k1tqbAezBIxDI+c2S7ZVQA3J3VU
   ruYpuUUX/PSzBv+JB1TCjQ3tjSVcOM5YkCbFmWPv8mF/edQJOFhN4IMjf
   kdCKmXQkzEp0dQvvTlya954cyze3plh7jG6KXgbVxlUb/oMNKnUjI/f6n
   0L78aB/amECdDYz0ODbIdBkUdBG59gujDIEaQFh8SplyxCWadiCbDfTp0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="423604544"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="423604544"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 20:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="780525407"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="780525407"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jun 2023 20:14:07 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7p3G-0009dv-31;
	Sat, 10 Jun 2023 03:14:06 +0000
Date: Sat, 10 Jun 2023 11:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Rae Moar <rmoar@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 2/6] kunit: Add speed attribute
Message-ID: <202306101026.UqIse3j5-lkp@intel.com>
References: <20230610005149.1145665-3-rmoar@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610005149.1145665-3-rmoar@google.com>

Hi Rae,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on fefdb43943c1a0d87e1b43ae4d03e5f9a1d058f4]

url:    https://github.com/intel-lab-lkp/linux/commits/Rae-Moar/kunit-Add-test-attributes-API-structure/20230610-085313
base:   fefdb43943c1a0d87e1b43ae4d03e5f9a1d058f4
patch link:    https://lore.kernel.org/r/20230610005149.1145665-3-rmoar%40google.com
patch subject: [RFC v1 2/6] kunit: Add speed attribute
config: hexagon-randconfig-r003-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101026.UqIse3j5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout fefdb43943c1a0d87e1b43ae4d03e5f9a1d058f4
        b4 shazam https://lore.kernel.org/r/20230610005149.1145665-3-rmoar@google.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash lib/kunit/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101026.UqIse3j5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/kunit/attributes.c:76:48: error: initializer element is not a compile-time constant
      76 | static struct kunit_attr kunit_attr_list[1] = {speed_attr};
         |                                                ^~~~~~~~~~
   1 error generated.


vim +76 lib/kunit/attributes.c

    75	
  > 76	static struct kunit_attr kunit_attr_list[1] = {speed_attr};
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
