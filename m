Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B208120A
	for <llvm@lists.linux.dev>; Tue, 16 Apr 2024 07:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713253124; cv=none; b=IlyvPb8iwrY5TFGLkgPh1gqpiBIDY7fmrAIlOU+HdXNmx0hvL+PDFzBp2+UoIcKn7wijLkEmm+GeWFaSm4xQdhzUQeNQHqXnunzkk3fNrntTXW5OGnjJusYYmAGZjq/d39IftDz02dpvD1ufef+V8/IVTfiT7Xj0L9og+pm6psw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713253124; c=relaxed/simple;
	bh=NqGefO8e8soidiTwcSRYWr+l8cFQpMRq6xubK0sbLqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ih0GvsB/ASksodSKuOBNSl83wvkyylSGE1XuqDJT19ZIKer7FjlaI8t3Y9U7zG73ReEPJPVFofMRECoAM+2nkzc1vHY4Pt+OAd94AlM+DntJS8/xsjg8cDu8CFfv0AevgRJ4y7PKkSPniNrOG/kW84wbUnzam51QPEehmsDLnzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ALM+dbx+; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALM+dbx+"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so4723088276.0
        for <llvm@lists.linux.dev>; Tue, 16 Apr 2024 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713253122; x=1713857922; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcPwd18dOOkZ0oDZ7o9XExIAwHWdpAiHEm8tKDtHtaQ=;
        b=ALM+dbx+JYEoVAwFQC7KgmCq0RIsN4UN4d4NcEr2bC25iw1XZLjfe/9qDDqzQJViZ4
         4epHSrvgsIunHt9csAXKLsVu6OfigH7y7wpjJtEQWyqFlv5swFO2c39A5c1VWqy1+q6V
         TSPkIJNLT8Vr4otDx6GcUBxChEp4ECyyMHvCGYRVSDPULSNaDg2soZ9rx01pBwLb5SC6
         VqpsV0VDbuH/g366KEBH1RJDdx7aoHeMFCwAsZOPkeGDt4rLekeEMiHbUH3wG4alnil5
         1WriTXtU2Qs7HBRT3LqLzeJ+grpNYZ9U4djk4NlZZODHdU6M6rrKrb5UUaEOjsbITVMu
         Np6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713253122; x=1713857922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcPwd18dOOkZ0oDZ7o9XExIAwHWdpAiHEm8tKDtHtaQ=;
        b=mnrFuuP0ZR+wGN2ifehN+En8S1SXeddvZcAkOYGVEeAsEnZ91dqyUw7+YJAeGXFRMN
         YwWhK63gH/+FNAENBgvE/3MwAPYT/n17+jxr+1AdRCTmoR4FWyyS/BcAgpRQFQPLiDr/
         +8/3YCBbLxL4gICx0y3Ailst9tMe4uQ68wUyqXfG3++uZMUUcZQr9TRxKLoMRfBv+C4F
         IUq8BA3Qnovxf/Ur6CaZAaULROb5QcK5KeeQyO636sSanfLq59so3TJrt4H28wQ5jDLe
         WXkoiMmdvKTWqRCfraRg4CStxVX+O82Es21QMAPYOPzjKdoV1uoBUiGaIJJowYsOun/y
         ShQg==
X-Forwarded-Encrypted: i=1; AJvYcCXJxtocqXjmalsrXAgk7kgJbrYsWHR97HhAlzWY1eMQap2LrliyyaeOILRJFx+5FN1vA60rg+Bh/1625/t3dXIlVIuKyg==
X-Gm-Message-State: AOJu0Yz0D2B0Z2sEf2Rrn4Yred+xcDDTAF5d3rqFwPan6aueJR+nyFIj
	CV2r/SklwKHKQ6rj48g0OyAFT1K+9v8nQkWeL2qSshQIg6V5xsvvrGaw1rdGvL1kZ/uCPAMDLJb
	Hc6HtI5vhCkeIk+rB3SXNt/29MwwtMnOHF3HPxg==
X-Google-Smtp-Source: AGHT+IG08HBFVHdCCjM3GEzuroDQ45ue7dDUSO8vI7IseF040ozzZ8kaFNNas1XL6mQXZ80mAT7KwoFNodFYQCClX88=
X-Received: by 2002:a25:600b:0:b0:dd6:7c00:5cdb with SMTP id
 u11-20020a25600b000000b00dd67c005cdbmr1473649ybb.14.1713253122584; Tue, 16
 Apr 2024 00:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org>
 <20240415-arm32-cfi-v5-4-ff11093eeccc@linaro.org> <CAMj1kXGhgQD=+fJDfswSA3HbO6bEgPdpkBthD-E06YWS9gOcng@mail.gmail.com>
In-Reply-To: <CAMj1kXGhgQD=+fJDfswSA3HbO6bEgPdpkBthD-E06YWS9gOcng@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Apr 2024 09:38:31 +0200
Message-ID: <CACRpkdZoBThaAx+eRRf_z58YW7AAE+tQZsBReH6zD2SK_wBj=A@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] ARM: mm: Type-annotate all cache assembly routines
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 6:35=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:

> > -ENTRY(fa_flush_user_cache_all)
> > -       /* FALLTHROUGH */
> > +SYM_TYPED_FUNC_START(fa_flush_user_cache_all)
> > +       b       fa_flush_kern_cache_all
> > +SYM_FUNC_END(fa_flush_user_cache_all)
> > +
>
> Given that the prototypes are identical (and therefore compatible as
> far as kCFI is concerned), we might just define an alias
>
> SYM_FUNC_ALIAS(fa_flush_user_cache_all, fa_flush_kern_cache_all)
>
> rather than generate different code.

Now we are getting to the real meat of the review :)

I will comb over both annotation patches and make sure to use
SYM_FUNC_ALIAS() where applicable, it seems a good number of
sites can be simplified this way.

Yours,
Linus Walleij
