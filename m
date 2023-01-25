Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C4810ED
	for <llvm@lists.linux.dev>; Wed, 25 Jan 2023 04:12:27 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P1r5j0GJRz4xyY;
	Wed, 25 Jan 2023 15:12:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1674619946;
	bh=leUmDE+CZ32bv0Iqn7DI7Je7HT39oOea5EznvVolH2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D/u0rmtQPBZO4VOc1rVoVtHOn4lBMOTL7Bc/hB9ejP5Zvln/aVBEQKvxRiPsxfeAR
	 8CZKcCDA4U1VqKP02X1wgsodQXh1gWRK4+FtKZmmUijJuwGMvCFHKeg+k9j8ho4wQ/
	 AOWD0AizqG/goj4UgMFID/48DHvs+iD7x3gIddS6KxXrX00koFM2yxItHaukxIG11C
	 efuu1M6CVsvEE86PcKXdkps2ccpkGZ5+zmTjDaDriXmXby07g0JrE5GIOS6r9Etrve
	 JjP8gE9UvzCB5zUMQI778oAIRz6DLG6gxCSuqAQVThv2Irmq07KWd14+ZuWcTFATIl
	 z6pT44cH9Sjgg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>, masahiroy@kernel.org
Cc: ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, Nathan Chancellor
 <nathan@kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>,
 npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 06/14] powerpc/vdso: Remove unused '-s' flag from
 ASFLAGS
In-Reply-To: <20221228-drop-qunused-arguments-v2-6-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-6-9adbddd20d86@kernel.org>
Date: Wed, 25 Jan 2023 15:12:24 +1100
Message-ID: <87y1prp80n.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Nathan Chancellor <nathan@kernel.org> writes:
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns:
>
>   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
>
> The compiler's '-s' flag is a linking option (it is passed along to the
> linker directly), which means it does nothing when the linker is not
> invoked by the compiler. The kernel builds all .o files with '-c', which
> stops the compilation pipeline before linking, so '-s' can be safely
> dropped from ASFLAGS.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
> ---
> Cc: mpe@ellerman.id.au

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
