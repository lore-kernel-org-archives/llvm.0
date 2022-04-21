Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D4F1FA6
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 06:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650523437; x=1682059437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9+dxDIm0+feMgzZZmQKgNiv6PylkgIAbcs+ydU/3LBY=;
  b=VoyRoQ1ycrBM+e7yGzXmqqcyuZtNYm7AgODeKal8yV262OV9fHqnnZ5r
   6OFxbiqx9lVxagn/he7vXXKIWvHe5i/awLKMDP1TTcW71Tqdu5Hj2DL5f
   +kjY/bXo7ZCF0Qh0F29RoeM8HFBSpFC4oBMaiRIDYzjJzzRJFUs9C7/HT
   FE+HwRHfLdWFDFIHPT92IQkiUuJiBtQ7gj7MubjPPDDQPtsfQa3maX0js
   O73cWCvSczK+gaFtd4f4/z9YDmBsb/vkB8mjYt8wdrlPmbdX1rz+JRhqG
   SiQsvtiZgE03kVeaP6cXFfSEjXO4aYsxzhhORBucTSoTeWrKOhxcWnjkd
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="261857565"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="261857565"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 23:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="555609059"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Apr 2022 23:43:51 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhQXf-00080s-3F;
	Thu, 21 Apr 2022 06:43:51 +0000
Date: Thu, 21 Apr 2022 14:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 2110/2579] include/linux/fscrypt.h:757:30:
 error: implicit declaration of function 'file_inode' is invalid in C99
Message-ID: <202204210747.4hHN7nFz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe
commit: 1cb1e496fc95fd250b11d4ae7bd593cbe22bb5f6 [2110/2579] headers/deps: fs: Optimize <linux/fs.h> dependencies, remove <linux/fs_api.h> inclusion
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220421/202204210747.4hHN7nFz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=1cb1e496fc95fd250b11d4ae7bd593cbe22bb5f6
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 1cb1e496fc95fd250b11d4ae7bd593cbe22bb5f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/ fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from fs/crypto/fname.c:23:
   In file included from fs/crypto/fscrypt_private.h:14:
>> include/linux/fscrypt.h:757:30: error: implicit declaration of function 'file_inode' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           const struct inode *inode = file_inode(iocb->ki_filp);
                                       ^
   include/linux/fscrypt.h:757:22: warning: incompatible integer to pointer conversion initializing 'const struct inode *' with an expression of type 'int' [-Wint-conversion]
           const struct inode *inode = file_inode(iocb->ki_filp);
                               ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/file_inode +757 include/linux/fscrypt.h

c6c89783eba05a Eric Biggers 2022-01-28  753  
c6c89783eba05a Eric Biggers 2022-01-28  754  static inline bool fscrypt_dio_supported(struct kiocb *iocb,
c6c89783eba05a Eric Biggers 2022-01-28  755  					 struct iov_iter *iter)
c6c89783eba05a Eric Biggers 2022-01-28  756  {
c6c89783eba05a Eric Biggers 2022-01-28 @757  	const struct inode *inode = file_inode(iocb->ki_filp);
c6c89783eba05a Eric Biggers 2022-01-28  758  
c6c89783eba05a Eric Biggers 2022-01-28  759  	return !fscrypt_needs_contents_encryption(inode);
c6c89783eba05a Eric Biggers 2022-01-28  760  }
c6c89783eba05a Eric Biggers 2022-01-28  761  

:::::: The code at line 757 was first introduced by commit
:::::: c6c89783eba05a5e159b07cfd8c68d841cc5de42 fscrypt: add functions for direct I/O support

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
