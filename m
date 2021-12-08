Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666EC2CA6
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 20:40:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="301319971"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; 
   d="scan'208";a="301319971"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 12:40:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; 
   d="scan'208";a="480049486"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 08 Dec 2021 12:39:56 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mv3jH-00011G-BK; Wed, 08 Dec 2021 20:39:55 +0000
Date: Thu, 9 Dec 2021 04:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: Leonard Crestez <cdleonard@gmail.com>, David Ahern <dsahern@kernel.org>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Eric Dumazet <edumazet@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Francesco Ruggeri <fruggeri@arista.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	Jakub Kicinski <kuba@kernel.org>, Yuchung Cheng <ycheng@google.com>
Subject: Re: [PATCH v3 06/18] tcp: authopt: Hook into tcp core
Message-ID: <202112090452.jW34oJZF-lkp@intel.com>
References: <c6a0af64b6e41aa74d70dc0f7321a5f2293ee53e.1638962992.git.cdleonard@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6a0af64b6e41aa74d70dc0f7321a5f2293ee53e.1638962992.git.cdleonard@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Leonard,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 1fe5b01262844be03de98afdd56d1d393df04d7e]

url:    https://github.com/0day-ci/linux/commits/Leonard-Crestez/tcp-Initial-support-for-RFC5925-auth-option/20211208-194125
base:   1fe5b01262844be03de98afdd56d1d393df04d7e
config: i386-randconfig-a013-20211207 (https://download.01.org/0day-ci/archive/20211209/202112090452.jW34oJZF-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5935c41094c73eec0e3c39119d7bfb22de066c3b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Leonard-Crestez/tcp-Initial-support-for-RFC5925-auth-option/20211208-194125
        git checkout 5935c41094c73eec0e3c39119d7bfb22de066c3b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from net/bpf/test_run.c:15:
>> include/net/tcp.h:433:17: warning: parameter 'md5ptr' set but not used [-Wunused-but-set-parameter]
                             const u8 **md5ptr,
                                        ^
>> include/net/tcp.h:434:17: warning: parameter 'aoptr' set but not used [-Wunused-but-set-parameter]
                             const u8 **aoptr)
                                        ^
   net/bpf/test_run.c:170:14: warning: no previous prototype for function 'bpf_fentry_test1' [-Wmissing-prototypes]
   int noinline bpf_fentry_test1(int a)
                ^
   net/bpf/test_run.c:170:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test1(int a)
   ^
   static 
   net/bpf/test_run.c:175:14: warning: no previous prototype for function 'bpf_fentry_test2' [-Wmissing-prototypes]
   int noinline bpf_fentry_test2(int a, u64 b)
                ^
   net/bpf/test_run.c:175:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test2(int a, u64 b)
   ^
   static 
   net/bpf/test_run.c:180:14: warning: no previous prototype for function 'bpf_fentry_test3' [-Wmissing-prototypes]
   int noinline bpf_fentry_test3(char a, int b, u64 c)
                ^
   net/bpf/test_run.c:180:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test3(char a, int b, u64 c)
   ^
   static 
   net/bpf/test_run.c:185:14: warning: no previous prototype for function 'bpf_fentry_test4' [-Wmissing-prototypes]
   int noinline bpf_fentry_test4(void *a, char b, int c, u64 d)
                ^
   net/bpf/test_run.c:185:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test4(void *a, char b, int c, u64 d)
   ^
   static 
   net/bpf/test_run.c:190:14: warning: no previous prototype for function 'bpf_fentry_test5' [-Wmissing-prototypes]
   int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
                ^
   net/bpf/test_run.c:190:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
   ^
   static 
   net/bpf/test_run.c:195:14: warning: no previous prototype for function 'bpf_fentry_test6' [-Wmissing-prototypes]
   int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
                ^
   net/bpf/test_run.c:195:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
   ^
   static 
   net/bpf/test_run.c:204:14: warning: no previous prototype for function 'bpf_fentry_test7' [-Wmissing-prototypes]
   int noinline bpf_fentry_test7(struct bpf_fentry_test_t *arg)
                ^
   net/bpf/test_run.c:204:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test7(struct bpf_fentry_test_t *arg)
   ^
   static 
   net/bpf/test_run.c:209:14: warning: no previous prototype for function 'bpf_fentry_test8' [-Wmissing-prototypes]
   int noinline bpf_fentry_test8(struct bpf_fentry_test_t *arg)
                ^
   net/bpf/test_run.c:209:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test8(struct bpf_fentry_test_t *arg)
   ^
   static 
   net/bpf/test_run.c:214:14: warning: no previous prototype for function 'bpf_modify_return_test' [-Wmissing-prototypes]
   int noinline bpf_modify_return_test(int a, int *b)
                ^
   net/bpf/test_run.c:214:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_modify_return_test(int a, int *b)
   ^
   static 
   net/bpf/test_run.c:220:14: warning: no previous prototype for function 'bpf_kfunc_call_test1' [-Wmissing-prototypes]
   u64 noinline bpf_kfunc_call_test1(struct sock *sk, u32 a, u64 b, u32 c, u64 d)
                ^
   net/bpf/test_run.c:220:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 noinline bpf_kfunc_call_test1(struct sock *sk, u32 a, u64 b, u32 c, u64 d)
   ^
   static 
   net/bpf/test_run.c:225:14: warning: no previous prototype for function 'bpf_kfunc_call_test2' [-Wmissing-prototypes]
   int noinline bpf_kfunc_call_test2(struct sock *sk, u32 a, u32 b)
                ^
   net/bpf/test_run.c:225:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_kfunc_call_test2(struct sock *sk, u32 a, u32 b)
   ^
   static 
   net/bpf/test_run.c:230:24: warning: no previous prototype for function 'bpf_kfunc_call_test3' [-Wmissing-prototypes]
   struct sock * noinline bpf_kfunc_call_test3(struct sock *sk)
                          ^
   net/bpf/test_run.c:230:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct sock * noinline bpf_kfunc_call_test3(struct sock *sk)
   ^
   static 
   14 warnings generated.
--
   In file included from net/core/skmsg.c:4:
   In file included from include/linux/skmsg.h:13:
>> include/net/tcp.h:433:17: warning: parameter 'md5ptr' set but not used [-Wunused-but-set-parameter]
                             const u8 **md5ptr,
                                        ^
>> include/net/tcp.h:434:17: warning: parameter 'aoptr' set but not used [-Wunused-but-set-parameter]
                             const u8 **aoptr)
                                        ^
   2 warnings generated.
--
   In file included from net/core/sock_map.c:11:
   In file included from include/linux/skmsg.h:13:
>> include/net/tcp.h:434:17: warning: parameter 'aoptr' set but not used [-Wunused-but-set-parameter]
                             const u8 **aoptr)
                                        ^
>> include/net/tcp.h:433:17: warning: parameter 'md5ptr' set but not used [-Wunused-but-set-parameter]
                             const u8 **md5ptr,
                                        ^
   2 warnings generated.
--
   In file included from net/ipv4/route.c:94:
>> include/net/tcp.h:433:17: warning: parameter 'md5ptr' set but not used [-Wunused-but-set-parameter]
                             const u8 **md5ptr,
                                        ^
>> include/net/tcp.h:434:17: warning: parameter 'aoptr' set but not used [-Wunused-but-set-parameter]
                             const u8 **aoptr)
                                        ^
   net/ipv4/route.c:869:6: warning: variable 'log_martians' set but not used [-Wunused-but-set-variable]
           int log_martians;
               ^
   3 warnings generated.
--
   In file included from net/ipv4/tcp_output.c:40:
>> include/net/tcp.h:434:17: warning: parameter 'aoptr' set but not used [-Wunused-but-set-parameter]
                             const u8 **aoptr)
                                        ^
>> include/net/tcp.h:433:17: warning: parameter 'md5ptr' set but not used [-Wunused-but-set-parameter]
                             const u8 **md5ptr,
                                        ^
   net/ipv4/tcp_output.c:189:3: warning: result of comparison of constant -1 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
                   NET_ADD_STATS(sock_net(sk), LINUX_MIB_TCPACKCOMPRESSED,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/ip.h:292:41: note: expanded from macro 'NET_ADD_STATS'
   #define NET_ADD_STATS(net, field, adnd) SNMP_ADD_STATS((net)->mib.net_statistics, field, adnd)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/snmp.h:143:4: note: expanded from macro 'SNMP_ADD_STATS'
                           this_cpu_add(mib->mibs[field], addend)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   <scratch space>:113:1: note: expanded from here
   this_cpu_add_4
   ^
   arch/x86/include/asm/percpu.h:268:34: note: expanded from macro 'this_cpu_add_4'
   #define this_cpu_add_4(pcp, val)        percpu_add_op(4, volatile, (pcp), val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:127:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                ~~~~~ ^  ~~
   3 warnings generated.
--
   In file included from net/mptcp/options.c:11:
>> include/net/tcp.h:434:17: warning: parameter 'aoptr' set but not used [-Wunused-but-set-parameter]
                             const u8 **aoptr)
                                        ^
>> include/net/tcp.h:433:17: warning: parameter 'md5ptr' set but not used [-Wunused-but-set-parameter]
                             const u8 **md5ptr,
                                        ^
   net/mptcp/options.c:552:21: warning: parameter 'remaining' set but not used [-Wunused-but-set-parameter]
                                             unsigned int remaining,
                                                          ^
   3 warnings generated.


vim +/md5ptr +433 include/net/tcp.h

   381	
   382	
   383	enum tcp_tw_status tcp_timewait_state_process(struct inet_timewait_sock *tw,
   384						      struct sk_buff *skb,
   385						      const struct tcphdr *th);
   386	struct sock *tcp_check_req(struct sock *sk, struct sk_buff *skb,
   387				   struct request_sock *req, bool fastopen,
   388				   bool *lost_race);
   389	int tcp_child_process(struct sock *parent, struct sock *child,
   390			      struct sk_buff *skb);
   391	void tcp_enter_loss(struct sock *sk);
   392	void tcp_cwnd_reduction(struct sock *sk, int newly_acked_sacked, int newly_lost, int flag);
   393	void tcp_clear_retrans(struct tcp_sock *tp);
   394	void tcp_update_metrics(struct sock *sk);
   395	void tcp_init_metrics(struct sock *sk);
   396	void tcp_metrics_init(void);
   397	bool tcp_peer_is_proven(struct request_sock *req, struct dst_entry *dst);
   398	void __tcp_close(struct sock *sk, long timeout);
   399	void tcp_close(struct sock *sk, long timeout);
   400	void tcp_init_sock(struct sock *sk);
   401	void tcp_init_transfer(struct sock *sk, int bpf_op, struct sk_buff *skb);
   402	__poll_t tcp_poll(struct file *file, struct socket *sock,
   403			      struct poll_table_struct *wait);
   404	int tcp_getsockopt(struct sock *sk, int level, int optname,
   405			   char __user *optval, int __user *optlen);
   406	bool tcp_bpf_bypass_getsockopt(int level, int optname);
   407	int tcp_setsockopt(struct sock *sk, int level, int optname, sockptr_t optval,
   408			   unsigned int optlen);
   409	void tcp_set_keepalive(struct sock *sk, int val);
   410	void tcp_syn_ack_timeout(const struct request_sock *req);
   411	int tcp_recvmsg(struct sock *sk, struct msghdr *msg, size_t len, int nonblock,
   412			int flags, int *addr_len);
   413	int tcp_set_rcvlowat(struct sock *sk, int val);
   414	int tcp_set_window_clamp(struct sock *sk, int val);
   415	void tcp_update_recv_tstamps(struct sk_buff *skb,
   416				     struct scm_timestamping_internal *tss);
   417	void tcp_recv_timestamp(struct msghdr *msg, const struct sock *sk,
   418				struct scm_timestamping_internal *tss);
   419	void tcp_data_ready(struct sock *sk);
   420	#ifdef CONFIG_MMU
   421	int tcp_mmap(struct file *file, struct socket *sock,
   422		     struct vm_area_struct *vma);
   423	#endif
   424	void tcp_parse_options(const struct net *net, const struct sk_buff *skb,
   425			       struct tcp_options_received *opt_rx,
   426			       int estab, struct tcp_fastopen_cookie *foc);
   427	#if defined(CONFIG_TCP_MD5SIG) || defined(CONFIG_TCP_AUTHOPT)
   428	int tcp_parse_sig_options(const struct tcphdr *th,
   429				  const u8 **md5ptr,
   430				  const u8 **aoptr);
   431	#else
   432	static inline int tcp_parse_sig_options(const struct tcphdr *th,
 > 433				  const u8 **md5ptr,
 > 434				  const u8 **aoptr)
   435	{
   436		aoptr = NULL;
   437		md5ptr = NULL;
   438		return 0;
   439	}
   440	#endif
   441	static inline const u8 *tcp_parse_md5sig_option(const struct tcphdr *th)
   442	{
   443		const u8 *md5, *ao;
   444		int ret;
   445	
   446		ret = tcp_parse_sig_options(th, &md5, &ao);
   447	
   448		return (md5 && !ao && !ret) ? md5 : NULL;
   449	}
   450	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
