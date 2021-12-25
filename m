Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17582C9D
	for <llvm@lists.linux.dev>; Sat, 25 Dec 2021 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640466264; x=1672002264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VIVquXJKsmg6nvyu2b9Ih/X7m359JTEc4HYnYqA1bfM=;
  b=FYjzvPgwBayJ7q1L4fttmRa5Yatu8NjBYeyfNUwAUNuS5HgKQtG+ipUj
   fQ38RJObbcDNg+uN7oJ/B86LlCi29PdK7c+x25W05uljw+wlKppl7VIwi
   PcEte3zpxJbgryzSl6AiczdwBBFeFoQwtm65j4b4qjUYMqDxm65rbg+2W
   amxbTdDV4IGBnIHV8jyQFcnSKN1tMccX3n7kSQtpu85sdJdFDtRdu8p//
   xGq69yCx+51Ek6Gti9KpCi5/HW2b7LQKjb9ngRflWDqjI5tDw4epbet5D
   3jJZ1LQ2HWfGD1RTN9gT21/VIBuPFMzSzWP1Ukj3zUCQfDenUpeVLr/+a
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10208"; a="240865886"
X-IronPort-AV: E=Sophos;i="5.88,236,1635231600"; 
   d="scan'208";a="240865886"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2021 13:04:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,236,1635231600"; 
   d="scan'208";a="571672248"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Dec 2021 13:04:20 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1EDE-0004gL-4t; Sat, 25 Dec 2021 21:04:20 +0000
Date: Sun, 26 Dec 2021 05:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: Leonard Crestez <cdleonard@gmail.com>, David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Philip Paeps <philip@trouble.is>,
	Dmitry Safonov <0x7f454c46@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	Jakub Kicinski <kuba@kernel.org>, Yuchung Cheng <ycheng@google.com>
Subject: Re: [PATCH v4 16/19] tcp: authopt: Add /proc/net/tcp_authopt listing
 all keys
Message-ID: <202112260500.dMAhM2XB-lkp@intel.com>
References: <80510f065b3b17d36626962cd7c7719036a6f9e1.1640273966.git.cdleonard@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80510f065b3b17d36626962cd7c7719036a6f9e1.1640273966.git.cdleonard@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Leonard,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on f4f2970dfd87e5132c436e6125148914596a9863]

url:    https://github.com/0day-ci/linux/commits/Leonard-Crestez/tcp-Initial-support-for-RFC5925-auth-option/20211223-234349
base:   f4f2970dfd87e5132c436e6125148914596a9863
config: riscv-randconfig-c006-20211226 (https://download.01.org/0day-ci/archive/20211226/202112260500.dMAhM2XB-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1ee7fd44b53c555a7823ae8fd1a8209c520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/78eca32fd5749f14aa4db0d123364a310f70392b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Leonard-Crestez/tcp-Initial-support-for-RFC5925-auth-option/20211223-234349
        git checkout 78eca32fd5749f14aa4db0d123364a310f70392b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/iio/accel/ net/ipv4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_authopt.c:1742:36: warning: unused variable 'tcp_authopt_seq_ops' [-Wunused-const-variable]
   static const struct seq_operations tcp_authopt_seq_ops = {
                                      ^
   1 warning generated.


vim +/tcp_authopt_seq_ops +1742 net/ipv4/tcp_authopt.c

  1741	
> 1742	static const struct seq_operations tcp_authopt_seq_ops = {
  1743		.start		= tcp_authopt_seq_start,
  1744		.next		= tcp_authopt_seq_next,
  1745		.stop		= tcp_authopt_seq_stop,
  1746		.show		= tcp_authopt_seq_show,
  1747	};
  1748	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
