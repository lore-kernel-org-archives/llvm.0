Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C229A28694;
	Mon,  4 Dec 2023 18:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pq53kDja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E36C433C8;
	Mon,  4 Dec 2023 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701713587;
	bh=ZnF++KDAwRvjCUKLyEG+QdraHD7QYVU2OsL3PPOdigc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pq53kDjarcnqVwJBMAHI7DkjDZTij2orbEmtr6uX1KJdWfLSgtGrJGJJ1MWCM1Ns/
	 +k6snGazyw+FcMAWXZfPapU+24iXOSXhFQwRL3k7UoxMFwaVqVltkXYoNCTlEG1Bte
	 E5DE1AWqGuFgQfUl0wjRQSuk7mrr5HA3MRMLAJAlYY0AFLnXcvWF8D0TZO9U69jlrb
	 zYXxIpMxjViFo5XEeuumn9Erb7UNesBj8zcknk45dVOhgCd8eJVs4qLNqvfFPTHkef
	 zjni7Awuw+1XFeKPGLE2zoihO1xco35ldUt9wM8xiMwOMmGbvw9xduJ+B8XYoOT7IL
	 IRwRzjykF8nuA==
Date: Mon, 4 Dec 2023 11:13:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: clang-nightly: vdso/compat_gettimeofday.h:152:15: error:
 instruction variant requires ARMv6 or later
Message-ID: <20231204181304.GA2043538@dev-arch.thelio-3990X>
References: <CA+G9fYvD72Vpfs2g8R+OJ6L8w9p_uaWbXpWMvnGAx_AOLabatw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvD72Vpfs2g8R+OJ6L8w9p_uaWbXpWMvnGAx_AOLabatw@mail.gmail.com>

Hi Naresh,

On Mon, Dec 04, 2023 at 05:33:26PM +0530, Naresh Kamboju wrote:
> Following build errors noticed on Linux next-20231204 tag with clang-nightly
> for arm and arm64.
> 
> ## Test Regressions (compared to next-20231201)
> * arm64, build
>   - clang-nightly-defconfig
>   - clang-nightly-defconfig-40bc7ee5
>   - clang-nightly-lkftconfig
>   - clang-nightly-lkftconfig-kselftest
> 
> * arm, build
>   - clang-nightly-allnoconfig
>   - clang-nightly-axm55xx_defconfig
>   - clang-nightly-bcm2835_defconfig
>   - clang-nightly-clps711x_defconfig
>   - clang-nightly-defconfig
>   - clang-nightly-exynos_defconfig
>   - clang-nightly-imx_v6_v7_defconfig
>   - clang-nightly-keystone_defconfig
>   - clang-nightly-lkftconfig
>   - clang-nightly-lkftconfig-kselftest
>   - clang-nightly-omap2plus_defconfig
>   - clang-nightly-pxa910_defconfig
>   - clang-nightly-s3c6400_defconfig
>   - clang-nightly-s5pv210_defconfig
>   - clang-nightly-sama5_defconfig
>   - clang-nightly-shmobile_defconfig
>   - clang-nightly-tinyconfig
>   - clang-nightly-u8500_defconfig
>   - clang-nightly-vexpress_defconfig
> 
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> 
> Build log on arm64:
> ---------
> In file included from lib/vdso/gettimeofday.c:5:
> In file included from include/vdso/datapage.h:135:
> arch/arm64/include/asm/vdso/compat_gettimeofday.h:152:15: error:
> instruction variant requires ARMv6 or later
>   152 |         asm volatile("mov %0, %1" : "=r"(ret) : "r"(_vdso_data));
>       |                      ^
> <inline asm>:1:2: note: instantiated into assembly here
>     1 |         mov r4, r1
>       |         ^
> In file included from <built-in>:3:
> lib/vdso/gettimeofday.c:139:3: error: invalid instruction
>   139 |                 smp_rmb();
>       |                 ^
> 
> Build log on arm:
> ---------
> In file included from arch/arm/vfp/vfpmodule.c:23:
> arch/arm/include/asm/cp15.h:101:2: error: instruction requires: data-barriers
>   101 |         isb();
>       |         ^

This is caused by a change to Debian's LLVM that changes the internal
defaults of the arm-linux-gnueabi and arm-linux-gnueabihf tuples:

https://salsa.debian.org/pkg-llvm-team/llvm-toolchain/-/commit/907baf024b9a5a1626893d9e731b6c79ccf45c87

We use arm-linux-gnueabi for the kernel (see scripts/Makefile.clang) so
now we have a hardcoded armv5te CPU, even if we are building for armv7
or such.

I am still investigating into what (if anything) can be done to resolve
this on the kernel side. We could potentially revert commit
ddc72c9659b5 ("kbuild: clang: do not use CROSS_COMPILE for target
triple") but I am not sure that will save us from that change, as
tuxmake's CROSS_COMPILE=arm-linux-gnueabihf will cause us to have an
armv7 CPU even though we may not be building for armv7.

Cheers,
Nathan
