Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC20613E
	for <llvm@lists.linux.dev>; Tue,  5 Sep 2023 10:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22BE0C433C7;
	Tue,  5 Sep 2023 10:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693909266;
	bh=M9uDru181L36pppGynsLKQXzHe9CGLvj0S3GGexNgSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/FBhenhIby7vAtcLwg7b695fH5lqIrug5x/bB1BwPOtUZfMoU7bLqAEibZUrNVZ/
	 PwN/aTt0loTKTs5IgopNcB2DlI+rbvHsoWH6npsIdX/Ysq7Z4oPzDF+QypfeMAXe89
	 mLDQyQD4XO3erz/4bnKOmu5JVpSzB+tK1oZK9ofA=
Date: Tue, 5 Sep 2023 11:21:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	kasan-dev <kasan-dev@googlegroups.com>, llvm@lists.linux.dev,
	linux- stable <stable@vger.kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	eb-gft-team@globallogic.com
Subject: Re: Include bac7a1fff792 ("lib/ubsan: remove
 returns-nonnull-attribute checks") into linux-4.14.y
Message-ID: <2023090548-flattery-wrath-8ace@gregkh>
References: <CAKXUXMzR4830pmUfWnwVjGk94inpQ0iz_uXiOnrE2kyV7SUPpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKXUXMzR4830pmUfWnwVjGk94inpQ0iz_uXiOnrE2kyV7SUPpg@mail.gmail.com>

On Tue, Sep 05, 2023 at 12:12:11PM +0200, Lukas Bulwahn wrote:
> Dear Andrey, dear Nick, dear Greg, dear Sasha,
> 
> 
> Compiling the kernel with UBSAN enabled and with gcc-8 and later fails when:
> 
>   commit 1e1b6d63d634 ("lib/string.c: implement stpcpy") is applied, and
>   commit bac7a1fff792 ("lib/ubsan: remove returns-nonnull-attribute checks") is
>   not applied.
> 
> To reproduce, run:
> 
>   tuxmake -r docker -a arm64 -t gcc-13 -k allnoconfig --kconfig-add
> CONFIG_UBSAN=y
> 
> It then fails with:
> 
>   aarch64-linux-gnu-ld: lib/string.o: in function `stpcpy':
>   string.c:(.text+0x694): undefined reference to
> `__ubsan_handle_nonnull_return_v1'
>   string.c:(.text+0x694): relocation truncated to fit:
> R_AARCH64_CALL26 against undefined symbol
> `__ubsan_handle_nonnull_return_v1'
> 
> Below you find a complete list of architectures, compiler versions and kernel
> versions that I have tested with.
> 
> As commit bac7a1fff792 ("lib/ubsan: remove returns-nonnull-attribute checks") is
> included in v4.16, and commit 1e1b6d63d634 ("lib/string.c: implement stpcpy") is
> included in v5.9, this is not an issue that can happen on any mainline release
> or the stable releases v4.19.y and later.
> 
> In the v4.14.y branch, however, commit 1e1b6d63d634 ("lib/string.c: implement
> stpcpy") was included with v4.14.200 as commit b6d38137c19f and commit
> bac7a1fff792 ("lib/ubsan: remove returns-nonnull-attribute checks") from
> mainline was not included yet. Hence, this reported failure with UBSAN can be
> observed on v4.14.y with recent gcc versions.
> 
> Greg, once checked and confirmed by Andrey or Nick, could you please include
> commit bac7a1fff792 ("lib/ubsan: remove returns-nonnull-attribute checks") into
> the linux-4.14.y branch?

Now queued up, thanks.

greg k-h
