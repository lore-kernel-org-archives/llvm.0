Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B152D603
	for <llvm@lists.linux.dev>; Tue, 21 Nov 2023 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9u+Lr9L"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c87acba73bso30627021fa.1
        for <llvm@lists.linux.dev>; Tue, 21 Nov 2023 02:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700564335; x=1701169135; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CCTVl3tUjQOvHObHzjbVxbNLOTFELDSW5iqT75QPHdA=;
        b=c9u+Lr9Luj30pu9ffhtDHqWSlpNnu74ReHUe6oPH9eOan2ybwGoYz3mQEyzzukuXFe
         VsQJ1vzFxbpl38A5VtkogfIJZzzvPmS6+CZ4CO6RMyDzaXkdGzupvEZ7eRtowDbTo1XQ
         zCuoA5yd8dQajCHFv7hGjykTaVTp2IGeF+Eg7xrHPhH9Fg5WbCMDPkITscuShRyhxHoK
         IqQKWlyl9sGBd6KRfFLb5w80UIn42KRwg259aiuHuZnCzzq5DpZcikLH6yGY4Zm29+CV
         //XVoV5Mm9wpE8s9AhZ0AsdfasAo5sTnuSsvctIMu/81qR4jq7llDWdCVzW2W+P6Fkcu
         1mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700564335; x=1701169135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CCTVl3tUjQOvHObHzjbVxbNLOTFELDSW5iqT75QPHdA=;
        b=LrI/V3H64/1u+TaVPreD/cg8PkPPJAJ/ZMXBbv8DTME0yNqf7I4v4+MPeJZEfoZT6f
         znb3Af27mfaCzbN70uCdB1owXCiV2cby+nuXkfOYLpB6hEEoujPP4OWz3Ild502jlYuE
         1Uqb+kdukYhXzWfmvPDdoeXmfHi1HLzuAddcPePmXe/0KPcmjaaaz0nBfyjp4l7Q67sU
         92iQEUlbr8svpHV8Sc5zhtH2Lq/mCPChlZ9v4UlfVovvsiDwNOnKV4ZwVBK9io9whipk
         ywwJALyK7TFKUxsopieDC27vKK+Q36+ghUE7Gxyt0iNt1bP8v0n5pVPakHraPomPRvyA
         tRQg==
X-Gm-Message-State: AOJu0Yx9gcnsA+MWtHn14/50Fw+rXwLaRinO/0/Ixls1FduKkBQsudR1
	WSkCGCCaQAxbpp/8QVdzTN765R6ONFkHYDWnYNQ=
X-Google-Smtp-Source: AGHT+IGmo1HpOU/EHoxZuU2TPsFSxyO1Siz8LBA8opwt+bBm4TaevsOx0CoZ1Nke4igOByX5NlDQGKXd1jqMKLbZMgs=
X-Received: by 2002:a2e:1f11:0:b0:2c5:f54:2477 with SMTP id
 f17-20020a2e1f11000000b002c50f542477mr6787045ljf.40.1700564334353; Tue, 21
 Nov 2023 02:58:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
In-Reply-To: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 21 Nov 2023 11:58:17 +0100
Message-ID: <CA+icZUXFGp-yoWUHhbowz6YJyoULCgtjSZ-fTpRg8YvVD9V5gg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
To: ndesaulniers@google.com
Cc: Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 8:24=E2=80=AFPM <ndesaulniers@google.com> wrote:
>
> As discussed at the ClangBuiltLinux '23 meetup (co-located with Linux Plu=
mbers
> Conf '23), I'll be taking a step back from kernel work to focus on my gro=
wing
> family and helping Google figure out its libc story. So I think it's time=
 to
> formally hand over the reigns to my co-maintainer Nathan.
>

Hi Nick,

WoW (C)lang(B)uilt(L)inux baby coming soon - your best patch well done!
(  "Catherine Beatrix Luana" might be a good first-name (my
Suggested-by when it's female) ).

> I identify first and foremost as a Linux kernel developer, and an LLVM de=
v
> second. May it be a cold day in hell when that changes.

Of course, I can understand these 3+ years of working on both sides -
Linux kernel and LLVM toolchain - might be very time-consuming and
hopefully with positive stress.
Best luck and more for the new challenges!
...and thanks Google jumped into it.

Thanks for inviting and participating in the First Meetup of
ClangBuiltLinux in Zurich - February 2020.
I see your slogan "Share Knowledge Aggressively" as a life motto :-).

Thanks and more.

Best regards,
-Sedat-
