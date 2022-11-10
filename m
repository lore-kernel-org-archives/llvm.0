Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EC52119
	for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 20:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347CEC433C1;
	Thu, 10 Nov 2022 20:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668113443;
	bh=+Guk1PkqtF3DpNjrdmxtlIWa68p9aMRWj4vAUJaMUvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=atcUOoui1uX1GR5cDuSN2A9FTOxwO2+gcf/ddhU6byVh6QfoC4TApGFTzNnmGMBPw
	 9Ho+rb2YsPI1r7E3M8liPiJ1QK3IF0yP3TngZJaWTmGrxtrqt5ChUqg/u3YVqrv/4B
	 qf1JIh4YI+6EoxAJKOjm6A9ZghuXKcincJLqmwtv62IFWGUJ5QQyTdUg0065uvOBlA
	 pKBZBqq3/qrD6oLiwez66anLmsi2MyX7NUMhG2qQV/S10kv7q6RZVsk7CpJRLSjwbA
	 SUotMk7wSwSCXJGRXvZZ+zHr+PPWiFqxt9VA2MFXKslIX5EevPY+jri/pkTS9PQLSg
	 cIhFKSIsITOfA==
Date: Thu, 10 Nov 2022 13:50:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: huyd12@chinatelecom.cn
Cc: guoj17@chinatelecom.cn, peterz@infradead.org, mingo@redhat.com,
	will@kernel.org, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, longman@redhat.com,
	boqun.feng@gmail.com, linux-kernel@vger.kernel.org, hpa@zytor.com,
	ndesaulniers@google.com, trix@redhat.com, llvm@lists.linux.dev
Subject: Re: =?utf-8?B?5Zue5aSN?= =?utf-8?Q?=3A?= [PATCH] locking: fix
 kernel/locking/ inline asm error
Message-ID: <Y21kIPpDl2Ra0VB/@dev-arch.thelio-3990X>
References: <20221108060126.2505-1-guoj17@chinatelecom.cn>
 <Y2rayPgDfL2NYcjQ@dev-arch.thelio-3990X>
 <001d01d8f4eb$f0f37a90$d2da6fb0$@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001d01d8f4eb$f0f37a90$d2da6fb0$@chinatelecom.cn>

On Thu, Nov 10, 2022 at 06:05:13PM +0800, huyd12@chinatelecom.cn wrote:
> 
> Thanks your comments, 
> And if any concern to apply it on upstream?

Unfortunately, I am not the one who gets to make that decision; one of
the maintainers of this file will have to pick it up, assuming they see
no issue with it.

Cheers,
Nathan

> -----邮件原件-----
> 发件人: nathan@kernel.org <nathan@kernel.org> 
> 发送时间: 2022年11月9日 6:40
> 收件人: guoj17@chinatelecom.cn
> 抄送: peterz@infradead.org; mingo@redhat.com; will@kernel.org;
> tglx@linutronix.de; bp@alien8.de; dave.hansen@linux.intel.com;
> x86@kernel.org; longman@redhat.com; boqun.feng@gmail.com; linux-kernel@vger.
> kernel.org; hpa@zytor.com; ndesaulniers@google.com; trix@redhat.com;
> llvm@lists.linux.dev; huyd12@chinatelecom.cn
> 主题: Re: [PATCH] locking: fix kernel/locking/ inline asm error
> 
> On Tue, Nov 08, 2022 at 02:01:26PM +0800, guoj17@chinatelecom.cn wrote:
> > From: Guo Jin <guoj17@chinatelecom.cn>
> > 
> > When compiling linux 6.1.0-rc3 configured with CONFIG_64BIT=y and 
> > CONFIG_PARAVIRT_SPINLOCKS=y on x86_64 using LLVM 11.0, an error: 
> > "<inline asm> error: changed section flags for .spinlock.text, 
> > expected:: 0x6" occurred.
> > 
> > The reason is the .spinlock.text in kernel/locking/qspinlock.o is used 
> > many times, but its flags are omitted in subsequent use.
> > 
> > LLVM 11.0 assembler didn't permit to
> > leave out flags in subsequent uses of the same sections.
> > 
> > So this patch adds the corresponding flags to avoid above error.
> > 
> > Signed-off-by: Guo Jin <guoj17@chinatelecom.cn>
> 
> Right, my reverse bisect tells me that this error was fixed by [1] in LLVM,
> which landed in 12.0.0 and was backported to LLVM 11.0.1 [2].
> 
> We could bump the minimum supported version of LLVM for building the kernel
> to 11.0.1 over this, just to avoid further issues like this down the road,
> as the kernel will always be adding new sections for various things. That
> change would not appear to be disruptive, as all the major distros either
> have 11.0.1 or newer or older than the current minimum of 11.0.0, so they
> need to get clang from elsewhere already.
> 
> archlinux:latest: clang version 14.0.6
> 
> debian:oldoldstable-slim: clang version 3.8.1-24 (tags/RELEASE_381/final)
> debian:oldstable-slim: clang version 7.0.1-8+deb10u2
> (tags/RELEASE_701/final)
> debian:stable-slim: Debian clang version 11.0.1-2
> debian:testing-slim: Debian clang version 14.0.6-2
> debian:unstable-slim: Debian clang version 14.0.6-7
> 
> fedora:35: clang version 13.0.1 (Fedora 13.0.1-1.fc35)
> fedora:latest: clang version 14.0.5 (Fedora 14.0.5-1.fc36)
> fedora:rawhide: clang version 15.0.4 (Fedora 15.0.4-1.fc38)
> 
> opensuse/leap:15: clang version 13.0.1
> opensuse/leap:latest: clang version 13.0.1
> opensuse/tumbleweed:latest: clang version 15.0.3
> 
> ubuntu:bionic: clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
> ubuntu:focal: clang version 10.0.0-4ubuntu1
> ubuntu:latest: Ubuntu clang version 14.0.0-1ubuntu1
> ubuntu:kinetic: Ubuntu clang version 15.0.2-1
> ubuntu:rolling: Ubuntu clang version 15.0.2-1
> ubuntu:devel: Ubuntu clang version 15.0.2-1
> 
> At the same time, you are clearly using LLVM 11.0.0, so I think this is a
> reasonable fix in the immediate term.
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> [1]:
> https://github.com/llvm/llvm-project/commit/1deff4009e0ae661b03682901bf69322
> 97ce7ea1
> [2]:
> https://github.com/llvm/llvm-project/commit/700baa009dc685a0adc5f94d258be4ae
> 24742471
> 
> > ---
> >  arch/x86/include/asm/qspinlock_paravirt.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/include/asm/qspinlock_paravirt.h 
> > b/arch/x86/include/asm/qspinlock_paravirt.h
> > index 60ece592b220..dbb38a6b4dfb 100644
> > --- a/arch/x86/include/asm/qspinlock_paravirt.h
> > +++ b/arch/x86/include/asm/qspinlock_paravirt.h
> > @@ -37,7 +37,7 @@
> __PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock_slowpath,
> ".spinlock.text");
> >   *   rsi = lockval           (second argument)
> >   *   rdx = internal variable (set to 0)
> >   */
> > -asm    (".pushsection .spinlock.text;"
> > +asm    (".pushsection .spinlock.text, \"ax\";"
> >  	".globl " PV_UNLOCK ";"
> >  	".type " PV_UNLOCK ", @function;"
> >  	".align 4,0x90;"
> > --
> > 2.25.1
> > 
> 
