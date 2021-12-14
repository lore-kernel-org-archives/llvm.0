Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0AE29CA
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639488191; x=1671024191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LKrwMhGoPn7PRY1bnp4+B7llSmchc/0l6V+DXNRfwe0=;
  b=c/UKSmGO0IkSlJKNaVwsFQvXIhFXfRnWIvqCvXGzLtwxZlw6DYlKZ39O
   B5S9Q5jjoIpUF1tTomP3zGHNeGmIrY3Nx6Yk9lNShc/H/1ad6Pz0ZobXn
   LehFsN+4uIPJfoCpzg73tswF8kVTbbbBil+f4DjBzKO/i0C2OAPvuUXcF
   F+z4i/5dbMYXQ06amP3DAFqxMfCjLH49HHCUXwMRixdzBEXrziBb1/YI3
   c55lN07fMFwjYJs2xlaEzKjeIeOrEVpZeZSffCsV5LDgYjqP0y5xurcq8
   Hu/OJYtzQ4xouOEoCPHRhp0dmiCvon3okvrMAxduSq8kqtoJVLxoAWSed
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219659174"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="219659174"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 05:23:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="614263200"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Dec 2021 05:23:09 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mx7ls-0000Lz-RU; Tue, 14 Dec 2021 13:23:08 +0000
Date: Tue, 14 Dec 2021 21:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 17/17] fortify: Work around Clang inlining bugs
Message-ID: <202112142158.n5ChiotI-lkp@intel.com>
References: <20211213223331.135412-18-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213223331.135412-18-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Kees,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.16-rc5]
[cannot apply to rdma/for-next axboe-block/for-next kvm/queue tip/x86/core mkp-scsi/for-next jejb-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kees-Cook/Enable-strict-compile-time-memcpy-fortify-checks/20211214-064002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git aa50faff4416c869b52dff68a937c84d29e12f4b
config: i386-randconfig-r003-20211213 (https://download.01.org/0day-ci/archive/20211214/202112142158.n5ChiotI-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e5d600e1abbdd2034dbc844654957a4ec1182dbf
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kees-Cook/Enable-strict-compile-time-memcpy-fortify-checks/20211214-064002
        git checkout e5d600e1abbdd2034dbc844654957a4ec1182dbf
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> warning: unsafe strlcpy() usage lacked '__write_overflow' symbol in lib/test_fortify/write_overflow-strlcpy.c
--
>> warning: unsafe strlcpy() usage lacked '__write_overflow' symbol in lib/test_fortify/write_overflow-strlcpy-src.c
--
>> warning: unsafe strcpy() usage lacked '__write_overflow' symbol in lib/test_fortify/write_overflow-strcpy-lit.c
--
>> warning: unsafe strcpy() usage lacked '__write_overflow' symbol in lib/test_fortify/write_overflow-strcpy.c

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
