Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACF2814
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654173208; x=1685709208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrWWBee5O4ifRLN4PYOkj7/HILLNXclmDbcGW/+bYzo=;
  b=bV/D43R/7/b4DWwKjIK8Toz5ccka+Z+5JQIdLiPfOA/ysEV7zrcJjLb+
   BKs1ZubuYCr5lny7ZmgowMj2oYUsZksAfbY3jkvQauAwqdGIkEQJIyliY
   dREsTAXj5U9MJr50FxUV2QuOBS37vzAk2qLD9ZP2oNC6GXnmjn2VL5pCq
   XFb2fzulDe6qPDa05ChlZFDjAsycgwkIAfqQl7cgIOyk+OE5wx8RJfrSs
   bgnN9BFMDMg70G8womXSq1odGO8TavmOsBcDUxPZODr4w4amA9lMMQyPv
   acWTETJfZODTKtbcRH4yFGdSO+D/DnXi7SFgfJZTT6eCXtyCXxYvR/dUA
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="301298036"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="301298036"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 05:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="612802181"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Jun 2022 05:33:26 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwk0z-00054h-De;
	Thu, 02 Jun 2022 12:33:25 +0000
Date: Thu, 2 Jun 2022 20:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [axboe-block:for-5.20/io_uring 61/69] io_uring/io_uring.c:3795:6:
 warning: no previous prototype for function 'io_assign_file'
Message-ID: <202206022034.TQhzh79T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-5.20/io_uring
head:   35527d1da9a7caedd07ab1b0a2176ea80bbdf692
commit: 7d8795a4e662b005b70330c8038f486f4465e4de [61/69] io_uring: move poll handling into its own file
config: arm-buildonly-randconfig-r004-20220531 (https://download.01.org/0day-ci/archive/20220602/202206022034.TQhzh79T-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=7d8795a4e662b005b70330c8038f486f4465e4de
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-5.20/io_uring
        git checkout 7d8795a4e662b005b70330c8038f486f4465e4de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> io_uring/io_uring.c:3795:6: warning: no previous prototype for function 'io_assign_file' [-Wmissing-prototypes]
   bool io_assign_file(struct io_kiocb *req, unsigned int issue_flags)
        ^
   io_uring/io_uring.c:3795:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool io_assign_file(struct io_kiocb *req, unsigned int issue_flags)
   ^
   static 
   1 warning generated.


vim +/io_assign_file +3795 io_uring/io_uring.c

  3794	
> 3795	bool io_assign_file(struct io_kiocb *req, unsigned int issue_flags)
  3796	{
  3797		if (req->file || !io_op_defs[req->opcode].needs_file)
  3798			return true;
  3799	
  3800		if (req->flags & REQ_F_FIXED_FILE)
  3801			req->file = io_file_get_fixed(req, req->cqe.fd, issue_flags);
  3802		else
  3803			req->file = io_file_get_normal(req, req->cqe.fd);
  3804	
  3805		return !!req->file;
  3806	}
  3807	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
