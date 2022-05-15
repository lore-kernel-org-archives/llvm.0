Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E2E620
	for <llvm@lists.linux.dev>; Sun, 15 May 2022 10:31:02 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1JZB3KJxz4xXS;
	Sun, 15 May 2022 20:30:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev
Cc: Gabriel Paubert <paubert@iram.es>, Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20220406070038.3704604-1-aik@ozlabs.ru>
References: <20220406070038.3704604-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel v3] powerpc/boot: Stop using RELACOUNT
Message-Id: <165261051395.1047019.1825598688195889072.b4-ty@ellerman.id.au>
Date: Sun, 15 May 2022 20:28:33 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 6 Apr 2022 17:00:38 +1000, Alexey Kardashevskiy wrote:
> So far the RELACOUNT tag from the ELF header was containing the exact
> number of R_PPC_RELATIVE/R_PPC64_RELATIVE relocations. However the LLVM's
> recent change [1] make it equal-or-less than the actual number which
> makes it useless.
> 
> This replaces RELACOUNT in zImage loader with a pair of RELASZ and RELAENT.
> The vmlinux relocation code is fixed in commit d79976918852
> ("powerpc/64: Add UADDR64 relocation support").
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/boot: Stop using RELACOUNT
      https://git.kernel.org/powerpc/c/c14d31bae372e050b053f2511fb3f0f90c27e4f9

cheers
