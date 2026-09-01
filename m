Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9E743FD29
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 19:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291964; cv=pass; b=k8GZSeT2Wgbx9iClKdfW3GIh6UgLA+VmUiWjKjqvKk4e9PckpNJnRCU6YAhV5ChTOnTRI5rqcIUDgXl+zyg0+ypzkum4MNDWTjJtjlsAGZ/kHbuqTWaeZe3lgJgaFfUJkWw2P8enFAJ52caE8bwZ7eDG7E+2xbPATFvuhT+SBqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291964; c=relaxed/simple;
	bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzNq82B8vyIgxtmuT0cp2bRD/BY1GR3/8OHoQjLNmVl7H3cG21h6IoUPR9Lh8XQ9Kl+PogGAgxZuHjcrlhGRvnZXXPENnN/tcoHjiViacGCDY3421PJIT8q5Km3FYeoBxBezg2SczqRcA9iG0Cwwum7P8P4VxJEAxrfiYt50Cjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vL4Pw1yZ; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vL4Pw1yZ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499add6348fso505e9.1
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 12:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788291959; cv=none;
        d=google.com; s=arc-20260327;
        b=NXxwev6eSnOmZaruD7Lj1UDwhTM9fVf2fqYaTtbvg6QkpN64E5BJvbxtj5W08uYDF5
         yp22aaBYIHof2rtPMSh8DZ2RCYPlzSxPlBR0gLdvAjwBQuH3mG4VzlTP61uzL5z97+vD
         8Q5uCu2XQWELVDAOMGW9iwKGOk3kVo/KWXudBuJU8jTeZ0RoXZOnne9NT7KPvwXjkbJe
         R6PcDQ+uvFYCFdEw7u3HVEGhxpJlvwRVHaoX/ewRsy2PcFmGIP8vtoez2RJc5WKqIzKk
         5EmzrrYd7MNroQSO5tsl1OKihKUhaMuR0R8+CJNYZ6Z5bOravPdhg2mg6P1yFiq/B7IM
         GEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
        fh=u4lfT9jwQk4fwnSxtYLgNzRdYkrozp8fUNPfyod6Mas=;
        b=eQe+HKP0LrsI4GZb/AGySUyUB1d10jO+ajpMXEhE3ff9MX7Q+YvpQT5QTI6Mo/OsdM
         nuExDqScxTIdZHIqomosTTWXAg+rZqK1VLdsSUcfxtbKOdRKYAykI8iLbp1D5X6lAX/P
         h3KSbyMTQWtmR8+Y/cR/o07YHQnEtFdUrZU64goL83wB52E6HLiXDNFYN7xDeYxcGwU0
         TwhL7lpmJQGbPQGSrQyENHmGLWJRvzIg4bcwMNBh7K+/juSzzU9vTeJN/M/8D+J8yNJ2
         tpJtqq3SFdl92mf+KDsymAY9JBCNSrHC1VMVF4UN+TSbBsb0384yag+MtFnCzK4UWXbE
         Hvpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788291959; x=1788896759; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
        b=vL4Pw1yZ/YopHZXQmfFhFmnixkjDBtXNpMwv97HFtGuy3MHmswbT4tWt6TQRSfdm6w
         RkSgnAJuq2HyiZeXy8gHYzimRbMyOpAH/JdrleFSLKpany3c3Z4m2OmLIp7WNjjVgKDE
         AtWdJLUH6wz3qHNuEcflHuzwK+E4m47GUVkwhBq+bRuuGLlNSKWwXxFAlAfKBlr+rE56
         Bn8A06lTUntw7QKrFqDgIXf9t5wviAS94fqcqfHXHpPlH1WjHcfgOnaytH/QSBaFsGUe
         qq3f/NhQcxzVIr3+L7YD4gHqD0T7/Lx20v1mucGEnmgrOTP7MotmOMUQnVT1sQ1udXea
         RUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291959; x=1788896759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
        b=p1Ue+1OU3AlQxD+a9+FRCgkni2Fi1wDF6d8hJBx09+Z5qsUUDId5iaZfyuUCYtRJr3
         /tGzrc7MVvN9pTatrdnYSiGsmvPrjPDnOEQfwLM9ueFA9cxQbrIbPoY7pWfzC1FT1GkX
         gueZN7GczJrznlsrOPigc7VsJtHjPrOh/2hSuOP5hD3qiOik0lkzHT7bR0jvB6W9wMfp
         UF5usNASzwioqCoILOpwwKQHl3vJejmL83ng7DCT0ttdh1lNUzRfqWHDsRqgo54K7LZN
         lxk3VlXHtTU4Q6cru/NHgvKPkYgYiNAeE0h5GjeGOekmcw6hT7VTbtgsF1JTiHU0kuAt
         8WKg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3Sj0LekTP2m3vgrd7jli2gIdgLfJWs7LgGmekXNR0Z5LQkhPek81jMf4JpAezhjLF0wyC@lists.linux.dev
X-Gm-Message-State: AFuF++nRys86z5sP4L88lvdUGVwTBq3Fm2cJpTrESvNYHTjN56Xi1nQj
	NJSIlV/2fWwcsVjacOX5psXX15R3mjZbP0ILgoYmdM+ihzIOcv2yB3lJOssqVQpw756acdnt5tk
	9bMLV3PmEjdHw+dvSlwvpZwANprfCdq26Hms47qra
X-Gm-Gg: AR+sD11/dlprj0argmzENiXno0BH68PM7ug9EsSiCvjCPksGRvCupRhTPWANg9TKA4H
	OT4iYk0ky1FZ2fofgAwrnyVXx7lK06OCAciGyGDampxfHJ/iWWnUmnkJ0AysdT6uMCCwId0cmzH
	ug9+SwGWYgdoYMyIsJZR42euaE2zvV25wXlH6NMd4iwKPlZ993Uhm0jd+I+AGVVVitXuLEI/Y4o
	7ZhKR2ebT70LoRbmQuhn2L98FQciLBFf4RUH421gECjOB5PV3kGG3ygOBIFQfPRJS++JWkLazdS
	yBZJoCfobwCODUOQxlfVetegGe4vHBkYE39NlhqP43JpE4wVzUfjEiBGHofMqAsSCILyT/Nc5/v
	DSaMfAM3QLN4=
X-Received: by 2002:a05:600c:6050:b0:495:7a0b:3b4a with SMTP id
 5b1f17b1804b1-49ce47dbac0mr115925e9.7.1788291958768; Tue, 01 Sep 2026
 12:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com> <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com>
In-Reply-To: <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Sep 2026 12:45:21 -0700
X-Gm-Features: AcwNN1Vx40LeKlkhxLn2rqkujAMnERf5APsKIrQ9ivuoQyg-T7s82dgNrM0lw9I
Message-ID: <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 9:24=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> The sashiko-bot's comment on v5 indeed pointed out that imx5, at91 and
> omap1 might suffer from the same bug: their suspend routines are also
> fncpy()'d into SRAM without a type hash and called indirectly. They're
> all ARM, so asm/linkage.h still seems like the right place for the
> macro.
>
> Do you think these need to be fixed as part of this patch, or as
> follow-ups? I only have my one imx6 device (a Kobo Clara HD), so I'm not
> sure how to test the fixes for the others.

I think separate patches for the others should be fine.

Sami
