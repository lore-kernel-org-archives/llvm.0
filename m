Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1656917E9
	for <llvm@lists.linux.dev>; Mon,  3 Oct 2022 17:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C41CC433D6;
	Mon,  3 Oct 2022 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664817005;
	bh=jrqogJN868qyHKjau9Ij3FcAorXeaYlWGK7fPCmyOzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tRUOnk/O14dqEtGuH88iwm/y+qBbJD6alLUrOSPbQnajN0YWqLWN3yji8kYnXY0cy
	 r1eQRcD4BwLLJ4Xl8i+w0wnlk6vFhrU/tBA7iv5NksgGv3rZbBJcPbNUgawCfzfeBv
	 0iJ0OYjU+F+Y7dYtcAtj35NWkeKI43BsXaP4uvYej3z2KAOOQGlSkha95/hElXG00H
	 PZ4ND6RbRaPhR9xBeZn3+nEJurAuU8OCgl8Nnj2CHc14UfBUrOJCtYCSKybFduKdgH
	 j/ZltU+OQwj6dtyhLUQjPy5LD+a+832dGVzDFHsNIdDS4hH2Up3+Ma3QEkN7eb5Qxt
	 d75j0gjeu7BNg==
Date: Mon, 3 Oct 2022 10:10:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] Kconfig.debug: add toolchain checks for
 DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
Message-ID: <YzsXa0GCGT6A0szV@dev-arch.thelio-3990X>
References: <20221002181107.51286-1-masahiroy@kernel.org>
 <20221002181107.51286-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221002181107.51286-3-masahiroy@kernel.org>

On Mon, Oct 03, 2022 at 03:11:06AM +0900, Masahiro Yamada wrote:
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT passes the -g option to the
> command line. The actual DWARF version is up to the toolchain.
> 
> The combination of GCC and GAS works fine, and Clang with the integrated
> assembler is good too.
> 
> The combination of Clang and GAS is a bit tricky, but at least, the
> default -g flag worked until LLVM 14 was released because Clang <=13
> defaults to DWARF v4.
> 
> Clang 14 switched to DWARF v5 by default.
> 
> Now, CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT has the same issue as
> addressed by commit 98cd6f521f10 ("Kconfig: allow explicit opt in to
> DWARF v5").
> 
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y for Clang >= 14 and
> GAS < 2.35 produces a ton of errors like follows:
> 
>   /tmp/main-c2741c.s: Assembler messages:
>   /tmp/main-c2741c.s:109: Error: junk at end of line, first unrecognized character is `"'
>   /tmp/main-c2741c.s:109: Error: file number less than one
> 
> Add 'depends on' to check toolchains.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  lib/Kconfig.debug | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index f4b2165f24db..cc90414d492e 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -253,6 +253,7 @@ config DEBUG_INFO_NONE
>  config DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>  	bool "Rely on the toolchain's implicit default DWARF version"
>  	select DEBUG_INFO
> +	depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502)
>  	help
>  	  The implicit default version of DWARF debug info produced by a
>  	  toolchain changes over time.
> -- 
> 2.34.1
> 
> 

Could we do something like this instead? Bikeshed the configuration
names as much as you want but we are duplicating most of this
conditional in a few different places so it would be good to consolidate
those in my opinion. Even though the DWARF4 and DWARF5 conditions are
the same, they might diverge so I think it makes sense to keep them
separate.

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index cc90414d492e..8e34a639cd40 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -231,6 +231,17 @@ config DEBUG_INFO
 	  in the "Debug information" choice below, indicating that debug
 	  information will be generated for build targets.
 
+config CC_AND_AS_SUPPORT_DWARF4
+	def_bool !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)
+
+config CC_AND_AS_SUPPORT_DWARF5
+	def_bool !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)
+
+config CC_AND_AS_SUPPORT_DWARF_DEFAULT
+	bool
+	default y if CC_AND_AS_SUPPORT_DWARF5 && (CLANG_VERSION >= 140000 || GCC_VERSION >= 110000)
+	default y if CC_AND_AS_SUPPORT_DWARF4 && (CLANG_VERSION < 140000 || GCC_VERSION < 110000)
+
 choice
 	prompt "Debug information"
 	depends on DEBUG_KERNEL
@@ -253,7 +264,7 @@ config DEBUG_INFO_NONE
 config DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
 	bool "Rely on the toolchain's implicit default DWARF version"
 	select DEBUG_INFO
-	depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502)
+	depends on CC_AND_AS_SUPPORT_DWARF_DEFAULT
 	help
 	  The implicit default version of DWARF debug info produced by a
 	  toolchain changes over time.
@@ -265,7 +276,7 @@ config DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
 config DEBUG_INFO_DWARF4
 	bool "Generate DWARF Version 4 debuginfo"
 	select DEBUG_INFO
-	depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)
+	depends on CC_AND_AS_SUPPORT_DWARF4
 	help
 	  Generate DWARF v4 debug info. This requires gcc 4.5+, binutils 2.35.2
 	  if using clang without clang's integrated assembler, and gdb 7.0+.
@@ -277,7 +288,7 @@ config DEBUG_INFO_DWARF4
 config DEBUG_INFO_DWARF5
 	bool "Generate DWARF Version 5 debuginfo"
 	select DEBUG_INFO
-	depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)
+	depends on CC_AND_AS_SUPPORT_DWARF5
 	help
 	  Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
 	  5.0+ accepts the -gdwarf-5 flag but only had partial support for some
