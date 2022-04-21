Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5181D1FA2
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 18:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650567275; x=1682103275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rnJ8AOQ+F107nQufb8ck2W0XHYKcNKoRr+IZqyjKpwg=;
  b=BLuUMvNm8UIUPWwz1sMB23Y7DkaxgP64+BzUQD4yFVxtl2VCrdRzDncw
   at1qWUa3cIB+c1eXu96RhiiVJhufO1ZBNCGTghzt7F7ic6quKSmGUQ9rp
   zVnxqpmRFjv24cpG922Mxcwdcp91iH0WfDArNfasfAXteO3Zn0rwOYLem
   itcwwawOylUnZns6UVob/IuagS6ahmkvI2nkQx4/7dphXwwHYO3KLFHjs
   GuOWNdlI+xRQNp3YmnJd9Ak885LeB87eFDC829FPUxElKT5eEOSeQOiBo
   YLy8JMgqly+W5+MrxhACilQe4pUtoLBy7RBtdYUw4GiTt3lJ8Pucoj3hE
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="263297701"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="263297701"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 11:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="615041508"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2022 11:54:33 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhbwm-0008gD-Uh;
	Thu, 21 Apr 2022 18:54:32 +0000
Date: Fri, 22 Apr 2022 02:53:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [dhowells-fs:rxrpc-ringless 17/21] ld.lld: error: undefined symbol:
 udpv6_sendmsg
Message-ID: <202204220240.iPx7FQgd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-ringless
head:   c388a8388ad238ffbe0cd204c3eacaf200055751
commit: d24f75894c69b625aaa8f2b937072e750a5787df [17/21] rxrpc: Call udp_sendmsg() directly
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220422/202204220240.iPx7FQgd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=d24f75894c69b625aaa8f2b937072e750a5787df
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs rxrpc-ringless
        git checkout d24f75894c69b625aaa8f2b937072e750a5787df
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: udpv6_sendmsg
   >>> referenced by output.c
   >>>               rxrpc/output.o:(rxrpc_send_abort_packet) in archive net/built-in.a
   >>> referenced by output.c
   >>>               rxrpc/output.o:(rxrpc_reject_packets) in archive net/built-in.a
   >>> referenced by output.c
   >>>               rxrpc/output.o:(rxrpc_send_keepalive) in archive net/built-in.a
   >>> referenced 3 more times

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
