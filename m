Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F80D101D0
	for <llvm@lists.linux.dev>; Sat, 18 Nov 2023 19:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b5yR52FX"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-54366bb1c02so4297a12.1
        for <llvm@lists.linux.dev>; Sat, 18 Nov 2023 11:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700334414; x=1700939214; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BX7PzfZyMqtOcztCqDIQ3igdby7s7mhmSg6YX3x3/1g=;
        b=b5yR52FX0wCrtDY3rokLBEnesBrDM3TiXODaWnS/roENFYJl2fJHzNBGPhCkoq7vXY
         PIxFVwB8ei9sYV27p/zPZhZC16xCVwvqSY5k9r0G972lCvcqvzP+XGKnvmjZu5rOd+K1
         ckL4iS8l6N1MLEO+p5bZNeRfLqs4sfS5Y6Kw/2OK9rfNkf5VLJ4C5/WRewb1Qi/PWLJz
         HCuM/pR2ahCKOGMduxZJiR12iCFMt95T6odXvPNdxosy+tJFVJtw3NoGZJfJMOrvWH6D
         4Fhdhxcs5QYDS3C47vFU9R/6vOqUN+5r7yvaJY0iLjC5lbGIA16E1Vwv4PCjaKlO7GwY
         7tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700334414; x=1700939214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BX7PzfZyMqtOcztCqDIQ3igdby7s7mhmSg6YX3x3/1g=;
        b=Jujl2tGhJMjzV5b8+k8dIsAY0YcbV7BIrDbrrlpbT7Cb71rDrEpFSHpFOYT3rMdUR+
         /vbtiFPrjyljl2p3Etk0uPaN3RH8Q7dDyM0hQoB5beVtEmh8dG5m4WmF3zkMfuLOWah/
         D62OTJvln/tZOn287qpcDVRUCS/MvcyUC3FLSUPJskySkPD9AW/9guqkrltYoRFLOJA4
         GYfc1UPY3Z/1N8drHoHYbDNiFhhpXDOWXFsutVKosuZPfUyDq0Aha8MRRFUV2a7nagRT
         H8GQjCFH3+o1UyIM/vQLSYsruWnHl1LhpITaLNEFn0H95rCs+uRIOclyTMahqDysK3mY
         OkUA==
X-Gm-Message-State: AOJu0YxWBZsexl4JceJzTNnRteOyA5HQmgQG9yr0tUdza6a5agmg5TJq
	jQHj+R8JXEVcdLsekNxhaNziWtD+puD7/ZOWG7rN
X-Google-Smtp-Source: AGHT+IE+ySdOFa6ErrSdvsWW7KQSBH8g/N1u2mWL8+Nn6TPxiB77nMMZ3Dtk7AmGRGZyP5s5Us2Nmlsmyr4xdkN5Q94=
X-Received: by 2002:a05:6402:514f:b0:545:94c:862e with SMTP id
 n15-20020a056402514f00b00545094c862emr109260edd.2.1700334414224; Sat, 18 Nov
 2023 11:06:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com> <8243E862-CFC1-4658-B07E-9FB87E34E12B@kernel.org>
In-Reply-To: <8243E862-CFC1-4658-B07E-9FB87E34E12B@kernel.org>
From: Bill Wendling <morbo@google.com>
Date: Sat, 18 Nov 2023 11:06:37 -0800
Message-ID: <CAGG=3QUishWF-bApJM5ppGPaZJNaHQjSxSB=NFRYpkmC59THbw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
To: Kees Cook <kees@kernel.org>
Cc: ndesaulniers@google.com, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 2:53=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
>
>
> On November 17, 2023 11:24:02 AM PST, ndesaulniers@google.com wrote:
> >I'll be taking a step back from kernel work
>
> NAK ;)
>
I was going to do that too. :-)

> >to focus on my growing
> >family and helping Google figure out its libc story.
>
> These are both big challenges, worthy of your attention. :)
>
> >For CLANG/LLVM BUILD SUPPORT I'm bumping myself down from maintainer to
> >reviewer, adding Bill and Justin, and removing Tom (Tom and I confirmed =
this
> >via private email; thanks for the work done Tom, ++beers_owed).
>
> Thanks Tom, and glad to have Bill and Justin stepping up!
>
> >Wake me when you need me.
>
> As the prophecy has foretold!
>
> >Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> We'll just report all issues as LTS kernel bugs and use the MAINTAINERS e=
ntries from there. ;) We'll miss you, but you won't be far!
>
> Good hunting,
>
> -Kees
>
> --
> Kees Cook
