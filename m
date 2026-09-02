Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF724A9D52
	for <llvm@lists.linux.dev>; Wed,  2 Sep 2026 17:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369039; cv=pass; b=Qx3ws9wGUudwuHScAYO5zAzzbZ4/CRCld9Uub6JTp033HW5RzrmdruBP1PxYiBymaPWM6E5910FF4fb5Z7EV2OPdGiFoNbRjItrCw2e8o9gXTQnCFnZBqG+uNkXgMh55IN7IBMD/cRk7Xl2SHc9S0n0A8NIGIs7sqbMATNoS5U8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369039; c=relaxed/simple;
	bh=mTnQX3Mp7xcXwmjhHicO/NT4zipxlJZDBHdnZk6kKHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UmwBW8ObyorP3FLJjAbny5RFNBLx8nJ26z1MAIXeEX3BLZdOpm0LhLXC/VVtoN3hmfnWfy+Ndhvtdd0J9QeTkxS+y7BmPEuttGSPoz5OL8fIet/LcLPSP/ZOFKWFh9lDgv7Um1fWPw1kiDNRimqhcxU9JJhvqBtTEiG2QRFYFFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YKLuxK37; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YKLuxK37"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1333044f8f.3
        for <llvm@lists.linux.dev>; Wed, 02 Sep 2026 10:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788369036; cv=none;
        d=google.com; s=arc-20260327;
        b=PCz2itUxHIVQRtYMR2LsTgJTczZwuufluOlU6t7W9DB+ykSDnzYSbUguZPRNd1ISOA
         vo7510DVjzGRWUhJ6bZNRKTjKlG9G3Y6N7gecnSMAAjMRq8zL2r34ka9ppgf//Td+C0d
         9thBuLY3BlEwUiu8gZ+2EK//0Y1u4O5W4c82hnm9amWGGxh1tw+TkdKznFe+q43u5Dbv
         7OlbQbuNu4fXCCDi0LOCmTOuNJ6gdZG9DrlTdBPqmQIXxUBhGrgeBtggo6YdPD+/IN+w
         uh/MF6R1ynCljgoygmu4OStoUF30ljaIuBp/6SagbLZIx50CMqiH/s7Ijl2WtThZDs2K
         anqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=;
        fh=lpbJaZ+RGL+CcQOfsToO9xEyzVQdPC/sAy3oTk8GA4E=;
        b=rWMb6/ohLaT4rQ2EFEl0YLQ8dQxsZSfmWTAn5z4q0qHSzN+XPe+7aTKXQk9nYeimt8
         hJEJM/QJ++E/Rrqcfet7FUtCmmgjBGYQ5Vky24JrhpOaIoyalRw/tUdB+FpLI+1wRjYc
         OcBqV/ajMKlxa6nIACpvlpurOtC8FKVaPOsRfulkzjr5lMFGIrEOxKG0RO6IHUPLgH2x
         dRFC7TD8WH+9dBK0AzxQeBCtqil6220N7E6NRzkKmb/6E2CC2/ADq3cIDfGvs3msa6WV
         gN36yLlZEzuJ2pcIS9LTYGO3l1F9I8ufkAUorVft2vsCFtcBaSCQLFu9nDNMYYnrjEEq
         ha8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788369036; x=1788973836; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=;
        b=YKLuxK37z2CNVyZLjFOzNvDvluCMJ09vADF6dAApuquIzXJMkzsPlKbWIZpgwmiH4k
         FtoyJr+CCP2iRxue2jQy7Ony5ybIe2UiP2D7jPIAk6hhlmrsDy+aBvEujjJvMMsHwN8a
         FIifxFow/aoNdAGWDk2qMz27Tw8X2tJbsL1Gb9br6rDoqfC7FYOKNN+AKGiMQBhwWIpM
         2QcVG63uK2k/JDtoEQL+7tAGiY4tFpVlp4lh6lOK9MKQibCL7Nx85Lmn1i2H4ZbVteWI
         PK/sULXEAudjh6n2l2boknHDSQlNy9C5nJ4NA/h8+VynJnxVHuBq0T9n+UApGW1zZhfJ
         ocbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369036; x=1788973836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=;
        b=k1vI6vpVCx86EczNYxd+13FF1/xS3SH/aSPkqZJzEINLev6qHJRfYR/p5HoDaoHCoS
         uWxWSgDx0kfryNyBAMnQXme2wII8TXatcqdzK5qGj2VI1NO+MmbzQ1FMpWS10cMO1Hsd
         UVQd7cu99Q/NrR0ahTsCNKkRvTdvtnnvWC3NAhuhvUaZTzD71QReVH7n5Zh9JIN6i7f9
         CooJwnCdEm/FLqFAHuuWZdgO3l4ltSfKYVN3wkiUYyjAq9ibFvkhEAGCELqIZoQNbQTy
         ikncaAQjyAV3RTaa6niMKW4drOo7itMm7k2w7/re4qN2QDQlNo68M+P/VfUrsB1V9351
         5yUQ==
X-Forwarded-Encrypted: i=1; AKwUvByYuTumLUxX8saoDOglNao4TkNH+PfvqktkZ5oAqtt6EhDPGBY01TRDsUgNY86iS0GVk8N0@lists.linux.dev
X-Gm-Message-State: AFuF++kR1wiRtXCFBC0ZuJnYoPBFEV99xhDVjMN95e1Ote6tq3xt6iES
	MjmIG/MdHkbkJTEZg+GXEg/RlZTj0w2dzox5/LzOrOGwTt1UJCUyVandQOorEwamQwRcTj5w7/x
	Cy9hy2N/FBbKKNFQvYuwd0eNndMVCHOxSQHYddyf7
X-Gm-Gg: AYBFou0Y+Gl3kTksiMFLpDotlY8ojIf8mVmLoa46SjNP0tWCHTxSUHXqFklA3qLd9vX
	narwEXlHhofCVoe/+Gnfk0DBih3rPuhpZOuKOMrDuURIbMWGlol94pxFjTtvI0a9P9/RkJNlkn/
	6vk3M2dJS3aNhKQS9KbLnEjhnhqKkc6lNzzRkLJhRZTaa428OKk86yvFcj+zADrqXlp31Nuofn/
	UJWUN+VWBLO03MVjQkQQPuNdirRXyUC5wkBtiwzUkcBRxzPmYYIBoPCuF3bQCzy6Xq3IFYXhHxU
	nuzELGC3ujsfRerk1osagCymvNz+UaEwPYCTzgQPefOBfgjQ2O5BdgqFoQp3ve9xDhp4rc27492
	akphJ5aToPTMuzWn48fIlF/04621dnVkEwZZr4xY622PojllEocVZADY=
X-Received: by 2002:a05:6000:4817:b0:484:40b0:ef30 with SMTP id
 ffacd0b85a97d-48488deded3mr13204952f8f.6.1788369035314; Wed, 02 Sep 2026
 10:10:35 -0700 (PDT)
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
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com> <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
 <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com> <aphSYUS7xGJjj2gT@SMW015318>
In-Reply-To: <aphSYUS7xGJjj2gT@SMW015318>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Sep 2026 10:10:23 -0700
X-Gm-Features: AcwNN1XAESqNH6wBokuk-x9G05tfeqXIGUNdG4bw9ZYytsqReJ2H5J3a05HeJ1A
Message-ID: <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Frank Li <Frank.li@oss.nxp.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 9:44=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> Nick Desaulniers:
>
>         Is this patch good to pickup?

Yes.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

It does depend on
https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-b2=
7015390901@kernel.org/
though, so you might need to coordinate your PRs to Linus with Nathan.
Nathan, is https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-er=
ror-v1-1-b27015390901@kernel.org/
going via kbuild tree or what?

--=20
Thanks,
~Nick Desaulniers
