Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128942C80
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 10:27:27 +0000 (UTC)
Date: Thu, 21 Oct 2021 10:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
	t=1634812035; bh=u9dXeRHmyJjJ/lRfD7FnZKxrYeIO9pbRnhaEFiIApHA=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=gF/MS+RdqblRdgH+fw/8LduG7fvCXAKuqA0bgpPF+hbc0/+Kw69rDI1cuvnLasAuU
	 9+S6pR3opgbGDcWGcqQeLFFkrkDoQMYg45kX+cyZ8FYKTtRgNAsFbWTLmTa4rRK/4P
	 5lw7SdMy256qFG54vaXLhgzJqMqR4Bnu1aM2J4OUMZbdFqa9rg7VgoYWGX6wK4UYCA
	 tlCabXp35jPeuuDvo29ZNMTmMKKvfxtZMS66Hg1jRt/rGMnIApHYp5rdQP3OwY65CO
	 eiyFjjGgaFZOeS042BBFKN6waG6Ymg0aqB5+FZD8DwaMhAtIRtDRTYPhLcPiHrU4Jq
	 zR+bwdYwEAUdg==
To: Sami Tolvanen <samitolvanen@google.com>
From: Alexander Lobakin <alobakin@pm.me>
Cc: Alexander Lobakin <alobakin@pm.me>, Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: [PATCH v5 00/15] x86: Add support for Clang CFI
Message-ID: <20211021102033.113197-1-alobakin@pm.me>
In-Reply-To: <20211013181658.1020262-1-samitolvanen@google.com>
References: <20211013181658.1020262-1-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 13 Oct 2021 11:16:43 -0700

> This series adds support for Clang's Control-Flow Integrity (CFI)
> checking to x86_64. With CFI, the compiler injects a runtime
> check before each indirect function call to ensure the target is
> a valid function with the correct static type. This restricts
> possible call targets and makes it more difficult for an attacker
> to exploit bugs that allow the modification of stored function
> pointers. For more details, see:
>
>   https://clang.llvm.org/docs/ControlFlowIntegrity.html
>
> Note that v5 is based on tip/master. The first two patches contain
> objtool support for CFI, the remaining patches change function
> declarations to use opaque types, fix type mismatch issues that
> confuse the compiler, and disable CFI where it can't be used.
>
> You can also pull this series from
>
>   https://github.com/samitolvanen/linux.git x86-cfi-v5

[ snip ]

I've been using it since the end of May on my x86_64, so for v5
(with changing retpoline thunks prototypes to opaque):

Reviwed-by: Alexander Lobakin <alobakin@pm.me>
Tested-by: Alexander Lobakin <alobakin@pm.me>

Thanks!
Al

