Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D41C36B
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 04:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651034258; x=1682570258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4bNaPQotuUhEyXc6F8ltsp1i18SjSsdYkM/iLl3j398=;
  b=ACYlnJR5ezi7q0Em3m16xm4RoZ6vyoI8laQWIx0jqFj4VC3K2pnV14YU
   0Owq6GOQnj8iqJXSvg/UotKuli8NzuUCjstvW8RAz/Ouc1IJ+g6kAZqhY
   5i1VeYlwDXU2Njrt3wemwy7IXGIt0QEsuWnqL2lAVk8fYpsJ8QK3i2y5h
   0Jz3FHTH/LVYTzg9KdpnUisbx93MFTP+5a6/cDtSzbgUZMQgCOFBVlq2y
   GR1d42mEI7pwxY0suX/DBbkf+tIgHIU11IiytN+0dKZFQs7QEEjNtKEcs
   UbtfbAly9Tet9f4h71VGlvcDBbt8p9369LlCEXGgXmLw1aoC4AdFnLQO1
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="263400751"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="263400751"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 21:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="513496144"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Apr 2022 21:37:24 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njZQZ-0004KW-Il;
	Wed, 27 Apr 2022 04:37:23 +0000
Date: Wed, 27 Apr 2022 12:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Potapenko <glider@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 04/46] instrumented.h: allow instrumenting both sides
 of copy_from_user()
Message-ID: <202204271215.wfSd4UMp-lkp@intel.com>
References: <20220426164315.625149-5-glider@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426164315.625149-5-glider@google.com>

Hi Alexander,

I love your patch! Yet something to improve:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/x86/mm linus/master v5.18-rc4 next-20220426]
[cannot apply to hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Potapenko/Add-KernelMemorySanitizer-infrastructure/20220427-004851
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 203d8919a9eda5d1bc68ac3cd7637588334c9dc1
config: s390-randconfig-r034-20220425 (https://download.01.org/0day-ci/archive/20220427/202204271215.wfSd4UMp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/c30e163fc48e694440a08d8445bf06254e933bf1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexander-Potapenko/Add-KernelMemorySanitizer-infrastructure/20220427-004851
        git checkout c30e163fc48e694440a08d8445bf06254e933bf1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/s390/lib/uaccess.c:84:3: error: call to undeclared function 'instrument_copy_from_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   instrument_copy_from_user(to, from, n);
                   ^
   arch/s390/lib/uaccess.c:84:3: note: did you mean 'instrument_copy_to_user'?
   include/linux/instrumented.h:116:1: note: 'instrument_copy_to_user' declared here
   instrument_copy_to_user(void __user *to, const void *from, unsigned long n)
   ^
   1 error generated.


vim +/instrument_copy_from_user +84 arch/s390/lib/uaccess.c

457f2180951cdc Heiko Carstens           2014-03-21  76  
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  77  unsigned long _copy_from_user_key(void *to, const void __user *from,
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  78  				  unsigned long n, unsigned long key)
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  79  {
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  80  	unsigned long res = n;
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  81  
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  82  	might_fault();
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  83  	if (!should_fail_usercopy()) {
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11 @84  		instrument_copy_from_user(to, from, n);
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  85  		res = raw_copy_from_user_key(to, from, n, key);
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  86  	}
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  87  	if (unlikely(res))
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  88  		memset(to + (n - res), 0, res);
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  89  	return res;
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  90  }
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  91  EXPORT_SYMBOL(_copy_from_user_key);
432b1cc78e985d Janis Schoetterl-Glausch 2022-02-11  92  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
