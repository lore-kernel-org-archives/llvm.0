Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1D43DAAD4
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 21:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003920; cv=pass; b=arGxjTR/mPubSlylsmj09tnI4O1+jl/fJ2AZQC+bWzQnjRjQ6223nVxgz+vS17c6XxB1lvfuUZxa81oQsHieaTMvUL+XzR5egXWfxKk47l/8/Nzpsnkz/hl7lRJXQLGeUMmBIdSz57brnJJKF0z1tbSIYPAcoCEQCuwVkFFd5pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003920; c=relaxed/simple;
	bh=CEdKirEq2+Q+UOHNlHEHrgKgh5UZWOj3QauTHmy16Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTluMuNAaOnvP0EvL1cIYkpSbZvccaS5hfjrGiGu5ui+rR4kNQrF6hFD49gwJR30Ng2VquU1ZrhFyNGS2EFlzWZcLvHvobsM6KvgK0yN4totgEvC77HX/pkZA5RvgpZP0SV2Npjrow1HlsocXEO1ySBv0DVmjr9no5M8CRQEDTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tDAvT9tp; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tDAvT9tp"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c20ce3c118aso65985566b.0
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 14:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787003912; cv=none;
        d=google.com; s=arc-20260327;
        b=e9Ygh1rV3R4k3m3vcI7jNufqB4RmBHOpU91FHK5Uvz/FKiVl8A8oKc/1OQPUED5LcX
         hWL93/xrtwKLG9ao+PonugDLgtYL2VkVrZeYabsQo/kQgq5VmCkryN8izWbpV7S2VniE
         hBHL+7c7UVueRKh3SjsGVksudg0HdgYj7hNprFPsiMX/HjIempvkDrCKsbIPPyCF08WJ
         BPr10NlmgfG7r/AP8lXz9/z0C7UNXf8PqEh6NVgMJH+wB12Rs5KRvzqHTrtxzt8Ow0cn
         qq6cVPSeLyv06dWpY5UethyNAhfQx+0UlehFmA6H/KSvBbpz+5djUD7sV5o+C8IVwg+O
         A4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=okaAU3zYOn1hyhzNcOWFnCkDHyrXnj6mHvmxdNYRJ3k=;
        fh=BtxSyZoGiRs0ScwtqlMvRNVmynKGaSAFB9mQiLXqzrc=;
        b=Q9YYdJo+4qqMDmb/0+u1NEbCsnj4/79kqN6We1h36Pcu6u5OYU6HvQ2OCM9EDa3JWd
         jkMmXJx1yrxH00tT8KgUwastVpdhF4C62XMglbAbHcdfNUE+5gyv/i9eyAH7JMrfWuIs
         11cEd8Vl4OQQ4dqW8xDNVwFlp7k01tfKOUFUtJ1yH9m4MqXSHiiHmPxSc/8qUvnGo9RQ
         u/KRY7Cmxksm5ovtusTzLXMbaDlTJoZnge+yQZSSpIlZ3I4ED652L7YBiKmGzoVefFfz
         oUjgovX1U/JxcJWeo81K5VoXoUiIM72Oddmz3v6Sl7uSQK5pWl863oJx62kvXtDGC4ib
         YN5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787003912; x=1787608712; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=okaAU3zYOn1hyhzNcOWFnCkDHyrXnj6mHvmxdNYRJ3k=;
        b=tDAvT9tpd5zyEdd17zJ8ylht2zphVHSs/vbGj0vnrQJHh9XlGYGOakZvcxYLur7t6T
         /f5KPQmm2mS7FdrNu+zXHoDVR6uePc1WAPanBMCV+gTSj94rLviCCl+YtnR22272UHSS
         2+cEzhPt5b2eteb6VgK7q8Mipikpheawld8hw+0oFqcrUhta4/qfXE0mQBSQ9mHM9dPy
         IW+e3hKONRi/VQ2h30VutUhy9jgZqbSQM8qVdzXUHZWKoX1JlmycBy53MUMA9sU/UD64
         Qs+rOL88q4MYGV6fuqktIckrJn+fEeURwv7Phzab/i0YoEmyFLEKdJbcVHDgANUI4H5q
         bUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003912; x=1787608712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okaAU3zYOn1hyhzNcOWFnCkDHyrXnj6mHvmxdNYRJ3k=;
        b=VjQdNXTDC8I8KwQLKDtpJZVznm0HCuZUnPF6ShX0rq+sr5SHYK4DD7kVRSy4xPhgCu
         bOKEjCjhd0hdYNaaro5jeO9hQa9Qgkv12kLCSu+Bts6u44jdyqSB5p5W7Db9j9rGZ6ye
         BpzahizjyUeC//rOcQzQBoO+sO/M32jD+Ie3+ih0TOqh/cJ0izey29sav0exCTnPzMcK
         ARSKTNJRXNIFmJuIHJIyfJ2nKasVIsEuuJKYlqcLPCkkBj8aGmS+r+zXIJwvicWBB2kx
         t4GpHaYhK4hbJ9OUydB9ikdZy1Ozg10ZQ0dTMhl4yrC6Zzu/lz+N5LE/e8iNnr/uchHs
         TGAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4izkW4tEoK3BCtxZIixx0MIKdYihyewmts0BhWGNQsdawISILXgG1El0eLTE5HbjZlTfV@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0emfWZczsBKFc3GJ7HLe2Wm01lPdh2eUY5fDvv2IFzKK8FNwa
	lN5guhAnYsc2FlLYOg4m/yg2M9Y5AdyJ0vQwImr97ITwi8YbyyOJR1zqyuPWnacm13iOZ6RcHHF
	vdlr38marApX6C3u5Vd05Pv+JTBfuNeLmm9bavwl+
X-Gm-Gg: AR+sD11VzVLvB2/74VsM4bRJ6eeXv6B9Ou4skQRPpw6b9kBsKchmsnX0A+l9e1aXak1
	CBACv+wuhPaAcONdYxSwGMbHICjAG2aMJ+usfbECnm22hf4BgD+j4bnhZguj820CFV++qkTTo4+
	qcqPeFbq0B6vKXRHlZaH4VjK5GSbG+U4b3I2GKh5ACxoU/keITbXHduKvzxNz+g1NgMjMuO1IdA
	ZWJZqyPfYBZ7oDrDfvAUP5pT35P0twvw+1bNHOfKz1yhUWrQVI4Sum+VlUPrFlpdZJNtGhSFf28
	wU/cQblBjKxT4/gfxpdEJ+xOEi/4JIzhfAF03A1GTlnqzgLiMVXA/xH0r59bbHcKkP8jR0jDGYx
	GuxZzu9IInsVChlZ6gNwQHawEuBKR4NYbz7s0ILe+oJRu3kBuIJJ6nkG2
X-Received: by 2002:a17:907:9446:b0:c0d:7c31:26a9 with SMTP id
 a640c23a62f3a-c218d9ba953mr40425566b.2.1787003911741; Mon, 17 Aug 2026
 14:58:31 -0700 (PDT)
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
 <CAKwvOdnaOy-nyZ=8oLw4N-_hA9JZVdP2BhR8cweCAOhsy4VG6w@mail.gmail.com> <91cb0f21-e78a-4931-b123-937c6a01592c@yoavmoshe.com>
In-Reply-To: <91cb0f21-e78a-4931-b123-937c6a01592c@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Aug 2026 14:58:19 -0700
X-Gm-Features: AcwNN1VNo3n6QqxpiSk3WE0KBl-3YmOc0Qs-sAl-zs64L7Q39Eb5f5vg2HrwQ5Q
Message-ID: <CAKwvOdk-JmqjhZWBiLjXTxKhEV+T3BAB6An+3Ara8oybmhAMpA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2026 at 8:37=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> On 2026-07-24 10:49 PM, Nick Desaulniers wrote:
> > Yeah, Yo'av did you test further modifications that explicitly copy
> > the hash prefix? I assumed Nathan's change _plus some additional tweak
> > to copy not just imx6_suspend to OCRAM which I assume the code already
> > does, but I would imagine you need another change to copy
> > __kcfi_typeid_imx6_suspend into OCRAM just before the function.  Was
> > that tested?
> Yes, I tried that as well and it unfortunately didn't work.
>
> I tested Nathan's change along with explicitly copying the 4-byte
> prefix from before imx6_suspend into OCRAM right before calling fncpy().

Can you share that diff? I would have expected that to work. Perhaps a
minor mistake in your implementation?

> However, when checking the compiled binary, "&imx6_suspend - 4" just
> contained padding rather than the hash, so the copied 4-byte value
> didn't match what the call site expected.

How did you verify this? Can you share the command line invocations and out=
put?

>
> Yo'av



--=20
Thanks,
~Nick Desaulniers
