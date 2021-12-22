Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E4C168
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 18:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1803C36AE5;
	Wed, 22 Dec 2021 18:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640197973;
	bh=oFYOckPrfQfT+uCoOEZdyGToL0hqy4zg5P6iJUy3w1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyMhwi0LEaJGm8qABqcqgBke3EtgOYjBBVJEZeAtY8BmH6px+WmDk82rO7+W92Mu1
	 8pO0dmA5kBM97u0Ox7C8kmNWqYAGx3Ys+BwUOoZmCoLs94h2uroISKAda33lnQlX/r
	 18JpPiEJx+Pyq7FMqec5mGNQHIOOSTy0AMeZEfUFh+LcIgcqRsxmB6Z3eWIBzrjjc2
	 8E+UCxMEdv23dVEa9yEXG3JY1ZLZMWbr+g9NLfdfKq/VNKiG7HEMYCkUFYrWYCBGAU
	 uQQba9SLIef6ahPwmBppHOBZvlD8IC0MZN109fOl4hkV8VjDLrlgHLw0tfxtPvD6b5
	 4MC2yQgkebysQ==
Date: Wed, 22 Dec 2021 11:32:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: llvm@lists.linux.dev, open list <linux-kernel@vger.kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [next] arm: current.h:53:6: error: out of range pc-relative
 fixup value
Message-ID: <YcNvUAMaRKBzUUcy@archlinux-ax161>
References: <CA+G9fYuz1Bfkfga7xVPVdTLETBQK3=4UsXq15kZW8C85DhyXJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuz1Bfkfga7xVPVdTLETBQK3=4UsXq15kZW8C85DhyXJQ@mail.gmail.com>

On Wed, Dec 22, 2021 at 11:57:20PM +0530, Naresh Kamboju wrote:
> [ Please ignore this email if it is already reported ]
> 
> On Linux next 20211220 (and  20211222) tag following arm config builds failed
> with clang-11, clang-12, clang-13 and clang-nightly.
> 
> Build errors:
> -------------
> In file included from /builds/linux/kernel/sched/core.c:10:
> In file included from /builds/linux/include/trace/events/sched.h:8:
> In file included from /builds/linux/include/linux/kthread.h:6:
> In file included from /builds/linux/include/linux/sched.h:12:
> /builds/linux/arch/arm/include/asm/current.h:53:6: error: out of range
> pc-relative fixup value
>         asm(LOAD_SYM_ARMV6(%0, __current) : "=r"(cur));
>             ^
> /builds/linux/arch/arm/include/asm/insn.h:25:2: note: expanded from
> macro 'LOAD_SYM_ARMV6'
>         "       ldr     " #reg ", =" #sym "                     \n\t"   \
>         ^
> <inline asm>:1:3: note: instantiated into assembly here
>                 ldr     r2, =__current
>                 ^

Report on our issue tracker with discussion:

https://github.com/ClangBuiltLinux/linux/issues/1551

Ard has a fix that should resolve this here:

https://lore.kernel.org/r/20211222104939.1154570-1-ardb@kernel.org/

I am about to reply with a Tested-by tag, I have tested LLVM 12 and 13
and my 14 build is running right now. Might be helpful for you to run
that patch through your matrix as well.

Cheers,
Nathan
