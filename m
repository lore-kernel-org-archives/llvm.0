Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9496E7E
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 12:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654171347; x=1685707347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eLkgYB/MMPFy9A1ktxNwuLS888wI049KX+6VJ0eAgM4=;
  b=fz7o3JS/bcC6wHerDwgDH59GkHzlXdkKcHS+oO1GvwjLaJgjXf+EKPgo
   9lBEjGi5wUKq1GU7zvPrCbHaCkrmuoM6hh764x1JOqCOf5xeMhE8wKNvR
   vVtLpRhLCFxRVtH7j8azyjBTpcEJJ1J4ngV5V7SBkjcB1JyLrJZOZVkUg
   Z+PyJRw+uSVQ378bQSGxAoVyYf6Vt6dbOBU/okfahskpyeZWqO4ro5Dsc
   wS6JsBkoDXq38UrKaJwpNSUcNd9BNPUYm60egBY5pAju+0dqokzWcWGgO
   HJxJintZpaxXZ04VWUG6imW299ER8BJbVGAZdCPhSHulFZKAtbGSTF29P
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="273493729"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="273493729"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 05:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="577482459"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Jun 2022 05:02:25 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwjWy-00052l-8M;
	Thu, 02 Jun 2022 12:02:24 +0000
Date: Thu, 2 Jun 2022 20:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 7/7] f2fs: Enable negative dentries on
 case-insensitive lookup
Message-ID: <202206021922.7RNcPLYm-lkp@intel.com>
References: <20220601204437.676872-8-krisman@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601204437.676872-8-krisman@collabora.com>

Hi Gabriel,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on jaegeuk-f2fs/dev-test linus/master v5.18 next-20220602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bertazi/Support-negative-dentries-on-case-insensitive-directories/20220602-045701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220602/202206021922.7RNcPLYm-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6e60d02c0ee76dca4dced43a6de6f622d48181b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gabriel-Krisman-Bertazi/Support-negative-dentries-on-case-insensitive-directories/20220602-045701
        git checkout 6e60d02c0ee76dca4dced43a6de6f622d48181b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "d_set_casefold_lookup" [fs/f2fs/f2fs.ko] undefined!
ERROR: modpost: "d_set_casefold_lookup" [fs/ext4/ext4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
