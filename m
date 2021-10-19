Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDD62C88
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 10:23:42 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4HYTtZ6cjhz4x2Lp
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 10:07:02 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="kgnUhhOx"
Date: Tue, 19 Oct 2021 10:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
	t=1634637998; bh=LOFsSQgEL4w+fS68cEWnarmWnUdXiUZe2VQW9yMhlYk=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=kgnUhhOx8j6ksT5RA6+ox2FUcgrA4VVcqOldtTlgDhhKSNfUVd498eXSm5hL82SQn
	 Vm3wvVOK0PrS3vSnid7gZE6SBQBntl4WR/Omv6Cq4Idpv6TJUU+pgbBB1XGTN1MYiT
	 hNIk4CI43LHFyiElLWwvfQYkg0hJLXQrHSuGtYE8cw9xFo58ByNHjnTL7Mhk3WzwyN
	 08R/zkYS6jzfHnRjsWKuTL6BybGW+N7dAMV+Rd+b7FVIpJ8eXw0V4z3KeIxMpP+QAp
	 nGqASZ2lfKwKJw1L75wTS8+Prb7EzGYyhsz+08EzUZjo0s3SkKNhwkJLmgWpd60aoP
	 kHly93G10ZO4Q==
To: Sami Tolvanen <samitolvanen@google.com>
From: Alexander Lobakin <alobakin@pm.me>
Cc: Alexander Lobakin <alobakin@pm.me>, x86@kernel.org, Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: [PATCH v5 00/15] x86: Add support for Clang CFI
Message-ID: <20211019095947.89257-1-alobakin@pm.me>
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

Hi,

I found [0] while was testing Peter's retpoline series, wanted to
ask / double check if that is because I'm using ClangCFI for x86
on unsupported Clang 12. It is fixed in 13 I suppose?

[0] https://lore.kernel.org/all/20211019094038.80569-1-alobakin@pm.me

Thanks,
Al

