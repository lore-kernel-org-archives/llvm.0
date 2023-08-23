Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD48BA48
	for <llvm@lists.linux.dev>; Wed, 23 Aug 2023 12:04:35 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4dR1jM0z4x4T;
	Wed, 23 Aug 2023 22:04:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, ndesaulniers@google.com
Cc: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20230817-ppc_xmon-v1-1-8cc2d51b9995@google.com>
References: <20230817-ppc_xmon-v1-1-8cc2d51b9995@google.com>
Subject: Re: [PATCH] Revert "powerpc/xmon: Relax frame size for clang"
Message-Id: <169279175573.797584.2695589362102577867.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thu, 17 Aug 2023 11:11:56 -0700, ndesaulniers@google.com wrote:
> This reverts commit 9c87156cce5a63735d1218f0096a65c50a7a32aa.
> 
> I have not been able to reproduce the reported -Wframe-larger-than=
> warning (or disassembly) with clang-11 or clang-18.
> 
> I don't know precisely when this was fixed in llvm, but it may be time
> to revert this.
> 
> [...]

Applied to powerpc/next.

[1/1] Revert "powerpc/xmon: Relax frame size for clang"
      https://git.kernel.org/powerpc/c/7f3c5d099b6f8452dc4dcfe4179ea48e6a13d0eb

cheers
