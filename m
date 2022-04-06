Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA17E33EA
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649273104; x=1680809104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cIm8qSlHUF8CXPEOlt0+3ZqAL8J3/3EDQ8gWoYdF/DE=;
  b=MrwLCxp5qOQFT506QG+VuAgh8HTJL1H24XWrUNRebGGRBrm9yKS8fhG3
   mdj5mGNNwQintgOCqKqLGQb7ZxIbUAhNyZ0xyxtUhGm/xz0VtmsnBvQJm
   2N91q9yJU3pvhZsS33H7RGEx4FgzAYBvN5jkqFhwrgsL29Bj3dasFstyZ
   6ccvj6NisXtxHn9pFok+4j9rFK0vIpGJPcvf+pv5aCN+kAw+AhRIJrTag
   jPc9M0NMdzm/iHcSqS+ZBDj+eQIHOne1H3tfZdOpXNzImQUgXRIrucAj9
   wlfwS3CkQb5s3NAljYdWp/JAaf8yPlAR7HPsKw4RL9iiOhP9/yEAj6aWd
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="248660795"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="248660795"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 12:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="722647825"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Apr 2022 12:24:30 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncBGX-0004gD-Du;
	Wed, 06 Apr 2022 19:24:29 +0000
Date: Thu, 7 Apr 2022 03:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v5 4/4] device property: Constify fwnode APIs that uses
 fwnode_get_next_parent()
Message-ID: <202204070325.jqK23CqC-lkp@intel.com>
References: <20220406130552.30930-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406130552.30930-4-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on rafael-pm/linux-next linus/master linux/master v5.18-rc1 next-20220406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/device-property-Allow-error-pointer-to-be-passed-to-fwnode-APIs/20220407-002511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git 3123109284176b1532874591f7c81f3837bbdc17
config: hexagon-randconfig-r032-20220406 (https://download.01.org/0day-ci/archive/20220407/202204070325.jqK23CqC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d9d353ada8d8c3b1b7f3965ad7fe191bd7dea930
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/device-property-Allow-error-pointer-to-be-passed-to-fwnode-APIs/20220407-002511
        git checkout d9d353ada8d8c3b1b7f3965ad7fe191bd7dea930
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/base/property.c:647:28: error: passing 'const struct fwnode_handle *' to parameter of type 'struct fwnode_handle *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   return fwnode_handle_get(fwnode);
                                            ^~~~~~
   include/linux/property.h:123:63: note: passing argument to parameter 'fwnode' here
   struct fwnode_handle *fwnode_handle_get(struct fwnode_handle *fwnode);
                                                                 ^
   1 error generated.


vim +647 drivers/base/property.c

87e5e95db31a27d Sakari Ailus    2019-10-03  629  
87e5e95db31a27d Sakari Ailus    2019-10-03  630  /**
87e5e95db31a27d Sakari Ailus    2019-10-03  631   * fwnode_get_nth_parent - Return an nth parent of a node
87e5e95db31a27d Sakari Ailus    2019-10-03  632   * @fwnode: The node the parent of which is requested
87e5e95db31a27d Sakari Ailus    2019-10-03  633   * @depth: Distance of the parent from the node
87e5e95db31a27d Sakari Ailus    2019-10-03  634   *
87e5e95db31a27d Sakari Ailus    2019-10-03  635   * Returns the nth parent of a node. If there is no parent at the requested
87e5e95db31a27d Sakari Ailus    2019-10-03  636   * @depth, %NULL is returned. If @depth is 0, the functionality is equivalent to
87e5e95db31a27d Sakari Ailus    2019-10-03  637   * fwnode_handle_get(). For @depth == 1, it is fwnode_get_parent() and so on.
87e5e95db31a27d Sakari Ailus    2019-10-03  638   *
87e5e95db31a27d Sakari Ailus    2019-10-03  639   * The caller is responsible for calling fwnode_handle_put() for the returned
87e5e95db31a27d Sakari Ailus    2019-10-03  640   * node.
87e5e95db31a27d Sakari Ailus    2019-10-03  641   */
d9d353ada8d8c3b Andy Shevchenko 2022-04-06  642  struct fwnode_handle *fwnode_get_nth_parent(const struct fwnode_handle *fwnode, unsigned int depth)
87e5e95db31a27d Sakari Ailus    2019-10-03  643  {
040f806ecab6cd6 Andy Shevchenko 2022-04-06  644  	struct fwnode_handle *parent;
87e5e95db31a27d Sakari Ailus    2019-10-03  645  
040f806ecab6cd6 Andy Shevchenko 2022-04-06  646  	if (depth == 0)
040f806ecab6cd6 Andy Shevchenko 2022-04-06 @647  		return fwnode_handle_get(fwnode);
87e5e95db31a27d Sakari Ailus    2019-10-03  648  
040f806ecab6cd6 Andy Shevchenko 2022-04-06  649  	fwnode_for_each_parent_node(fwnode, parent) {
040f806ecab6cd6 Andy Shevchenko 2022-04-06  650  		if (--depth == 0)
040f806ecab6cd6 Andy Shevchenko 2022-04-06  651  			return parent;
040f806ecab6cd6 Andy Shevchenko 2022-04-06  652  	}
040f806ecab6cd6 Andy Shevchenko 2022-04-06  653  	return NULL;
87e5e95db31a27d Sakari Ailus    2019-10-03  654  }
87e5e95db31a27d Sakari Ailus    2019-10-03  655  EXPORT_SYMBOL_GPL(fwnode_get_nth_parent);
87e5e95db31a27d Sakari Ailus    2019-10-03  656  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
