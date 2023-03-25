Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE8E643;
	Sat, 25 Mar 2023 04:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679720033; x=1711256033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sr2PaA2Wh83YrQlVsajUD78EG0G6QZQj52QwuWQtJF4=;
  b=g2id+mnMX6NdFPJEOWzW+ZxtMD2HkaIPpQ5ugJNvB6qQQbBYwt8YKSPZ
   26yy3LOExs4RgX6rla+ikW9ilPXh+fGnOzCwPCqtJ1E5SVrhJmejZ1Myf
   Z3orUwJPoEpwsJJ24fpMg3he/+yxQGolHevFQPwU7AkDm3KRAiZW6Wo4a
   Nj5zhwizOEjZAhZPw4uJEptfY5/GfjJxWiHJFR9Is78zQb+FnQxQzxucw
   UGqK5nrwINg7flVr4w1jHq81YWKknE3ostNbLWtlf0SD9sbuulwLxBxlu
   5Iv17FNd6xqw1E+FQfPhOj5RK1tPeDgm7GNU6C61mWsIBq3FQTLdqj/Aj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="323819292"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="323819292"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 21:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="928889773"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="928889773"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Mar 2023 21:53:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfvuU-000Fy3-2y;
	Sat, 25 Mar 2023 04:53:46 +0000
Date: Sat, 25 Mar 2023 12:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:iter-ubuf 2/2] lib/iov_iter.c:1786:9: warning: no
 previous prototype for function '__import_iovec_ubuf'
Message-ID: <202303251233.dDz1N6Ph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git iter-ubuf
head:   8ccf20004bd671f70362eac93833c12f5ce89c66
commit: 8ccf20004bd671f70362eac93833c12f5ce89c66 [2/2] iov_iter: import single vector iovecs as ITER_UBUF
config: arm-randconfig-r046-20230322 (https://download.01.org/0day-ci/archive/20230325/202303251233.dDz1N6Ph-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=8ccf20004bd671f70362eac93833c12f5ce89c66
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block iter-ubuf
        git checkout 8ccf20004bd671f70362eac93833c12f5ce89c66
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303251233.dDz1N6Ph-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/iov_iter.c:1786:9: warning: no previous prototype for function '__import_iovec_ubuf' [-Wmissing-prototypes]
   ssize_t __import_iovec_ubuf(int type, const struct iovec __user *uvec,
           ^
   lib/iov_iter.c:1786:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t __import_iovec_ubuf(int type, const struct iovec __user *uvec,
   ^
   static 
   1 warning generated.


vim +/__import_iovec_ubuf +1786 lib/iov_iter.c

  1782	
  1783	/*
  1784	 * Single segment iovec supplied by the user, import it as ITER_UBUF.
  1785	 */
> 1786	ssize_t __import_iovec_ubuf(int type, const struct iovec __user *uvec,
  1787				    struct iovec **iovp, struct iov_iter *i,
  1788				    bool compat)
  1789	{
  1790		struct iovec *iov = *iovp;
  1791		ssize_t ret;
  1792	
  1793		if (compat)
  1794			ret = copy_compat_iovec_from_user(iov, uvec, 1);
  1795		else
  1796			ret = copy_iovec_from_user(iov, uvec, 1);
  1797		if (unlikely(ret))
  1798			return ret;
  1799	
  1800		import_ubuf(type, iov->iov_base, iov->iov_len, i);
  1801		*iovp = NULL;
  1802		return i->count;
  1803	}
  1804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
