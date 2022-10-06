Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8192D4690
	for <llvm@lists.linux.dev>; Thu,  6 Oct 2022 18:07:25 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ogVH2-0001pm-1s; Thu, 06 Oct 2022 20:07:08 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Conor Dooley <conor@kernel.org>
Cc: Tom Rix <trix@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, Dao Lu <daolu@rivosinc.com>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: fix detection of toolchain Zihintpause support
Date: Thu, 06 Oct 2022 20:07:07 +0200
Message-ID: <2599561.BddDVKsqQX@diego>
In-Reply-To: <20221006173520.1785507-3-conor@kernel.org>
References: <20221006173520.1785507-1-conor@kernel.org> <20221006173520.1785507-3-conor@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 6. Oktober 2022, 19:35:21 CEST schrieb Conor Dooley:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> It is not sufficient to check if a toolchain supports a particular
> extension without checking if the linker supports that extension
> too. For example, Clang 15 supports Zihintpause but GNU bintutils
> 2.35.2 does not, leading build errors like so:
> 
> riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_c2p0_zihintpause2p0: Invalid or unknown z ISA extension: 'zihintpause'
> 
> Add a TOOLCHAIN_HAS_ZIHINTPAUSE which checks if each of the compiler,
> assembler and linker support the extension. Replace the ifdef in the
> vdso with one depending on this new symbol.
> 
> Fixes: 8eb060e10185 ("arch/riscv: add Zihintpause support")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


