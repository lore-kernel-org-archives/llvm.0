Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C962A15A0
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 04:04:58 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbncL6vW7z4x3H;
	Thu, 31 Aug 2023 14:04:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
In-Reply-To: <20230828-ppc_rerevert-v2-1-46b71a3656c6@google.com>
References: <20230828-ppc_rerevert-v2-1-46b71a3656c6@google.com>
Subject: Re: [PATCH v2] reapply: powerpc/xmon: Relax frame size for clang
Message-Id: <169345455034.11824.13251320830249144277.b4-ty@ellerman.id.au>
Date: Thu, 31 Aug 2023 14:02:30 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Mon, 28 Aug 2023 13:39:06 -0700, Nick Desaulniers wrote:
> This is a manual revert of commit
> 7f3c5d099b6f8452dc4dcfe4179ea48e6a13d0eb, but using
> ccflags-$(CONFIG_CC_IS_CLANG) which is shorter.
> 
> Turns out that this is reproducible still under specific compiler
> versions (mea culpa: I did not test every supported version of clang),
> and even a few randconfigs bots found.
> 
> [...]

Applied to powerpc/next.

[1/1] reapply: powerpc/xmon: Relax frame size for clang
      https://git.kernel.org/powerpc/c/90bae4d99beb1f31d8bde7c438a36e8875ae6090

cheers
