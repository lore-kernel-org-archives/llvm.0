Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7475C2C80
	for <llvm@lists.linux.dev>; Thu,  2 Dec 2021 21:59:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="236788410"
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; 
   d="scan'208";a="236788410"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2021 13:59:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; 
   d="scan'208";a="513388058"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 02 Dec 2021 13:59:42 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1msu7C-000Gih-0P; Thu, 02 Dec 2021 21:59:42 +0000
Date: Fri, 3 Dec 2021 05:59:00 +0800
From: kernel test robot <lkp@intel.com>
To: Akhmat Karakotov <hmukos@yandex-team.ru>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2 net-next 2/4] txhash: Add socket option to control
 TX hash rethink behavior
Message-ID: <202112030521.vwMOWAw9-lkp@intel.com>
References: <20211202164031.18134-3-hmukos@yandex-team.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202164031.18134-3-hmukos@yandex-team.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Akhmat,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on arnd-asm-generic/master]
[cannot apply to net-next/master deller-parisc/for-next bpf-next/master bpf/master linus/master davem-sparc/master v5.16-rc3 next-20211202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Akhmat-Karakotov/txhash-Make-rethinking-txhash-behavior-configurable-via-sysctl/20211203-014057
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
config: arm-buildonly-randconfig-r001-20211202 (https://download.01.org/0day-ci/archive/20211203/202112030521.vwMOWAw9-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/5a9ea3173f8cf5ee10364ba8150d0eb9d43d8cc2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Akhmat-Karakotov/txhash-Make-rethinking-txhash-behavior-configurable-via-sysctl/20211203-014057
        git checkout 5a9ea3173f8cf5ee10364ba8150d0eb9d43d8cc2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv4/inet_connection_sock.c:1049:22: warning: result of comparison of constant -1 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
           if (sk->sk_txrehash == SOCK_TXREHASH_DEFAULT)
               ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +1049 net/ipv4/inet_connection_sock.c

  1037	
  1038	int inet_csk_listen_start(struct sock *sk, int backlog)
  1039	{
  1040		struct inet_connection_sock *icsk = inet_csk(sk);
  1041		struct inet_sock *inet = inet_sk(sk);
  1042		int err = -EADDRINUSE;
  1043	
  1044		reqsk_queue_alloc(&icsk->icsk_accept_queue);
  1045	
  1046		sk->sk_ack_backlog = 0;
  1047		inet_csk_delack_init(sk);
  1048	
> 1049		if (sk->sk_txrehash == SOCK_TXREHASH_DEFAULT)
  1050			sk->sk_txrehash = READ_ONCE(sock_net(sk)->core.sysctl_txrehash);
  1051	
  1052		/* There is race window here: we announce ourselves listening,
  1053		 * but this transition is still not validated by get_port().
  1054		 * It is OK, because this socket enters to hash table only
  1055		 * after validation is complete.
  1056		 */
  1057		inet_sk_state_store(sk, TCP_LISTEN);
  1058		if (!sk->sk_prot->get_port(sk, inet->inet_num)) {
  1059			inet->inet_sport = htons(inet->inet_num);
  1060	
  1061			sk_dst_reset(sk);
  1062			err = sk->sk_prot->hash(sk);
  1063	
  1064			if (likely(!err))
  1065				return 0;
  1066		}
  1067	
  1068		inet_sk_set_state(sk, TCP_CLOSE);
  1069		return err;
  1070	}
  1071	EXPORT_SYMBOL_GPL(inet_csk_listen_start);
  1072	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
