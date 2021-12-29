Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B042C80
	for <llvm@lists.linux.dev>; Wed, 29 Dec 2021 11:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640777584; x=1672313584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WOppu46yfxfyzYaDBnTj4lZIptZv34kviksQfAidF+A=;
  b=fmu/9JKpjZtwztoCIZ6CsLvTW8lVcGv6YrFboYFTN2rBl9VlH+30KwUJ
   2cgLd9BJ/QCL+hD6//lzMe7MJEc91qr97jT7ZMKyQnnl9/SZ2v5vls3/W
   r0F6N4JU/8A+Cn/iCm14j3Bnr+kUNctqJ9rIgPUgg2tO0lXr/vBKvG8dz
   7vq5J9zfpmvdj06B2+wAJuXj3lloySfd2nz0l8/3o0LnTcrfj0CiCdDk5
   F9hvihzba/7sShlq71mSsvi3EN509j2zr5YPCHMbYr845q5wA4shw7iv+
   Vpos0Ev3GmBnByRRsO6f3r+PLnbVv9qenY+6dYas3h0KKA/dGDTeRy1+d
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="265742613"
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; 
   d="scan'208";a="265742613"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2021 03:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; 
   d="scan'208";a="486589795"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Dec 2021 03:33:00 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n2XCV-0008rp-N7; Wed, 29 Dec 2021 11:32:59 +0000
Date: Wed, 29 Dec 2021 19:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: menglong8.dong@gmail.com, daniel@iogearbox.net
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, ast@kernel.org,
	andrii@kernel.org, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
	john.fastabend@gmail.com, kpsingh@kernel.org, davem@davemloft.net,
	kuba@kernel.org
Subject: Re: [PATCH net-next] net: bpf: hook for inet port bind conflict check
Message-ID: <202112291915.muBKYGuT-lkp@intel.com>
References: <20211229085547.206008-1-imagedong@tencent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211229085547.206008-1-imagedong@tencent.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/0day-ci/linux/commits/menglong8-dong-gmail-com/net-bpf-hook-for-inet-port-bind-conflict-check/20211229-165656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 271d3be1c3b6b0be083a99254a0ecac41789929b
config: hexagon-buildonly-randconfig-r002-20211228 (https://download.01.org/0day-ci/archive/20211229/202112291915.muBKYGuT-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project cd284b7ac0615afc6e0f1a30da2777e361de27a3)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ca8b713d84b5e09a77bfae226287297f49cd97c9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review menglong8-dong-gmail-com/net-bpf-hook-for-inet-port-bind-conflict-check/20211229-165656
        git checkout ca8b713d84b5e09a77bfae226287297f49cd97c9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from net/ipv4/route.c:79:
   In file included from include/linux/mroute.h:10:
   In file included from include/linux/mroute_base.h:10:
   In file included from include/net/ip_fib.h:20:
   In file included from include/net/inetpeer.h:16:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:92:
   In file included from include/linux/tcp.h:20:
   In file included from include/net/inet_connection_sock.h:21:
>> include/net/inet_sock.h:307:8: error: implicit declaration of function 'BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE' [-Werror,-Wimplicit-function-declaration]
           res = BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE(sk);
                 ^
   net/ipv4/route.c:869:6: warning: variable 'log_martians' set but not used [-Wunused-but-set-variable]
           int log_martians;
               ^
   1 warning and 1 error generated.
--
   In file included from net/ipv4/inetpeer.c:22:
   In file included from include/net/ip.h:29:
>> include/net/inet_sock.h:307:8: error: implicit declaration of function 'BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE' [-Werror,-Wimplicit-function-declaration]
           res = BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE(sk);
                 ^
   1 error generated.
--
   In file included from net/ipv4/udp.c:100:
   In file included from include/net/icmp.h:19:
>> include/net/inet_sock.h:307:8: error: implicit declaration of function 'BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE' [-Werror,-Wimplicit-function-declaration]
           res = BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE(sk);
                 ^
>> net/ipv4/udp.c:203:9: error: implicit declaration of function 'BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE' [-Werror,-Wimplicit-function-declaration]
                   res = BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE(sk);
                         ^
   2 errors generated.
--
   In file included from net/ipv4/igmp.c:92:
   In file included from include/net/ip.h:29:
>> include/net/inet_sock.h:307:8: error: implicit declaration of function 'BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE' [-Werror,-Wimplicit-function-declaration]
           res = BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE(sk);
                 ^
   net/ipv4/igmp.c:1905:6: warning: variable 'changerec' set but not used [-Wunused-but-set-variable]
           int     changerec = 0;
                   ^
   1 warning and 1 error generated.
--
   In file included from net/ipv4/ip_gre.c:19:
   In file included from include/linux/tcp.h:20:
   In file included from include/net/inet_connection_sock.h:21:
>> include/net/inet_sock.h:307:8: error: implicit declaration of function 'BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE' [-Werror,-Wimplicit-function-declaration]
           res = BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE(sk);
                 ^
   net/ipv4/ip_gre.c:143:15: warning: variable 'data_len' set but not used [-Wunused-but-set-variable]
           unsigned int data_len = 0;
                        ^
   1 warning and 1 error generated.
--
   In file included from net/ipv4/ah4.c:9:
   In file included from include/net/ip.h:29:
>> include/net/inet_sock.h:307:8: error: implicit declaration of function 'BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE' [-Werror,-Wimplicit-function-declaration]
           res = BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE(sk);
                 ^
   net/ipv4/ah4.c:513:4: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
                           aalg_desc->uinfo.auth.icv_fullbits / 8);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:523:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                   ~~~     ^~~~~~~~~~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning and 1 error generated.
--
   In file included from net/ipv4/esp4.c:8:
   In file included from include/net/ip.h:29:
>> include/net/inet_sock.h:307:8: error: implicit declaration of function 'BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE' [-Werror,-Wimplicit-function-declaration]
           res = BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE(sk);
                 ^
   net/ipv4/esp4.c:1116:5: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
                                   aalg_desc->uinfo.auth.icv_fullbits / 8);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:523:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                   ~~~     ^~~~~~~~~~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning and 1 error generated.
--
   In file included from net/ipv4/netfilter/nf_reject_ipv4.c:7:
   In file included from include/net/ip.h:29:
>> include/net/inet_sock.h:307:8: error: implicit declaration of function 'BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE' [-Werror,-Wimplicit-function-declaration]
           res = BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE(sk);
                 ^
   net/ipv4/netfilter/nf_reject_ipv4.c:242:16: warning: variable 'niph' set but not used [-Wunused-but-set-variable]
           struct iphdr *niph;
                         ^
   1 warning and 1 error generated.


vim +/BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE +307 include/net/inet_sock.h

   300	
   301	static inline int inet_bind_conflict(struct sock *sk, int port)
   302	{
   303		int res;
   304		int old = sk->sk_num;
   305	
   306		sk->sk_num = port;
 > 307		res = BPF_CGROUP_RUN_PROG_INET_LPORT_INUSE(sk);
   308		sk->sk_num = old;
   309		return res;
   310	}
   311	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
