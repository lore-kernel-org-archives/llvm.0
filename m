Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9B2566E
	for <llvm@lists.linux.dev>; Tue,  7 Feb 2023 16:30:45 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 997171EC01E0;
	Tue,  7 Feb 2023 17:30:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1675787443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=k7lbXAoNmIgA34q7uf5Rrx5EbmJefw8z97r3hM5YyxY=;
	b=PGAirc20vXYdDpS+IbMHLx0xJvfBL/VD4QXbhYBBK5tVbOeRD3Z9Efv4MQUKm6tZcYSvjr
	7usAOERy+8NzTMh5dAcrZcbaD56EJBUQhaFhynoOKUeDyuPD0+JaUJmBBrTGxIKsA8rxvK
	ZnbsuLB0dNTNLhna/zQ6q4ygyCg9Y6A=
Date: Tue, 7 Feb 2023 17:30:38 +0100
From: Borislav Petkov <bp@alien8.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev,
	open list <linux-kernel@vger.kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	lkft-triage@lists.linaro.org, "H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: x86/include/asm/arch_hweight.h:49:15: error: invalid input size
 for constraint 'D'
Message-ID: <Y+J8rtEBlSTsCBLa@zn.tnic>
References: <CA+G9fYuSWodh1teau4jGG_P15yT-ev1+bS7HAAmMu5D5J-d2vw@mail.gmail.com>
 <Y+J8SobyVojJWuFv@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+J8SobyVojJWuFv@dev-arch.thelio-3990X>

On Tue, Feb 07, 2023 at 09:28:58AM -0700, Nathan Chancellor wrote:
> Thanks a lot for the report as always! Looks like there is a fix pending
> on the list:
> 
> https://lore.kernel.org/Y+IsCWQdXEr8d9Vy@linutronix.de/

Btw, while I have you, do you know why clang isn't DCOing this chunk
like gcc does?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
