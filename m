Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5827BD530;
	Tue, 21 Mar 2023 20:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679429875; x=1710965875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3B4GFJqcCrzSiNmmoO4Rxjx/uq3JsBBmVSGBit3rgaA=;
  b=UDS56qfXYhZTABm4OGJ92PEE//9AXm8dRG34A/f1Hg7N4cfZsXOmj/wZ
   Bz+B3C8CpGh38iqMfbRfvESgTh4gD74qQf5AhryenXpYr3lKcanqT32Nw
   ra/MbV3kNRUZoNlvtg5vbJG7xgQ9oKDby6tmQ5BSeqclgJ+k7Cm8Hjt1H
   DDemOGiRZhNaLgDDB0n5vYSpzzGBMYNR9qvx7dDXDTklRCQ9i3wKFqs0A
   mwFpl38Q1oF2JUdsGjEn4vpPEopnz9H/7VnkysHHbgx2gRO+CNQ8P9PtF
   ZPROtB2/cFEb7QeGvGFJCH7ORl8t6B7MDG8/ZAgVtIQZ6Yv3Kmr161WvA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366790008"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="366790008"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 13:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792236798"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="792236798"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 13:17:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peiQZ-000CNG-2o;
	Tue, 21 Mar 2023 20:17:51 +0000
Date: Wed, 22 Mar 2023 04:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-sendpage 1/1] drivers/isdn/mISDN/socket.c:579:13:
 error: incompatible function pointer types initializing 'int (*)(struct
 socket *, struct msghdr *)' with an expression of type 'int (struct socket
 *, struct msghdr *, size_t)' (aka 'int (struct socket *, struct msghdr *...
Message-ID: <202303220413.IJ5tHSUX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-sendpage
head:   a5671f4448e7760c4d253d2ae2051ead0ef30304
commit: a5671f4448e7760c4d253d2ae2051ead0ef30304 [1/1] net: Drop the size argument from ->sendmsg()
config: i386-randconfig-a002-20230320 (https://download.01.org/0day-ci/archive/20230322/202303220413.IJ5tHSUX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=a5671f4448e7760c4d253d2ae2051ead0ef30304
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs iov-sendpage
        git checkout a5671f4448e7760c4d253d2ae2051ead0ef30304
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/isdn/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220413.IJ5tHSUX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/isdn/mISDN/socket.c:579:13: error: incompatible function pointer types initializing 'int (*)(struct socket *, struct msghdr *)' with an expression of type 'int (struct socket *, struct msghdr *, size_t)' (aka 'int (struct socket *, struct msghdr *, unsigned int)') [-Werror,-Wincompatible-function-pointer-types]
           .sendmsg        = mISDN_sock_sendmsg,
                             ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +579 drivers/isdn/mISDN/socket.c

1b2b03f8e514e4 Karsten Keil   2008-07-27  571  
1b2b03f8e514e4 Karsten Keil   2008-07-27  572  static const struct proto_ops data_sock_ops = {
1b2b03f8e514e4 Karsten Keil   2008-07-27  573  	.family		= PF_ISDN,
1b2b03f8e514e4 Karsten Keil   2008-07-27  574  	.owner		= THIS_MODULE,
1b2b03f8e514e4 Karsten Keil   2008-07-27  575  	.release	= data_sock_release,
1b2b03f8e514e4 Karsten Keil   2008-07-27  576  	.ioctl		= data_sock_ioctl,
1b2b03f8e514e4 Karsten Keil   2008-07-27  577  	.bind		= data_sock_bind,
1b2b03f8e514e4 Karsten Keil   2008-07-27  578  	.getname	= data_sock_getname,
1b2b03f8e514e4 Karsten Keil   2008-07-27 @579  	.sendmsg	= mISDN_sock_sendmsg,
1b2b03f8e514e4 Karsten Keil   2008-07-27  580  	.recvmsg	= mISDN_sock_recvmsg,
a11e1d432b51f6 Linus Torvalds 2018-06-28  581  	.poll		= datagram_poll,
1b2b03f8e514e4 Karsten Keil   2008-07-27  582  	.listen		= sock_no_listen,
1b2b03f8e514e4 Karsten Keil   2008-07-27  583  	.shutdown	= sock_no_shutdown,
1b2b03f8e514e4 Karsten Keil   2008-07-27  584  	.setsockopt	= data_sock_setsockopt,
1b2b03f8e514e4 Karsten Keil   2008-07-27  585  	.getsockopt	= data_sock_getsockopt,
1b2b03f8e514e4 Karsten Keil   2008-07-27  586  	.connect	= sock_no_connect,
1b2b03f8e514e4 Karsten Keil   2008-07-27  587  	.socketpair	= sock_no_socketpair,
1b2b03f8e514e4 Karsten Keil   2008-07-27  588  	.accept		= sock_no_accept,
1b2b03f8e514e4 Karsten Keil   2008-07-27  589  	.mmap		= sock_no_mmap
1b2b03f8e514e4 Karsten Keil   2008-07-27  590  };
1b2b03f8e514e4 Karsten Keil   2008-07-27  591  

:::::: The code at line 579 was first introduced by commit
:::::: 1b2b03f8e514e4f68e293846ba511a948b80243c Add mISDN core files

:::::: TO: Karsten Keil <kkeil@suse.de>
:::::: CC: Karsten Keil <kkeil@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
