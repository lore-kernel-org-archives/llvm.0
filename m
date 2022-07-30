Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D463FF1
	for <llvm@lists.linux.dev>; Sat, 30 Jul 2022 22:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659219711; x=1690755711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+lmZwGBC6mWku02MktmD17iV3sA5j0PaSdMhZK/mMpc=;
  b=egNlIuFX+d1FH7Zp9dzOMtEZnRlYi+aSt5L3osETAO1TAlOspVe858kp
   PaAIrGuVaoc9wxyXNJfQmAQlZJpyQEheMMVQX48p57j1i4tLq/OKgnEFI
   t5pSHxGxlvOq25uRUGDrnfJZVOjvjzdUKfMqZv6wGyEbPMMyA9c6fCjfm
   zKrWXDXgzm7IKK4kh4TpRaJqwYOzegQ1ZaM/A365Gi2cvGufgVgBclDCV
   cJzO+6SeyLuarVn5D+K/6UKGSBYdTgm+oM4L0Nax7M353eEqeRRxsKZVW
   egagiIC3ucoTqV9UEEQjBp2FGRSX/8WGOieu5YaVEqxe6rZGMyVT4aT6/
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="350655377"
X-IronPort-AV: E=Sophos;i="5.93,205,1654585200"; 
   d="scan'208";a="350655377"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 15:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,205,1654585200"; 
   d="scan'208";a="929125897"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jul 2022 15:21:49 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHuqC-000DOZ-36;
	Sat, 30 Jul 2022 22:21:48 +0000
Date: Sun, 31 Jul 2022 06:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Kosina <jkosina@suse.cz>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-input@vger.kernel.org
Subject: [hid:for-next 22/28] drivers/hid/hid-nintendo.c:1514:29: error:
 redefinition of 'JC_RUMBLE_ZERO_AMP_PKT_CNT'
Message-ID: <202207310604.IJTM9Qx3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
head:   7af32d156ad75cd88699b28a617857c74c933721
commit: 0f0606ababb185afe1461ebd9abb95d797a5b952 [22/28] Merge branch 'for-5.20/nintendo' into for-next
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220731/202207310604.IJTM9Qx3-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=0f0606ababb185afe1461ebd9abb95d797a5b952
        git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
        git fetch --no-tags hid for-next
        git checkout 0f0606ababb185afe1461ebd9abb95d797a5b952
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hid/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/hid/hid-nintendo.c:1514:29: error: redefinition of 'JC_RUMBLE_ZERO_AMP_PKT_CNT'
   static const unsigned short JC_RUMBLE_ZERO_AMP_PKT_CNT = 5;
                               ^
   drivers/hid/hid-nintendo.c:295:29: note: previous definition is here
   static const unsigned short JC_RUMBLE_ZERO_AMP_PKT_CNT = 5;
                               ^
   1 error generated.


vim +/JC_RUMBLE_ZERO_AMP_PKT_CNT +1514 drivers/hid/hid-nintendo.c

c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1513  
669abca7b767f0 Aashish Sharma      2022-07-20 @1514  static const unsigned short JC_RUMBLE_ZERO_AMP_PKT_CNT = 5;
669abca7b767f0 Aashish Sharma      2022-07-20  1515  

:::::: The code at line 1514 was first introduced by commit
:::::: 669abca7b767f0daa34f6b965a415f7a9045703e HID: nintendo: Fix unused-const-variable compiler warning

:::::: TO: Aashish Sharma <shraash@google.com>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
