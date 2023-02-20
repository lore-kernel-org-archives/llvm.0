Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14225A3F
	for <llvm@lists.linux.dev>; Mon, 20 Feb 2023 03:51:41 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKpPk67NMz4x7y;
	Mon, 20 Feb 2023 14:51:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: nathan@kernel.org, ndesaulniers@google.com, mpe@ellerman.id.au, Anders Roxell <anders.roxell@linaro.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20220810114318.3220630-1-anders.roxell@linaro.org>
References: <20220810114318.3220630-1-anders.roxell@linaro.org>
Subject: Re: [PATCHv3, resend] powerpc: mm: radix_tlb: rearrange the if-else block
Message-Id: <167686496037.2406274.4922238912170748440.b4-ty@ellerman.id.au>
Date: Mon, 20 Feb 2023 14:49:20 +1100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 10 Aug 2022 13:43:18 +0200, Anders Roxell wrote:
> Clang warns:
> 
> arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
>                                 __tlbiel_va_range(hstart, hend, pid,
>                                                   ^~~~~~
> arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning
>                 unsigned long hstart, hend;
>                                     ^
>                                      = 0
> arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is uninitialized when used here [-Werror,-Wuninitialized]
>                                 __tlbiel_va_range(hstart, hend, pid,
>                                                           ^~~~
> arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the variable 'hend' to silence this warning
>                 unsigned long hstart, hend;
>                                           ^
>                                            = 0
> 2 errors generated.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: mm: radix_tlb: rearrange the if-else block
      https://git.kernel.org/powerpc/c/d78c8e32890ef7eca79ffd67c96022c7f9d8cce4

cheers
