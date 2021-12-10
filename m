Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03E22C99
	for <llvm@lists.linux.dev>; Fri, 10 Dec 2021 00:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639097449; x=1670633449;
  h=date:from:cc:subject:message-id:mime-version;
  bh=N2g9AUNwQg4mhHt8cP62BkNNr1ltXW0db/xAFSH71+o=;
  b=EjRB0LKRoirQHiSyq8Xk5Ig2XOVyPlSY0+TYvh9FURNHdH7oCG+64fIP
   J9U6ofheAkF56IBR5ysXG2Vk8BuZbN0mwls1jbwzday+L+agDHfJ3ndkq
   9UkdinX9+hZSTMnkMXPTkST/LIWpWIiZCrQmzghp1AXljz6T6sUqrRGHm
   8Th8L7gpZsTIWsDwHep2tumwn3RG1pwUAqNGdSyh5KuMos4mqXBnf3p39
   dQ+sp6z3k4CU58Y4P7bBvuKhQmGinmj/saZf8Yt/0/dO/hle5uVD2TyEE
   HMQkjYmgUplanySmf7kisNx+VDvNJyUZLmmauKwdEn2HsQu1fcm4D/Rnm
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="225108276"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; 
   d="scan'208";a="225108276"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 16:50:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; 
   d="scan'208";a="503714817"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 09 Dec 2021 16:50:48 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvU7b-0002Z9-RX; Fri, 10 Dec 2021 00:50:47 +0000
Date: Fri, 10 Dec 2021 08:50:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 302/5842] fs/configfs/dir.o: warning: objtool:
 configfs_mkdir()+0x315: unreachable instruction
Message-ID: <202112100832.1TIAHVom-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>

Hi Bartosz,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4eee8d0b64ecc3231040fa68ba750317ffca5c52
commit: 8336b1fe1552b8da46fb67bfacf1295db95890e9 [302/5842] configfs: implement committable items
config: x86_64-randconfig-a015-20211205 (https://download.01.org/0day-ci/archive/20211210/202112100832.1TIAHVom-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8336b1fe1552b8da46fb67bfacf1295db95890e9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8336b1fe1552b8da46fb67bfacf1295db95890e9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash crypto// drivers/ fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/configfs/dir.o: warning: objtool: configfs_mkdir()+0x315: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
