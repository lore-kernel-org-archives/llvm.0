Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADA21FA5
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 15:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A3BC385A9;
	Fri, 27 May 2022 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653665517;
	bh=lDacCcW5oBQ/nFAD4l5L8yV6/DrYAxo5jI0xrrZLIUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otNuxF4tGMSeaMha2xXHnHV5OIS3F3SZzm4iyeVBirWWS4lloMSYuJCB4Ggkhg5N5
	 XjthG4zVxpbfHSE3zapxjG2J8XAf0xjt39HDVxpGBozFr9LhWmnAof47DnYBC4sfQu
	 a6VMJqVey0NrS102dTQKfTCZdWAwRJZZdAAmiucP4mxrG8wObPT0UgYvpDUYT181H/
	 L/SkGGfeFYUN4B4qGd6tX8ri7FcnLh6fpt/QPv9ejo+SLJPgVPqxu4b6SH6+7eP34u
	 QfvJnEGY/QF7WERzBIi4qxx+bQLWbzCG6u3E0d5ics0Kv4dDyy4vHvW0/EDBN1UNWH
	 U5qpK0EH3X50A==
Date: Fri, 27 May 2022 08:31:54 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>, llvm@lists.linux.dev,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v7 2/8] kbuild: do not create *.prelink.o for Clang LTO
 or IBT
Message-ID: <20220527153154.hivyahzjz3txouoi@treble>
References: <20220527100155.1996314-1-masahiroy@kernel.org>
 <20220527100155.1996314-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220527100155.1996314-3-masahiroy@kernel.org>

On Fri, May 27, 2022 at 07:01:49PM +0900, Masahiro Yamada wrote:
> New build flow
> ==============
> 
>  [1] single-object module
> 
>   Since there is only one object, there is no need to keep the LLVM IR.
>   Use $(CC)+$(LD) to generate an ELF object in one build rule. When LTO
>   is disabled, $(LD) is unneeded because $(CC) produces an ELF object.
> 
>                $(CC)+$(LD)+objtool              $(LD)
>     foo.c ----------------------------> foo.o ---------> foo.ko
>                                         (ELF)     |
>                                                   |
>                                       foo.mod.o --/
> 
>  [2] multi-object module
> 
>   Previously, $(AR) was used to combine LLVM bitcode into an archive,
>   but there was no technical reason to do so. Use $(LD) to merge them
>   into a single ELF object.
> 
>                                $(LD)
>              $(CC)            +objtool          $(LD)
>     foo1.c ---------> foo1.o ---------> foo.o ---------> foo.ko
>                                  |      (ELF)     |
>     foo2.c ---------> foo2.o ----/                |
>                      (LLVM IR)        foo.mod.o --/
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM-14 (x86-64)

Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh
