Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA7F23A6
	for <llvm@lists.linux.dev>; Wed, 13 Apr 2022 22:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649890461; x=1681426461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8V4OPc5qWzAYZSVwVpMIb8F9Q8695qCcFacUPCDjceI=;
  b=KrLykR+1LuVjenmlMwmyyJNecorBc6cvhoHrIizglvmppIo0dF+emJeU
   7bk4HT8b+RoL8d7L63OTuPctvlQh8mFMzXbuUxCDSsKSgHHZ3iF9jYoW5
   3/pwIj360wEenNX8D0cCJ6JyRbt5UwOmkiPsZsdll4LgOaBMkMGfiBYvc
   /Llkkfem3O1fTWFqO4ppNtZUylD4LhQhDIv7zvmTjYCXa9DC7+T5CXoLU
   rYDS9+1zRFLaVsfm6US3g2rYrhque17ZBE98eSlhZtzb/h/R8W/hjwgJr
   i5K2aO+0JenlPRXVGm6CBd+UBSbUEeowwpNlCSD3HZ3NccmLEy9DPwGHl
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="261640978"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="261640978"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 15:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="854968940"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Apr 2022 15:54:15 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nelsN-0000gs-2D;
	Wed, 13 Apr 2022 22:54:15 +0000
Date: Thu, 14 Apr 2022 06:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhu <zhuyan34@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [ammarfaizi2-block:bpf/bpf-next/pr/bpf-sysctl 1/1]
 kernel/bpf/syscall.c:4944:13: warning: no previous prototype for function
 'unpriv_ebpf_notify'
Message-ID: <202204140608.VUvJxAlq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf-next/pr/bpf-sysctl
head:   2900005ea287b11dcc8c1b9fcf24893b7ff41d6d
commit: 2900005ea287b11dcc8c1b9fcf24893b7ff41d6d [1/1] bpf: Move BPF sysctls from kernel/sysctl.c to BPF core
config: arm64-buildonly-randconfig-r005-20220413 (https://download.01.org/0day-ci/archive/20220414/202204140608.VUvJxAlq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/2900005ea287b11dcc8c1b9fcf24893b7ff41d6d
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block bpf/bpf-next/pr/bpf-sysctl
        git checkout 2900005ea287b11dcc8c1b9fcf24893b7ff41d6d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/syscall.c:4944:13: warning: no previous prototype for function 'unpriv_ebpf_notify' [-Wmissing-prototypes]
   void __weak unpriv_ebpf_notify(int new_state)
               ^
   kernel/bpf/syscall.c:4944:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak unpriv_ebpf_notify(int new_state)
   ^
   static 
   1 warning generated.


vim +/unpriv_ebpf_notify +4944 kernel/bpf/syscall.c

  4943	
> 4944	void __weak unpriv_ebpf_notify(int new_state)
  4945	{
  4946	}
  4947	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
