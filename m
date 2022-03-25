Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5B17E
	for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648226140; x=1679762140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8u6M+Dp7AiifeVlYkXZK/xg5RToRNGkPuFZ6N1+i/dc=;
  b=T6XrLT0iCz7qH7kL3JKB/T0AF3XnawknCi0vESZExN5XWMioyfyC2XU9
   jeBzo8vTVqRqyO/NSgEKZch/wvewd6rPDR1fCpLX+Q3bC97z4yziEuKBX
   N+Sn+GriAz+L7t8NU3yCjP+eMIGNwwmk6cLBY46VT8IWlxxYM5zLwgChW
   5JVxo2VOhGRAHauWG0EqQAZbK3iXMvS6glEyi5dEXr4eB3gkPLB2UML4r
   LQ0rt5YpVLRM121qSTEsiVgn5cwjt5OO1Ny4WkpZsb/gUh2qRVe6j4Q/J
   2fTnagcJbSe/dAcBYTH87K7zvDoBM5iuFgvktgQYKfQhoJNT1KILltXov
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="239270576"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="239270576"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 09:35:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="520257175"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Mar 2022 09:35:36 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nXmuV-000MNu-P0; Fri, 25 Mar 2022 16:35:35 +0000
Date: Sat, 26 Mar 2022 00:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: Marcello Sylvester Bauer <sylv@sylv.io>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: drivers/hwmon/pmbus/xdpe12284.c:127:36: warning: unused variable
 'xdpe122_reg_desc'
Message-ID: <202203260059.nMMU6fdT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   34af78c4e616c359ed428d79fe4758a35d2c5473
commit: f53bfe4d698430bd602c37042db4021dc2603b8d hwmon: (xdpe12284) Add regulator support
date:   3 weeks ago
config: hexagon-randconfig-r041-20220325 (https://download.01.org/0day-ci/archive/20220326/202203260059.nMMU6fdT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f53bfe4d698430bd602c37042db4021dc2603b8d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f53bfe4d698430bd602c37042db4021dc2603b8d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hwmon/pmbus/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/xdpe12284.c:127:36: warning: unused variable 'xdpe122_reg_desc' [-Wunused-const-variable]
   static const struct regulator_desc xdpe122_reg_desc[] = {
                                      ^
   1 warning generated.


vim +/xdpe122_reg_desc +127 drivers/hwmon/pmbus/xdpe12284.c

   126	
 > 127	static const struct regulator_desc xdpe122_reg_desc[] = {
   128		PMBUS_REGULATOR("vout", 0),
   129		PMBUS_REGULATOR("vout", 1),
   130	};
   131	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
