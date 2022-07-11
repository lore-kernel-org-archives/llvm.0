Received: from mail.netfilter.org (mail.netfilter.org [217.70.188.207])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B2B1FCE
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 09:12:38 +0000 (UTC)
Date: Mon, 11 Jul 2022 11:04:10 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] netfilter: xt_TPROXY: fix clang -Wformat warnings:
Message-ID: <YsvniilEnfUOd+yk@salvia>
References: <20220707191745.840590-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220707191745.840590-1-justinstitt@google.com>

On Thu, Jul 07, 2022 at 12:17:45PM -0700, Justin Stitt wrote:
> diff --git a/net/netfilter/xt_TPROXY.c b/net/netfilter/xt_TPROXY.c
> index 459d0696c91a..5d74abffc94f 100644
> --- a/net/netfilter/xt_TPROXY.c
> +++ b/net/netfilter/xt_TPROXY.c
> @@ -169,7 +169,7 @@ tproxy_tg6_v1(struct sk_buff *skb, const struct xt_action_param *par)
>  		   targets on the same rule yet */
>  		skb->mark = (skb->mark & ~tgi->mark_mask) ^ tgi->mark_value;
>  
> -		pr_debug("redirecting: proto %hhu %pI6:%hu -> %pI6:%hu, mark: %x\n",
> +		pr_debug("redirecting: proto %d %pI6:%hu -> %pI6:%hu, mark: %x\n",
>  			 tproto, &iph->saddr, ntohs(hp->source),
>  			 laddr, ntohs(lport), skb->mark);
>  
> @@ -177,7 +177,7 @@ tproxy_tg6_v1(struct sk_buff *skb, const struct xt_action_param *par)
>  		return NF_ACCEPT;
>  	}
>  
> -	pr_debug("no socket, dropping: proto %hhu %pI6:%hu -> %pI6:%hu, mark: %x\n",
> +	pr_debug("no socket, dropping: proto %d %pI6:%hu -> %pI6:%hu, mark: %x\n",
>  		 tproto, &iph->saddr, ntohs(hp->source),
>  		 &iph->daddr, ntohs(hp->dest), skb->mark);

Could you instead send a patch to remove these pr_debug calls?

Thanks.
