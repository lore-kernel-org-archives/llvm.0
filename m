Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592C72F45
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652373866; x=1683909866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aSoD9A65PeW90ZHA6KeiB1hT1IPWY6t/5WyFpaRGgNg=;
  b=cX96ZWlP+M8E81aLnRRKPqwA5zNbNTHPx5id+T3lwfn0NAH496cK+0br
   yId3eXLSGQ/+iWt9/6Yprq6Foe1zIOjLfDBf1/9BCOncwcQJ6jVp7tVH4
   PT34rXLpeb5CvJddcdF3YVxWnui8Hrx7lVGQSJa9nO5UUPkxciTSYTUrl
   3M00Mdl9pRpsFwv6FnDL1QCbI9XHhqUrO1Hmo+HjQQL22zp4N3wgIfHm+
   VcDDT/C7j4HhYffysyujFCaba4yw4WfLPD1gJU7bfvOYH7+8qPHT9xh/K
   7UA2F2oh5cSptVoWL4E4s6hZ06qeoZc1PozdbvFfwGRmkgkZP7wN7R5iO
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="249954202"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="249954202"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 09:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="670909190"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 May 2022 09:21:37 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npBZI-000Kfo-LM;
	Thu, 12 May 2022 16:21:36 +0000
Date: Fri, 13 May 2022 00:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Jonas Paulsson <paulsson@linux.vnet.ibm.com>,
	Ulrich Weigand <ulrich.weigand@de.ibm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexander Egorenkov <egorenar@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Sven Schnelle <svens@linux.ibm.com>,
	Andreas Krebbel <krebbel@linux.ibm.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH 3/8] s390/entry: shorten OUTSIDE macro
Message-ID: <202205130050.x6Is9kJO-lkp@intel.com>
References: <20220511120532.2228616-4-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511120532.2228616-4-hca@linux.ibm.com>

Hi Heiko,

I love your patch! Yet something to improve:

[auto build test ERROR on s390/features]
[also build test ERROR on tip/locking/core masahiroy-kbuild/for-next linus/master v5.18-rc6 next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Carstens/s390-allow-to-build-with-llvm-s-integrated-assembler/20220511-201054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
config: s390-randconfig-r003-20220512 (https://download.01.org/0day-ci/archive/20220513/202205130050.x6Is9kJO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/ad8a0a6488ba252aaa84b813dee2c949ae59d88a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Heiko-Carstens/s390-allow-to-build-with-llvm-s-integrated-assembler/20220511-201054
        git checkout ad8a0a6488ba252aaa84b813dee2c949ae59d88a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> <instantiation>:2:2: error: instruction requires: distinct-ops
    slgrk %r14,%r9,%r14
    ^
   arch/s390/kernel/entry.S:378:2: note: while in macro instantiation
    OUTSIDE %r9,.Lsie_gmap,.Lsie_done,1f
    ^
   <instantiation>:3:13: error: invalid operand for instruction
    clgfi %r14,.Lsie_done - .Lsie_gmap
               ^
   arch/s390/kernel/entry.S:378:2: note: while in macro instantiation
    OUTSIDE %r9,.Lsie_gmap,.Lsie_done,1f
    ^
>> <instantiation>:2:2: error: instruction requires: distinct-ops
    slgrk %r14,%r9,%r14
    ^
   <instantiation>:12:2: note: while in macro instantiation
    OUTSIDE %r9,.Lsie_gmap,.Lsie_done,0f
    ^
   arch/s390/kernel/entry.S:488:1: note: while in macro instantiation
   INT_HANDLER ext_int_handler,304,do_ext_irq
   ^
   <instantiation>:3:13: error: invalid operand for instruction
    clgfi %r14,.Lsie_done - .Lsie_gmap
               ^
   <instantiation>:12:2: note: while in macro instantiation
    OUTSIDE %r9,.Lsie_gmap,.Lsie_done,0f
    ^
   arch/s390/kernel/entry.S:488:1: note: while in macro instantiation
   INT_HANDLER ext_int_handler,304,do_ext_irq
   ^
>> <instantiation>:2:2: error: instruction requires: distinct-ops
    slgrk %r14,%r9,%r14
    ^
   <instantiation>:12:2: note: while in macro instantiation
    OUTSIDE %r9,.Lsie_gmap,.Lsie_done,0f
    ^
   arch/s390/kernel/entry.S:489:1: note: while in macro instantiation
   INT_HANDLER io_int_handler,368,do_io_irq
   ^
   <instantiation>:3:13: error: invalid operand for instruction
    clgfi %r14,.Lsie_done - .Lsie_gmap
               ^
   <instantiation>:12:2: note: while in macro instantiation
    OUTSIDE %r9,.Lsie_gmap,.Lsie_done,0f
    ^
   arch/s390/kernel/entry.S:489:1: note: while in macro instantiation
   INT_HANDLER io_int_handler,368,do_io_irq
   ^
>> <instantiation>:2:2: error: instruction requires: distinct-ops
    slgrk %r14,%r9,%r14
    ^
   arch/s390/kernel/entry.S:554:2: note: while in macro instantiation
    OUTSIDE %r9,.Lsie_gmap,.Lsie_done,6f
    ^
   <instantiation>:3:13: error: invalid operand for instruction
    clgfi %r14,.Lsie_done - .Lsie_gmap
               ^
   arch/s390/kernel/entry.S:554:2: note: while in macro instantiation
    OUTSIDE %r9,.Lsie_gmap,.Lsie_done,6f
    ^
>> <instantiation>:2:2: error: instruction requires: distinct-ops
    slgrk %r14,%r9,%r14
    ^
   arch/s390/kernel/entry.S:555:2: note: while in macro instantiation
    OUTSIDE %r9,.Lsie_entry,.Lsie_skip,4f
    ^
   <instantiation>:3:13: error: invalid operand for instruction
    clgfi %r14,.Lsie_skip - .Lsie_entry
               ^
   arch/s390/kernel/entry.S:555:2: note: while in macro instantiation
    OUTSIDE %r9,.Lsie_entry,.Lsie_skip,4f
    ^

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
