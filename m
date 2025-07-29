Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8163521D001;
	Tue, 29 Jul 2025 10:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753785151; cv=none; b=f8z7VILWtuf2HBCe4caYVNKBJo+Y8r1/1EOsb9lKBJkoXIOPmcDzs1QuOTOfHvyjb0WHpnwXI8KF247YWTq61NAFePi8aYa4t2EwAKzBHmYKo8C0bsvN8Kd2HY4JU+PlL5O2DXaddE+VIDGYzD2lhteQAlgh+OjFiCY172jFYwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753785151; c=relaxed/simple;
	bh=Egd7MCY7LVDLj3MpL4PWCOaHU+rY1sVQYcW0almTjaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3AJkoHeuEYcWsAWumKmpPcQFfDbmQVXefw4s95Uqds8up+CAPrJuskyy4HscVqwzyHamBqmWzkydtxIGoz/AAfp17UazqJC/Yafowf6tvLVewPjVeIZKcZrIYfankwRWjnZVAGAphs7WhP4IceyOS5TuFTJ2V3VkoW7LQ3s4tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTR3bFKh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTR3bFKh"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso1097190666b.2;
        Tue, 29 Jul 2025 03:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753785148; x=1754389948; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUlNfqlQv51czIMEh6zHw/PUQr/dXVTYzNTmvEdWeJQ=;
        b=NTR3bFKhthSM8PeAaXsXcAgj4k/r0AY3YqhGyZW1nIps8nbkjOZJ7rIEteX/1AiFb6
         6lJprCrigpOo4MohKA/Q32GNlDM6jQ9yNpLN9uNfdbouP/XPpSmtnYTNbaa8O3MUjz+1
         zvuRpZA+brhOze8MLc/u7dDpfVBS3GY5ogfr/DlIO9SgjPAmBnxJiGCIGSB7Cia75K3W
         iWquJpaavztWHNUdjRf1Y7nF6R5rqtpwKNbhmJqL9Skr8i9EJz3OhX1LfTVdbNyI0Yw5
         KSvJqLZchtwZtFhceB0CJxbEsJtylcm/aiRRP1eTcEyXn9OVPppENJkcjsNjJnwveE2K
         sNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753785148; x=1754389948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUlNfqlQv51czIMEh6zHw/PUQr/dXVTYzNTmvEdWeJQ=;
        b=ALEzIFIBvuoN4BDTC4044S8gx82DLhPP/EFIHPnwGeOUoX4z9p6dhpqLTWRYY0LqfU
         3QssZURlfQH+BAjpA+0Dgt4RwQ8EA+0vPREl4Ff7YLGEDCYO5mnFRFhBnp7ouZ0mEEKt
         kbbw0EIwCQ8M7P6W5ICS8vqqWMDYRMruErKAU3iUVw83OrEH3mKnCPM7g46/u9aXde0j
         maDnAXxACsEsPuWJ83hkfixGMGZvolKzKWYOIARlmtXvYqD+IG/q6DZXafAfCBsUck2T
         XOtsEBWglxuvxkd8Jc5/gRW8Bqjss8Qv9mWlw9+FLPwQi9wqNy0ncMSKBrOjuHdL12OE
         HNmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW8U+nBRmkp5M+LRcnetDXf+KcrwCRa6oJSlXAbfjihtf2SkYorZMaAFnpld2zHKgXMYRs@lists.linux.dev, AJvYcCUx66o7goaxgGnUl3mDlYpUprTRx1NBXR/czruCTEzs74C6LIcaJ9HGx/T3A36L+CH1h2l9LcOHS7WRYS3VVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ1Fn2gSDcpIlTJgicGRao0lcUQXZn1Eypk0XWBx4zH/i9+ViR
	TCGmFQK3sX+hXx8mhv5mBz6C/zEB2waqhDJ2EYkElvabZh1lUJIZZx5+TR79/dyosCuN5404iHE
	sPQEE7NvErO2vf8rx94PAjdfFX8t/oOs=
X-Gm-Gg: ASbGncvmm1edeZhuf9TUm9BUaj2nfs29Mu6KtkEsmxJ9VsilxUX+x2spsU0Gy5QesVf
	DPbRH5Hf1oEHlNkLrdMtZkLqD85SZwmqKnS2/KaMRUa6UF9M4yrHZKTOVJqj/pPVrZiQkTVZlWl
	f7rbcaLvit+RiarezAVsKS7rFR5MQKnmShN2bbSBjzvE0DtdKG9Cpj9X1uecHuWuarwPpV03QBI
	jkCA8JOLyUn+Wo0wcBzePd386VIwWw8dBZh4FFvIg==
X-Google-Smtp-Source: AGHT+IFxXAHjt8+mCk+a7x/xU7iaEiDEIirgDpLkHyDsxKg57EPvq9+iw9tF06YJDhuR9Pkw7TMPw9RYYKU1vYDLXKk=
X-Received: by 2002:a17:907:c1f:b0:af2:b9b5:1c06 with SMTP id
 a640c23a62f3a-af61c8aa24fmr1664968966b.14.1753785147471; Tue, 29 Jul 2025
 03:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-10-af4db9302de4@linaro.org>
 <202507261937.Txq9shpv-lkp@intel.com> <CAHp75VcrL56_8uKNrmLj9sk+t7qZfKNi6-W-yAKNZ+mSCXU8zw@mail.gmail.com>
 <CAMRc=MdfMEAjgkTNENZejzRPN4svCiy4VZS9Y5HG7Ht5XwqUgA@mail.gmail.com>
In-Reply-To: <CAMRc=MdfMEAjgkTNENZejzRPN4svCiy4VZS9Y5HG7Ht5XwqUgA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Jul 2025 12:31:51 +0200
X-Gm-Features: Ac12FXyzhjLDpJil0UBomtlZ5A8XPq4-tiZzez2Wp0eBW04tx8ikqHk1kggUetA
Message-ID: <CAHp75Vd6Vwk8pLarDk+hDQ2S_ufZ6wNw9xffMUJfQ5M8bPJubw@mail.gmail.com>
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

On Tue, Jul 29, 2025 at 11:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> On Sat, Jul 26, 2025 at 9:29=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sat, Jul 26, 2025 at 1:31=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:

...

> > > All warnings (new ones prefixed by >>):
> > >
> > > >> drivers/pinctrl/pinmux.c:917:7: warning: cast from 'void (*)(const=
 void *)' to 'void (*)(void *)' converts to incompatible function type [-Wc=
ast-function-type-strict]
> > >      917 |                                          (void (*)(void *)=
)kfree_const,
> > >          |                                          ^~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
> > >    include/linux/device/devres.h:166:34: note: expanded from macro 'd=
evm_add_action_or_reset'
> > >      166 |         __devm_add_action_or_reset(dev, action, data, #act=
ion)
> > >          |                                         ^~~~~~
> > >    1 warning generated.
> >
> > Good catch, LKP!
>
> Ah, strict function type cast...

...

> > >    910          /*
> > >    911           * FIXME: It's generally a bad idea to use devres in =
subsystem core
> > >    912           * code - managed interfaces are aimed at drivers - b=
ut pinctrl already
> > >    913           * uses it all over the place so it's a larger piece =
of technical debt
> > >    914           * to fix.
> > >    915           */
> >
> > Indeed, this has to be addressed first, and IIRC I also got something
> > like this in the past.
>
> I mean, it doesn't have to be addressed first really, it's another big
> chunk of technical debt but we can live with it for now and address it
> in parallel.

I don't know how you can solve this issue without addressing that
first. I do not consider "fixing" by casting out const specifier (the
whole point of which is to be not mangled).


--=20
With Best Regards,
Andy Shevchenko
