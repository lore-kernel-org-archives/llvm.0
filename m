Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879BD566B
	for <llvm@lists.linux.dev>; Tue,  7 Feb 2023 16:18:11 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 343D81EC068B;
	Tue,  7 Feb 2023 17:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1675786689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=VNy8Woq4Jn8BVfHCwBWvG4CoPXvMEy3JphpIhqqNLUc=;
	b=iGao97844DWXkB0gIVhh/LJ2AL9svQiYVZHAzBR7W+T55AOWJpqM4vT0tG9X5r671dGVDP
	fIE/YUn3UvIZHUf1OQz+SXjOii1rxug00MjKHbYtSPvcM4wiftA7gJMxjzGaGZz0hGde8j
	Je0iPXS5LhIf3HvQ+8nvV7z2bQi2IKU=
Date: Tue, 7 Feb 2023 17:18:08 +0100
From: Borislav Petkov <bp@alien8.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] x86: vdso: sanitize asm helpers for vgetcpu.c
Message-ID: <Y+J5wLxzFR0S2Bx/@zn.tnic>
References: <20230207161349.309901-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230207161349.309901-1-arnd@kernel.org>

On Tue, Feb 07, 2023 at 05:13:41PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The x86 vdso implementation includes a few include/linux/*.h kernel
> headers outside of the include/vdso/*.h space.  This causes a new
> warning when building with clang, after the vgetcpu code is added
> to the vdso32 support on 64-bit kernels:

...

https://lore.kernel.org/r/Y%2BIsCWQdXEr8d9Vy@linutronix.de

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
