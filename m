Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1430D2F48
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 20:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757FDC385A2;
	Tue,  7 Jun 2022 20:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654634157;
	bh=VJmfnqX0UQuKG6JX/Juy1BlHWUzOBDOdt9R7hQL7eiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eD2Kx5oerDySCdSLkKJDiDa5vDGxAB00e/MYgt0SgfJwP08f1+RGfRwL1Get4rted
	 9k2JlE17+0uDRFjsMOym3nIHEB26ptJJ1lQfbsNJyVTuymueAyFVzv57B+L5/hrF1+
	 rlFw8/oBLPCql0fQ08L2YbjOBTE6lJB484c3EuxJtyTEHF+jztC0Z2dkBg9Gz2bNVZ
	 Ov6UB4TLemBNKLoJJDFozfNctHZ0umtRoFG/PmJs18Q52XO33LrY7aPTjPGqi4Ylw5
	 I3VmGirjqjhTJHL6prVTgQ6KUaO9QA3TRI/u25sNLui7TjaBguROOKEz0DHLYUUqld
	 EZwRuBG+x8XtA==
Date: Tue, 7 Jun 2022 13:35:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <jstitt007@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] netfilter: conntrack: Fix clang -Wformat warning in
 print_tuple()
Message-ID: <Yp+2qwh5DNbxVfvS@dev-arch.thelio-3990X>
References: <Yp9uRz40J24vWLSb@dev-arch.thelio-3990X>
 <20220607180847.13482-1-jstitt007@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607180847.13482-1-jstitt007@gmail.com>

On Tue, Jun 07, 2022 at 11:08:47AM -0700, Justin Stitt wrote:
>  | net/netfilter/nf_conntrack_standalone.c:63:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->src.u.tcp.port),
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:64:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->dst.u.tcp.port));
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:69:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->src.u.udp.port),
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:70:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->dst.u.udp.port));
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:75:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->src.u.dccp.port),
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:76:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->dst.u.dccp.port));
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:80:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->src.u.sctp.port),
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | net/netfilter/nf_conntrack_standalone.c:81:7: warning: format specifies type
>  | 'unsigned short' but the argument has type 'int' [-Wformat]
>  |                            ntohs(tuple->dst.u.sctp.port));
>  |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Variadic functions (printf-like) undergo default argument promotion.
> Documentation/core-api/printk-formats.rst specifically recommends
> using the promoted-to-type's format flag.
> 
> Also, as per C11 6.3.1.1:
> (https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf)
> `If an int can represent all values of the original type ..., the
> value is converted to an int; otherwise, it is converted to an
> unsigned int. These are called the integer promotions.`
> Thus it makes sense to change %hu (as well as %u) to %d.
> 
> It should be noted that %u does not produce the same warning as %hu in this
> context. However, it should probably be changed as well for consistency.
> 
> Signed-off-by: Justin Stitt <jstitt007@gmail.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Diff between v1 -> v2:
>  * update commit message and subject line
>  
>  Note: The architecture (arm64) is critical for reproducing this warning.
>  
>  net/netfilter/nf_conntrack_standalone.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
> index 6ad7bbc90d38..afbec8a12c5e 100644
> --- a/net/netfilter/nf_conntrack_standalone.c
> +++ b/net/netfilter/nf_conntrack_standalone.c
> @@ -53,30 +53,30 @@ print_tuple(struct seq_file *s, const struct nf_conntrack_tuple *tuple,
>  
>  	switch (l4proto->l4proto) {
>  	case IPPROTO_ICMP:
> -		seq_printf(s, "type=%u code=%u id=%u ",
> +		seq_printf(s, "type=%d code=%d id=%d ",
>  			   tuple->dst.u.icmp.type,
>  			   tuple->dst.u.icmp.code,
>  			   ntohs(tuple->src.u.icmp.id));
>  		break;
>  	case IPPROTO_TCP:
> -		seq_printf(s, "sport=%hu dport=%hu ",
> +		seq_printf(s, "sport=%d dport=%d ",
>  			   ntohs(tuple->src.u.tcp.port),
>  			   ntohs(tuple->dst.u.tcp.port));
>  		break;
>  	case IPPROTO_UDPLITE:
>  	case IPPROTO_UDP:
> -		seq_printf(s, "sport=%hu dport=%hu ",
> +		seq_printf(s, "sport=%d dport=%d ",
>  			   ntohs(tuple->src.u.udp.port),
>  			   ntohs(tuple->dst.u.udp.port));
>  
>  		break;
>  	case IPPROTO_DCCP:
> -		seq_printf(s, "sport=%hu dport=%hu ",
> +		seq_printf(s, "sport=%d dport=%d ",
>  			   ntohs(tuple->src.u.dccp.port),
>  			   ntohs(tuple->dst.u.dccp.port));
>  		break;
>  	case IPPROTO_SCTP:
> -		seq_printf(s, "sport=%hu dport=%hu ",
> +		seq_printf(s, "sport=%d dport=%d ",
>  			   ntohs(tuple->src.u.sctp.port),
>  			   ntohs(tuple->dst.u.sctp.port));
>  		break;
> -- 
> 2.30.2
> 
