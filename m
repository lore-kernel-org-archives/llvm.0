Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65147F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 23:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659395576; x=1690931576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G9bgKXvdBj+4w1asG6gUtTJ6Z+qCX6yLZ9jUh+LTVog=;
  b=IIWHeNl9I73Zj58abSqwwww8G0vrVW2J7pZoyQ8Dca/zR//yZBoUVKUG
   Vyu14KUDPoxBXZWx34pChhYoflBD/VGTm424h9snbHimazjsBGho3ZJih
   kIQF83QTYLbkASWgXcaa64V2eQIea7ebbeZzYlh423ALtaUZh1fPnRVA1
   bnyOaKm6jTIEXZ66r8G2Uzw2TSxVADQ4CxbvS8HFpZDSnh9/WUVC1shET
   2L2+j4191IwuO4u8UjEKJA5Gp8VHk0jG/05Os5QOYnIPUZqox7fzJNBSv
   HOXEQ2dr6TbL2kS0qpqy5yk6f3khvVreqAeyZXdokPl+IVCwRiuX1nKnx
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="350979676"
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="350979676"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 16:12:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="744454444"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2022 16:12:54 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIeak-000FT6-0h;
	Mon, 01 Aug 2022 23:12:54 +0000
Date: Tue, 2 Aug 2022 07:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Suniel Mahesh <sunil@amarulasolutions.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 1/2] usb: gadget: f_hid: Extend functionality for
 GET_REPORT mode
Message-ID: <202208020708.SdOu2dlp-lkp@intel.com>
References: <20220801123010.2984864-2-sunil@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801123010.2984864-2-sunil@amarulasolutions.com>

Hi Suniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on usb/usb-testing]
[also build test ERROR on linus/master balbi-usb/testing/next peter-chen-usb/for-usb-next v5.19 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suniel-Mahesh/Extend-functionality-for-GET_REPORT/20220801-204541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: i386-randconfig-a002-20220801 (https://download.01.org/0day-ci/archive/20220802/202208020708.SdOu2dlp-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9211662f0f3d90b67bd34041c8f292b883345d9d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Suniel-Mahesh/Extend-functionality-for-GET_REPORT/20220801-204541
        git checkout 9211662f0f3d90b67bd34041c8f292b883345d9d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> error: include/uapi/linux/usb/g_hid.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[2]: *** [scripts/Makefile.headersinst:63: usr/include/linux/usb/g_hid.h] Error 1
   make[2]: Target '__headers' not remade because of errors.
   make[1]: *** [Makefile:1286: headers] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
