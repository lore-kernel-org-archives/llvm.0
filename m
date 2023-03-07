Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B152C612F;
	Tue,  7 Mar 2023 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678191245; x=1709727245;
  h=date:from:cc:subject:message-id:mime-version;
  bh=943Pfg7arX5KH1hJzx+A5eF/iMiatOoX9k/iQp1FSvI=;
  b=Qp9av+jcfDIyFS/A8DYwzyG3kLLJpcdBvt93zSlVkunQosdqxTHRQrNI
   trAyzJoYtMaD8LtVse2donsX93fxvTpZ704OFj3Q85hnxZXHSP/B1rEQB
   JKHjRuB9cgB+pBTEN9240cNbDbU4I7XM3VR95+t24XmClC8l2IvQAUaRM
   ECju1Dyo+DmErfo+CubwG6vJXyfOy/4sAp2ODhkCpAJZd/YgFb8W/1Rgv
   CLrj4TEm7PyvpdwxkEnrAvF4t+76Qm5XRchptVzmcoEL3HUIQhHHuG6Ca
   F9yAHPDZdYqAXJdmVJQ+bbGKHoxP1oasMO+yF2vAV54w9/fRBZ7pEcesx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="324140117"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="324140117"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 04:14:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="626515419"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="626515419"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Mar 2023 04:14:04 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZWCh-0001IB-1K;
	Tue, 07 Mar 2023 12:14:03 +0000
Date: Tue, 7 Mar 2023 20:13:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 6/12] ld.lld: error:
 init/built-in.a(main.o):(function trace_event_raw_event_initcall_level:
 .text+0x2da): relocation R_RISCV_HI20 out of range: 531340 is not in
 [-524288, 524287]; references
 trace_event_raw_event_initcall_level.__if_trace.53.0
Message-ID: <202303072009.dhEDMzJd-lkp@intel.com>
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

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   c3bb885686dff3c63995ca9b8af28a31c537fde4
commit: 414b60e85a7ec7d39c4cda497cd9eb507836fae4 [6/12] UPSTREAM: drm/i915/xelpmp: Consider GSI offset when doing MCR lookups
config: riscv-buildonly-randconfig-r005-20230306 (https://download.01.org/0day-ci/archive/20230307/202303072009.dhEDMzJd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 414b60e85a7ec7d39c4cda497cd9eb507836fae4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303072009.dhEDMzJd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(main.o):(function trace_event_raw_event_initcall_level: .text+0x2da): relocation R_RISCV_HI20 out of range: 531340 is not in [-524288, 524287]; references trace_event_raw_event_initcall_level.__if_trace.53.0
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
