Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECD94501A;
	Tue, 29 Jul 2025 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753790446; cv=none; b=DAmc6eoeD+RKmcpj5AKUV4Joy8VZrfE7RnVpbLGS1YIgFriJjW+0FtPr8TBpCkWrFxqirySHnZBAYtNYwsU6OwTz2Q5rodphd/1nWmQlPDT3xkQNM9fln5BNmX9CbLIU9xy+E/QaT9xvmVI05cmXihQTQrM+61/8aRKMq74z36E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753790446; c=relaxed/simple;
	bh=m1t7gFqsd4jUA/isqstA+JlfZ0bSi2r0Lve6NPFxRsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDc+qXobUpaMNzoPqGHBZBLrKyPD/ZUVRsn3D35/abzDQu7WejZltM851SSovushHWx1vIAYk/cJ7WS1Tdc9cV8LYYik7u+MML97155dUCcSSrOcHjLDWLP4OZ60xwj0GiPO6FSdD0BHREWhco8c9OkKSwheCQTFtE5FO0u+zqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyNTTbHF; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyNTTbHF"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso1115727166b.2;
        Tue, 29 Jul 2025 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753790443; x=1754395243; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T71omp5VnPaPYUhkD5VGEAJJeTj3czjIV76TIGjrbtA=;
        b=OyNTTbHFlNhVWaAkU0Mxt2qQ0Z3OjOFAfmZlBwe+lPxcOAz4y9ldy+AgxU9lwz4HSZ
         QP1deZqDvHdiKtxYdRwXedDO33NYHd04vc9GfTQ8/JgGGxgGESupJ2pfpz9SdZiNRGZ4
         njl9njUODboHy4WbphbfMFdI/+jgjXBbXNCqCnAD2qe/wg9+0X816N2fkOWJFXZze72h
         //tuE8aSaMiXTI6qVMn+l6erJODytKA9E3GuP+WWeRVNiPOFGkH6eZs2LgbNEK29XfPD
         2eGV0qA9/HdE1j+he+RjE2ynpr+5BtA8QrFL0elCjgaN0ocgc6jcvxQoqDl0PIksH3Di
         QNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790443; x=1754395243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T71omp5VnPaPYUhkD5VGEAJJeTj3czjIV76TIGjrbtA=;
        b=lHy9GIQYGW7qFaI5fzpt2Cph+h0eNrkNC5MbqHBsZHhAtZAzn7vbHa37UOJj2NgYdX
         B9QwYxy+aITUxkWZ32qyb7Hw4HX7mkUXefQ2zRoOOFV7ed7RP4D8hz9LuMVTxwJn7x/z
         4yZaEbAyPRjQcUpSKecX41XhOiCYi7SLXaYt1DshV/Hzs4ioJxY15HevUzXEuQxEC2Bt
         OxiaqFDObWnprc06fai9q3/wBVXg0y38fWCETnJAi0c4M6LjkXMuzDCzhnKeqZeleCDG
         cmQdHLrLKy8RwWWux6RphNdN2/nNNdjY3lV3WS7FcvNf1S7r5rtRw+/GosvStPsfM6Uj
         xEjA==
X-Forwarded-Encrypted: i=1; AJvYcCXLed1NNYt3j1tMIHxJm0CVEV1Oo8OL+3gCTayqFgybp4s9M2VBTVTP+wpsDIFo+ALuHe7EwDlDoppEGcbCAA==@lists.linux.dev, AJvYcCXu3g/wE1tPtdZD47g524Ba3LFxVx2O78UlIlJFdQIlgfu1oM8f1EvFrPl2SMYhT7clNTXq@lists.linux.dev
X-Gm-Message-State: AOJu0YzbTrvQMyBGk/NzbtFxkHjAOeyAsK/t36GOO7dlU6Nzz/zJ8/yg
	/E00eAtui3TyDZ13UNykWYSnw3cDKH9IIvz2wJhDIJqYG9Y0nDTASgBd3/HczroS9FCs0zR4B0t
	QY+JZJibS/D2WmwdvXFLpvjvperGfm6E=
X-Gm-Gg: ASbGncvUwqioNbTFaw8aoGMzFH/TWl3DdWxjYIoCp5dvPxM89SI49dncb/+zPVHQbkE
	+ErCTEoWVfYXHX8qnb0auq1R9Ja2OdtlvZcD+5W6qB2wNIA1DV+lz4oRZ3mBoWv/WFfbr6TZzIZ
	5yOFx39aJgyB0Pfscoh4OM4tLN+hyLdpeaxnUzN4DKerWeeANhb32A9SDj28Mc6t3VWn/KPNpTw
	/I9v2jMV+T5vH7npkDU
X-Google-Smtp-Source: AGHT+IHI50mh77+KmKYUPFMQpLDoGMPMeGaz5hvMplW+BGg6jqyM13nj/daE7kf3KpgtX2epm1dM6w59Adlag1YAld0=
X-Received: by 2002:a17:907:3e12:b0:ae0:b847:435 with SMTP id
 a640c23a62f3a-af61eb0d30dmr1821169466b.49.1753790441500; Tue, 29 Jul 2025
 05:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-10-af4db9302de4@linaro.org>
 <202507261937.Txq9shpv-lkp@intel.com> <CAHp75VcrL56_8uKNrmLj9sk+t7qZfKNi6-W-yAKNZ+mSCXU8zw@mail.gmail.com>
 <CAMRc=MdfMEAjgkTNENZejzRPN4svCiy4VZS9Y5HG7Ht5XwqUgA@mail.gmail.com>
 <CAHp75Vd6Vwk8pLarDk+hDQ2S_ufZ6wNw9xffMUJfQ5M8bPJubw@mail.gmail.com> <CAMRc=MdNN_J_uB4wxGgpvaxmhgGCYwu5LXCEFBOurNWc2OmSaw@mail.gmail.com>
In-Reply-To: <CAMRc=MdNN_J_uB4wxGgpvaxmhgGCYwu5LXCEFBOurNWc2OmSaw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Jul 2025 14:00:04 +0200
X-Gm-Features: Ac12FXwnzreOOhB0DO10QJJwRXKbVGABZpGShwmlXbV7ZXNZ8Iy65zL8Tf8Pqqk
Message-ID: <CAHp75VeJwGm2v=jGrd+cnitZ-cyy3bXoiDKkV5xQ70P-oecvyg@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] pinctrl: make struct pinfunction a pointer in
 struct function_desc
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 1:06=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Tue, Jul 29, 2025 at 12:32=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Jul 29, 2025 at 11:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > > On Sat, Jul 26, 2025 at 9:29=E2=80=AFPM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Sat, Jul 26, 2025 at 1:31=E2=80=AFPM kernel test robot <lkp@inte=
l.com> wrote:

...

> > > > > All warnings (new ones prefixed by >>):
> > > > >
> > > > > >> drivers/pinctrl/pinmux.c:917:7: warning: cast from 'void (*)(c=
onst void *)' to 'void (*)(void *)' converts to incompatible function type =
[-Wcast-function-type-strict]
> > > > >      917 |                                          (void (*)(voi=
d *))kfree_const,
> > > > >          |                                          ^~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
> > > > >    include/linux/device/devres.h:166:34: note: expanded from macr=
o 'devm_add_action_or_reset'
> > > > >      166 |         __devm_add_action_or_reset(dev, action, data, =
#action)
> > > > >          |                                         ^~~~~~
> > > > >    1 warning generated.
> > > >
> > > > Good catch, LKP!
> > >
> > > Ah, strict function type cast...

...

> > > > >    910          /*
> > > > >    911           * FIXME: It's generally a bad idea to use devres=
 in subsystem core
> > > > >    912           * code - managed interfaces are aimed at drivers=
 - but pinctrl already
> > > > >    913           * uses it all over the place so it's a larger pi=
ece of technical debt
> > > > >    914           * to fix.
> > > > >    915           */
> > > >
> > > > Indeed, this has to be addressed first, and IIRC I also got somethi=
ng
> > > > like this in the past.
> > >
> > > I mean, it doesn't have to be addressed first really, it's another bi=
g
> > > chunk of technical debt but we can live with it for now and address i=
t
> > > in parallel.
> >
> > I don't know how you can solve this issue without addressing that
> > first. I do not consider "fixing" by casting out const specifier (the
> > whole point of which is to be not mangled).
>
> We can do nothing and keep on leaking this memory or we can
> exceptionally cast out the const and pass it down to
> devm_add_action_or_reset(). The scope of removing devres from pinctrl
> core is quite big and honestly this series is already big as is. I
> don't see it as a big issue. I can meet you in the middle and simply
> implement devm_kmemdup_const() manually to avoid casting out the const
> modifier.

It sounds like a good compromise to me. You will have my tag for that,
if it helps you.


--=20
With Best Regards,
Andy Shevchenko
