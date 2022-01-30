Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA842CA1
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643539534; x=1675075534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C/g4/HjJWtsOpl+TgTQHRBlPefzxtkc/8FHfQdwW9oI=;
  b=nFrCfRc4eyaXsLwJqjS7eoFTxeEQAGA+9a1mvRIhLw+bQXcIVpYDNrRH
   j88/uwztZHvdDlYvVrE1nmkFib/4iaWjwr27Jtu43v/WMszFsA5B4HSiY
   kEa2811qMArRD3Xge2EeGx6QYUftvmkNfz2ayfR72JsxzCSpzhoWgaTbk
   aueAj/r4HQUBNJBl/CNlLmz/5jZ/PfHzdNXBf+2q/8n7Pw8Fixv/jYmNb
   frqpKSi9bXt8+hNSvbkN4ac89WMTdaK1OU7AQJtTQt+Ob6Uq78a48HMSc
   f/limj981pnmDFcUFZmkjxNiLxVNLlysV4M+KvE/o8e9RNA0E89yShH/e
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="246174050"
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="246174050"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 02:45:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="481262583"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Jan 2022 02:45:31 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nE7i6-000QOT-P3; Sun, 30 Jan 2022 10:45:30 +0000
Date: Sun, 30 Jan 2022 18:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Jerry Zuo <Jerry.Zuo@amd.com>
Subject: [linux-next:master 1798/2855]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:805:6:
 warning: no previous prototype for function
 'dm_helpers_enable_periodic_detection'
Message-ID: <202201301809.h2YkYdBY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b605fdc54c2b28c30ef06d9db99282d8a32ae4be
commit: d9eb8fea6862e63421f7b9c93e32bef348488c41 [1798/2855] drm/amd/display: Drop DCN for DP2.x logic
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220130/202201301809.h2YkYdBY-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d9eb8fea6862e63421f7b9c93e32bef348488c41
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d9eb8fea6862e63421f7b9c93e32bef348488c41
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:805:6: warning: no previous prototype for function 'dm_helpers_enable_periodic_detection' [-Wmissing-prototypes]
   void dm_helpers_enable_periodic_detection(struct dc_context *ctx, bool enable)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:805:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dm_helpers_enable_periodic_detection(struct dc_context *ctx, bool enable)
   ^
   static 
   1 warning generated.


vim +/dm_helpers_enable_periodic_detection +805 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c

ac02dc34258569 Eric Yang 2021-08-25  804  
ac02dc34258569 Eric Yang 2021-08-25 @805  void dm_helpers_enable_periodic_detection(struct dc_context *ctx, bool enable)

:::::: The code at line 805 was first introduced by commit
:::::: ac02dc34258569b793b78483154ca336f103946f drm/amd/display: Add periodic detection when zstate is enabled

:::::: TO: Eric Yang <Eric.Yang2@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
