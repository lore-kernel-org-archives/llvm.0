Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689AAD530
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 20:21:33 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.riseup.net", Issuer "R3" (not verified))
	by mx1.riseup.net (Postfix) with ESMTPS id 4Ph2nh23XDzDqGt;
	Tue, 21 Mar 2023 20:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1679429528; bh=+4hKPyRMH2aAK35R9DtVSpBun70VepUerw2XjaTytxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cnch0x4zGxsR9VcUGElrbA7sE/iBGr3H+sdwfYJ4+SiLz3Odfgd7jOUhGap+KYViM
	 zi1bsUKERut+p8wrLXb3bAC/JUBiyoqP9DSKFbqqoXm+jMhRuyOd+Hzvo3D/ltY8ts
	 FEnJ/T9QtDnPvc5H9n/Ci5fvDIdLLCWA33tXns78=
X-Riseup-User-ID: 1C3CD006F550256050AEC2FA37B1A54058F970E2E8F94543F974B5CEED22D817
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews2.riseup.net (Postfix) with ESMTPSA id 4Ph2nP1MWTz1y8Z;
	Tue, 21 Mar 2023 20:11:52 +0000 (UTC)
Message-ID: <a7313cdd-c54e-cbbf-e8e9-8330184912ac@riseup.net>
Date: Tue, 21 Mar 2023 17:11:47 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] arch:um: Only disable SSE on clang to work around old GCC
 bugs
Content-Language: en-US
To: David Gow <davidgow@google.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Roberto Sassu <roberto.sassu@huaweicloud.com>, SeongJae Park <sj@kernel.org>
Cc: linux-um@lists.infradead.org, x86@kernel.org, llvm@lists.linux.dev,
 rust-for-linux@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
References: <20230318041555.4192172-1-davidgow@google.com>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <20230318041555.4192172-1-davidgow@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/03/23 01:15, 'David Gow' via KUnit Development wrote:
> As part of the Rust support for UML, we disable SSE (and similar flags)
> to match the normal x86 builds. This both makes sense (we ideally want a
> similar configuration to x86), and works around a crash bug with SSE
> generation under Rust with LLVM.
> 
> However, this breaks compiling stdlib.h under gcc < 11, as the x86_64
> ABI requires floating-point return values be stored in an SSE register.
> gcc 11 fixes this by only doing register allocation when a function is
> actually used, and since we never use atof(), it shouldn't be a problem:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99652
> 
> Nevertheless, only disable SSE on clang setups, as that's a simple way
> of working around everyone's bugs.
> 
> Fixes: 884981867947 ("rust: arch/um: Disable FP/SIMD instruction to match x86")
> Reported-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> Link: https://lore.kernel.org/linux-um/6df2ecef9011d85654a82acd607fdcbc93ad593c.camel@huaweicloud.com/
> Tested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> Tested-by: SeongJae Park <sj@kernel.org>
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>  arch/x86/Makefile.um | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/x86/Makefile.um b/arch/x86/Makefile.um
> index b70559b821df..2106a2bd152b 100644
> --- a/arch/x86/Makefile.um
> +++ b/arch/x86/Makefile.um
> @@ -3,9 +3,14 @@ core-y += arch/x86/crypto/
>  
>  #
>  # Disable SSE and other FP/SIMD instructions to match normal x86
> +# This is required to work around issues in older LLVM versions, but breaks
> +# GCC versions < 11. See:
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99652
>  #
> +ifeq ($(CONFIG_CC_IS_CLANG),y)
>  KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
>  KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
> +endif
>  
>  ifeq ($(CONFIG_X86_32),y)
>  START := 0x8048000

Tested-by: Arthur Grillo <arthurgrillo@riseup.net>
