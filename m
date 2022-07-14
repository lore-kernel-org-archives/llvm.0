Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E324A38
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 15:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F314FC34114;
	Thu, 14 Jul 2022 15:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657814118;
	bh=4qMtVyFcWvW65W5QmSZM/dYNE02o7SyZGAA6cLCMC1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIn3ue86mrF4qt03v8pjqJ798SWoFvduzW+vmwLdXgPEJ5P79RzUld1b15eX6ypQ2
	 Xn1v4A+oe8cX9CcdnYnxK7c+RQKzPwKGf+C8qllo7KOtzrQ83V7ncYg9RELJ7uLiuT
	 jwTXTXFICfYAhtMT2XpnZ9akks8Lys76lMqB9S+L7hT2cinDuXgR8AJNi1pcm/ZvGi
	 CnDUc5VJN7wR9sX/7o/LRalaOC33SPp7wfM2uI2f2U08saUEwWDoOsR2SPpsAZFYiS
	 /QcbnGxvjl5+jH3gzSjbn0sEYV7Tn6n+05oiJcAECjLHVqVdFA7L3y5XOVoup/uY8Q
	 OX/aIZXROLs0Q==
Date: Thu, 14 Jul 2022 08:55:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev
Subject: Re: Linux v5.19-rc6: Building and testing x86/retbleed
Message-ID: <YtA8ZH5sZWL35/Pr@dev-arch.thelio-3990X>
References: <CA+icZUURRcY+f6OHbAqc_ruUSsft8hMttOy9TS=k0MnATpjLGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUURRcY+f6OHbAqc_ruUSsft8hMttOy9TS=k0MnATpjLGg@mail.gmail.com>

Hi Sedat!

On Thu, Jul 14, 2022 at 11:49:33AM +0200, Sedat Dilek wrote:
> Hi,
> 
> as far as I can see to fully support x86/retbleed you need LLVM-15?

> Due to:
> 
> [ arch/x86/Kconfig ]
> config CC_HAS_RETURN_THUNK
> def_bool $(cc-option,-mfunction-return=thunk-extern)

Per the documentation, rethunks are only effective for certain AMD Zen
platforms so unless you have one of those CPUs, you don't need a new
compiler for the retbleed mitigations. Additionally, you might have an
old enough CPU that doesn't require them anyways, the affected models
can be seen in the cpu_vuln_blacklist variable in
arch/x86/kernel/cpu/common.c.

For the record, here is the output of the retbleed sysfs node on all of
my x86 hardware:

AMD Threadripper 3990X: Mitigation: untrained return thunk; SMT enabled with STIBP protection
Intel Core i7-11700: Mitigation: Enhanced IBRS
AMD Ryzen 3 4300G: Mitigation: untrained return thunk; SMT enabled with STIBP protection
Intel Core i5-4210U: Not affected

> Has someone a commit-id which supports above and is stable/safe?

This is the latest compiler I built and everything appears to work fine:

$ clang --version | head -1
ClangBuiltLinux clang version 15.0.0 (https://github.com/llvm/llvm-project 0406c0cda675f3cb7d294a3e65eb4f19c9efe98b)

> Has anyone numbers w/ and w/o enabling x86/retbleed?

I haven't noticed any major slow downs while compiling kernels, which is
the main use case for my workstation, but it is a Zen platform so I am
not paying the IBPB penalty, which will be worse. Some stats of my full
set of builds against linux-next and mainline:

Before:

linux-next: 2h 29m 44s
mainline: 2h 21m 49s

After:

linux-next: 2h 34m 04s
mainline: 2h 23m 53s

I would say that is within the noise of thermal throttling and other
variables.

Cheers,
Nathan
