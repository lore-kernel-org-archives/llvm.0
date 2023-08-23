Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9282BA48
	for <llvm@lists.linux.dev>; Wed, 23 Aug 2023 12:04:40 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4dW1J3dz4x2F;
	Wed, 23 Aug 2023 22:04:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
In-Reply-To: <20230803-ppc_tlbilxlpid-v3-1-ca84739bfd73@google.com>
References: <20230803-ppc_tlbilxlpid-v3-1-ca84739bfd73@google.com>
Subject: Re: [PATCH v3] powerpc/inst: add PPC_TLBILX_LPID
Message-Id: <169279175566.797584.17891188620028353230.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thu, 03 Aug 2023 11:33:52 -0700, Nick Desaulniers wrote:
> Clang didn't recognize the instruction tlbilxlpid. This was fixed in
> clang-18 [0] then backported to clang-17 [1].  To support clang-16 and
> older, rather than using that instruction bare in inline asm, add it to
> ppc-opcode.h and use that macro as is done elsewhere for other
> instructions.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/inst: add PPC_TLBILX_LPID
      https://git.kernel.org/powerpc/c/ae7936d232d862e5b8311180036281ffe93735b8

cheers
