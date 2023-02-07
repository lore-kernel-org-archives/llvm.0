Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478C5566E
	for <llvm@lists.linux.dev>; Tue,  7 Feb 2023 16:44:25 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 58EC21EC042F;
	Tue,  7 Feb 2023 17:44:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1675788263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=Wf6EXE8MgWaf7bVHOvRI0kZ2JeI5v6n9K1M463GjUsg=;
	b=Wt4dYqH77AlUz9FWGKp6uGPEhOiTXgzbK8Y3JZAr//o/uC2GNMjXOk9XmS6dwG2AgFZ5D+
	Jby/7vyMBrBKqVFPpcfaRB+nSW1AJmqfz114lvvqRLzwW59vMbLa4LLf4+fleSET4yQfMT
	7Igs9+AopfPCqIT/LEi/iGGMwunP6Hc=
Date: Tue, 7 Feb 2023 17:44:18 +0100
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
Message-ID: <Y+J/4kGuIqb8qeob@zn.tnic>
References: <CA+G9fYuSWodh1teau4jGG_P15yT-ev1+bS7HAAmMu5D5J-d2vw@mail.gmail.com>
 <Y+J8SobyVojJWuFv@dev-arch.thelio-3990X>
 <Y+J8rtEBlSTsCBLa@zn.tnic>
 <Y+J+UQ1vAKr6RHuH@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+J+UQ1vAKr6RHuH@dev-arch.thelio-3990X>

On Tue, Feb 07, 2023 at 09:37:37AM -0700, Nathan Chancellor wrote:
> Clang does its semantic analysis before optimization, so it cannot dead
> code eliminate that chunk before it checks the validity of the asm
> constraints, that is just how the pipeline is structured as far as I
> understand it. That is one of the biggest and longest standing
> differences between clang and GCC that we know about, the upstream link
> in the issue below has some more info.
> 
> https://github.com/ClangBuiltLinux/linux/issues/3
> 
> I am not super familiar with the internal details of LLVM and clang as
> other folks are though so I could be wrong or missing something :)

Thanks and wow, that's issue #3. Like wow that's old. And reading Nick's
text, it sure does sound like that's the one.

Fun.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
