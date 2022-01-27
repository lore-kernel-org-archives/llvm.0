Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C05F168
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643298785; x=1674834785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QssZTDIf2fNZDmmpnhEA2kuDiKjwkOgEBw2ZdOUxWv0=;
  b=JQifm1EZzgryiBmo7OG01vNgn0q4c03fOOPAlVQHNjQjy1j9ZyqR30N7
   UPguHcNhw9h/zfEtv1JeTgtTycy/ntohRmf0s9RjZkliQH+v73DOgtMLK
   eAnLUxCz4a74Z5DogMtp7HTROfrRRN/Ama+QKHTohUFapgKACXsdjhU95
   29Mj2xoJi+w/xGhIUJ+WaCWPK7oQYbhC0wAjEJr7RA7CE9CAcS0kTB7sL
   I+CosStMJBucxiK6/dhaIo+mANnJNjk9o9Ck05/ipbvv/tnkZq+K3XN+3
   /zYWU+4bqE5TsEPOzjiCMADLpFyc64z0H+9UFWWeBsEOno2XKWpzAlxFt
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245733505"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="245733505"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 07:53:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="533151794"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jan 2022 07:53:01 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nD753-000Mk9-9l; Thu, 27 Jan 2022 15:53:01 +0000
Date: Thu, 27 Jan 2022 23:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: "D. Wythe" <alibuda@linux.alibaba.com>, kgraul@linux.ibm.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kuba@kernel.org,
	davem@davemloft.net, netdev@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
	"D. Wythe" <alibuda@linux.alibaba.com>
Subject: Re: [PATCH net-next 2/3] net/smc: Limits backlog connections
Message-ID: <202201272328.JtsPKLkq-lkp@intel.com>
References: <9b52fc3f11a2ae6f23224a178fd4cff9f9dd4eaa.1643284658.git.alibuda@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b52fc3f11a2ae6f23224a178fd4cff9f9dd4eaa.1643284658.git.alibuda@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Wythe",

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/0day-ci/linux/commits/D-Wythe/Optimizing-performance-in-short-lived/20220127-200912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git fbb8295248e1d6f576d444309fcf79356008eac1
config: mips-buildonly-randconfig-r004-20220124 (https://download.01.org/0day-ci/archive/20220127/202201272328.JtsPKLkq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f32dccb9a43b02ce4e540d6ba5dbbdb188f2dc7d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/718aff24f3fcc73ecb7bff17fcbe029b799c6624
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review D-Wythe/Optimizing-performance-in-short-lived/20220127-200912
        git checkout 718aff24f3fcc73ecb7bff17fcbe029b799c6624
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/ net/smc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/smc/af_smc.c:2202:18: error: assigning to 'struct inet_connection_sock_af_ops *' from 'const struct inet_connection_sock_af_ops *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           smc->ori_af_ops = inet_csk(smc->clcsock->sk)->icsk_af_ops;
                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +2202 net/smc/af_smc.c

  2166	
  2167	static int smc_listen(struct socket *sock, int backlog)
  2168	{
  2169		struct sock *sk = sock->sk;
  2170		struct smc_sock *smc;
  2171		int rc;
  2172	
  2173		smc = smc_sk(sk);
  2174		lock_sock(sk);
  2175	
  2176		rc = -EINVAL;
  2177		if ((sk->sk_state != SMC_INIT && sk->sk_state != SMC_LISTEN) ||
  2178		    smc->connect_nonblock)
  2179			goto out;
  2180	
  2181		rc = 0;
  2182		if (sk->sk_state == SMC_LISTEN) {
  2183			sk->sk_max_ack_backlog = backlog;
  2184			goto out;
  2185		}
  2186		/* some socket options are handled in core, so we could not apply
  2187		 * them to the clc socket -- copy smc socket options to clc socket
  2188		 */
  2189		smc_copy_sock_settings_to_clc(smc);
  2190		if (!smc->use_fallback)
  2191			tcp_sk(smc->clcsock->sk)->syn_smc = 1;
  2192	
  2193		/* save original sk_data_ready function and establish
  2194		 * smc-specific sk_data_ready function
  2195		 */
  2196		smc->clcsk_data_ready = smc->clcsock->sk->sk_data_ready;
  2197		smc->clcsock->sk->sk_data_ready = smc_clcsock_data_ready;
  2198		smc->clcsock->sk->sk_user_data =
  2199			(void *)((uintptr_t)smc | SK_USER_DATA_NOCOPY);
  2200	
  2201		/* save origin ops */
> 2202		smc->ori_af_ops = inet_csk(smc->clcsock->sk)->icsk_af_ops;
  2203	
  2204		smc->af_ops = *smc->ori_af_ops;
  2205		smc->af_ops.syn_recv_sock = smc_tcp_syn_recv_sock;
  2206	
  2207		inet_csk(smc->clcsock->sk)->icsk_af_ops = &smc->af_ops;
  2208	
  2209		rc = kernel_listen(smc->clcsock, backlog);
  2210		if (rc) {
  2211			smc->clcsock->sk->sk_data_ready = smc->clcsk_data_ready;
  2212			goto out;
  2213		}
  2214		sk->sk_max_ack_backlog = backlog;
  2215		sk->sk_ack_backlog = 0;
  2216		sk->sk_state = SMC_LISTEN;
  2217	
  2218	out:
  2219		release_sock(sk);
  2220		return rc;
  2221	}
  2222	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
