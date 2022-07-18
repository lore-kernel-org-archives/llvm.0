Received: from mail.netfilter.org (mail.netfilter.org [217.70.188.207])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B56A4683
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 21:38:10 +0000 (UTC)
Date: Mon, 18 Jul 2022 23:38:02 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Justin Stitt <justinstitt@google.com>
Cc: nathan@kernel.org, coreteam@netfilter.org, davem@davemloft.net,
	edumazet@google.com, fw@strlen.de, kadlec@netfilter.org,
	kuba@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	ndesaulniers@google.com, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, pabeni@redhat.com, trix@redhat.com
Subject: Re: [PATCH v2] netfilter: xt_TPROXY: remove pr_debug invocations
Message-ID: <YtXSuqVZ7160Kyls@salvia>
References: <Ys3DwnYiF9eDwr2T@dev-arch.thelio-3990X>
 <20220712204900.660569-1-justinstitt@google.com>
 <CAFhGd8p2o45-mw50=4dPxmpKe5kZf2t_p=vpy7T5vZt3VUkYiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFhGd8p2o45-mw50=4dPxmpKe5kZf2t_p=vpy7T5vZt3VUkYiA@mail.gmail.com>

On Mon, Jul 18, 2022 at 10:43:17AM -0700, Justin Stitt wrote:
> Any chance a maintainer could take a look at this patch? I am trying
> to get it through this cycle and we are so close to enabling the
> -Wformat option for Clang. There's only a handful of patches remaining
> until the patch enabling this warning can be sent!

I'll place this into nf-next, thanks.
