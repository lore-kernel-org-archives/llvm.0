Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B3320E5
	for <llvm@lists.linux.dev>; Fri,  8 Apr 2022 15:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6129C385A3;
	Fri,  8 Apr 2022 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649430298;
	bh=an+fC0xbH99y8i5dJa9nG5z8u5iECRDcXrmVP68kI8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K0Jhq96efaqthazPlC/NbOp8eIpAAFZh0bIlXGt6SC5Glh5rKb+Y6PuMKATkliOtz
	 UGQWAbhUhrTbL/YLlIJY7Rw3z6KjY7zHRy0LCgQCkrqu9mfPBcjV2DOhOtipjM8z2T
	 1nYAtpCIyAhsSRwOeCE4Pmj/XX67b8GSZ8qCEgSZ7NeFg8Q/kVBqX3ogQXdKAR3ysG
	 ZcH/1u6k+aaUBnHKLrbsm1f3RMHQ97wyWNcjrOgmHAu9fB6bNuxrAMz913xM5rTziW
	 z9GHWBKgS5Ktp4N0csuZyGIaplPvROivohBRdvjs86vmENyCUhwofndNSR9y1XNExR
	 jS+ICqtz+pnJA==
Date: Fri, 8 Apr 2022 08:04:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, keescook@chromium.org, ardb@kernel.org,
	llvm@lists.linux.dev
Subject: Re: allmodconfig builds failing to link on arm64
Message-ID: <YlBPGFs2PMNX6est@dev-arch.thelio-3990X>
References: <20220408115407.GA27685@willie-the-truck>
 <YlBKln4m6JiLRrjl@lakrids>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlBKln4m6JiLRrjl@lakrids>

Hi Will and Mark,

On Fri, Apr 08, 2022 at 03:45:42PM +0100, Mark Rutland wrote:
> On Fri, Apr 08, 2022 at 12:54:07PM +0100, Will Deacon wrote:
> > Hi folks,
> 
> Hi Will,
> 
> > Since -rc1 (although I haven't tried bisecting the merge window), I'm
> > not able to link allmodconfig for arm64:
> > 
> > aarch64-linux-gnu-ld: .init.data has both ordered [`__patchable_function_entries' in init/main.o] and unordered [`.init_array.1' in virt/lib/irqbypass.o] sections
> > aarch64-linux-gnu-ld: final link failed: bad value
> > make: *** [Makefile:1158: vmlinux] Error 1
> > 
> > I'm using an Android clang based on 12.0.6 and LD claims to be
> > 2.33.1.20191209.
> 
> I can reproduce that when using the llvm.org 12.0.0 binaries along with the
> kernel.org crosstool 9.2.0 binaries (binutils 2.32) to build v5.18-rc1
> allmodconfig.
> 
> I see the failure with (at least) the following combinations that I tested:
> 
> * LLVM 11.0.0 && binutils 2.34 (kernel.org 8.4.0 binaries)
> * LLVM 12.0.0 && binutils 2.30 (kernel.org 8.1.0 binaries)
> * LLVM 12.0.0 && binutils 2.32 (kernel.org 9.2.0 binaries)
> * LLVM 12.0.0 && binutils 2.34 (kernel.org 8.4.0/9.3.0 binaries)
> * LLVM 13.0.0 && binutils 2.34 (kernel.org 8.4.0 binaries)
> * LLVM 14.0.0 && binutils 2.34 (kernel.org 8.4.0 binaries)
> 
> I *DO NOT* see the failure with the following combinations:
> 
> * LLVM 12.0.0 && binutils 2.36.1 (kernel.org 10.3.0/11.1.0 binaries)
> * LLVM 13.0.0 && binutils 2.36.1 (kernel.org 10.3.0/11.1.0 binaries)
> * LLVM 14.0.0 && binutils 2.36.1 (kernel.org 10.3.0/11.1.0 binaries)
> 
> So clearly something changed on the binutils side between 2.34 and
> 2.36.1, but I don't know whether either behaviour is incorrect, or
> whether LLVM implicitly depends upon a newer binutils version.

Correct, it sounds like it is 2.36 where this issue disappears:

https://github.com/ClangBuiltLinux/linux/issues/1507

https://sourceware.org/bugzilla/show_bug.cgi?id=26256

I don't know if something changed in LLVM to cause this but if it did,
it has clearly been there since LLVM 11, so it is probably not worth
hunting down. Unfortunately, our testing with just "CC=clang" has been
lacking, as we are primarily focused on using the whole LLVM suite, so
this could have been around for a while and we just missed it.

It sounds like this same issue would be seen with GCC 11+ and older
binutils but I am guessing that combination is not quite as common, as
GCC 11.1 was released April 2021 and binutils 2.36 had been out for
three months at that point.

> I don't know why this suddenly became a problem in v5.18-rc1; I'll have
> a look.

Yes, this part is odd, because according to our issue above, this has
been visible for a couple releases. Perhaps some configuration change
allows CONFIG_FTRACE and CONFIG_STACK_TRACER to be turned on with
allmodconfig now?

I think we can probably work around this in Kconfig fairly easily, I can
take a look at that today if necessary.

Cheers,
Nathan
