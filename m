Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9F434D93C
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 22:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782946110; cv=pass; b=K+t7mat5mhKF+xptHCUwNCl3y2xgyl5gVWM56/1sT+3SR1PEGY2aJJkBE65StB5lID3GOsDvxr4Wg4INRoFxRZZftm8klPMAAD19SSuswlJ/BnQ8Jme4Ghp04+KowyqR7DJtiTpan3XbbsMT2A10qR44PtB+XoYfbu/NJNd6JsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782946110; c=relaxed/simple;
	bh=SuV/RveQMwmgPdBsG3oB7KB0fRA+6EblRb6Qr0sJC6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsIqXtHqSgPGgBENaXjqiwzMj5bGuzS5Gd3j3XmzZfzfNVke/2sBd4WPo0WlRRrdBP/PbwBYo8GyZqS6AMpZUmqX/8O31bIKo30i8bXjblcfyM7hGxTuV424mDtS2Zzyxpf7ym61EmHQAd6oTCvS+PCtVbCfVRoEtmscb9az0is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLrixUBw; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLrixUBw"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c125bce2294so137526266b.3
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 15:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782946107; cv=none;
        d=google.com; s=arc-20260327;
        b=EKzWlwLAWz5/02P49q/CtePtwdp7syJ+aKoGWHxxf0S7t2cMolLnS07kSCGjkb81Vk
         NztALRDoQXxIpZ6qIHi5tiscXuvzPmJhxps9iJlCoPVZ4v4dyQogj7u0cZQKJmrsfUUO
         CBPTEDkghT5dBz4955M+4UUKuZI6JMRmtrxTLMkP4O0jQ1W/GCUDzohtJROvbqYqjN36
         31IRnY/zBPlZHPeyO6z1Gpdj++04dPwOM58zslaQqhEt/MhMDJs6NM3Qgwq3CSVV52WP
         V5rsEJpqT+6VAzJCvYdHWJXabQoP/5yT4FLFHsTUFXoa5LhdDU5GmOSKHVbv1dZKgs2U
         fQow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Y7K42Pthy/h/C6rphgJepVh7B3oR9NKzsJz8MEYLdg=;
        fh=iiTLUbn/v9vGoGxyWNzap5BnIPa8ATusosnszXFz3vE=;
        b=OhIvnb96LIgN9bO2QPmRbXBREHmqUG2DIvbC+NX01VEpc0VbMxfhQA7gWeip+L954V
         8kqNuPH0pDYMG0bkbztqEquya3kU9bBv3UluLG7hM78lG3rGGRnuaraZ2EGnIXiARlT1
         x2gmOyvlSRX67hsmjZcPzxvY26b5fLilNaODm8lWS5kAA/KTH++Nwfr903PD5DUsISWJ
         ecNiFkvnpHx5itI+Bt5BuMssMauAe56s2xk0gpvzjjPVz0E43govcpaczvgyCAnrleSF
         wQmfH9tUKUWq/JSB77DnIRllctYaXkQCvbwqgZnl5ld1VBq8zedR7WI6pju43Zi5HAPL
         I/Tw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782946107; x=1783550907; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Y7K42Pthy/h/C6rphgJepVh7B3oR9NKzsJz8MEYLdg=;
        b=MLrixUBwksUT1FWraCE0xSm+qPVon5SsQ5PAkrK+gBIJp8G2CgIzyj2HkhGUbytIvX
         kKz/Vbdi4z+m7yFdyPD9wDZHbs1PNToVhyc/xVYweKJTXmjmu1vtaoojBwOf4YeCwmYT
         TwEVI8dkZsC5iRTfsal7ZsdZMwznSRPPFafWGjPOlweyJghVwiJ2izElH84R5INtXSjZ
         262p7vBVOy6BP9PCBGoIPkX1Rhu2uIle/2pv1PfqhDuUlACmJ3R+GuuVH59ng3/FrP9W
         t+p4LBfA3NivtFqSK/ADuyHFaNTuS8/dQvyjycWUNiErEQ0daLlBhxw1TDrJnznqyTtT
         cegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782946107; x=1783550907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Y7K42Pthy/h/C6rphgJepVh7B3oR9NKzsJz8MEYLdg=;
        b=NtpJTaJssA+hP6Mrvk8K38rt/TcZqt+JEp5yCCJzFjwqCGOYxW/R3nAB4FCuTdfRfl
         XQWNzRErBedNmjWoI0zBCE5ouLVmm+sk7tLDLDnIdUJD8s7UXs3rBaEBVKDomGeG8X9t
         USSrHd4qIdkMviks8KmlNyjxq/Z6kiW7dmmyALNWnyds7fX9fDFNCHqXnnP6RU2YZ6CP
         hBvKwHDkqtBEbByafviy4/BxPfFoyZixGdxuX+qL8hAlrCJb2tZMJOuqIx/GBOJKxPPE
         E161WyBQFIgusUXYlnPk/ovFeaqVsccBpCcXWLRtyj6B9UPTUiH+3Vp86zaMSZ+hgLv3
         m6jw==
X-Forwarded-Encrypted: i=1; AHgh+RoQGYbe1CZ2JKTbDJEyKwwm0jQR989YHrVG91ZftpVRQ8ZAaIDkEbSDv7JfAjfVkDuAv1FJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpt+jfH1aGr8i6vDZv9IkhA4x9/J7Vw09Q1387M/unYa4aItT+
	sv7y1UFebHW6W1Vz8Qx4A4t3MtWJAeACi+sKhiFI9mGG/Z/nFg1aVG+ltQ+8Z6PjNp73zC0ZOsv
	xvYh7+bWrrXbVm5Y6xJZEKEBuBdeSDvI=
X-Gm-Gg: AfdE7cmJG9BoyJhMEpOLR6tSX3ePWVZoveC+j1DwyZdgVfljULh0mCWQyFZydGX0QwM
	iBOq+Pzu2UiabHMS8D3NnHPo03tPH4T5rf+ocpXfCR7k/w2cgjkGOONBukjARKnQH//MyIVslyP
	DOTzuAn5fzDhGDnUmVVXWJ01yHxALBgwVpntFApzmwinnGXftvA8wn1YebkEvusK1+CXXgfHNr9
	PTug6StOOGg7mS1wP+fValGbnUwAt804qp4VSc6qw72ZH7svX9F31I7QZtufZiwrsauaLNHb5k5
	XN9qEhUyLtyc0ePoDvatfjbRP02Z2w0NOBbM5WXFUmbDQ1g4tuhgDzhKlVjtw+yjZjA0enM+Uf9
	zZRQYqbCkZA==
X-Received: by 2002:a17:906:f851:b0:c12:9fb7:3e68 with SMTP id
 a640c23a62f3a-c12ae7af993mr118796666b.38.1782946107350; Wed, 01 Jul 2026
 15:48:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701125151.352632-1-voytikd@gmail.com> <CAG_fn=Wor0586c077D+0D+NYh+bkhqPhVVzoAANsaLGxbjLpTQ@mail.gmail.com>
 <CAAX90H31D3y-q1RJ=ah+hhPj2_apUh-rGtmwwp8vBzDNZcLH5A@mail.gmail.com> <CAG_fn=VA4P2YVNHSHxzeChFg45LhoYLnj4jrLMq+jVGnt__wPQ@mail.gmail.com>
In-Reply-To: <CAG_fn=VA4P2YVNHSHxzeChFg45LhoYLnj4jrLMq+jVGnt__wPQ@mail.gmail.com>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Thu, 2 Jul 2026 00:47:59 +0200
X-Gm-Features: AVVi8CdTiFW68fd4xueUqXpI0l3PKu1X-5785Y8Ch-vZEDPAQtgM96icXgvaUBA
Message-ID: <CAAX90H0XdhYLPRctHKnpT8i-qYUrJH3WqDAq17M4pDB_p=Ymbg@mail.gmail.com>
Subject: Re: [PATCH] x86/mm: fix objtool failure with KMSAN enabled
To: Alexander Potapenko <glider@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankur Arora <ankur.a.arora@oracle.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Marco Elver <elver@google.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 5:16=E2=80=AFPM Alexander Potapenko <glider@google.c=
om> wrote:

> In fact I think the hangs are being caused by CONFIG_UNWINDER_ORC=3Dy,
> sorry for the noise.

No worries!
Just in case, I double checked with current Linus' tree, defconfig +
KMSAN + DEBUG_INFO_* ,
and it looks like CONFIG_UNWINDER_ORC gets enabled:

git pull -r
make mrproper
make LLVM=3D1 defconfig
./scripts/config -e CONFIG_KMSAN \
  -e CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
make LLVM=3D1 olddefconfig
make LLVM=3D1 W=3Dce -j(nproc) bzImage

grep CONFIG_UNWINDER_ORC .config
CONFIG_UNWINDER_ORC=3Dy

and the kernel boots in qemu, so maybe something else is causing
(another?) issue?
