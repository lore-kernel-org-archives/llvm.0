Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6072E2F21
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 17:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A0DC004E1;
	Thu,  3 Mar 2022 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646327129;
	bh=UlEEFvE4moKLFH7KT2/jhy8K9GOLr1k5Jamli9rMvJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhL2venSa+dZt8lmt8sVJR+CU5WOR+mJhRuKOeSdWd2ZMejS/NTl2K9pun+DmHTpm
	 nrg1Pv0ouXyubUOnN05Jm0xV/WDK3GihUb62V7Es2iXyhX9K7s64O6Io6H+JwIDOB3
	 mF5BWpwnzo8SzyhbhX+c9Z0/17KIArM0tLFJz2dGUUfNH8Gvs5BgQ6CqGxKML1zaVa
	 m4SS/0bwXhnRNv0SF05F+F49tIxesWNPkY7OIJrs8+aLSdcy1vFMrP3+4pcqKTLiMw
	 OdfDq+F7RfDYTMTgMdvu5uMaMhxmeGznHZ7i7+oRQvF8r5Wg1H2G2u3yZx38D8HniD
	 hMqx+w8MijhcA==
Date: Thu, 3 Mar 2022 10:05:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: llvm@lists.linux.dev, lkft-triage@lists.linaro.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [next] mips: clang-14-defconfig build regression
Message-ID: <YiD1UruDryIyZAJc@dev-arch.thelio-3990X>
References: <CA+G9fYs3GavpYh6V_yTUGNbAU70mygVxBKvqoq=xh20pw1Wvow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYs3GavpYh6V_yTUGNbAU70mygVxBKvqoq=xh20pw1Wvow@mail.gmail.com>

Hi Naresh,

On Thu, Mar 03, 2022 at 09:09:56AM +0530, Naresh Kamboju wrote:
> [Please ignore this email if it is already reported]
> 
> Linux next-20220302 mips builds failed [1] & [2].
> 
> Regressions found on mips:
> 
>   - mips-clang-12-defconfig
>   - mips-clang-13-allnoconfig
>   - mips-clang-12-allnoconfig
>   - mips-clang-12-tinyconfig
>   - mips-clang-13-defconfig
>   - mips-clang-11-tinyconfig
>   - mips-clang-11-defconfig
>   - mips-clang-nightly-allnoconfig
>   - mips-clang-14-tinyconfig
>   - mips-clang-14-defconfig
>   - mips-clang-11-allnoconfig
>   - mips-clang-nightly-tinyconfig
>   - mips-clang-13-tinyconfig
>   - mips-clang-nightly-defconfig
>   - mips-clang-14-allnoconfig
> 
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
> ARCH=mips CROSS_COMPILE=mips-linux-gnu- 'HOSTCC=sccache clang'
> 'CC=sccache clang' defconfig

<snip>

> fatal error: error in backend: Invalid register name global variable

Thanks a lot for the report! Our CI caught this as well, I have filed an
issue on our tracker and the upstream LLVM one:

https://github.com/ClangBuiltLinux/linux/issues/1608
https://github.com/llvm/llvm-project/issues/54174

CC Kees, just as an FYI because of commit 200ed341b864 ("mips: Implement
"current_stack_pointer"").

Cheers,
Nathan
