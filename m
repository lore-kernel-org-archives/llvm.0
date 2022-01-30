Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522C42C80
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 20:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643573634; x=1675109634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CUGxfIgplr8CR/vNBSqUY2Z6LFy1cI+HK/XEaUaxP70=;
  b=l4TMDtpGoVbu5eh5eWI+oqrnwKcwGXZWma5A9E15Dk+j30vcWU13b3+j
   9YvyqaLZlDM4Ksb6MopUuDYtG4d/ugseSFWqmd5X+9RZEJ3KP1AaDeLp7
   iNPraI8iaIWgZYTVIGvQk73XZrahT9rqQ1co0angF432sE4R7aNfZAKLc
   OMIRbaAfSRZ2veXSyGiUz7ChGRDL4GWi3Wp9te2xObGZ1hOXJ1S1GaZ1V
   vTsrKeRgW3Uxh/nN+MmUqfgEzrCNaRh/SiPLKvYqr7d3FNcYFuO0ahp2e
   T4tEVuCazf+lQvPVY3GHdR9SVfb390fM4LLyh26p+S5BfqFzI/CA4KosA
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="247323428"
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; 
   d="scan'208";a="247323428"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 12:13:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; 
   d="scan'208";a="536845470"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Jan 2022 12:13:51 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEGa6-000Qws-Gs; Sun, 30 Jan 2022 20:13:50 +0000
Date: Mon, 31 Jan 2022 04:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: kbuild-all@lists.01.org, Geert Uytterhoeven <geert@linux-m68k.org>,
	Peter Rosin <peda@axentia.se>, Andy Shevchenko <andy@kernel.org>,
	Matteo Croce <mcroce@microsoft.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] lib/test_string.c: Add test for strlen()
Message-ID: <202201310303.HQlCsvvd-lkp@intel.com>
References: <20220130183653.491292-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130183653.491292-1-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Kees,

I love your patch! Yet something to improve:

[auto build test ERROR on linux/master]
[also build test ERROR on linus/master kees/for-next/pstore v5.17-rc2 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kees-Cook/lib-test_string-c-Add-test-for-strlen/20220131-023726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2c271fe77d52a0555161926c232cd5bc07178b39
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220131/202201310303.HQlCsvvd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d22fe883339c5141953dbca980b51466ac3e2329
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kees-Cook/lib-test_string-c-Add-test-for-strlen/20220131-023726
        git checkout d22fe883339c5141953dbca980b51466ac3e2329
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=sh SHELL=/bin/bash M=lib/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> lib/test_string.c:188:30: error: initializer element is not constant
     188 | static const int strlen_ce = strlen("tada, a constant expression");
         |                              ^~~~~~


vim +188 lib/test_string.c

   181	
   182	/*
   183	 * Unlike many other string functions, strlen() can be used in
   184	 * static initializers when string lengths are known at compile
   185	 * time. (i.e. Under these conditions, strlen() is a constant
   186	 * expression.) Make sure it can be used this way.
   187	 */
 > 188	static const int strlen_ce = strlen("tada, a constant expression");
   189	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
