Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7110E7;
	Thu, 30 Mar 2023 21:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680211573; x=1711747573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cKeZbKWkg9z99bXtIqconGRjRMnNZctSQaGvAUstSvg=;
  b=AwdErX0DZ/nDjeZiLmUPqtYVoNH8VN/yN8UaioRYw/U51UBgGWjyYpgJ
   MqU/hKDrWxxy7V6k0jWwcHn8UXyBCIDSCwf3lACfGtA1vA9LPRqhu4som
   G0bIxEmJ2xOmPNBIwPOvVTDiLm8CkviCZoK1wA+8cKy7+YbmzrgH0ccyH
   YPgwgGsUbnwyRZMSHkP/0mA1Dp/QrlOPG5oYclhV9j6P4l73vMrz9fIoK
   ZWfSqYO9xgRpdsExe3VHDTnqJ1Uji3jQRKQ3exIWXuRZB6HkHGfytK4lR
   xxyHxC7G+lHujgAiie745BDElvp08ILOyG8X7kbuMgAPncFvFowb7lVQF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="340016061"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="340016061"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 14:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678353758"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="678353758"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 14:26:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phzmc-000LDk-1k;
	Thu, 30 Mar 2023 21:26:10 +0000
Date: Fri, 31 Mar 2023 05:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sheng Yong <shengyong@oppo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] f2fs: expand f2fs_compr_option to allow ioctl
 setting compression level
Message-ID: <202303310556.cf7vlToW-lkp@intel.com>
References: <20230330153719.3085164-1-shengyong@oppo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330153719.3085164-1-shengyong@oppo.com>

Hi Sheng,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev next-20230330]
[cannot apply to linus/master v6.3-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sheng-Yong/f2fs-expand-f2fs_compr_option-to-allow-ioctl-setting-compression-level/20230330-233928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230330153719.3085164-1-shengyong%40oppo.com
patch subject: [RFC PATCH] f2fs: expand f2fs_compr_option to allow ioctl setting compression level
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20230331/202303310556.cf7vlToW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d454d77b29654af47145c3ff3b9a59714f84ca6a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sheng-Yong/f2fs-expand-f2fs_compr_option-to-allow-ioctl-setting-compression-level/20230330-233928
        git checkout d454d77b29654af47145c3ff3b9a59714f84ca6a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310556.cf7vlToW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/f2fs.h:109:16: warning: // comments are not allowed in this language [-Wcomment]
                           __u8 value; // MSB 4 bit is version, LSB 4 bit is algorithm
                                       ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
