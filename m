Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F45C4689;
	Fri, 18 Aug 2023 09:09:59 +0000 (UTC)
Received: from [78.30.34.192] (port=47818 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1qWvUF-000E3B-Vd; Fri, 18 Aug 2023 11:09:47 +0200
Date: Fri, 18 Aug 2023 11:09:43 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: kernel test robot <lkp@intel.com>
Cc: netfilter-devel@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf] netfilter: nf_tables: GC transaction race with abort
 path
Message-ID: <ZN81Vz8/yIBm201d@calendula>
References: <20230817231352.8412-1-pablo@netfilter.org>
 <202308181545.lZbeE7Lm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202308181545.lZbeE7Lm-lkp@intel.com>
X-Spam-Score: -1.9 (-)

On Fri, Aug 18, 2023 at 03:48:48PM +0800, kernel test robot wrote:
> Hi Pablo,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on nf/master]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/netfilter-nf_tables-GC-transaction-race-with-abort-path/20230818-071545
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf.git master

Wrong tree, we moved to:

https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
