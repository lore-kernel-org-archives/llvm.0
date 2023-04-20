Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE558C15
	for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 15:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C98C433EF;
	Thu, 20 Apr 2023 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682005539;
	bh=RqzPLJRv4Lf5O4O76oH40wEJLKGg6yw+iZXeH5rG4dQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=afAw6WGMaD+BqMxQEw8SvFAUttM3QUu8SyfnKbKVc0VpwAMVB+N9ZG+fVy77/GKHR
	 rWqcib927XQn66zUS5pm7oEzL7wXtC4/rHCD12g9nVU3JqrrKXCH/2uKVShmX5uzxH
	 2PpZpTeSdkjf01sz7bLNUYi1Au7100egrqL99qczKD0PwuS29m0LSDgiZQTaxjsLVz
	 AC6BVl54iiJ96LnB+EMYSozkdcoPIh59DuKFxSnwTwoOkLLaW1UpnEHdaLzRPyKL8+
	 9F6/JK3hVTSkmysyWcVD7EHl3JcsJlM9bdmXr5CVfGxOdDhL/Nv4/hruWBkr8VX2ux
	 ty9OD1smfOtKA==
Date: Thu, 20 Apr 2023 08:45:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linux-mips@vger.kernel.org, llvm@lists.linux.dev,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Phil =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: next: mips: ERROR: modpost: Section mismatches detected.
Message-ID: <20230420154537.GA706381@dev-arch.thelio-3990X>
References: <CA+G9fYt+4e57Gdy6cix=LeNK6XqWoui8du=mZWu=cf8vPYocKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYt+4e57Gdy6cix=LeNK6XqWoui8du=mZWu=cf8vPYocKw@mail.gmail.com>

Hi Naresh,

On Thu, Apr 20, 2023 at 04:31:12PM +0530, Naresh Kamboju wrote:
> Following build failures noticed on Linux next-20230419 for mips.
> 
> Regressions found on mips:
>  - build/clang-nightly-allnoconfig
>  - build/clang-16-allnoconfig
>  - build/clang-16-tinyconfig
>  - build/clang-nightly-tinyconfig
> 
> 
> arch/mips/kernel/genex.S:520:2: warning: macro defined with named
> parameters which are not used in macro body, possible positional
> parameter found in body which will have no effect
>  .macro __BUILD_verbose nexception
>  ^
> WARNING: modpost: vmlinux.o: section mismatch in reference: check_bugs
> (section: .text) -> check_bugs32 (section: .init.text)
> ERROR: modpost: Section mismatches detected.
> Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
> make[2]: *** [scripts/Makefile.modpost:136: vmlinux.symvers] Error 1
> make[2]: *** Deleting file 'vmlinux.symvers'
> make[2]: Target '__modpost' not remade because of errors.
> make[1]: *** [Makefile:1978: modpost] Error 2

Thanks for the report. I sent a patch for this yesterday:

https://lore.kernel.org/20230419-mips-check_bugs-init-attribute-v1-1-91e6eed55b89@kernel.org/

Cheers,
Nathan
