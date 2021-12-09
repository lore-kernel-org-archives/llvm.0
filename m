Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9002173
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 06:40:36 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4J8ktg48xXz4xhB;
	Thu,  9 Dec 2021 17:40:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1639032029;
	bh=suZjxbWzZfiwEHkXF7PVcnVEK2S44YPaAlsYAqlSBBA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GGuZ7UcqMCRzxt11p1WpFVObvEmF7QF3q/jrxLxUc6xSnoo7r1EJRkoqP1vn8unY6
	 vk7x0SjUtsMWVgxEegLSD5VvE9ZVlBVlLaw00vXtHyoyazgzpbwSjZnTZon8+G4xf6
	 PEj+0jm1xquSXV4uVu283TUDCNW8xthP5oi77M2zTAFJ0nojo4zIaZdV+Aohe0Ccoc
	 B0+hu9YJDrmbWYKuxfW36xqYW2PJT6hj38YjIqGG2ECCbWARwgLOH6iGd/5PuGeSE5
	 4+66hZc0dkWIA3FSB5tHK6qqWTSkWCHe0LLnqpGbnbHVMCRk3Zt/Tr2/9xnrurM6Gy
	 wPcbXvVFr7e4A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anders Roxell <anders.roxell@linaro.org>, arnd@arndb.de
Cc: nathan@kernel.org, ndesaulniers@google.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Anders Roxell <anders.roxell@linaro.org>, Naresh
 Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] powerpc: platforms: cell: pervasive: fix clang
 -Wimplicit-fallthrough
In-Reply-To: <20211207110228.698956-1-anders.roxell@linaro.org>
References: <20211207110228.698956-1-anders.roxell@linaro.org>
Date: Thu, 09 Dec 2021 17:40:24 +1100
Message-ID: <87zgpamgbr.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Anders Roxell <anders.roxell@linaro.org> writes:
> Clang warns:
>
> arch/powerpc/platforms/cell/pervasive.c:81:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>         case SRR1_WAKEEE:
>         ^
> arch/powerpc/platforms/cell/pervasive.c:81:2: note: insert 'break;' to avoid fall-through
>         case SRR1_WAKEEE:
>         ^
>         break;
> 1 error generated.
>
> Clang is more pedantic than GCC, which does not warn when failing
> through to a case that is just break or return. Clang's version
> is more in line with the kernel's own stance in deprecated.rst.
> Add athe missing break to silence the warning.
>
> Fixes: 6e83985b0f6e ("powerpc/cbe: Do not process external or decremeter interrupts from sreset")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  arch/powerpc/platforms/cell/pervasive.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/cell/pervasive.c b/arch/powerpc/platforms/cell/pervasive.c
> index 5b9a7e9f144b..dff8d5e7ab82 100644
> --- a/arch/powerpc/platforms/cell/pervasive.c
> +++ b/arch/powerpc/platforms/cell/pervasive.c
> @@ -78,6 +78,7 @@ static int cbe_system_reset_exception(struct pt_regs *regs)
>  	switch (regs->msr & SRR1_WAKEMASK) {
>  	case SRR1_WAKEDEC:
>  		set_dec(1);
> +		break;
>  	case SRR1_WAKEEE:
>  		/*
>  		 * Handle these when interrupts get re-enabled and we take

Thanks. I have definitely fixed this somewhere before, but I guess I
never sent it upstream, or it's still lying in a git stash of mine.

cheers
