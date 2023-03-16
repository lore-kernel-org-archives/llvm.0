Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D4618F;
	Thu, 16 Mar 2023 00:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678927936; x=1710463936;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5icHnsl3HDMQPjg4chFGRqCFNguFfKbg4I6+lpD164s=;
  b=P0vMePYITjKRhw12NWHxrMdAXWFRtYHIvR66Xl2sOGhE4rCat6W6g0pr
   xFUPv1KdXDrd6KriB3rNu+FyBfiRncQlTGbpbOnAV4YGBLh2b9z5Q5KAt
   bpuf2ac7YGuUJdD2wC9b9yhm/czVNCEnc3k3sQlaRTiLf2tQW6soOR1EV
   7KztwiC1GWOoNHew2i4KbAv/5BoaTkAE9E94SUkoiONTVeF1RTqHaJ9z3
   LEhIoMBC9O0q3iK4dkiCtAW5/0X/wBjsCd/r5j5QdJG7zytxBMPyJGfe8
   evRi5L84Re5E9SunrVewUYVXZzDy2gn+UF6FANaUmscKI7eahfdO9YjJU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365542787"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="365542787"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 17:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="803505871"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="803505871"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Mar 2023 17:52:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcbqn-0008AP-2z;
	Thu, 16 Mar 2023 00:52:13 +0000
Date: Thu, 16 Mar 2023 08:51:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 11/97] ld.lld: error:
 vmlinux.a(fs/fuse/control.o):(function fuse_ctl_add_conn: .text+0x24):
 relocation R_RISCV_HI20 out of range: 534145 is not in [-524288, 524287];
 references fuse_control_sb
Message-ID: <202303160805.bsKBnyCl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   105289787142cf4c9a90015989c8bdbb4532afe0
commit: 3b6e19c0978576a692d11e83f7b1fef024ab3d98 [11/97] UPSTREAM: ASoC: SOF: sof-audio: Populate the PCM stream pipeline_info
config: riscv-randconfig-r034-20230312 (https://download.01.org/0day-ci/archive/20230316/202303160805.bsKBnyCl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 3b6e19c0978576a692d11e83f7b1fef024ab3d98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160805.bsKBnyCl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/fuse/control.o):(function fuse_ctl_add_conn: .text+0x24): relocation R_RISCV_HI20 out of range: 534145 is not in [-524288, 524287]; references fuse_control_sb
   >>> referenced by control.c:290 (fs/fuse/control.c:290)
   >>> defined in vmlinux.a(fs/fuse/control.o)
--
>> ld.lld: error: vmlinux.a(fs/fuse/control.o):(function fuse_ctl_add_conn: .text+0x82): relocation R_RISCV_HI20 out of range: 532941 is not in [-524288, 524287]; references .L.str
   >>> referenced by control.c:292 (fs/fuse/control.c:292)
   >>> defined in vmlinux.a(fs/fuse/control.o)
--
>> ld.lld: error: vmlinux.a(fs/fuse/control.o):(function fuse_ctl_add_conn: .text+0x96): relocation R_RISCV_HI20 out of range: 531980 is not in [-524288, 524287]; references simple_dir_inode_operations
   >>> referenced by control.c:292 (fs/fuse/control.c:292)
   >>> defined in vmlinux.a(fs/libfs.o)
--
>> ld.lld: error: vmlinux.a(fs/fuse/control.o):(function fuse_ctl_add_conn: .text+0x9e): relocation R_RISCV_HI20 out of range: 531979 is not in [-524288, 524287]; references simple_dir_operations
   >>> referenced by control.c:292 (fs/fuse/control.c:292)
   >>> defined in vmlinux.a(fs/libfs.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
