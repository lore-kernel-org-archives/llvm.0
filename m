Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4A515B0;
	Sun,  7 May 2023 02:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683424889; x=1714960889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TUykyREkvoYgkJ35tg+SCwpfydW6o1znBSlKjgRpjXs=;
  b=CH+JNf/RpwSCCpK01YRHa7Oy/F36oG+UWUtEuoyB93/pz5pfzhGao3Kn
   NfLc6ZSoajkKizL5DFWTBGksov8GsFwgLtl9lY2t8kXksfhNl81QXNKtM
   /ny57qowHLq6SsvPxYH942UAlpsQ5iGDrrp5BZefacJhGe6S3Bqy/KqUC
   +nFv1xkpZR1QFuQfuuHDugGGoslN441qtj/Qdq6q9/zG1sw6bERspKERe
   1r5x+pLYOOjrxoEZwcE+nVF1mj8VUiUx5ueUP7xO5Riri6zlZbYd39RZi
   FZbruGbUBbjseTqlZEIwwIixWUWZ75u+HKihNjbFAcZ2G+qIKQVVSQBLi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="435756498"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="435756498"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 19:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="787656636"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="787656636"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 May 2023 19:01:26 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvTiH-0000ZA-1f;
	Sun, 07 May 2023 02:01:25 +0000
Date: Sun, 7 May 2023 10:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [stable:linux-4.19.y 3525/9999] ld.lld: error:
 drivers/media/usb/usbtv/usbtv-audio.o: contains a compressed section, but
 zlib is not available
Message-ID: <202305070940.YD1J8Lug-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   cdfda37ab2cfc783a190b563806cda611c35d1e3
commit: d4503a3fd3bbf8ddecddb4d71be7110d7651eb8a [3525/9999] media: usbtv: Fix refcounting mixup
config: x86_64-randconfig-a016-20230501 (https://download.01.org/0day-ci/archive/20230507/202305070940.YD1J8Lug-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=d4503a3fd3bbf8ddecddb4d71be7110d7651eb8a
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout d4503a3fd3bbf8ddecddb4d71be7110d7651eb8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305070940.YD1J8Lug-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/media/usb/usbtv/usbtv-video.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/media/usb/usbtv/usbtv-audio.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
