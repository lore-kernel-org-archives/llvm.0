Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F85F1100;
	Tue,  4 Jul 2023 21:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1F9C433C7;
	Tue,  4 Jul 2023 21:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688506614;
	bh=eKyZ9PkJ+ke344sHii+bCX3P4/oDphlbXbihKHuI0wc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=KbyZEpz7LvuMZPUZ+VDakZRe1vQSYrRAkkHStQga6b9oeMtoBkNCgunC864yhA5lO
	 NrrRbVrBbsrq2SCSESAQjQtGu9y56YMwKa5cleuC1UbKT4h68/vEl7/L54aBckiYb1
	 Iy4TyoOW9Loq0nnh0NyFEPTe79+ee65BGcRGn9EGtaWpqGjxNUtmjUITBGrShJtVjE
	 i0Qyjjx9XtP4sHAB/K5OHDYyczO0nQlDIziJLgcpRQXUmTWwVNqDqsnXSA7+5rZdtP
	 lM8HgFiGDSkEsY3JVKafmZqkYGV3KDqLW52mbn8ypfUeIJJPvHj8T3TKvNxmc/SC4P
	 NONZUDeTMYycA==
Date: Tue, 04 Jul 2023 14:36:51 -0700
From: Kees Cook <kees@kernel.org>
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
 Kees Cook <keescook@chromium.org>
CC: Guenter Roeck <linux@roeck-us.net>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux LLVM <llvm@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 Linux Regressions <regressions@lists.linux.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-hardening@vger.kernel.org
Subject: Re: [CRASH][BISECTED] 6.4.1 crash in boot
User-Agent: K-9 Mail for Android
In-Reply-To: <fbf4103b-6471-1f06-34a8-4aa227f5e091@alu.unizg.hr>
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr> <ZKIoBVzrjZ+Ybxy9@debian.me> <202307022018.B26F5795@keescook> <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net> <4fa56264-f188-46f9-cc77-117b469b3328@roeck-us.net> <2b1a4f49-ba18-0246-af09-4e4133814411@alu.unizg.hr> <202307022230.6121D6896@keescook> <ed3e4315-b149-2f9e-70d4-45d7f83b9922@alu.unizg.hr> <202307031149.823F9A3@keescook> <202307031606.3FD9D0D@keescook> <fbf4103b-6471-1f06-34a8-4aa227f5e091@alu.unizg.hr>
Message-ID: <3CDD1188-7B2A-4D53-9B8F-C07BC39844E9@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 4, 2023 10:20:11 AM PDT, Mirsad Todorovac <mirsad=2Etodorovac@alu=
=2Eunizg=2Ehr> wrote:
>On 7/4/23 01:09, Kees Cook wrote:> On Mon, Jul 03, 2023 at 12:03:23PM -07=
00, Kees Cook wrote:
>>> Cool=2E xhci-hub is in your backtrace, and the above patch was made fo=
r
>>> something very similar (though, again, I don't see why you're getting =
a
>>> _crash_, it should _warn_ and continue normally)=2E And, actually, als=
o
>>> include this patch:
>>> https://lore=2Ekernel=2Eorg/lkml/20230614181307=2Egonna=2E256-kees@ker=
nel=2Eorg/
>>=20
>> This is now in Linus's tree:
>> 09b69dd4378b ("usb: ch9: Replace 1-element array with flexible array")
>>=20
>> Please also still try with the first patch I mentioned, which is very s=
imilar:
>> https://lore=2Ekernel=2Eorg/lkml/20230629190900=2Enever=2E787-kees@kern=
el=2Eorg/
>
>Hi,
>
>I have finally built w both patches (and recommended PSTORE settings were
>default already)=2E

Were you able to find the crashes saved by pstore?

>
>This second patch fixes the booting problem, but alas there is still a pr=
oblem -

Ah! That's great! They're is still an unexpected crash source, but the tri=
gger is fixed=2E

>all Wayland and X11=2Eorg GUI applications fail to start, with errors lik=
e this one:
>
>Jul  4 19:09:07 defiant kernel: [   40=2E529719] invalid opcode: 0000 [#1=
] PREEMPT SMP NOPTI

Hmm, is CONFIG_UBSAN_TRAP set?

>Jul  4 19:09:07 defiant kernel: [   40=2E529726] RIP: 0010:alloc_pid+0x46=
c/0x480

Hmm, is this patch in your kernel?
https://git=2Ekernel=2Eorg/linus/b69f0aeb068980af983d399deafc7477cec8bc04


--=20
Kees Cook
