Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DCC7E5;
	Sat, 11 Feb 2023 21:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676151867; x=1707687867;
  h=date:from:cc:subject:message-id:mime-version;
  bh=8N0DYA21xyy9YPFL9MR06pfDAmGwG9abJilBw1UMw0c=;
  b=kBXKKlCs/caqAQ4vFl8UjmDLIuAvK5NTpXBlxN+fHepjy/fLgMEkBszX
   7L3Spqp0Fq+QYdRE+MYSwTd2XZjabN8ysOTdGId2EC0R/D7wptipowDQ+
   IhQ+XDm/p+4WszH+8IHiqOIkIoTRVDYU7TlWjcWz1uH6omVcrmSde1pfP
   nVmtdpniPyc2QtBkhhK9UtV6q7Um2QehSKm9Oajhlm7Tkl+Twbo8JsFbM
   rTkGrCuzsGoIILe4Vgf/QNaCy+hG2SjItkbWV3R8ihXD+7dEsRdcl0Ld9
   yO0hRPa7bPiNf59q+er0p25Sq72XCDdUojIa2Eq8nQ5EYAdjyoO+z0cuh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="416884005"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="416884005"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 13:44:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="757140514"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="757140514"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Feb 2023 13:44:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQxfV-0006oz-2g;
	Sat, 11 Feb 2023 21:44:25 +0000
Date: Sun, 12 Feb 2023 05:44:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 9813/12152] ld.lld: error:
 vmlinux.a(fs/btrfs/uuid-tree.o):(function btrfs_uuid_tree_add: .text+0x332):
 relocation R_RISCV_HI20 out of range: 536970 is not in [-524288, 524287];
 references .L.str.3
Message-ID: <202302120501.QfPosCy2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba8a227fd19d19779005fb66ad7562608e1df83
commit: 42186e6c00352ce9df9e3f12b1ff82e61978d40b [9813/12152] ipv4: raw: add drop reasons
config: riscv-randconfig-r022-20230212 (https://download.01.org/0day-ci/archive/20230212/202302120501.QfPosCy2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=42186e6c00352ce9df9e3f12b1ff82e61978d40b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 42186e6c00352ce9df9e3f12b1ff82e61978d40b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302120501.QfPosCy2-lkp@intel.com/

Note: the linux-next/master HEAD 6ba8a227fd19d19779005fb66ad7562608e1df83 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/btrfs/uuid-tree.o):(function btrfs_uuid_tree_add: .text+0x332): relocation R_RISCV_HI20 out of range: 536970 is not in [-524288, 524287]; references .L.str.3
   >>> referenced by uuid-tree.c
   >>> defined in vmlinux.a(fs/btrfs/uuid-tree.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
