Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B95A7A
	for <llvm@lists.linux.dev>; Thu, 16 Jun 2022 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655366876; x=1686902876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PJ6GmqZ9PT2Awp3dplYnHTw/TGRHqjdNrF02ItrKOV4=;
  b=NCM4gIqGC4iaRNNNRe7BRwxJO3/ZTsL7KsuVLstn8SDYMQIlZ2Jm89bt
   X6KZbqEl744WLpV7E2yPW9AkGYdFhHTWcYOvAvu1pzKUtpphX9Xz+AbCF
   3HvFx7gKNg4V8GZOJ1V0vL9l6YUI6lHyIRN5dbLZyxz1Ja0KOAj4w/7os
   V1qm5E2WFNBZUz+LUaJ4J0mrlzf6zgPBKOnAdVsN7sNyRS2Dw2tjQr8DG
   24JjpMGTayXKNnyma+xlZGJT7rjooBY16k0cDmQib1Ofjn7NCAgogxUBf
   iYARnya42cdGIVdHxe23E1l85gb5zg/zqqAkAHNf/5S4iC/QLGOP+8n2V
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="276769214"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="276769214"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 01:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="713276247"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jun 2022 01:07:52 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1kXf-000OCL-IE;
	Thu, 16 Jun 2022 08:07:51 +0000
Date: Thu, 16 Jun 2022 16:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-ringless-2 15/24]
 net/rxrpc/output.c:23:19: warning: unused variable 'sa'
Message-ID: <202206161534.tpQzkyUT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/rxrpc-ringless-2
head:   3f41f1279858b9676cd6724d54e4323696e1ac07
commit: 4d6e89b6fafafd93ba38b1d86b8adbaa4401802c [15/24] rxrpc: Call udp_sendmsg() directly
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220616/202206161534.tpQzkyUT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/4d6e89b6fafafd93ba38b1d86b8adbaa4401802c
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/rxrpc-ringless-2
        git checkout 4d6e89b6fafafd93ba38b1d86b8adbaa4401802c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/rxrpc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/rxrpc/output.c:23:19: warning: unused variable 'sa' [-Wunused-variable]
           struct sockaddr *sa = msg->msg_name;
                            ^
   1 warning generated.


vim +/sa +23 net/rxrpc/output.c

    20	
    21	static ssize_t do_udp_sendmsg(struct socket *sk, struct msghdr *msg, size_t len)
    22	{
  > 23		struct sockaddr *sa = msg->msg_name;
    24	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
