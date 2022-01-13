Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE83173
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642066839; x=1673602839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IHDfPqOB+GlFtyGR8eqkFs3TvhSjZVqTB/a5wI3JQtM=;
  b=eOSTWCw6RPmykVixABFia0POrr2LaninVLPySBb0QRj3jT/hNTSIGX76
   mtJ1YTatULK7YtS2IrmNcfqqmJBjWsLWpLtbVfq9pfeMylW7AcA0Es9Vr
   RbIhl7oFtWYoCi4v4+MtRcQAkn/DE38i427W9O135Z3GzUuBAP+Wdi6N6
   4GFYvKwsUp7RB8KZdjLav+NnHFIHaX/MthmEnoJxyl2Rs5pq9oOZyBg5x
   WsrAaWYZWxZISPedo1qaXouaCqiCdpd5deH30tsfp5Z3UsfGhJHNHtNC7
   kg/AFcoNvXg7IpYaDCoYANVWVaDYqjR/wGWtCz5YH4xpnG/amG5O7h+mk
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="223955617"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="223955617"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 01:40:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="593296005"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2022 01:40:38 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7waz-000737-Bl; Thu, 13 Jan 2022 09:40:37 +0000
Date: Thu, 13 Jan 2022 17:40:32 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 01/28] clk: renesas: rzg2l: Add FOUTPOSTDIV clk support
Message-ID: <202201131731.OhbX4Dpr-lkp@intel.com>
References: <20220112174612.10773-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112174612.10773-2-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Biju,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on next-20220112]
[cannot apply to pinchartl-media/drm/du/next geert-renesas-drivers/renesas-clk geert-renesas-devel/next v5.16 v5.16-rc8 v5.16-rc7 v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Biju-Das/Add-RZ-G2L-Display-support/20220113-014940
base:    32ce2abb03cfae17a9eb42bd6b1b619b72f23f20
config: arm-randconfig-r021-20220113 (https://download.01.org/0day-ci/archive/20220113/202201131731.OhbX4Dpr-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/c0b834d1561a902d5f960a18e365d66fbeba0f95
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Biju-Das/Add-RZ-G2L-Display-support/20220113-014940
        git checkout c0b834d1561a902d5f960a18e365d66fbeba0f95
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/renesas/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/renesas/rzg2l-cpg.c:302:4: warning: integer literal is too large to be represented in type 'long', interpreting as 'unsigned long' per C89; this literal will have type 'long long' in C99 onwards [-Wc99-compat]
           { 3000000000, 1, 125,        0, 1, 1, 0, 0,  0, 0 }, /* 3000 MHz */
             ^
   drivers/clk/renesas/rzg2l-cpg.c:317:4: warning: integer literal is too large to be represented in type 'long', interpreting as 'unsigned long' per C89; this literal will have type 'long long' in C99 onwards [-Wc99-compat]
           { 3000000000, 1, 125,        0, 1, 1, 0, 0, 0, 0 }, /* 3000 MHz */
             ^
   2 warnings generated.


vim +302 drivers/clk/renesas/rzg2l-cpg.c

   286	
   287	static const struct rzg2l_pll5_param dsi_mode_param[] = {
   288		{   25175000, 1,  16, 13141593, 1, 1, 2, 3, 16, 0 }, /* VGA 25.175MHz */
   289		{   25200000, 1,  16, 13421773, 1, 1, 2, 3, 16, 0 }, /* VGA 25.200MHz */
   290		{   27000000, 1,  18,        0, 1, 1, 2, 3, 16, 0 }, /* 480p/576p 27.000MHz */
   291		{   27027000, 1,  18,   301990, 1, 1, 2, 3, 16, 0 }, /* 480p 27.027MHz */
   292		{   29605000, 1,  19, 12359216, 1, 1, 2, 3, 16, 0 }, /* WVGA 29.605MHz */
   293		{   40000000, 2,  80,        0, 2, 1, 1, 2,  6, 0 }, /* SVGA 40.00MHz */
   294		{   65000000, 1,  43,  5592405, 1, 1, 2, 3, 16, 0 }, /* XGA 65.00MHz */
   295		{   71000000, 2,  71,        0, 1, 1, 1, 2,  6, 0 }, /* WXGA 1280x800 71.0MHz */
   296		{   74176000, 1,  49,  7560932, 1, 1, 2, 3, 16, 0 }, /* 720p 74.176MHz */
   297		{   74250000, 1,  49,  8388608, 1, 1, 2, 3, 16, 0 }, /* 720p 74.25MHz */
   298		{   85500000, 2,  85,  8388608, 1, 1, 1, 2,  6, 0 }, /* FWXGA 1360x768 85.5MHz */
   299		{   88750000, 2,  88, 12582912, 1, 1, 1, 2,  6, 1 }, /* WXGA+ 1440x900 88.75MHz */
   300		{  108000000, 2, 108,        0, 1, 1, 1, 2,  6, 1 }, /* SXGA 108MHz */
   301		{  148500000, 2, 148,  8388608, 1, 1, 1, 2,  6, 1 }, /* 1080p 148.5MHz */
 > 302		{ 3000000000, 1, 125,        0, 1, 1, 0, 0,  0, 0 }, /* 3000 MHz */
   303	};
   304	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
