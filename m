Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D2B3201
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 17:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3585CC3411B;
	Fri, 17 Jun 2022 17:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655485460;
	bh=ZNX3SfhnNB+4HcBjQtfIi5dVBrlpAT055QTd12dr/tQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKFgLStoSjUpMVrxi2e9cyGd8qtsETZPCwQCv4JB3exTg8o+8mok9vyb4xzWyyyrR
	 EuxzGCdTfazkPjTEfmL9bJ/e0OJuxS/ler0/tg+faI9fVlfP/MthwkgB0aCSDPz8UQ
	 tTPbhRPqxRMYNOBWiafVizefUHwWWcC+QisGf8WszS58L0Bx0bWDAMiwp1QQNUwCtV
	 6ln+MtWx7odTbrTEv3aHR6PBshSKppm47LA84RhhOFajqxekKFh4znFBaW3UrTAgcR
	 17w4GWJP/8acko7rPnW/JjClRWpT7x7aLFmaS6h/ut5pHKgrc4pNqh/5NuoBlxAHf1
	 U1hVF2au3vsPA==
Date: Fri, 17 Jun 2022 10:04:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Tom Rix <trix@redhat.com>, Michal Marek <michal.lkml@markovi.net>,
	Jonathan Corbet <corbet@lwn.net>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/llvm: Update Supported Arch table
Message-ID: <Yqy0EkraT0O52Na7@dev-arch.thelio-3990X>
References: <20220617165817.3204917-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617165817.3204917-1-ndesaulniers@google.com>

On Fri, Jun 17, 2022 at 09:58:17AM -0700, Nick Desaulniers wrote:
> While watching Michael's new talk on Clang-built-Linux, I noticed the
> arch table in our docs that he refers to is outdated.
> 
> Add hexagon and User Mode.  Bump MIPS and RISCV to LLVM=1.  PowerPC is
> almost LLVM=1 capable; ppc64le works, but ppc64 (big endian) and ppc32
> still need more work.
> 
> Link: https://youtu.be/W4zdEDpvR5c?t=399
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for updating this!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Documentation/kbuild/llvm.rst | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index b854bb413164..6b2bac8e9ce0 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -129,18 +129,24 @@ yet. Bug reports are always welcome at the issue tracker below!
>     * - arm64
>       - Supported
>       - ``LLVM=1``
> +   * - hexagon
> +     - Maintained
> +     - ``LLVM=1``
>     * - mips
>       - Maintained
> -     - ``CC=clang``
> +     - ``LLVM=1``
>     * - powerpc
>       - Maintained
>       - ``CC=clang``
>     * - riscv
>       - Maintained
> -     - ``CC=clang``
> +     - ``LLVM=1``
>     * - s390
>       - Maintained
>       - ``CC=clang``
> +   * - um (User Mode)
> +     - Maintained
> +     - ``LLVM=1``
>     * - x86
>       - Supported
>       - ``LLVM=1``
> -- 
> 2.36.1.476.g0c4daa206d-goog
> 
