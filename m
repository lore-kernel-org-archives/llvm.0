Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA003890F8
	for <llvm@lists.linux.dev>; Sat, 26 Sep 2026 19:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452342; cv=none; b=c5KCSeYtVR+rGh36jXn6e5O9mBKnEq+phCkGrfOa8OJ4fnheyj6/gKTu4ocTiNBDa+tP/lULreuaRLPJYcR4B9cB4xnpR0EDd9ISJOHtaQSIsQbRQaWmHUaSrQwmlPr7Yii3eLeNLpYLGR6XpTGv0I0Cv6abmOZiIT+LgUs5QkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452342; c=relaxed/simple;
	bh=D1nqub9tM1dPC7lujubaxuH80QEvH7OW08kzVVZUt0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXlB8uKxBrdnzqToPd5wKBh2/0JknAy5ELxDNXKrcDOmoW/bf/T1LC9ifrf0Xoti69qA94EppMSwCAXS8vWgt2ELEAjl8SpFYCKr6y9oUY4ZOuiaNAjB6AyZ8e4xendhu8Irgte8OdfVstrjiP3kYF46aGD4FvXgkC2Arxyw26E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VSV6b0Pf reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VSV6b0Pf"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5631A40E01F9;
	Sat, 26 Sep 2026 19:52:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yVhWzCsEK9wq; Sat, 26 Sep 2026 19:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790452325; bh=UiMSyRFKs7VC0vsliyJ+JCT7GZBHFu90GqFe0oIG6hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VSV6b0Pfpcbadj+z1O0dIqxuh8GsGgZAsmDEln8avnprJpQy12o7Tty9JXLw/EBs3
	 E+uWgY8bJi+pwGk9P9wAP2Timg+l9KXHF4ZVAN8vacoolIITh5pPwNzo7Uat4mM4/H
	 Emwain9eUGcvJBpst3gdFHWric4ioFhjhrlpCeQ8Cb9WiQSAA4UOVAPUWf9xOE0+fC
	 Mn4qNNzJnoXi0YyieOP/5LYqPfmbxGth5Lu8YR6RrsX4nBxu+qbCBqdJhsFQMB7d+A
	 RxTKzqRdre/6a7NAx6i+/1KUAqyCYL2r3hQK1d7qV5yn669k1lphmN1PQdt/GJHjBY
	 xfxv65ZyQEkwnivnDOHpp9djTTzHQ7x5PjQdpzbVfbVEjuIUomdinddrUQrpUXT5UA
	 0lFQVC5iirRU/3TbzPIhv6qP3oIU+Xi+GkdbRSLj9VXCSZE8cx/S/zqkbf0rUxYFWT
	 b5UmgVG5BMW5fyzWpVDA9D0ulTVUxQJCNeeILutVWQOsoPFPy6KhlSmmLZxVCTnAH4
	 b4WFDeur8BoODY6CEOHvuaW9R5LMu0jW8ShEGlezD12JkmmubDUijfPsTMnWtqbcrW
	 dQRCyLwiWHAaoHzOgtcYid2tY+w9pjcVXbMbMjauHf9rWJXN7uJ4dfLK88FqmNOlHp
	 olNsauftvm5VpsJZRDtaWeOY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CC81F40E00E7;
	Sat, 26 Sep 2026 19:51:48 +0000 (UTC)
Date: Sat, 26 Sep 2026 12:51:45 -0700
From: Borislav Petkov <bp@alien8.de>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
Message-ID: <20260926195145.GBargiUSEEqjWPpuaK@fat_crate.local>
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
 <e801211b4c71ddd919fa5d7b9c859b86addf3fb7.camel@sipsolutions.net>
 <CAKwvOdkMK9Tj=JgsPeQj6_Xtx3FgZK2SWTSJVU_BJ7G17pDC2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdkMK9Tj=JgsPeQj6_Xtx3FgZK2SWTSJVU_BJ7G17pDC2w@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 02:25:47PM -0700, Nick Desaulniers wrote:
> On Thu, Sep 24, 2026 at 7:54=E2=80=AFAM Johannes Berg <johannes@sipsolu=
tions.net> wrote:
> >
> > On Fri, 2026-08-21 at 15:45 -0700, Nick Desaulniers wrote:
> > >
> > >  arch/x86/um/asm/ptrace.h               | 4 +---
> > >  arch/x86/um/ptrace_32.c                | 1 +
> >
> > This seems like a simple adjustment for what you need to do in x86, s=
o
> > that's OK, but I don't think we'll take this through the UML tree.
>=20
> Appreciated! I agree, maybe with Oleg's review this can go via the x86 =
tree?

Do we want it in stable too even if it is not really stable material so t=
hat
userspace does not have to upgrade kernels just for this?

Or are they simply copying upstream UAPI headers from the latest kernel s=
o
that stable backports don't matter?

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
