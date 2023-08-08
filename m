Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9323212B6C
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 15:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CBFC433C8;
	Tue,  8 Aug 2023 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691507635;
	bh=kDFAlSbkJ936J8VHhHrXEcGboI/qSbJqIJs3esWiWco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/WFexBR1seFJuZsSKS7NUz6Q4ih5cU2tvXfND6RKuYWqtUk+OaDkjhLil5Kols1Z
	 yIh2tP4lgeOUTrmNEkGKtEkfzAaz8pYOW2bLb9F8vka0eMSum/jlbaRmJMXs44UwRb
	 aPIi+T29eYq9f2OrKggEiMCMyuytJN7/CHDLUi/wAhTNL5rXAsCYwewvE6N7Or69SN
	 Xzjo862RE65RG7zS/qIq9Libtgjc/+kpsx5JKCtylCikzH2X7AsYIqosm1d8mffa2l
	 0BHD625aoDABSPAlpIZrxmXGqUsdeCBLkjME1jL0/r1gAqWLF2KOGsgVVUnN3hBlUD
	 mVtJ4uJnXpb8g==
Date: Tue, 8 Aug 2023 08:13:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	linux-stable <stable@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: stable-rc 5.15: clang-17: davinci_all_defconfig failed -
 arch/arm/include/asm/tlbflush.h:420:85: error: use of logical '&&' with
 constant operand [-Werror,-Wconstant-logical-operand]
Message-ID: <20230808151353.GA798905@dev-arch.thelio-3990X>
References: <CA+G9fYv-fRa2n+8WC3tE5a9Kdu7M0i8jpzU0=BEGV_krDuyctA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYv-fRa2n+8WC3tE5a9Kdu7M0i8jpzU0=BEGV_krDuyctA@mail.gmail.com>

Hi Naresh,

On Tue, Aug 08, 2023 at 11:52:12AM +0530, Naresh Kamboju wrote:
> LKFT build plans upgraded to clang-17 and found this failure,
> 
> While building stable-rc 5.15 arm davinci_all_defconfig with clang-17 failed
> with below warnings and errors.
> 
> Build log:
> ----------
> 
> arch/arm/include/asm/tlbflush.h:420:85: error: use of logical '&&'
> with constant operand [-Werror,-Wconstant-logical-operand]
>   420 |         if (possible_tlb_flags &
> (TLB_V4_U_PAGE|TLB_V4_D_PAGE|TLB_V4_I_PAGE|TLB_V4_I_FULL) &&
>       |
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ^
> arch/arm/include/asm/tlbflush.h:420:85: note: use '&' for a bitwise operation
>   420 |         if (possible_tlb_flags &
> (TLB_V4_U_PAGE|TLB_V4_D_PAGE|TLB_V4_I_PAGE|TLB_V4_I_FULL) &&
>       |
>                             ^~
>       |
>                             &

Thanks for the report. This is "fixed" in mainline with commit
cb32c285cc10 ("cpumask: change return types to bool where appropriate"),
which causes the warning not to fire because the right hand side is a
boolean, rather than an integer. That change picks cleanly back to at
least 5.4 with commit 1dc01abad654 ("cpumask: Always inline helpers
which use bit manipulation functions") applied before it.

However, the change to -Wconstant-logical-operand in clang that causes
this in the first place is being reverted in both clang-18 and clang-17,
so this will disappear shortly:

https://github.com/llvm/llvm-project/commit/a84525233776a716e2c6291993f0b33fd1c76f7c
https://github.com/llvm/llvm-project/issues/64515

There is some discussion about the warning coming back and the suggested
change to the warning does not seem like it fix this instance so
applying those couple of changes may not be a bad idea anyways:

https://github.com/llvm/llvm-project/issues/64356

Cheers,
Nathan
