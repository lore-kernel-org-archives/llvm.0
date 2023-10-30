Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D94D288
	for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g/q/WNZf"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32d834ec222so2929826f8f.0
        for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698680506; x=1699285306; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAwWZrPXTo4EZTkQWQtAX6T0c+ZYFM39OKbb39PnU6g=;
        b=g/q/WNZffviIVRS3PnLrNUtY4t6aI91ohgyiIxE6lQfF9LCIQ65z6BYAFZHesXTWIG
         lC3OvqDpBavuYeDay6zDVBlYEwlExzjHR0Uxri5bTsfPbs2LleLXf19Odsf09R7U1l2e
         WuxK/2h5emeEykO3kEZWxVBfUVCZO7mxRoRL+jhbhjNQTZ1JqylbMTt/OCGpm5/Eijch
         8lrk//5yHsPn5qyxMkw+8Ofb5J6benWXCLpXnX/poamFLfIe4Heoujo0q6/YbGvmiMNg
         ie4pT57etI/f6pvH3pkxul03iFPYFxoDmscIWaWCACBob+wjBG0CGHQ81hQtTrR7XymE
         eCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698680506; x=1699285306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAwWZrPXTo4EZTkQWQtAX6T0c+ZYFM39OKbb39PnU6g=;
        b=hWOHLRTBi3R7Ht3+/ulR+5Xp5ITVi9GwYNcu9QuQVYVDnbj1Npy8loe1D64rUn5VjW
         53hqWepIz+qONUsy52vBuyUevFXRdhXOkvO/YIZ9BpqGw+zhorugsnTKwaOOfH5hgnOr
         ys5Y+cnxah4Qy1NEEppSbJ+rBD1lfIgMdCXQrwc2vznOUTQKWRM9Y25nPjwR2iJOWK/6
         WUuoPO4Rr7uDNKGpmNbDaIETyelvYn3d/2vkE4jt21A9fdgdfGvOIhx+9wr33k6Of/T4
         DVGRgkIGxD4rZBrCv3/B6aM2Oaw0dTs2Vrgr2Pz/b+Pd9nKYsMJpDAiup5OrGDv9m3H0
         2FvQ==
X-Gm-Message-State: AOJu0YzB3JiD1EEQ423XigMKqyMlZBp+XaGcouUkMzm78QqVau754Bwq
	mXh1eV/kO7+Rke1l97tq60VIuZdfEruHvCkwDq4EeA==
X-Google-Smtp-Source: AGHT+IF4ePvkyfvR3irY3gtCqD1EEUCh3daNuP9B7Ec5czxUWvfMEP6r1CnVTOhrza4Ot4bylniO0Aieo1UFdXM9+XI=
X-Received: by 2002:adf:d1e8:0:b0:32f:7d50:267e with SMTP id
 g8-20020adfd1e8000000b0032f7d50267emr5277665wrd.9.1698680505655; Mon, 30 Oct
 2023 08:41:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1c90b45a-f35b-48ea-972d-019b0004a91c@linux.ibm.com>
In-Reply-To: <1c90b45a-f35b-48ea-972d-019b0004a91c@linux.ibm.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 30 Oct 2023 08:41:34 -0700
Message-ID: <CAKwvOdka7ZXn6Zj-jh_0igFH0ru=g-18t5p-NC0gXxEUdsOqOQ@mail.gmail.com>
Subject: Re: Prototype Assembly support for Clangd
To: Benjamin Gray <bgray@linux.ibm.com>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 29, 2023 at 7:10=E2=80=AFPM Benjamin Gray <bgray@linux.ibm.com>=
 wrote:
>
> A while ago I mentioned working on adding Assembly support to Clangd. I
> finally got some time to iron out the obvious bugs, and have announced
> it here as a discussion.
>
> https://github.com/clangd/clangd/discussions/1805
>
> (direct repo link https://github.com/BenjaminGrayNp1/llvm-project)
>
> It's of particular interest to kernel developers I imagine, given the
> large amount of Assembly using preprocessor macros.
>
> I probably won't add any more features for now, unless there's interest
> in adapting it up for upstream. I will try to keep this fork
> synchronized with upstream though, so I'll fix merge issues as much as
> possible.

Neat! Yes, sorry I saw your first post and got distracted before I could re=
ply.

I just recently started using clangd in vim via lunarvim.  So far,
I've been somewhat happy with it.  Still need to work on
lexing/parsing speed to make it smoother.

Can you tell us a little more about your use case?
--=20
Thanks,
~Nick Desaulniers
