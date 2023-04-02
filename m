Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7803C2C9E;
	Sun,  2 Apr 2023 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680453193; x=1711989193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nkYnLTnr+MDpSrUK+7YUtmEOZ0nX7zU95A4HbkYN1u0=;
  b=baXYCZhi8SQldQwL/zrSLMQ8Zpom0BeQlbiaHC4HNZGpSaKliZ5DvEn+
   9nyygZc+SRr8tqKl7BeNXf5cdgAo+np+Ze7qfcZzn4Y7eTsuMlAWKzY1A
   43e8YyHimfg67rd81ACvnHxbUoywOWQpumAkOlm2lMbqvdg3iMWtQwdIy
   1qBoHISuPGhy6kkxJe1oQ2Bl3Ji00nlnD4hEX9jjYdYAqb3fUzeAzkZN8
   ZTMmOz8WPOwQrQ9wv54rkKwj5OvuEacXDU7n47Pt9Yi0aH77Fe0loPNtH
   cGvbuKNRgNUJ5fy8lsgAQOEof2u8/Sbq27qZ7h4xm92eid9XlwP1lE/ks
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="341772135"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="341772135"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 09:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="809601353"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="809601353"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Apr 2023 09:33:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pj0dh-000NX3-1n;
	Sun, 02 Apr 2023 16:33:09 +0000
Date: Mon, 3 Apr 2023 00:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Maxim Georgiev <glipus@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC v2] Add NDOs for hardware timestamp get/set
Message-ID: <202304030058.xmknyQtu-lkp@intel.com>
References: <20230402142435.47105-1-glipus@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230402142435.47105-1-glipus@gmail.com>

Hi Maxim,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxim-Georgiev/Add-NDOs-for-hardware-timestamp-get-set/20230402-222504
patch link:    https://lore.kernel.org/r/20230402142435.47105-1-glipus%40gmail.com
patch subject: [PATCH net-next RFC v2] Add NDOs for hardware timestamp get/set
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20230403/202304030058.xmknyQtu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9c768404248f059870f899ce676098d83bacdf18
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxim-Georgiev/Add-NDOs-for-hardware-timestamp-get-set/20230402-222504
        git checkout 9c768404248f059870f899ce676098d83bacdf18
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304030058.xmknyQtu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/net_tstamp.h:94:2: error: unknown type name 'u8'
           u8 dummy;
           ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
