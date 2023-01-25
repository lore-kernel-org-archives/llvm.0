Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188BB10ED
	for <llvm@lists.linux.dev>; Wed, 25 Jan 2023 04:21:28 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P1r4Y6yPLz4xwp;
	Wed, 25 Jan 2023 15:11:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1674619888;
	bh=490Aut76SVYQ50BiNDD2OExog3lplcLjgXShI99t2n8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MxyyPw5qPPKCGFjUGIO9bcDDwFZzx5BzmupP5hnIjnqlE3hVjGBviuL4ucBfqRnIo
	 ZvaI1hB4vaKh0+/LbDn3uJ/A4YnJlLfZIh7r4fuLAzc9WfudUncgSIEc8dgqWkzvyp
	 g1eFesoLTUQnfwiRc5G7arZIdn2W4c0u6SypVEQLAkASmDa66+Yb68l8JQtPomf7TO
	 6EvybHLpJhkNQm/4Tu3F3fKxAhCtGAQOE5S6nTCKnFftUvmiY2cbLNVnwLaGhBiIBA
	 EFRgvFs1KV7owWDwopxw+JFuEfYfxTiB74dM5RLvL4q00bTfItirHeWyXKHvCRFjwc
	 Q5eH65HxXGDIA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>, masahiroy@kernel.org
Cc: ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, Nathan Chancellor
 <nathan@kernel.org>, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
In-Reply-To: <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org>
Date: Wed, 25 Jan 2023 15:11:25 +1100
Message-ID: <871qnjqmmq.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Nathan Chancellor <nathan@kernel.org> writes:
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> points out that KBUILD_AFLAGS contains a linker flag, which will be
> used:

Should that say "unused" ?

>   clang: error: -Wl,-a32: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>
> This was likely supposed to be '-Wa,-a$(BITS)'. However, this change is
> unnecessary, as all supported versions of clang and gcc will pass '-a64'
> or '-a32' to GNU as based on the value of '-m'; the behavior of the
> latest stable release of the oldest supported major version of each
> compiler is shown below and each compiler's latest release exhibits the
> same behavior (GCC 12.2.0 and Clang 15.0.6).
>
>   $ powerpc64-linux-gcc --version | head -1
>   powerpc64-linux-gcc (GCC) 5.5.0
>
>   $ powerpc64-linux-gcc -m64 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
>   .../as -a64 -mppc64 -many -mbig -o /dev/null /tmp/cctwuBzZ.s
>
>   $ powerpc64-linux-gcc -m32 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
>   .../as -a32 -mppc -many -mbig -o /dev/null /tmp/ccaZP4mF.sg
>
>   $ clang --version | head -1
>   Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214622.5
>
>   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
>     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
>    "/usr/bin/powerpc64-linux-gnu-as" "-a64" "-mppc64" "-many" "-o" "/dev/null" "/tmp/null-80267c.s"
>
>   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
>     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
>    "/usr/bin/powerpc64-linux-gnu-as" "-a32" "-mppc" "-many" "-o" "/dev/null" "/tmp/null-ab8f8d.s"
>
> Remove this flag altogether to avoid future issues.
>
> Fixes: 1421dc6d4829 ("powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Cc: mpe@ellerman.id.au

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
