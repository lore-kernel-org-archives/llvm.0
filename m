Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6068D15A7
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1660834948; x=1692370948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AVDKpW3E0SoesYRfNdNj6AunH1Huh55azMmsgmV/WlI=;
  b=OYr5WdsovTmrAufb5sDIJp8QBLJCDia5csbLCDB7ilBhZClF7IEJGH6h
   NKzbW9/TNVqJqJ435W1NdLr+GeuIzMu4k2Q5U0QScznD24wDt62u9s2XQ
   N9KZEuZnbF54n+wR/5x7Uyn1TPozVQ0tJhIBjstZD3nBo3dZdB3+tavK+
   g=;
X-IronPort-AV: E=Sophos;i="5.93,246,1654560000"; 
   d="scan'208";a="250286477"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2b-31df91b1.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 15:02:06 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-pdx-2b-31df91b1.us-west-2.amazon.com (Postfix) with ESMTPS id 81D9B451FE;
	Thu, 18 Aug 2022 15:02:05 +0000 (UTC)
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Thu, 18 Aug 2022 15:02:04 +0000
Received: from 88665a182662.ant.amazon.com (10.43.162.158) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.12;
 Thu, 18 Aug 2022 15:02:02 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <lkp@intel.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <kbuild-all@lists.01.org>,
	<kuba@kernel.org>, <kuniyu@amazon.com>, <llvm@lists.linux.dev>,
	<netdev@vger.kernel.org>, <pabeni@redhat.com>
Subject: Re: [PATCH v2 net 13/17] net: Fix data-races around sysctl_fb_tunnels_only_for_init_net.
Date: Thu, 18 Aug 2022 08:01:54 -0700
Message-ID: <20220818150154.29112-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <202208181615.Lu9xjiEv-lkp@intel.com>
References: <202208181615.Lu9xjiEv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.162.158]
X-ClientProxiedBy: EX13D42UWB004.ant.amazon.com (10.43.161.99) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
Precedence: Bulk

From:   kernel test robot <lkp@intel.com>
Date:   Thu, 18 Aug 2022 16:51:37 +0800
> Hi Kuniyuki,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on net/master]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/net-sysctl-Fix-data-races-around-net-core-XXX/20220818-115941
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git fc4aaf9fb3c99bcb326d52f9d320ed5680bd1cee
> config: riscv-randconfig-r032-20220818 (https://download.01.org/0day-ci/archive/20220818/202208181615.Lu9xjiEv-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/6bc3dfb3dc4862f4e00ba93c45cd5c0251b85d5b
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Kuniyuki-Iwashima/net-sysctl-Fix-data-races-around-net-core-XXX/20220818-115941
>         git checkout 6bc3dfb3dc4862f4e00ba93c45cd5c0251b85d5b
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: sysctl_fb_tunnels_only_for_init_net
>    >>> referenced by ip_tunnel.c
>    >>>               ipv4/ip_tunnel.o:(ip_tunnel_init_net) in archive net/built-in.a
>    >>> referenced by ip_tunnel.c
>    >>>               ipv4/ip_tunnel.o:(ip_tunnel_init_net) in archive net/built-in.a

Hmm... I tested allmodconfig with x86_64 but it seems not enough...

I don't think just using READ_ONCE() causes regression.
Is this really regression or always-broken stuff in some arch,
or ... clang 16?

Anyway, I'll take a look.
