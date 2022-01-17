Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B72C2C9E
	for <llvm@lists.linux.dev>; Mon, 17 Jan 2022 18:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642445747; x=1673981747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OOvDBzf/x/mAjHZWTgT2oB2UUi0ZTBgH/ykCE1wtCDU=;
  b=IJgWJkMLs5qNBLqsE7KgsffNp2O88mfDXTVz6Mjh+1UUw5KimJnpC4E3
   3CnKLm3Zzvee22qGOKSbYixQDQTJb7BSi8e9lPsGvwHaN4jG9E3cqyxoz
   LI0KuQfZbdDp6Gc0JUfEyAkkkwRpkdNVzHqLqyW3mq+lnNKPi29s+/J+D
   T8gqTREYq/BYG+jyQ8aKsVL77nFuCBi1nN3s0XMLzLhW6M1ut/QKOM/79
   ucyeX1aGA60CpG5rXbFdCo3qkAKlanPw6r1aycd1a2kZDjLjEyoyx3cdU
   dadcJtZKSfZjJBRpvOZORnzcxFQV1VIXmF1cXv6nkBPK5jsx0Sgc8oO2o
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="331027472"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; 
   d="scan'208";a="331027472"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2022 10:55:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; 
   d="scan'208";a="476737854"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Jan 2022 10:55:45 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9XAO-000Bmd-NP; Mon, 17 Jan 2022 18:55:44 +0000
Date: Tue, 18 Jan 2022 02:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [drm-misc:drm-misc-next 3/5] ERROR: modpost:
 "drm_dp_dump_sideband_msg_req_body"
 [drivers/gpu/drm/selftests/test-drm_modeset.ko] undefined!
Message-ID: <202201180225.QB8esALn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   032a125904995985334766911de9e26ee2bbd646
commit: adb9d5a2cc77e8aefe98fe4c11656c5b7025c248 [3/5] drm/dp: Move DisplayPort helpers into separate helper module
config: x86_64-randconfig-a004-20220117 (https://download.01.org/0day-ci/archive/20220118/202201180225.QB8esALn-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f782d25a742302d25ef3c8b84b54f7483c2deb9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc drm-misc-next
        git checkout adb9d5a2cc77e8aefe98fe4c11656c5b7025c248
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_dp_dump_sideband_msg_req_body" [drivers/gpu/drm/selftests/test-drm_modeset.ko] undefined!
>> ERROR: modpost: "drm_dp_decode_sideband_req" [drivers/gpu/drm/selftests/test-drm_modeset.ko] undefined!
>> ERROR: modpost: "drm_dp_encode_sideband_req" [drivers/gpu/drm/selftests/test-drm_modeset.ko] undefined!
>> ERROR: modpost: "drm_dp_calc_pbn_mode" [drivers/gpu/drm/selftests/test-drm_modeset.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
