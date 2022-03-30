Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668C936C
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 06:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648623229; x=1680159229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cm7zalOPVoseD2/NZNf63+7ZwazgOQ0XcSWIJMqTgps=;
  b=KicsymGnLZa088l/6oebAqIt5hpTs8EwMqWOJ9flGPzfHzpNLTzPHOjU
   wyvtD+a8QCdyaKA7nfUo0ZHo9B+/EPVi6+N5vvYLliSvK5ChgIFaBxjQZ
   abxBz9bPULwu7Nn4ywNdK97XI2fI9j7EaQlhJWdGtYXf0p4V+yXMfOozr
   3JomSRGWdL7ovrTBi7m6pJEdoWrtXdqcAUrvpGXESX1MwyzjtPT+22uZ9
   KqobJ9OSiZKhjpUirmIpTPWCmUOZ/Pn3kvfR1tX1FRlC7RBUpoNktESRX
   O74S23dytZmswxhFbglHoKknMqLvwIafZQpCBrHu9eGDSoLxN/FNqXe00
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="246960058"
X-IronPort-AV: E=Sophos;i="5.90,221,1643702400"; 
   d="scan'208";a="246960058"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 23:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="503198264"
Received: from lkp-server01.sh.intel.com (HELO 3965e2759b93) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Mar 2022 23:53:43 -0700
Received: from kbuild by 3965e2759b93 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nZSD8-000150-GS; Wed, 30 Mar 2022 06:53:42 +0000
Date: Wed, 30 Mar 2022 14:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <guro@fb.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Minchan Kim <minchan@google.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-trusty-5.10
 4036/5872] WARNING: modpost: vmlinux.o(.text+0x4111c4): Section mismatch in
 reference from the function memblock_bottom_up() to the variable
 .meminit.data:memblock
Message-ID: <202203301412.MZ7wQvQz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Roman,

FYI, the error/warning still remains.

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-trusty-5.10
head:   07055bfd3d810d41a38354693dfaa55a6f8c0025
commit: 0e0bfc41fdf4d79d39ebe929844cdee44f97366d [4036/5872] UPSTREAM: mm: cma: allocate cma areas bottom-up
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220330/202203301412.MZ7wQvQz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/0e0bfc41fdf4d79d39ebe929844cdee44f97366d
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-trusty-5.10
        git checkout 0e0bfc41fdf4d79d39ebe929844cdee44f97366d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0x4111c4): Section mismatch in reference from the function memblock_bottom_up() to the variable .meminit.data:memblock
The function memblock_bottom_up() references
the variable __meminitdata memblock.
This is often because memblock_bottom_up lacks a __meminitdata
annotation or the annotation of memblock is wrong.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
