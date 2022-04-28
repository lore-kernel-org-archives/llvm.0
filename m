Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54588EC2
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 14:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651156442; x=1682692442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P7R3NniOUVQ571w6+hROLmu3RMmQFSvj5HRSEytbIvI=;
  b=jTdxPq1OfMAdjWQW8bFy+fQJfWn2qAcCIJcsG8uJguCPvVlEZ061+Nzf
   UtRTgYvrJ4IJUG/vuFmiZN66Y6mHvui1h/CcFMOjbcGvLZelmF0C5Wid1
   82056nTNAVS3/CoJlYeiI2PFHdLVVePs+az+4DWpMdSrajo7wTeDv9idX
   1xSDc9Rq9uL4VQkcX5+brTK/wjKLEQYpVG/MvWjehXWo13cJLTkvE3qkJ
   y40YBWRNzcIvmKJ7yS/JemTr9CCkmmYQbqWoKqpdPvud6Fb92ll2EdNI9
   o73glV8NuUpRWb/lkTzUOyfH+O4NNDUvwEmmkS0lSh6M6bZKokRVvVCrk
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="253689150"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="253689150"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 07:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="565624406"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Apr 2022 07:33:42 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nk5DB-0005Rk-85;
	Thu, 28 Apr 2022 14:33:41 +0000
Date: Thu, 28 Apr 2022 22:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 25/45]
 ld.lld: error: undefined symbol: fscache_begin_cache_operation
Message-ID: <202204282239.2Pg6F5y5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-linked-list
head:   a20ca5707a9b524115f5ded439fed1f8e552dd6b
commit: 506cacdcdfd787336db327e5f38d5a378d5998fd [25/45] fscache: Add a function to begin an cache op from a netfslib request
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220428/202204282239.2Pg6F5y5-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/506cacdcdfd787336db327e5f38d5a378d5998fd
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-linked-list
        git checkout 506cacdcdfd787336db327e5f38d5a378d5998fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fscache_begin_cache_operation
   >>> referenced by file.c
   >>>               afs/file.o:(afs_req_ops) in archive fs/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
