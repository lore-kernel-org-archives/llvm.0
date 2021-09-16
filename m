Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C7B3FCF
	for <llvm@lists.linux.dev>; Thu, 16 Sep 2021 13:23:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F21336120F;
	Thu, 16 Sep 2021 13:23:50 +0000 (UTC)
Date: Thu, 16 Sep 2021 14:23:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] arm64: remove GCC version check for
 ARCH_SUPPORTS_INT128
Message-ID: <YUNFY0Tbb4MZntS8@arm.com>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-8-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-8-ndesaulniers@google.com>

On Fri, Sep 10, 2021 at 04:40:44PM -0700, Nick Desaulniers wrote:
> Now that GCC 5.1 is the minimally supported compiler version, this
> Kconfig check is no longer necessary.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
