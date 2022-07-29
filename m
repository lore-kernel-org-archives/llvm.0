Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4910442F
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 12:22:54 +0000 (UTC)
Received: from zn.tnic (p57969665.dip0.t-ipconnect.de [87.150.150.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 74EAB1EC067D;
	Fri, 29 Jul 2022 14:22:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1659097362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=yo2SrLzv/OKreH1iHpJ1DYQT+By+wzIaKn0HrrNq7ts=;
	b=E25F2yKTTS0I/O107L+nrkY9ImN7ihsAkxFjoGwojIVo8dxSTIQIHKoZrhWzpTbEW5wjCv
	2Kx/PuwfrXrqOl3KXs8HJ156uiClmj6USf3CVAugEXtY5TX9KIF2dB0c0E7ljZRTTDMpD3
	ZF5RxfpP2OJp9neg3fF6adoN0wHThws=
Date: Fri, 29 Jul 2022 14:22:38 +0200
From: Borislav Petkov <bp@alien8.de>
To: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	David Howells <dhowells@redhat.com>,
	Jan Beulich <JBeulich@suse.com>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Joe Perches <joe@perches.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [RESEND PATCH v4 0/2] x86/asm/bitops: optimize ff{s,z} functions
 for constant expressions
Message-ID: <YuPRDvELE+Sx5p2c@zn.tnic>
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220723151521.51451-1-mailhol.vincent@wanadoo.fr>
 <CAMZ6Rq+KohWoRurA3cKog18D=NuXNj_k4+ZmPRiakZd7ZPS1OQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMZ6Rq+KohWoRurA3cKog18D=NuXNj_k4+ZmPRiakZd7ZPS1OQ@mail.gmail.com>

On Fri, Jul 29, 2022 at 08:24:58PM +0900, Vincent MAILHOL wrote:
> This patch series [1] has been waiting for more than two months
> already. So far, I have not heard back from any of the x86 mainteners.
> Do you see anything wrong with this series? If not, any chances to
> have someone of you to pick it up?

They're on my todo list but you have to be patient. If you haven't
heard, we're still busy with this thing called retbleed.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
