Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECCC320E
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 12:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650024930; x=1681560930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2ffantDfDJF/384zKJkeiXccIRnCxuSDVGb4CQk+jZ0=;
  b=Y5s33yFISCldpElvKWWtJIiM9J87ZhSznNOkrsoyk22FfBic14AQhqxI
   4EH17W6WQSDlg6UdKBdSBi9t6Q1/uM+0tMYTyAdEhMD09POz8j1espVYn
   We7GA2NsEFnFivXAuKSGZCb2t75Cv4ItTM9e4a8nqvuQ/eqGPxWVcVX4I
   I3oI38YQ/Awim1pu2ezR6UlUJ0ynTUUb66lKQ24S5/80upAcYMOcStRy6
   sMtAbEpTc/YJFqawnRRI9qadTlo1XymSri9IacdFx6/hRIn6IGN0SROx0
   jyCfVbiNEFvVEHAFDC3tZz03DH9nQl/N3J/QKzJYdkt8zevq4b2wHX3fb
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="260740794"
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; 
   d="scan'208";a="260740794"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 05:15:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; 
   d="scan'208";a="553130943"
Received: from boxer.igk.intel.com (HELO boxer) ([10.102.20.173])
  by orsmga007.jf.intel.com with ESMTP; 15 Apr 2022 05:15:21 -0700
Date: Fri, 15 Apr 2022 14:15:15 +0200
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Alexander Lobakin <alobakin@pm.me>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Dmitrii Dolgov <9erthalion6@gmail.com>,
	Quentin Monnet <quentin@isovalent.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Chenbo Feng <fengc@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Daniel Wagner <daniel.wagner@bmw-carit.de>,
	Thomas Graf <tgraf@suug.ch>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next 11/11] samples: bpf: xdpsock: fix
 -Wmaybe-uninitialized
Message-ID: <Yllh08sX+ctbpNYg@boxer>
References: <20220414223704.341028-1-alobakin@pm.me>
 <20220414223704.341028-12-alobakin@pm.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414223704.341028-12-alobakin@pm.me>

On Thu, Apr 14, 2022 at 10:47:20PM +0000, Alexander Lobakin wrote:
> Fix two sort-of-false-positives in the xdpsock userspace part:
> 
> samples/bpf/xdpsock_user.c: In function 'main':
> samples/bpf/xdpsock_user.c:1531:47: warning: 'tv_usec' may be used uninitialized in this function [-Wmaybe-uninitialized]
>  1531 |                         pktgen_hdr->tv_usec = htonl(tv_usec);
>       |                                               ^~~~~~~~~~~~~~
> samples/bpf/xdpsock_user.c:1500:26: note: 'tv_usec' was declared here
>  1500 |         u32 idx, tv_sec, tv_usec;
>       |                          ^~~~~~~
> samples/bpf/xdpsock_user.c:1530:46: warning: 'tv_sec' may be used uninitialized in this function [-Wmaybe-uninitialized]
>  1530 |                         pktgen_hdr->tv_sec = htonl(tv_sec);
>       |                                              ^~~~~~~~~~~~~
> samples/bpf/xdpsock_user.c:1500:18: note: 'tv_sec' was declared here
>  1500 |         u32 idx, tv_sec, tv_usec;
>       |                  ^~~~~~
> 
> Both variables are always initialized when @opt_tstamp == true and
> they're being used also only when @opt_tstamp == true. However, that
> variable comes from the BSS and is being toggled from another
> function. They can't be executed simultaneously to actually trigger
> undefined behaviour, but purely technically it is a correct warning.
> Just initialize them with zeroes.
> 
> Fixes: eb68db45b747 ("samples/bpf: xdpsock: Add timestamp for Tx-only operation")
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>

Acked-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

Magnus would tell you that you should fix this on libxdp side instead :)

> ---
>  samples/bpf/xdpsock_user.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/samples/bpf/xdpsock_user.c b/samples/bpf/xdpsock_user.c
> index 399b999fcec2..1dc7ad5dbef4 100644
> --- a/samples/bpf/xdpsock_user.c
> +++ b/samples/bpf/xdpsock_user.c
> @@ -1496,7 +1496,7 @@ static void rx_drop_all(void)
>  static int tx_only(struct xsk_socket_info *xsk, u32 *frame_nb,
>  		   int batch_size, unsigned long tx_ns)
>  {
> -	u32 idx, tv_sec, tv_usec;
> +	u32 idx, tv_sec = 0, tv_usec = 0;
>  	unsigned int i;
> 
>  	while (xsk_ring_prod__reserve(&xsk->tx, batch_size, &idx) <
> --
> 2.35.2
> 
> 
