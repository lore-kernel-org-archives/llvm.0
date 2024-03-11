Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0362E20DE5
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710148508; cv=none; b=OQ5xDbq0+4YYOEhpIxxerv0z8N/n2GaB2kMaxOy/gTje5m9GGMbcRmybkSmlwMi4PBzAv27mNecT+IdnL5GPWRtTKBbjYNuK4AIb4JmwVr8BGZLRr01/xsBkvJzi5na3Ahn7qa7C2IIyhRc7MzkWy4Skli2/6U4Nu63QKpuo/0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710148508; c=relaxed/simple;
	bh=QO/GNzNkf2YcryLx1EP1noGR45Eqf4Z0zlwExKfufq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtACpdCZx6B2qi3DDDK+tObsGRdlbIwhSWClI5Dsp730ATBKpGGaxY9FsLkB1cikHMhvcdMj/GKDfe8ZH7YcsdLbOuXWpOcvZywKOTGvP/C0iysiAJfJea37G4AX03SLiO48UIsHk+vC39uHpqoV517ALVP61woGSUKFnr4Piak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc745927098so3611209276.3
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 02:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710148504; x=1710753304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Afomj2qqE2Ncus3hWAy0Jm8sIwQF0kbqpG+NUNMGeg4=;
        b=hc0CpxgWwXUOjZhDf0p6Br0FcN9fJCxsjNeKmqzpHRj4QIL+fxant4V1gx8JhHc8jr
         VMu1A3JHA3D+WXQQ7obg7QVw+GM4JHPPD6d5ugVxdjL0Vn5cjX6m0Ii4+1S6BqFKHnUY
         YG+4K97wLR6agc3xLV7LCN0Xpc0NIo/QygZfGnj59o7JBk5XawLVrgB1doKsO1Vuu6Uz
         ChPaGuFVGoNZKDMOks33xTQt+aPYnKus9hdrWezINUahDuODeXJO9ZME71JMO30xh7oL
         ugtGrELgRwPP9Cnhxwr9upAh+huuJJDkTweRIRcTfJpw571Z3iNnvHN4FQvNfYWC925e
         aUHA==
X-Forwarded-Encrypted: i=1; AJvYcCWOfVdyh0haXyZ+pqRHuhBVD08Cz3Nzt0tcOiTw3NuYhuEPrv+FODi0/TzlGhGIzem5PVsswc/wEcH6vRaeiEYwqXm61w==
X-Gm-Message-State: AOJu0YxxkWOg82OAfZEGkIRuof5MAuR9PQv4Omnbogez1Maefe41Er1i
	I4DKqW5SoJ5eWr/KfFqSxxIp4OCIja4ol9lb/Ut7i2ELGc7ZjZ/oNDsLU5vPq2M=
X-Google-Smtp-Source: AGHT+IE35d+QINOW44bXRd5Oo/LdgRFB3lfWFGKjF53PpLOTdtfmm3HCqA+k9Y2tjzD67hhoqNJQQw==
X-Received: by 2002:a25:c7c9:0:b0:dc7:5157:d43d with SMTP id w192-20020a25c7c9000000b00dc75157d43dmr4049942ybe.42.1710148503911;
        Mon, 11 Mar 2024 02:15:03 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id h17-20020a25b191000000b00dcdb0f80b69sm1080483ybj.48.2024.03.11.02.15.03
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 02:15:03 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-609fc742044so35366207b3.1
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 02:15:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVd7OXyFLkPoYYjefeLrfHLZGW0T6YIOceSVrQkwmNSW204jzLn9w6sABbchCvdy10097p0GXh9J+D6dE9IYyfEgc8Dkg==
X-Received: by 2002:a25:9d85:0:b0:dcf:5be3:3ed4 with SMTP id
 v5-20020a259d85000000b00dcf5be33ed4mr3877372ybp.17.1710148502987; Mon, 11 Mar
 2024 02:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240307151231.654025-1-liuyuntao12@huawei.com>
 <58cc1053-7208-4b22-99cb-210fdf700569@app.fastmail.com> <42892794-7668-4eb0-8d2f-c78ca0daf370@huawei.com>
 <2a90581c-f1df-4d6b-8f0b-8e7cbf150ed9@app.fastmail.com> <346e15e5-49e9-4a7f-b163-c3316225baab@huawei.com>
In-Reply-To: <346e15e5-49e9-4a7f-b163-c3316225baab@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Mar 2024 10:14:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKk9S9voKVPvO+xvn1zFW3FnKyVHQGDkC7b9Ynkcnvmw@mail.gmail.com>
Message-ID: <CAMuHMdXKk9S9voKVPvO+xvn1zFW3FnKyVHQGDkC7b9Ynkcnvmw@mail.gmail.com>
Subject: Re: [PATCH-next v2] arm32: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
To: "liuyuntao (F)" <liuyuntao12@huawei.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Fangrui Song <maskray@google.com>, Russell King <linux@armlinux.org.uk>, Andrew Davis <afd@ti.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Jonathan Corbet <corbet@lwn.net>, 
	Mike Rapoport <rppt@kernel.org>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yuntao,

On Sat, Mar 9, 2024 at 2:24=E2=80=AFPM liuyuntao (F) <liuyuntao12@huawei.co=
m> wrote:
> On 2024/3/9 16:20, Arnd Bergmann wrote:
> > On Sat, Mar 9, 2024, at 07:14, liuyuntao (F) wrote:
> >> On 2024/3/8 21:15, Arnd Bergmann wrote:
> >>> On Thu, Mar 7, 2024, at 16:12, Yuntao Liu wrote:
> >>
> >> Thanks for the tests, CONFIG_LD_DEAD_CODE_DATA_ELIMINATION and
> >> CONFIG_TRIM_UNUSED_KSYMS do indeed result in a significant improvement=
.
> >> I found that arm32 still doesn't support CONFIG_LTO_CLANG. I've done
> >> some work on it, but without success. I'd like to learn more about the
> >> CONFIG_LTO_CLANG patch. Do you have any relevant links?
> >
> > I did not try to get it to boot and gave up when I did not see
> > any size improvement. I think there were previous attempts to
> > do it elsewhere, which I did not try to find.
> >
>
> I tested this patch, the size improvement was only about one
> ten-thousandth, and the compilation time had increased by about a quarter=
,
> and the kernel did not boot.
>
> Strangely, LTO has actually increased the compilation time
> significantly, which seems contrary to its purpose.

The purpose of LTO is to reduce code size. Doing so requires more
processing, hence the total build time increases.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
