Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EA21865
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 18:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649701484; x=1681237484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wl6WY4/B8WKpXD5i/+CDbBlXLg7RHazGg+wlD/LEtXc=;
  b=Il6GVptYfpUE9D39K0UJftTtriS7ldw/sNRAk0ZP5FXP3J1Ev/tYJv2g
   fa5X/IiwR4FSjF8TMbbruS+Q301INUGQDstfSpyCXhD2AOJnEBkap0pEP
   DGoRSdXRt3lxV0odWkAabT/+acpt00d/W0pLj/kJD52U8vGOIxYvCcgRQ
   HQqpVb8KgLwZAlLG1bKsA1sR1bYp0eWejXLjXjKHcUEzIgSLrp5kLhpA+
   Ea3W4csNWTL6CD9CXmIEGFsKt3wFnRezBlvMoHia6tBVXoj1QPmqabfnz
   RFYIDI3LToLNzskkegGyUu/3Wus5Crs4Kw69CuVio7nhBOeHUQoNFhOES
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="249466407"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="249466407"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 11:24:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="660158663"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 11 Apr 2022 11:24:43 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ndyiQ-00023m-JJ;
	Mon, 11 Apr 2022 18:24:42 +0000
Date: Tue, 12 Apr 2022 02:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/4] mptcp: never shrink offered window
Message-ID: <202204120247.mC6ZORgL-lkp@intel.com>
References: <ab1fd2897c57a50d7580950dbe6fb58006c04253.1649672265.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab1fd2897c57a50d7580950dbe6fb58006c04253.1649672265.git.pabeni@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Paolo,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on mptcp/export]
[also build test ERROR on linus/master v5.18-rc2 next-20220411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/mptcp-improve-mptcp-level-window-tracking/20220411-184144
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
config: hexagon-defconfig (https://download.01.org/0day-ci/archive/20220412/202204120247.mC6ZORgL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4cd25cbca4acc18a428817e9b1adc5ddd131422b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paolo-Abeni/mptcp-improve-mptcp-level-window-tracking/20220411-184144
        git checkout 4cd25cbca4acc18a428817e9b1adc5ddd131422b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/mptcp/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   net/mptcp/options.c:554:21: warning: parameter 'remaining' set but not used [-Wunused-but-set-parameter]
                                             unsigned int remaining,
                                                          ^
>> net/mptcp/options.c:1248:14: error: implicit declaration of function 'arch_cmpxchg64' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           rcv_wnd = cmpxchg64(&msk->rcv_wnd_sent, rcv_wnd_old, rcv_wnd_new);
                                     ^
   include/linux/atomic/atomic-instrumented.h:1946:2: note: expanded from macro 'cmpxchg64'
           arch_cmpxchg64(__ai_ptr, __VA_ARGS__); \
           ^
   1 warning and 1 error generated.


vim +/arch_cmpxchg64 +1248 net/mptcp/options.c

  1226	
  1227	static void mptcp_set_rwin(struct tcp_sock *tp, void *opt)
  1228	{
  1229		const struct sock *ssk = (const struct sock *)tp;
  1230		struct mptcp_subflow_context *subflow;
  1231		u64 ack_seq, rcv_wnd_old, rcv_wnd_new;
  1232		struct mptcp_sock *msk;
  1233		struct tcphdr *th;
  1234		u32 new_win;
  1235		u64 win;
  1236	
  1237		subflow = mptcp_subflow_ctx(ssk);
  1238		msk = mptcp_sk(subflow->conn);
  1239	
  1240		ack_seq = READ_ONCE(msk->ack_seq);
  1241		rcv_wnd_new = ack_seq + tp->rcv_wnd;
  1242	
  1243		rcv_wnd_old = READ_ONCE(msk->rcv_wnd_sent);
  1244		if (after64(rcv_wnd_new, rcv_wnd_old)) {
  1245			u64 rcv_wnd;
  1246	
  1247			for (;;) {
> 1248				rcv_wnd = cmpxchg64(&msk->rcv_wnd_sent, rcv_wnd_old, rcv_wnd_new);
  1249	
  1250				if (rcv_wnd == rcv_wnd_old)
  1251					break;
  1252				if (before64(rcv_wnd_new, rcv_wnd))
  1253					goto raise_win;
  1254				rcv_wnd_old = rcv_wnd;
  1255			};
  1256			return;
  1257		}
  1258	
  1259		if (rcv_wnd_new != rcv_wnd_old) {
  1260	
  1261	raise_win:
  1262			th = opt - sizeof(struct tcphdr);
  1263			win = rcv_wnd_old - ack_seq;
  1264			tp->rcv_wnd = min_t(u64, win, U32_MAX);
  1265			new_win = tp->rcv_wnd;
  1266	
  1267			/* Make sure we do not exceed the maximum possible
  1268			 * scaled window.
  1269			 */
  1270			if (unlikely(th->syn))
  1271				new_win = min(new_win, 65535U) << tp->rx_opt.rcv_wscale;
  1272			if (!tp->rx_opt.rcv_wscale &&
  1273			    sock_net(ssk)->ipv4.sysctl_tcp_workaround_signed_windows)
  1274				new_win = min(new_win, MAX_TCP_WINDOW);
  1275			else
  1276				new_win = min(new_win, (65535U << tp->rx_opt.rcv_wscale));
  1277	
  1278			/* RFC1323 scaling applied */
  1279			new_win >>= tp->rx_opt.rcv_wscale;
  1280			th->window = htons(new_win);
  1281		}
  1282	}
  1283	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
