Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742801878;
	Sat, 10 Jun 2023 03:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686369434; x=1717905434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2oeOC2Xsc2uJbBkIETMCjhpnpofAbFchTB2AYjgmy4k=;
  b=Ugtr2v+7JXewAQynz7Yv1Xo6D1UMyZ7FxX0kI8xnDtTTQKWmLTsMDyDv
   c8OgPkj/AgUE5OZZ8DPIZ/FPiiIFJvjbX8e4zpShqVC1oIOUeufXj0MyK
   V3VXfzzI/g6McoJUiIk1InHkH+YFs794/Y6XLIOoBhQlql0xc/eqoZrzz
   bvF+lAOqS0B3CvTYwcz8GTnxEIfD1eXafW3K7x0omAXKDSVhxwFVABiZO
   1nKhMMBQncQ0LaTaEXE+H+8V+sRnVIaMFezCYdtHFAN7vFCPfqpQ8XYkj
   bOQ+U9Obsnk7ArZ/WajuthAhQeI2uItjwQhPzv3SwfvOjn1+1QGM1wiu6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="423606782"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="423606782"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 20:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="743697568"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="743697568"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Jun 2023 20:57:10 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7piv-0009gF-04;
	Sat, 10 Jun 2023 03:57:09 +0000
Date: Sat, 10 Jun 2023 11:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rae Moar <rmoar@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 3/6] kunit: Add ability to filter attributes
Message-ID: <202306101114.XVXocTvA-lkp@intel.com>
References: <20230610005149.1145665-4-rmoar@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610005149.1145665-4-rmoar@google.com>

Hi Rae,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on fefdb43943c1a0d87e1b43ae4d03e5f9a1d058f4]

url:    https://github.com/intel-lab-lkp/linux/commits/Rae-Moar/kunit-Add-test-attributes-API-structure/20230610-085313
base:   fefdb43943c1a0d87e1b43ae4d03e5f9a1d058f4
patch link:    https://lore.kernel.org/r/20230610005149.1145665-4-rmoar%40google.com
patch subject: [RFC v1 3/6] kunit: Add ability to filter attributes
config: hexagon-randconfig-r003-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101114.XVXocTvA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout fefdb43943c1a0d87e1b43ae4d03e5f9a1d058f4
        b4 shazam https://lore.kernel.org/r/20230610005149.1145665-4-rmoar@google.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash lib/kunit/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101114.XVXocTvA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/attributes.c:80:14: warning: variable 'input_val' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
      80 |         for (i = 0; input[i]; i++) {
         |                     ^~~~~~~~
   lib/kunit/attributes.c:87:7: note: uninitialized use occurs here
      87 |         if (!input_val) {
         |              ^~~~~~~~~
   lib/kunit/attributes.c:80:14: note: remove the condition if it is always true
      80 |         for (i = 0; input[i]; i++) {
         |                     ^~~~~~~~
   lib/kunit/attributes.c:78:23: note: initialize the variable 'input_val' to silence this warning
      78 |         const char *input_val;
         |                              ^
         |                               = NULL
   lib/kunit/attributes.c:137:48: error: initializer element is not a compile-time constant
     137 | static struct kunit_attr kunit_attr_list[1] = {speed_attr};
         |                                                ^~~~~~~~~~
   1 warning and 1 error generated.


vim +80 lib/kunit/attributes.c

    72	
    73	static int attr_enum_filter(void *attr, const char *input, int *err,
    74			const char * const str_list[], int max)
    75	{
    76		int i, j, input_int;
    77		long test_val = (long)attr;
    78		const char *input_val;
    79	
  > 80		for (i = 0; input[i]; i++) {
    81			if (!strchr("<!=>", input[i])) {
    82				input_val = input + i;
    83				break;
    84			}
    85		}
    86	
    87		if (!input_val) {
    88			*err = -EINVAL;
    89			pr_err("kunit executor: filter operation not found: %s\n", input);
    90			return false;
    91		}
    92	
    93		for (j = 0; j <= max; j++) {
    94			if (!strcmp(input_val, str_list[j]))
    95				input_int = j;
    96		}
    97	
    98		if (!input_int) {
    99			*err = -EINVAL;
   100			pr_err("kunit executor: invalid filter input: %s\n", input);
   101			return false;
   102		}
   103	
   104		return int_filter(test_val, input, input_int, err);
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
