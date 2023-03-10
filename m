Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9162F2F32;
	Fri, 10 Mar 2023 22:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678488874; x=1710024874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V/dmuPH5J4lz1oCtHGZQKlLQgAaqRC4hYmOWTulJQbo=;
  b=f2TOxtGeob6omjz8MveEUpzY6MGYoyJLQBERpOq8c6/s3bMv1Rl0f6Hf
   SQJlyswQF5KuJL6CQ9G0tWX2oqf9ncEL8uMVGDidH1UFi2kl6fKnaBrIy
   iOaqdTuRbW12NnUc1R8Cut5dMzdnIDKOA/HCEUeQQoLkez4lQFcy5Groa
   mF9j6dT9i3LILcQUqf1gfhZ2eYovrLMGNFm9A7hq4ZN1IxLKdT+ww97cK
   l/d656UJ6KO4eh73AS87dxuz8skwhDSt9rsVqDYiNl2jepffHR068OnmT
   u7jS7uczJrJkGUHtPKh8jMogD+3RcJdV0HRQJ2cfKlxeHddTVtE1S04gJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="335542884"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="335542884"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 14:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="788205773"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="788205773"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2023 14:54:31 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pald8-000497-22;
	Fri, 10 Mar 2023 22:54:30 +0000
Date: Sat, 11 Mar 2023 06:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/pipe-list 30/30]
 crypto/algif_skcipher.c:197:3: error: field designator 'sendpage' does not
 refer to any field in type 'struct proto_ops'
Message-ID: <202303110643.lt2c86An-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

First bad commit (maybe != root cause):

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/pipe-list
head:   e76345d9b0b65f673fbee4ce5c3ef8450e89638e
commit: e76345d9b0b65f673fbee4ce5c3ef8450e89638e [30/30] sock: Remove ->sendpage*() in favour of sendmsg(MSG_SPLICE_PAGES)
config: powerpc-randconfig-r005-20230310 (https://download.01.org/0day-ci/archive/20230311/202303110643.lt2c86An-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/e76345d9b0b65f673fbee4ce5c3ef8450e89638e
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/pipe-list
        git checkout e76345d9b0b65f673fbee4ce5c3ef8450e89638e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash crypto/ net/unix/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110643.lt2c86An-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/algif_skcipher.c:197:3: error: field designator 'sendpage' does not refer to any field in type 'struct proto_ops'
           .sendpage       =       af_alg_sendpage,
            ^
   crypto/algif_skcipher.c:288:3: error: field designator 'sendpage' does not refer to any field in type 'struct proto_ops'
           .sendpage       =       skcipher_sendpage_nokey,
            ^
   2 errors generated.
--
>> crypto/algif_aead.c:371:3: error: field designator 'sendpage' does not refer to any field in type 'struct proto_ops'
           .sendpage       =       af_alg_sendpage,
            ^
   crypto/algif_aead.c:462:3: error: field designator 'sendpage' does not refer to any field in type 'struct proto_ops'
           .sendpage       =       aead_sendpage_nokey,
            ^
   2 errors generated.
--
>> net/unix/af_unix.c:855:3: error: field designator 'sendpage' does not refer to any field in type 'const struct proto_ops'
           .sendpage =     unix_stream_sendpage,
            ^
   1 error generated.


vim +197 crypto/algif_skcipher.c

8ff590903d5fc7 Herbert Xu      2010-10-19  181  
8ff590903d5fc7 Herbert Xu      2010-10-19  182  static struct proto_ops algif_skcipher_ops = {
8ff590903d5fc7 Herbert Xu      2010-10-19  183  	.family		=	PF_ALG,
8ff590903d5fc7 Herbert Xu      2010-10-19  184  
8ff590903d5fc7 Herbert Xu      2010-10-19  185  	.connect	=	sock_no_connect,
8ff590903d5fc7 Herbert Xu      2010-10-19  186  	.socketpair	=	sock_no_socketpair,
8ff590903d5fc7 Herbert Xu      2010-10-19  187  	.getname	=	sock_no_getname,
8ff590903d5fc7 Herbert Xu      2010-10-19  188  	.ioctl		=	sock_no_ioctl,
8ff590903d5fc7 Herbert Xu      2010-10-19  189  	.listen		=	sock_no_listen,
8ff590903d5fc7 Herbert Xu      2010-10-19  190  	.shutdown	=	sock_no_shutdown,
8ff590903d5fc7 Herbert Xu      2010-10-19  191  	.mmap		=	sock_no_mmap,
8ff590903d5fc7 Herbert Xu      2010-10-19  192  	.bind		=	sock_no_bind,
8ff590903d5fc7 Herbert Xu      2010-10-19  193  	.accept		=	sock_no_accept,
8ff590903d5fc7 Herbert Xu      2010-10-19  194  
8ff590903d5fc7 Herbert Xu      2010-10-19  195  	.release	=	af_alg_release,
8ff590903d5fc7 Herbert Xu      2010-10-19  196  	.sendmsg	=	skcipher_sendmsg,
2d97591ef43d05 Stephan Mueller 2017-08-02 @197  	.sendpage	=	af_alg_sendpage,
8ff590903d5fc7 Herbert Xu      2010-10-19  198  	.recvmsg	=	skcipher_recvmsg,
a11e1d432b51f6 Linus Torvalds  2018-06-28  199  	.poll		=	af_alg_poll,
8ff590903d5fc7 Herbert Xu      2010-10-19  200  };
8ff590903d5fc7 Herbert Xu      2010-10-19  201  

:::::: The code at line 197 was first introduced by commit
:::::: 2d97591ef43d0587be22ad1b0d758d6df4999a0b crypto: af_alg - consolidation of duplicate code

:::::: TO: Stephan Mueller <smueller@chronox.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
