Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5327A
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 04:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655093655; x=1686629655;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zqlLIiXRzBNPzwh5U4MCF22imSVqrTF+KjOjf/cd9Yk=;
  b=QJ2pvBulOgIX5FuG/5l4vywwCgaeMgTBrptqBL4CX0gUChtfzPt97dmd
   k1JWmr5yiap/UkpPwEkUATZ3krd3pPK00X0CCq2dp0QSJ3fow3Uvbnd1y
   gda0PvpQmbEbVy8wHszMrLBtpwAq0xP7Hfxq6NmvnzLavO/nverzn1uo+
   V1P3qYo21ia0TpnI6VnXX5MkWWYxvWZ212Oy+fdHCamtAjQ/O/PVC9QDE
   +Us0DGjXAB2XJSman4LsIPEJr1/iRzRwzsTyLK2qWoi5N2nDZX6KhwGXQ
   4wRfYoIiWNshNM10fKoLgxRDofflOJkxVhobqaCtLOmnd2GwPYlkbNtUC
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="342133121"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="342133121"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2022 21:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="685805461"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2022 21:14:13 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0bSu-000KSr-Qw;
	Mon, 13 Jun 2022 04:14:12 +0000
Date: Mon, 13 Jun 2022 12:14:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [drm-misc:for-linux-next 1/5] ld.lld: error:
 kernel/built-in.a(futex/pi.o):(function refill_pi_state_cache: .text+0x1a):
 relocation R_RISCV_HI20 out of range: 535298 is not in [-524288, 524287];
 references kmalloc_caches
Message-ID: <202206131241.m3tI5ZOo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Robinson <pbrobinson@gmail.com>
CC: Melissa Wen <melissa.srw@gmail.com>
CC: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
CC: Stefan Wahren <stefan.wahren@i2se.com>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   16490922a95f4f67eb9d918f94a4f5b5bdc9eb80
commit: 9c63e253485cd78ae74da2fcce67e7a1746ed905 [1/5] dt-bindings: gpu: v3d: Add BCM2711's compatible
config: riscv-randconfig-r013-20220612 (https://download.01.org/0day-ci/archive/20220613/202206131241.m3tI5ZOo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d378268ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc for-linux-next
        git checkout 9c63e253485cd78ae74da2fcce67e7a1746ed905
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the drm-misc/for-linux-next HEAD 16490922a95f4f67eb9d918f94a4f5b5bdc9eb80 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(futex/pi.o):(function refill_pi_state_cache: .text+0x1a): relocation R_RISCV_HI20 out of range: 535298 is not in [-524288, 524287]; references kmalloc_caches
   >>> referenced by pi.c
   >>> defined in mm/built-in.a(slab_common.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
