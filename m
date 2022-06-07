Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A7528FB
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 15:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6C4C385A5;
	Tue,  7 Jun 2022 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654615625;
	bh=9YuKjBwPz0thK8vVB5EAsBSeWNQrCouwnj9xJ/aYOSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QLri+2fUczvTYPI1ycIjL+kuWoimg9jGQdjIdMtNZB+KIl6ofkrSr8uvQAS5cJdqD
	 tIpLcKMRdG9OfA5WJ2GqB6gUy6fqAzG2T/ar7ptwxJR72QAQH7HtWM/+ArWGrrLYvZ
	 Hy7I9EVVJVdLrmJB2G1SZ24rm07YmYH4D9CrY/c7zXA86sGFqa6ll4+nN1wN8Mj1z9
	 +IPb1X49Qy5rfCMwrMDkJsuOMmnugPr4XMm/K1QtaDRq5ZbzqyQRkTdE9pdcb5USuI
	 tNzf38xx9SmlOlx6MLGxuokimrjsh4kU08yp7UrUvGjX0UNEjhjvqBbG+dS9MvEfef
	 NaXamv1wc7+vg==
Date: Tue, 7 Jun 2022 08:27:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <jstitt007@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] netfilter: conntrack: fix this -Wformat clang warning:
Message-ID: <Yp9uRz40J24vWLSb@dev-arch.thelio-3990X>
References: <20220606212819.9548-1-jstitt007@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606212819.9548-1-jstitt007@gmail.com>

Hi Justin,

The subject might be a little more descriptive if if were something
like:

netfilter: conntrack: Fix clang -Wformat in print_tuple()

rather than saying "this warning", as subjects should be standalone from
the rest of the message. Minor nit but some maintainers have high
standards for commit messages.

On Mon, Jun 06, 2022 at 02:28:19PM -0700, Justin Stitt wrote:

It would be helpful to note here that this warning appears when building
arm64 with clang using -Wformat; the architecture is critical for
reproducing this warning.

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

I think that it is probably worth noting that ntohs() has type 'int' in
this case because arm64 does not define CONFIG_ARCH_USE_BUILTIN_BSWAP to
use the version of __swab16() with a cast to __u16; rather, it uses the
one with the conditional operator, which per 6.5.15.5 means the type of
the result of the conditional operator is determined through these
promotion rules as well.

I suspect that the conditional versions of __swab{16,32,64}() in
include/uapi/linux/swab.h want a cast on the outside of the conditional
operator with the specified type but I am not sure what other
repurcussions that might have so it is probably safer to just fix these
warnings up one by one.

> Thus it makes sense to change %hu (as well as %u) to %d.

Regardless of that, changing from '%hu' to '%d' is recommended so that
part of the change is fine. I am not sure that changing '%u' to '%d'
does anything other than add to the diff, as there was no warnings from
those, but consistency is key.

> Signed-off-by: Justin Stitt <jstitt007@gmail.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
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
> 
