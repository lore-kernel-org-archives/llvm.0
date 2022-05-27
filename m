Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB231FA5
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 15:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEF8C385B8;
	Fri, 27 May 2022 15:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653666655;
	bh=TPf6is16EOLHLwQWRGMgJn/SSSCwI0QxzD/Gb/AqW7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnbYL7XY/hwZg1VbAnfs/juboFYB8oW1A6Rowzr2+JZ5PEgeSXaopCeK89HOD08y0
	 IXS5aZ4LLvFnvf9wyPEuzTJ1nQhcj/cDNLf/Ez0HBMTCx6JxGso9myFcDFnKGL0LsC
	 K4js/L9rGFQGpKA294BNzS5ydTa/GsxhSRlPuVZrCjpTxZjxRyh3F9oE1t6GYLtHIO
	 2Ll5sGDa9/LOZJr6fvDz+QcuwHRS5wpxIkZzD5Ep5aoPBt3KSXWtFJBchqwYk6fhot
	 7Dl68DW7yr1s6ErTN9TpCq/cAem3HgrHrnT7l3cmgEbeX6+9s8p2Tb2G5F7q9KwUUW
	 5RiJiaLNNq2DA==
Date: Fri, 27 May 2022 08:50:53 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>, llvm@lists.linux.dev,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <n.schier@avm.de>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v7 8/8] kbuild: rebuild multi-object modules when objtool
 is updated
Message-ID: <20220527155053.i4xfrlupuqfu4kem@treble>
References: <20220527100155.1996314-1-masahiroy@kernel.org>
 <20220527100155.1996314-9-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220527100155.1996314-9-masahiroy@kernel.org>

On Fri, May 27, 2022 at 07:01:55PM +0900, Masahiro Yamada wrote:
> When CONFIG_LTO_CLANG or CONFIG_X86_KERNEL_IBT is enabled, objtool for
> multi-object modules is postponed until the objects are linked together.
> 
> Make sure to re-run objtool and re-link multi-object modules when
> objtool is updated.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Nicolas Schier <n.schier@avm.de>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM-14 (x86-64)

Hi Masahiro,

Is it also possible to rebuild vmlinux.o when objtool changes, for
CONFIG_LTO_CLANG, CONFIG_X86_KERNEL_IBT, or CONFIG_NOINSTR_VALIDATION?
That doesn't seem to be happening.

-- 
Josh
