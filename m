Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534BA7B
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 15:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651072922; x=1682608922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LZHA7S4vK3tGEc9SdiCQ18DzBapdoZ52KjvqvOsWcIc=;
  b=MiVMgR/sg4k4W/6vD3QJT8NLPsFXm7YcheXdQ6gLAvnZNZ3Yl4BT4cm5
   9PlTQXg5GFpCQnFzghmUvnS1d53zySjglZn71V83laG4h0lFbVyZSNJqP
   aTQIvqi9b6Jbhhi8/6PgIdfPVSlVIrK9HVRCLQYkaQBCWnq20g6z/d4mp
   SM+wF35lQxosQrrj/s1huW5KPfBTsyiFQopiNqo19vBA0g5FcLhs6DhNU
   g/CDCJRsJsq57sxdPJgyE2bcSP2yU1sqcQgJkMSKJGOweo0dcYYq781LH
   2MQmGDRm6dPyl9qnG83YHKjL7KRLKYs9kuN3ZxPIcDp0MlRkmGmN0+qqC
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="352394839"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; 
   d="scan'208";a="352394839"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 08:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; 
   d="scan'208";a="730839552"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2022 08:06:33 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njjFQ-0004ju-FU;
	Wed, 27 Apr 2022 15:06:32 +0000
Date: Wed, 27 Apr 2022 23:05:35 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Roesch <shr@fb.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v1 10/18] xfs: Enable async write file modification
 handling.
Message-ID: <202204272220.eh9McLtZ-lkp@intel.com>
References: <20220426174335.4004987-11-shr@fb.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426174335.4004987-11-shr@fb.com>

Hi Stefan,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on af2d861d4cd2a4da5137f795ee3509e6f944a25b]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Roesch/io-uring-xfs-support-async-buffered-writes/20220427-014610
base:   af2d861d4cd2a4da5137f795ee3509e6f944a25b
config: i386-randconfig-a006-20220425 (https://download.01.org/0day-ci/archive/20220427/202204272220.eh9McLtZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/322e4a99c7828050895c8af8e49ac61cd6f7e0ea
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stefan-Roesch/io-uring-xfs-support-async-buffered-writes/20220427-014610
        git checkout 322e4a99c7828050895c8af8e49ac61cd6f7e0ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "do_file_update_time" [fs/xfs/xfs.ko] undefined!
>> ERROR: modpost: "need_file_update_time" [fs/xfs/xfs.ko] undefined!
>> ERROR: modpost: "do_file_remove_privs" [fs/xfs/xfs.ko] undefined!
>> ERROR: modpost: "need_file_remove_privs" [fs/xfs/xfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
