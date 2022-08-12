Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548281371
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 14:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660312968; x=1691848968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tURBSLvapNKWKLrlqWooe5/2I5z7MCFJwhSBW2wdemg=;
  b=WGn1tgkL+M/TdMIkeC8vz0Wwmo7jSe2di7UX65NcheW2z/HvjoRnu1Tk
   TTDiSH/yhDPYSgjCEiHey/gvRqGyLJw0BgRkF3FjQrLK2yTV/BaBXzstb
   yJ4aidQEvHSZ+qHMFzlOpuZsXTNBBkMkeVHYh8sBSpoxIb7mAXNdV0i3u
   hujjp6XL1dhxI9p2nAw0aaC/ugBGk8qqfd6Efuhe5rYXvDPlLxjZ0wVzW
   ifWV/zCajeWB7gsnBDo+h6T/Cl/jy2JLZpl7ODwvZtuNJ5lZdVrTC+44F
   62EHiFm9y621zRWYf28LgiI86V1pAKaHFtNquLmNGY2H18pOsWgtFjAMd
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="289169286"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="289169286"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 07:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="556523354"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Aug 2022 07:02:45 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMVFM-0000bJ-1K;
	Fri, 12 Aug 2022 14:02:44 +0000
Date: Fri, 12 Aug 2022 22:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:totally-untested/remaining-fam0 1/2]
 drivers/net/can/usb/etas_es58x/es58x_core.h:225:5: error: flexible array
 member 'raw_cmd' in a union is not allowed
Message-ID: <202208122128.dEarB7X1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git totally-untested/remaining-fam0
head:   b0684d2f714f4ae515c283697c48d14e3ccef21b
commit: 9b8e2a44bb97e6316a5d268f9812543e2f6f1d44 [1/2] totally-untested: remaining zero-length arrays in unions in next-20220811
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220812/202208122128.dEarB7X1-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?id=9b8e2a44bb97e6316a5d268f9812543e2f6f1d44
        git remote add gustavoars https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git
        git fetch --no-tags gustavoars totally-untested/remaining-fam0
        git checkout 9b8e2a44bb97e6316a5d268f9812543e2f6f1d44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/net/can/usb/etas_es58x/es58x_core.c:20:
>> drivers/net/can/usb/etas_es58x/es58x_core.h:225:5: error: flexible array member 'raw_cmd' in a union is not allowed
           u8 raw_cmd[];
              ^
   1 error generated.


vim +/raw_cmd +225 drivers/net/can/usb/etas_es58x/es58x_core.h

   216	
   217	union es58x_urb_cmd {
   218		struct es581_4_urb_cmd es581_4_urb_cmd;
   219		struct es58x_fd_urb_cmd es58x_fd_urb_cmd;
   220		struct {		/* Common header parts of all variants */
   221			__le16 sof;
   222			u8 cmd_type;
   223			u8 cmd_id;
   224		} __packed;
 > 225		u8 raw_cmd[];
   226	};
   227	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
