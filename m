Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEBA168
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643216429; x=1674752429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z1F9uBxvghpbijIqaxr94f86rMBz/0lxTVva51RHX5I=;
  b=dl3fR6laXRSmVXgIoRJg7YQ8w/9ZswptPiLBQqkO/lrcipkVagOxvF8O
   9j2iEijt+nhGeZaUber5TJ1NAKpEOFWraI1fD1u3GV63P92ValqwTgkgC
   9lNoijcU5P8MiVHWIroG65IjNnrx+pMv+k4bYHzVbSGHHv0hCrQR3r1Mt
   Op0wnBcYFGlU69Ixsn82eWwoKHDX726wsqlvYYTPQfGAMqKxfjvxHOMRY
   ByqE2XTytriAZHBCyzRiTUJXtXt4bGhiJNkIcIsFefLeqrioHJ2QGTiu/
   6QL3e+GTyA7hSlcfz9ZO4wkryEkvXnjdhTmFfg7s5lQTk7GDEJ48tNOQ0
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244195154"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="244195154"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 09:00:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="696298959"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jan 2022 09:00:03 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCleM-000LPi-Dt; Wed, 26 Jan 2022 17:00:02 +0000
Date: Thu, 27 Jan 2022 00:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Maciej W. Rozycki" <macro@embecosm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3] tty: Partially revert the removal of the Cyclades
 public API
Message-ID: <202201270027.EK50hAls-lkp@intel.com>
References: <alpine.DEB.2.20.2201260733430.11348@tpp.orcam.me.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.2201260733430.11348@tpp.orcam.me.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Maciej,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on linus/master v5.17-rc1 next-20220125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maciej-W-Rozycki/tty-Partially-revert-the-removal-of-the-Cyclades-public-API/20220126-172520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220127/202201270027.EK50hAls-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c9e707e313f471adbe057300f4fb163113cf062c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maciej-W-Rozycki/tty-Partially-revert-the-removal-of-the-Cyclades-public-API/20220126-172520
        git checkout c9e707e313f471adbe057300f4fb163113cf062c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/cyclades.h:6:2: warning: "Support for features provided by this header has been removed" [-W#warnings]
   #warning "Support for features provided by this header has been removed"
    ^
>> ./usr/include/linux/cyclades.h:7:2: warning: "Please consider updating your code" [-W#warnings]
   #warning "Please consider updating your code"
    ^
   2 warnings generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
