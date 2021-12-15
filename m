Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E612CA4
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 00:26:51 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4JDGJf6V6Zz4xQs;
	Wed, 15 Dec 2021 11:26:42 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: arnd@arndb.de, Anders Roxell <anders.roxell@linaro.org>
Cc: ndesaulniers@google.com, nathan@kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
In-Reply-To: <20211207110228.698956-1-anders.roxell@linaro.org>
References: <20211207110228.698956-1-anders.roxell@linaro.org>
Subject: Re: [PATCH] powerpc: platforms: cell: pervasive: fix clang -Wimplicit-fallthrough
Message-Id: <163952788002.919625.12030438662288837731.b4-ty@ellerman.id.au>
Date: Wed, 15 Dec 2021 11:24:40 +1100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 7 Dec 2021 12:02:28 +0100, Anders Roxell wrote:
> Clang warns:
> 
> arch/powerpc/platforms/cell/pervasive.c:81:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>         case SRR1_WAKEEE:
>         ^
> arch/powerpc/platforms/cell/pervasive.c:81:2: note: insert 'break;' to avoid fall-through
>         case SRR1_WAKEEE:
>         ^
>         break;
> 1 error generated.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: platforms: cell: pervasive: fix clang -Wimplicit-fallthrough
      https://git.kernel.org/powerpc/c/e89257e28e844f5d1d39081bb901d9f1183a7705

cheers
