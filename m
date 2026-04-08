Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DCD3A6F04
	for <llvm@lists.linux.dev>; Wed,  8 Apr 2026 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637670; cv=pass; b=TqYnAbCj/aCUbDXT0YIhzFP3sBCnGfvjXhpsXlElPgZTU9rVANCNS7SUSG0dR/lBN1yQHdUqqdOMSgqSDGnmluUBSarflYQepFBpF2YxGWUiOZC+Cmx+99OxVcc9ruthKtvEhYn9c7Hqoy7nlS6igU6IDEQnC7Vr93HJh8Ni9cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637670; c=relaxed/simple;
	bh=ds2d105585T/Lxee2FL3vcHPKCIjYRWRnrmiikWWZjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rA7cKsTiTHSBT/t5p6vEovQa5FB6yPzfB0+DbaP5URdfXSBCFu8l9WNQh/hbEopfw71gBEJ0fJLL3krbb3Ei7MOcJpnGkpWkuuGjgxaDUipXJdJBin2LVzd71o8R08M2Enint9BYk09lrwmaaLbJzwKlSA5nFzBnC5PUBGjikqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BejBTLpM; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BejBTLpM"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c7e5f38a69so489521eec.1
        for <llvm@lists.linux.dev>; Wed, 08 Apr 2026 01:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775637669; cv=none;
        d=google.com; s=arc-20240605;
        b=fdL5ruYkyNGdJo6NToZuT3wBgi66lWkqP8nT86oYlbJ7T0FJGII4gLFX6cygnn1zhl
         VrCnJBnA4t1FhgIiwSMF0jr+OMsOHgHDq7klfNL2rAY4f0/1hZYw995zmxhDzMcenTDt
         JT4/CdePnVh7BC3E91y4QHtUXlXK3FvIvZayb/JUn9yXrIXj0mmzcJ3a4vvhMzpRxx+q
         83PiuiKYS2+n02LiYHIbTEjdHj+0gHyZ01lf+ofYDKpsE8ZxGMzDqBaDH7eC9z3Wr8yn
         d/Kco4/WK5SWzYiWjw3/a8WDI7GqvYPRoEDHwuHGSDk8sOBuwH+V/ISIWooZTRdAF00+
         36tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ds2d105585T/Lxee2FL3vcHPKCIjYRWRnrmiikWWZjc=;
        fh=lF7hde1cgOUSgdLuhXZxyrmcEUl6505UVEFGaf9Y9SQ=;
        b=E+gR94IjZs29OE5KhbNAz41yjlQhNafXrqpHQYoRETXBdqAph5mQpKWi+hz+z2wnG9
         2wm6XX1IsVgZxUd4ytero+0NOjllEMiZc5g8/xppCAOShM+sfACg/roc//Rk8UGjw98x
         NNP81cj+3p1WFrPpPW00EfkJM9UG9DXVXBOmzUqXY5qiGzt9UBBm40WXTmsrhBnqAXjK
         1IdNTKBxQiIk1W8rTh/e2w3SlPeCVdYiemIKjUIdiVo1cepQ+rFBfmvlM30djXygfi4n
         23Pg6urOMhinGoDY+SSVeOgS1s4HwkXMJzQPCnp6Y6nfakd7yY94kQZAd263he3wyYXK
         nk0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775637669; x=1776242469; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds2d105585T/Lxee2FL3vcHPKCIjYRWRnrmiikWWZjc=;
        b=BejBTLpMAqtLwSJJ/tiudIde1gbVCxRZAYg1ChGZsp46cn6fm/N2EEVdHTt2hhs8xw
         omonhlmCvWToNuvesOej+pk0vhnGg3N+aITtRG/Ns33R6Kq+WMzdOXzTOUB/Bqkbrze6
         Egu7sZDH8UkbGf3v1bVz1i3G5zVi/hVUQymq8mo5o34C5oMIMpH9QIpNJia4K2cfCsGj
         6xY1gZFXcKPomv66/zE7eGplOrFh+Wf4rHiBY4i9qJ2uMzchFPhwCj5pwc2Ka77QDrii
         G+hNGlf3pGyoQj6DdrXRN3MC6I1D3C9X4DSRGV51wJcbuTTdYKXP3XnSV4dJQ+/mmHyD
         OpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775637669; x=1776242469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ds2d105585T/Lxee2FL3vcHPKCIjYRWRnrmiikWWZjc=;
        b=kEiEg5gozRlWzFauPwdKG45hwx/26ZpdX00sxtmcPGqj78/V0xeRMYzX/uryjr3QgV
         LWZNfQNoKJ1YbRTrjiAhCSkGI/XMovEnTqAt/h1XtPNvNLwwyNNKv8KDEKE8DDAhlZhb
         YrvvU5zf/jX+WE1lU8WJ9UhypVOSZouefcKAf3VvXvU3uovYjOy7MYLLDW7z6ZMFYReJ
         AHyyxn60Kz/+P/5llfYzPHEj1oy0g1Awpb3id30YjnlDnFk5l0VecV/RrEQ4FQ7mZObD
         5IitJo4/XEzzQC91kwuEDG3H1vmBv0KDb+8rM4YguQOZn2rxgLa4GPb3qtkWO2h3czyd
         Ltag==
X-Forwarded-Encrypted: i=1; AJvYcCVXMNkS8/S65AB7PZCg798I/cj70EWWj/h4JfitKdKmkHNxXCyH9Jh390mBANSO9Ype2MsZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+hphaJOnRRf3fnR6lgkFi7U2vm5XQSu7pBYMTPQS2CGMpg3qE
	g4Z/jLfiXWGGClf8EQzZorLxvw03nV2hcfmf6T0dbustE8iu4ON0xgyTxv1ij1F2v6rsI3h+Hrb
	yvyq3Bh4AQk6L5CMmxRpB6AN/N7DFHZ8=
X-Gm-Gg: AeBDievUcPOJDGpLUrDOOXLA+g03uB0vLdIR6KGhXtJZ0URSEKEjn80SHlk6xqQV7jQ
	Ux8tvjcUu6rlpdyo1+6HCxJ2YYHxyuqtioRF3Fzs+HcRiiGhKfdViQlDE1My1vlaubZnFyQqi8i
	BsflC27EWDV0r531cV7wpcq5RuAWzLnslR+XSuTXw+eiYeD997alLqERmOGgnzOhqaHKuY4//i8
	cuK23VLxlXMYzJBga5jiLXhVyu+ccJ2VIk4wa0Xq1tkkHkNymOusi6p5goKCskmxuSxa6aEqWGL
	YfI/xbsbn1nTFpjIIsJK8OwY9Jr1fhk4YwJt015x1rI3JvKkdg6lztVSXnwq+qmILiDty7R6WAg
	FStwSzwxf03zmunX+xXG2+rk=
X-Received: by 2002:a05:7022:4396:b0:119:e56b:46b7 with SMTP id
 a92af1059eb24-12bfb6f27dcmr3976967c88.1.1775637668815; Wed, 08 Apr 2026
 01:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com> <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com>
In-Reply-To: <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Apr 2026 10:40:55 +0200
X-Gm-Features: AQROBzBFKYcW2G2u6qwyXoEByJvTB9sw3RTtXdZetSya5QexuQ_pmSB9sEwicQ4
Message-ID: <CANiq72n2m0N6FaGaCF6J_bm99ysJxhkLLmLz8uwkgXV7riAJ9A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kasan: KASAN+RUST requires clang
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 10:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Kernel KASAN involves passing various llvm/gcc specific arguments to
> the C and Rust compiler. Since these arguments differ between llvm and
> gcc, it's not safe to mix an llvm-based rustc with a gcc build when
> kasan is enabled.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

We probably want:

Cc: stable@vger.kernel.org
Fixes: e3117404b411 ("kbuild: rust: Enable KASAN support")

Cheers,
Miguel
