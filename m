Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F182C9D
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 13:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641388543; x=1672924543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tf3VjKdx5lZUJulujJQfWa3C1zHWAeUFsoR64Ph5AAA=;
  b=CXU2weIM/YIkPdPzYH2HwHwVc0zDR7fxvxPP81AFdV8jbDQvsYMhaDiI
   55tN6DtFwQi665KsZA4Qtp25jDOSeeNVZlETx9YdzNJSiAeweuqULm9F8
   7aHdO3D36yU4jFXf9O/WblSZr7WjqkAJagFzyoIoa8CLqJwwE5qbOz1UP
   K0Fs2lIm9MfXx/LBNU9120u3JRaSAQVJvj6eBNFNBxW0MaVpq4NZ/8FLw
   7lfnyu3a7CU4idEVerxev/7hEwYUcVvZJ6uGspxrU+XRbsLNOfABrQ+xF
   P06fbleIIWQxkhUzWYBqUNVfCG+uek/l52+6Moz3hFWUfXZ9TFtWARLvs
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="229251233"
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; 
   d="scan'208";a="229251233"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 05:15:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="488563397"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Jan 2022 05:15:41 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n568i-000Geh-Tz; Wed, 05 Jan 2022 13:15:40 +0000
Date: Wed, 5 Jan 2022 21:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: drivers/remoteproc/remoteproc_debugfs.c:395:10: warning:
 incompatible integer to pointer conversion returning 'long' from a function
 with result type 'struct dentry *'
Message-ID: <202201052108.jYZEx2yr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20220105-144328/Miaoqian-Lin/remoteproc-Fix-NULL-vs-IS_ERR-checking-in-rproc_create_trace_file/20211227-170725
head:   e2c26738760efa9568ce3fef6180fb4311e28d08
commit: e2c26738760efa9568ce3fef6180fb4311e28d08 remoteproc: Fix NULL vs IS_ERR() checking in rproc_create_trace_file
date:   6 hours ago
config: i386-randconfig-a016-20220105 (https://download.01.org/0day-ci/archive/20220105/202201052108.jYZEx2yr-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e2c26738760efa9568ce3fef6180fb4311e28d08
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review UPDATE-20220105-144328/Miaoqian-Lin/remoteproc-Fix-NULL-vs-IS_ERR-checking-in-rproc_create_trace_file/20211227-170725
        git checkout e2c26738760efa9568ce3fef6180fb4311e28d08
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/remoteproc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/remoteproc_debugfs.c:395:10: warning: incompatible integer to pointer conversion returning 'long' from a function with result type 'struct dentry *' [-Wint-conversion]
                   return PTR_ERR(tfile);
                          ^~~~~~~~~~~~~~
   1 warning generated.


vim +395 drivers/remoteproc/remoteproc_debugfs.c

   385	
   386	struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
   387					       struct rproc_debug_trace *trace)
   388	{
   389		struct dentry *tfile;
   390	
   391		tfile = debugfs_create_file(name, 0400, rproc->dbg_dir, trace,
   392					    &trace_rproc_ops);
   393		if (IS_ERR(tfile)) {
   394			dev_err(&rproc->dev, "failed to create debugfs trace entry\n");
 > 395			return PTR_ERR(tfile);
   396		}
   397	
   398		return tfile;
   399	}
   400	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
