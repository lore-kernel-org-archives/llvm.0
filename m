Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A003112B2
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784497459; cv=pass; b=sdqKqxXVEDOpUChkvEUug53/rY4nFaH5CaEZnaA7BXsBqU6Y3ZE5IEIzhhtoA8yiYyirLaloAQv3/ZfkYyZclGY/SYLgT9c5EHeq77pTqTKDEx488MUuMYpfEFNbijfYd/h56j7GSXU8gtAvAlW1hf0w400pUPLA5OMsMZuCH1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784497459; c=relaxed/simple;
	bh=qsCYuckKASREOCqrWu2OiTP9uAhxU/090DtklF6jGXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fi7UkOBQMkM80d2h5qLCuS2EYuqULdn7eYCgQjQ82VEqqS52y8BvkzM9HfS0O9rx+lsDtQ3jHCqleksjmYCytFcPT5fkddE0KFt4OJ+gvQ8ueV/mRus87YTA82ZObKEO8qqf3/4bEsDw+aEl/7D6oKmrvubm4w/q+XPxCpQIfwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmfCAAbQ; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmfCAAbQ"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3997a448ecbso64891151fa.0
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784497455; cv=none;
        d=google.com; s=arc-20260327;
        b=LSwomEBgOHW/ym1R7QdU9fIblBjlrTandjFUQNprMY5lfB9LhKdY+n2LzVoNTmxCUo
         ITxbLWwyhNDIqYvI4eypcjRjHUdhNUh8TK1RS9KMx7xPRz0pgCm2outBfQj2C8Wcd56B
         ofP5Ihm+Y2LhTxv7nPxJEzBDzUrIeUurzbdawIvux5wRqfqxPlsNxnDP0M0KNJMts0YT
         zi6egC0omafb+t8ucMU9Lfq36yEtZupLmYa/dmm7aAvOjtp8omjIpfFkFZPJZooQ+RqR
         YQ4yrOjcgwZZcJg/EGvrC2BVhn8GAG+LfZdXW7hAr9s1MSvgTnb/KJa11es6PtZ6KrkJ
         9f4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfdfHA5WCA+spIZWH2utCUt8Mub2WpDVKDTvo9VEZbA=;
        fh=IitqKRdmfYo37y+2dquwLV1au4ksDPlPmW1PLUE4UIk=;
        b=JVroiIEqQmf6Z3BvrvwzN4Mr5qLn16yVTFB04WC/u6xEnv1NiCjZiTeCUcQeh6mvFE
         DTQj/NJMwBcCAltc+QDOIevwgiBvR5yIgCkZsXAnfFkdZctKuVzZ+wmc7DtEHOBdeqhg
         HVZS5ahJtN5kxh8/2ITnHj2aeBa923zPFu+lmkRsheaBnP7j5rakdas8NA/+zh4mdBy5
         +8SRE6nyPl6er2/UfxbzAHiwb76Ib4OJhUPwr9rexih9DOwc8QUE483oAbTl4x6Z+i1M
         JPa0YExygtQ5ybmF089QyRg1O3ybxCi2OnSwixJjR+wbGzSMDzc3Y34Mq5Ir2RDZ+BHg
         bprA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497455; x=1785102255; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfdfHA5WCA+spIZWH2utCUt8Mub2WpDVKDTvo9VEZbA=;
        b=bmfCAAbQn75hDC49hzHofzKk0QLfvOsljTBjc0dMmb87oFbAjOggZ757VbC8osVV3L
         gBrqTZYYHtSsiCn2GzgfrwJ0f/gJlA12+cLj3W91rsxqyWZdVnBhu8Ga7ZrpEX1ZEnPH
         rg4UOd3EjeWBhIIPlOoUZVYtcuKet72vdh221gXD6lBBCRIma78pkCOoxZT40U2W4Cqb
         BGI5fN05CvVIz+rg1CgKK6TYuC9wKvwT2sk213lCwfqQNw1O4ayxU4U/DCTVrBXDSiJ0
         ddp5vItGkn3BLdFS31L0WMrTYqF7d7/txUF7Hqq0aejMOuM/CKi9XAn3dWs/zszX0b2y
         Q07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497455; x=1785102255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfdfHA5WCA+spIZWH2utCUt8Mub2WpDVKDTvo9VEZbA=;
        b=Wx91aMxytrOjqINvNMCLvj0tEJRC61yR+csrNh/zceJ6QzIw25Rn70MkfCi6Ykaep5
         MVYB3UDf9+ZHjLmEMUwHRRZ1Ox6oW8X+Nj6KSMTXuytp+DfheCZb62PD+mMdg7k+WPQM
         9DKiXfXomiNxpc3f1oNTvy7Lc/ZsInKvb5UCyvFhawRIbLlQsT3SbyJf8AbH3EpyP4YQ
         MvHlmFbFMub3cjf9lVCQy/x5K5DvamwfkbxuDa0+WCAZQ2cZtOn35/MyEQrR7BcWq/kg
         bS3HIUtbQMi4loXLnccNWwJ+ngEQXif3GNnRVrlPA/maZToJ9xEQb+SNWLNyjhoIvTr/
         Xo/A==
X-Forwarded-Encrypted: i=1; AHgh+Rq6IlHwQ8oMGYFPYdWHff173mG4cMRijp/rdum8unNoZ+d27QszJpCuesrI5pHybvvr7N87@lists.linux.dev
X-Gm-Message-State: AOJu0YyCgK10KO9CIkhgamHDq290mtyDZgMLqUqC+75gzxsNz2+HIMrJ
	hVO6IwfYtBXqu3zMeVliQiYzScObJiuHiRlzx9jXJAkMNYT8To5AoPF4Zf+tGi5GhOA5caHpmOp
	b7VLzYuPror//4XDir1kCh4W+IK1zH0s=
X-Gm-Gg: AfdE7cljpZUNT0k5fbTrv2sPr1qb9iLDnp701IrI/uRbi9qYmWC7dX/VkUC6vsntgTa
	GNGABkcn0SBAqSce9XXu7hVUGsGkC27nmJCUju3nJHy5PtNJy498yINM8TK2bKsbdeI69wjEP3Z
	3MPDuucZijsVwKt+Pj3SOQjqXbztTTGCMs4XjI9GlLb2IrTcVmLPp1YR1fwdR9/+NF8ZAiilVHU
	WaSB21XH42TsTQc3+WiwU/IpoEAc4GhAhFB/TvLIQbXg5pGoDy9xrfhLw3F7hgSsOo6biz8Uk2o
	FFnloeDlLqot1sK4U3IcpOKl7jfIsw9w4VdLJ6dMB9dMFPSnqTrccHmrXTb/Nq/Zy/nCmtKgI9S
	K6UbCqXMS4TjAR7YAPKSxy7Q1ekjhDbpHMLjHslLdLm7oSSI5eq91ce8bMcgagwOlTSNvI7/E
X-Received: by 2002:a05:6512:66d7:20b0:5b0:1f7c:254d with SMTP id
 2adb3069b0e04-5b28f9b9f21mr1377355e87.58.1784497454636; Sun, 19 Jul 2026
 14:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509051110.1061393-1-rosenp@gmail.com> <agHu78VflprAM7Yj@redhat.com>
In-Reply-To: <agHu78VflprAM7Yj@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 19 Jul 2026 14:44:03 -0700
X-Gm-Features: AUfX_mydAb8OKQC-V9pRIVqyJYvnD-MKgJEDEArKFjqMm6JFlPXOW7FXXxffczQ
Message-ID: <CAKxU2N9Wf07ZNvVyOz=WR+8TdzxoivnAp5x3_FN5rqpU6M7maw@mail.gmail.com>
Subject: Re: [PATCH] clk: hisilicon: allow COMPILE_TEST builds
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 8:00=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
>
> On Fri, May 08, 2026 at 10:11:10PM -0700, Rosen Penev wrote:
> > The HiSilicon clock symbols already depend on ARCH_HISI or COMPILE_TEST=
,
> > but the parent clock Makefile only descends into the hisilicon director=
y
> > when ARCH_HISI is enabled.
> >
> > Add a hidden family gate selected by the HiSilicon clock and reset symb=
ols,
> > default it for ARCH_HISI, and use it for the parent Makefile descent.  =
This
> > keeps existing platform builds unchanged while allowing compile-test
> > coverage.
> >
> > Tested with:
> > make LLVM=3D1 ARCH=3Dloongarch drivers/clk/hisilicon/
> >
> > Assisted-by: Codex:GPT-5.5
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
Should I resend?
>
