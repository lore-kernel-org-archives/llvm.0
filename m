Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976C938F65B
	for <llvm@lists.linux.dev>; Fri, 24 Jul 2026 20:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926179; cv=pass; b=BMSmLGYzmJLHCXNokuEi4JGZ9vr6neknGGI0K338plSIN4iqGbgo4OhxG3TMZnYqMXZAhhzaiKLpSsY8L1UdLZJBivhDhXSdNQQ8hsfH58G8Oegkx+pC3oSnd5xMyQF22ra1Y8fhyW23xyBnFlzbnWLJMnHjz3m3O+WqCGyju7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926179; c=relaxed/simple;
	bh=gaeGWLc1DkhoMVhCoeTTtFJMXVnVmf3wALfJxA2LuRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQ6GuuNhr8sSiP+SFPxxpjyUSKvlSRdAE1h6pKRHkdj/vYZ1k6bHHo1IJGwbZwcrQb9B+RRiJTUaKQV1KU5z0rxdO/s4SYRi+8FgFth0EO/A0yRdVNd2sfqh9nLUnB7IN/L8pHktzslxlBkeoxiAL0ilctght5qt12pVMGVhu6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bK+JnZtN; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bK+JnZtN"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15e592da74so102697266b.1
        for <llvm@lists.linux.dev>; Fri, 24 Jul 2026 13:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784926176; cv=none;
        d=google.com; s=arc-20260327;
        b=oiZivhoSqX1ICIJa1nX89U1bq32hlTElfmdc/8yu/rfRkwKu8bsV0M58qNUfBxT+Ul
         rzrAACfXdjRtwFCPi0IWyDAhFYEu/jOT1qWFus0UZNbWZCquTkOYfvtoAsa539LA3g3D
         ML7fgL+0B1rP1M/07S4DkjH7jqVfc1TOh2xHH5v6Wok1gHMaKYoz+bI03fng4B0OrBFU
         Hmhn6Sqlbsr1duoROlco7KHTKxw0drpLntEIClWWkuRS+HoCLVcmeOqT/4rsAaiqJSdv
         VmhHopSxrPnEXRKjtVeVeu6K5emUZ87TgrkdZnIwG6QgmFmX7FGL6UNVe55wa7n0HNai
         7Umw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ir3cBbA+grq0RW9ubbM0IgTXxYQsKBl5GJdSxtKNd+o=;
        fh=6RofHpYQAjrCYP4ViVFfqs+LUxU6GSnCpQoBxx8X5UM=;
        b=RmeapS13QCmh9Lus+j3O9SW4jJTsJUSPqUGOAScGzpGgw05ShFg5bmpC75g7hJSy06
         c5CN2YcQlAie6KabbD4KEY0IxswmovORJWaXjWyn95+WWOFn4yQ64uLcTnSvYz239USI
         tIFRp/GubkmHa15Z6NpiaMx2LMaz0Ibw5C9PZiFxTt0OS/JkAcMT2bRXvVv7VvQZUR+v
         2n6itRkO0LMGJqskrp0KWWURaiQMm2EAoDRy2q82dpm0aPWOcUCCzJ9PB902AMR4a5QV
         r1FVT0yD5+4zqKkzsZiKGoWjgZGWE/zHXRkY4zbmOE1ymqhmjTTAYKo379PTNCOcY7Nm
         x72A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784926176; x=1785530976; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ir3cBbA+grq0RW9ubbM0IgTXxYQsKBl5GJdSxtKNd+o=;
        b=bK+JnZtNpJQyt8c0317T9wHIGQ8jubOKuHjuJjgcD9z+7ujCb9zJFcRdAVi8UqC07i
         aiIZOretcOGnN8TJ942kr9CWRxW0oZZZzqu1nWlkMBzfFSCvddzL8DYM5CE9VpHztWcX
         2Nf2Wdr49Ig7E8l0L2piaBVLJ32EgcYpfg9cj3GmAxFg4BdTscUHUKX516wa1aOzUwwj
         tdiK1cXmoUhHMH8mijIKtMtT1htFjud1spKGmbUsVmTlC5dZOXcvx/E5zo2QriWnPumC
         R+XRs+rQjf5VKGCTNgUAGOl8A8CT9iyAe+yPG4R4oyiJfvnXdKLUpgdjsVrumuxcROEC
         aj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784926176; x=1785530976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ir3cBbA+grq0RW9ubbM0IgTXxYQsKBl5GJdSxtKNd+o=;
        b=YD1wLCASaSlrQCPU41GUzkbIh8dipUEJLjSFPjXSKc1qmj79hbIi/zLy1f5eP02TC9
         DKuyHA7do+wkIrDqjLc5+hnu5voWwnVd0fqY13EOT9MkTIPIbQY1ACeRkbcNA8aPEFxp
         VnC/Agup26hhSHYBucVIbQ+ziHULsEr3wl5KCYGf3SwrAjEIdkrrkF7WWUT0KtUwQli+
         08+AGHKQMQoU5JH8P29UkRGCAkeAAq4IQqkg2Sf+CbXKUpXlzCm7D/HXUnkKGl9XtKJO
         1i2wu8DlaNpCWkyJxk+yQxNFToc4i+GygIh5DZ4zJt5DqAntCsGa4pHLM8SuTMvNP73m
         +reQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWBLxcU5AKXk8TDQOZxYIYuBWwnyj6VG0EVKYEIeJA+7GoviIM0nm8cFALAoJ7tfDwjSmS@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk6RGwxcrSfU4Cp9jBa5ASqj8HcxFv07H/Dzdc49CJn/NWocoy
	G07kcWVFnCOsSuCZWZZG7cdjkuOsraTqc9Ya2yFTqkT+RgkOwGWbHTwcNQ5ggB2ltYbN3arnEbL
	XOFUk85IWBmBgXEhrjEBoC++x6fuC4tcGlqb87Z2J
X-Gm-Gg: AR+sD11mH8yimt7a3oa7T8hD2KtzyO/q1JSqojXpoDOq9why7SQBSDHLMWuokC0l154
	9oiQ7VNXCbSTkcG0FVGLqQ81yJA6wpTkHwVHEt8tZBOtHpO4sTPFlcZImQKzC07UgXb2FE9bBEX
	RgREsEGiOSq5SHz9G050jOh8QIhi7icjNHCjN4QMF20dDF+bTGNMqEG/s68pWdRUSq5InGO6WYE
	P95mOPoiQrULpDmFQGkW6hDE5oOe8Go8uEqdO4UOGHNrxtHFpcTIMTCftxLVm+hy1mUlTBgP2km
	LAJZrplOVer/r7zLeNJz82WGiIhJ2/S/rSExKzArMKZuA7USro5DDsVnj8GAZrpCXu7DG665pBg
	=
X-Received: by 2002:a17:907:608f:b0:c19:5db0:edd3 with SMTP id
 a640c23a62f3a-c1c50cf9265mr356852666b.58.1784926175176; Fri, 24 Jul 2026
 13:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com> <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com> <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
 <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com> <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
In-Reply-To: <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 24 Jul 2026 13:49:23 -0700
X-Gm-Features: AUfX_myzXob-BTOm6ceAaY-cqbzmlciva43qU3JWJWtP-y4nEwp_xtUIj8U2zQo
Message-ID: <CAKwvOdnaOy-nyZ=8oLw4N-_hA9JZVdP2BhR8cweCAOhsy4VG6w@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 8:54=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Thu, Jul 23, 2026 at 12:56=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com=
> wrote:
> >
> > On 2026-07-23 9:21 PM, Sami Tolvanen wrote:
> > > What's the value for the __kcfi_typeid_imx6_suspend symbol in
> > > vmlinux.o? I would expect the hash value to look a bit more random.
> > Checking vmlinux.o with `llvm-readelf -s vmlinux.o` indeed shows:
> >
> >   a488ebfc  0 NOTYPE  WEAK  DEFAULT  ABS __kcfi_typeid_imx6_suspend
>
> OK, so the hashes should match. I can only assume that the hash prefix
> doesn't end up getting copied to OCRAM for some reason then, or

Yeah, Yo'av did you test further modifications that explicitly copy
the hash prefix? I assumed Nathan's change _plus some additional tweak
to copy not just imx6_suspend to OCRAM which I assume the code already
does, but I would imagine you need another change to copy
__kcfi_typeid_imx6_suspend into OCRAM just before the function.  Was
that tested?

> perhaps the source of the copy operation doesn't have relocations
> applied? Either way, if this turns out to be infeasible, I think the
> __nocfi approach is reasonable in this case too.
>
> Sami



--=20
Thanks,
~Nick Desaulniers
