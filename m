Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8745E36212C
	for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 22:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769725900; cv=none; b=UCnmwi7tHqxuQC1k7MBCe0NqXxJmZFdq/gkiPDhtVJ9EVX2pFjY6JsYpqfq+Eo+1vigAoGgQuXRZ7YyBfOXvJLg90qreP5gmRT0Cy60wDFKygHPzxLvHpzyk1Djd+kwlcBkRxalCKcVCkypC3Wj9oQqFsG3DNhUgqYkxmoXqbKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769725900; c=relaxed/simple;
	bh=E32m1zZl3x1RripaVchHUXrgIQHgmrfviHWdUL621HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emdNdlX0xSd+pv4GUmzILWl9xSowKxEMH9ZyF2uDEILSoxxtmcBoas4rujpI70aJHKZjgOMLGfI1DBl3TwMW2l9A7KO0vCqnPM023fdNPKK7g9fRf96FV95TrpgHQ/pLN1EXvuc3S4XsVSlo5kDXgkTYUI5YeHy3m++memqSdnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9XqZXlz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9XqZXlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFF7C4CEF7;
	Thu, 29 Jan 2026 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769725899;
	bh=E32m1zZl3x1RripaVchHUXrgIQHgmrfviHWdUL621HE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9XqZXlzP6Mp6G99g+KUIqj2ErofnD8ERZW7Gh29Xb9YlUznohVK/Imewv1JI6ILk
	 zQ+6rZYGMs5Wvsqs6eiDPtVG0t2AmarAYGamMZiH4MRm8iNAIQaGD7ouYFSixJQkdU
	 UBPtshydj6D/gmxbpm+w844GVPIpUpk66r/HzsTVio/nsCKXxgJSqGuGs5BB2MdXxR
	 mHp5HxhnkQ26Lo5h7Wd+XkinJfRgP5wE2Ek4ieDpicb1JesZT6T+RUU1jxgn2M3g9g
	 lBC9v94uFT2rnM2tCeKjHp9g3NkU5VUodpFxX4tnqkji6DOnNqdd5tmmkpJDoeU6Pu
	 zGJWVYtdLOj9g==
Date: Thu, 29 Jan 2026 15:31:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
Subject: Re: Failure to build with LLVM for the Wii
Message-ID: <20260129223136.GA1614447@ax162>
References: <aXs8sgAcci9FKKpx@luna>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXs8sgAcci9FKKpx@luna>

Hi Link,

On Thu, Jan 29, 2026 at 11:55:46AM +0100, Link Mauve wrote:
> I’m trying to build the kernel for the Nintendo Wii, using LLVM instead
> of gcc, in order to bring Rust support to this architecture (and also
> because my distribution doesn’t ship a cross-compiling gcc), but I get
> this build issue near the end:
> ```
> % make O=wii LLVM=1 ARCH=powerpc -j1
> make[1]: Entering directory '/home/linkmauve/dev/linux/wii'
>   GEN     Makefile
>   CALL    ../scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   WRAP    arch/powerpc/boot/dtbImage.wii
> objcopy: Unable to recognise the format of the input file `vmlinux'
> make[3]: *** [../arch/powerpc/boot/Makefile:394: arch/powerpc/boot/dtbImage.wii] Error 1
> make[2]: *** [../arch/powerpc/Makefile:236: zImage] Error 2
> make[1]: *** [/home/linkmauve/dev/linux/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/home/linkmauve/dev/linux/wii'
> make: *** [Makefile:248: __sub-make] Error 2
> ```
> 
> I believe it should use $(OBJCOPY) instead of objcopy, which is set to
> llvm-objcopy, but couldn’t figure out where it is misconfigured.
> 
> Thanks for your help!

It is the arch/powerpc/boot/wrapper script:

  https://github.com/ClangBuiltLinux/linux/issues/1601

I have a WIP series from long ago that may be a good starting point for
getting something working but there were some errors I never got around
to solving before having to shelve it for other issues:

  https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git/log/?h=wip/llvm-1-powerpc-boot-wrapper

Maybe something I (or someone else) can get back to soon.

Cheers,
Nathan
