Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E92110B;
	Thu,  2 Mar 2023 05:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677733385; x=1709269385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QCrY8IccKuFkKPyKDtCnKQ/AOitu19+NGq+DifguEqE=;
  b=JJ1LWvECtlvwnKNFo1fZzeu03gQPpdkQwNjj+c8K/t1+IX5cligKpSpg
   tU48WfQOtt1NNke6/H34ZEt12gLMAjNPTfW1aTxo9NOaeggEcEEG+HREY
   U8XDmMNlb8GSbLzew86g8pFsM4BouHFVVIGdbIgDIiM1Ax6czhdy0uX5x
   O61cVn3yCQJR+WSR5B4AOqfawvwsSwM0oG0ZJwdAGBHE4ELhyEAPncyCO
   a/Py6+i6yiIa9ucFdW1LNs9AW3DazGozfUYVRxZzvDh7RZ7y/Pie3i8kz
   4vtZjWHFDfvIjuRb4dh6+auHTbJoTXx7HMCbmVA+Lvi1FhbxC6BrWo8Ho
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332101778"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="332101778"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 21:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="1003963694"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="1003963694"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Mar 2023 21:03:02 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXb5p-0000Dx-2k;
	Thu, 02 Mar 2023 05:03:01 +0000
Date: Thu, 2 Mar 2023 13:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org, chao@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH] f2fs: add discard_cpuset mount opt
Message-ID: <202303021251.ExUzrEYm-lkp@intel.com>
References: <20230301152212.53951-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301152212.53951-1-frank.li@vivo.com>

Hi Yangtao,

I love your patch! Yet something to improve:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master next-20230302]
[cannot apply to v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yangtao-Li/f2fs-add-discard_cpuset-mount-opt/20230301-232500
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230301152212.53951-1-frank.li%40vivo.com
patch subject: [PATCH] f2fs: add discard_cpuset mount opt
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230302/202303021251.ExUzrEYm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fdcaea1b50e37d5bcfcc186db80237edc04cfafc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yangtao-Li/f2fs-add-discard_cpuset-mount-opt/20230301-232500
        git checkout fdcaea1b50e37d5bcfcc186db80237edc04cfafc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021251.ExUzrEYm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "kthread_bind_mask" [fs/f2fs/f2fs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
