Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7897C;
	Wed, 15 Feb 2023 03:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676430392; x=1707966392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QWHUZhQl/0rGUmSvkNnvpWuIYRpUMTCITJ2hJYkV61g=;
  b=CjjNjumpHZ4imcy2UnsTDSOJnbfILo8ui3j0U3yMVVw5368YvBobXs97
   XwXkPUPCgBK5DkeY1rTzJxar/6guVk3zglRs2evKZYrelzq5ocvz4bPDL
   8czHAwuvbT41quutPWj/K0+gveJQM9/8UUvLr57PlGbhiXK/uNvt/Uqpc
   8CUBGllNTyGznxgC4SalmN1ioX4TjQ2Ky+B1dZe8I+D/BEVW8baKPvAVu
   zAPEK9qFJhaYoBVhQK/AHRv9y1vPOUqFOGvUwpZbWz3JpLw634i9phOIy
   ihG67T7379XiE1RtxOkpRPizZ0QsAMMrnU9nyo9iUZel3vcgQbUAipXLr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="393734696"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="393734696"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 19:06:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="701869200"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="701869200"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Feb 2023 19:06:30 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS87p-0008yJ-1R;
	Wed, 15 Feb 2023 03:06:29 +0000
Date: Wed, 15 Feb 2023 11:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/iov-cifs 6/16] ERROR: modpost:
 "direct_splice_read" [fs/cifs/cifs.ko] undefined!
Message-ID: <202302151059.ctzZGP8M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-cifs
head:   88f921fbd55dd896385d04ccbf1f820c2b8cf921
commit: 93a7b7f1f49b3e6109b68ef88970af926ee20c49 [6/16] cifs: Implement splice_read to pass down ITER_BVEC not ITER_PIPE
config: i386-randconfig-a003-20230213 (https://download.01.org/0day-ci/archive/20230215/202302151059.ctzZGP8M-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/93a7b7f1f49b3e6109b68ef88970af926ee20c49
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/iov-cifs
        git checkout 93a7b7f1f49b3e6109b68ef88970af926ee20c49
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302151059.ctzZGP8M-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "direct_splice_read" [fs/cifs/cifs.ko] undefined!
>> ERROR: modpost: "filemap_splice_read" [fs/cifs/cifs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
