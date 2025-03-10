Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A841F875A
	for <llvm@lists.linux.dev>; Mon, 10 Mar 2025 23:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741647858; cv=none; b=q8DlmK6QIueRzvp3aQO4CNKmuN0x2wKBXDQwWBW4RlQXFLScBabiBTxlIu4yoztH5aDLeVwuf4ZkqXVt0hmqObk1hKC+B8Aw/S2mQmRs1PwjhktB0pOiZn0sTvwxW1UVh3Dypy0JXCjc3/MogtjnC53QcX1jQwSMF7LOddfY84E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741647858; c=relaxed/simple;
	bh=Zdfhh0ipuN8MCu+L9MfsZd22Ig8nwfFBb83EjH5gd20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmGik4XulpdqjcxHk6c/A9FXKEBX5993zzH9ZVipV22V7iEyqEPfglQ5/Mo65T4sk2JK8aPxZlhIDY4xxsXgV+87dVEDGT61O+OobG+cVZ2glX0R8NiFOrwvCafAajC/Ma8kAXDf9MDp18hSpGV+F+TGlxXk0jChg2POzDxexNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WW4XIIDt; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WW4XIIDt"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff5f2c5924so1354252a91.2
        for <llvm@lists.linux.dev>; Mon, 10 Mar 2025 16:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741647855; x=1742252655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdfhh0ipuN8MCu+L9MfsZd22Ig8nwfFBb83EjH5gd20=;
        b=WW4XIIDtixPn51QLo0tWnD3pp7JoZu5hXlPZMB1SfCSZjkXtOTBpH2w0u/iJcoAWAL
         Q20ppkFMBmb4VbTiwyCpRNubil+ER2BoIniL0Kt23hc4vcterI/zJsGl1Tlf3gXJJZ9F
         cs3JNMt5CZqb+1rEMKyjv86B3bQlENfeHWbgWBBHpiZte681tHnHBF8IUG4X23CbjyAs
         avXRyYkAHLmu6ciK8KP8dc0iVNjqEUs7hoPjXTdOaQW/CA7Uwdrmc38d8hCRItrq2nKk
         usS4hZ5o7ZoABMWw5kG/zxV8VeHx24oDZGhTPoppsFCfsi57YriN4aTLEBo9syJ/75hC
         aEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741647855; x=1742252655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdfhh0ipuN8MCu+L9MfsZd22Ig8nwfFBb83EjH5gd20=;
        b=ut4RSNaKgvcfsUX2Ck+zO2Ms0RxBR+L7NVRZEZ80PVt+5ODqXE6WwX6UIkNbBm9+9L
         Z3PJCa1c/T7VCXHRA3SP9zlDaWsUzNT6JNbhyOCnJva2LWeAE9Zv//xQ0z5ncZ82zOiZ
         2ixsAKl8ZevDDpLQ9zvs+cM0HZiWFp0KrclaH6aUPvC6GiMfcQPoVW4zfU/ODjR2481A
         zXxu/PDwPNTWoABSGphdHeei8GuUEo3H1num+niU9ipQkpYRsm8W8vcVIGuQrEIfM7WU
         kcOm3LaMOia4qBCsxeb7Em4OXqlIDAl9enIzK8mk+WdOjMpd6uYVnz4P2Pp5GPrtzJH1
         O9pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOFfW9Vf71d2BnZPr/ejWE4qhUbPdH69qXCatGdybzGLO4i/dtmTKcF/XBw9nDi+BNrX7G@lists.linux.dev
X-Gm-Message-State: AOJu0YxM0thxbOzsDj7JKSNUmXkGDrsEaiF0U7xPRWgeUmVPEa2Vtbs9
	KC6u56SkS+RDAvnyM6J9nLAyFpCrUFs3HGxTRKljMZr3ZfYehHBYIEHmjSnhZWcDmNxOKLC20pl
	WnEZyCDAZ+qgO7ANJpUG7m7XqMRo=
X-Gm-Gg: ASbGncvlrDbGqsU3g6M2B1xRv4WeXxSAf6Nrxqfbo10Y9oTe2j7Jt9HGpnRISeM4IKh
	SxWMQw0Gi2Ho5BQVlp7xzsY+ugomsPLM9xXplgATnu2Xrncsv+aMMQZaSiMOtgb3jpOoOF3cWxN
	hgdIosQ5gyBQNPjjdpGcsUq7PnqQ==
X-Google-Smtp-Source: AGHT+IH6T8fdGIzDXC4W4TJjk1AVx/xQcuVgZrI0OMlDI+CxP0UiXAkP8MlnNFwcdqOhyukWA7xsEQmiPq3/ophLU1U=
X-Received: by 2002:a17:90b:1c8d:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-300ff37b586mr756039a91.0.1741647855338; Mon, 10 Mar 2025
 16:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250310214244.work.194-kees@kernel.org>
In-Reply-To: <20250310214244.work.194-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Mar 2025 00:04:02 +0100
X-Gm-Features: AQ5f1JpZqJCnF45H_65NrQFI7MtNuIN6z8BNK855RsbyJrPe9EJztgfm--UbPaE
Message-ID: <CANiq72=n97YAJEMtgQFJbRP=Mt-SqznX0xcqxxXeeiXCPTqpoA@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: Introduce __nonstring_array
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marco Elver <elver@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Hao Luo <haoluo@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Johannes Weiner <hannes@cmpxchg.org>, 
	linux-acpi@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Yafang Shao <laoar.shao@gmail.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Tony Ambardar <tony.ambardar@gmail.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	Tejun Heo <tj@kernel.org>, Yoann Congal <yoann.congal@smile.fr>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Jens Axboe <axboe@kernel.dk>, 
	Chen Ridong <chenridong@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jann Horn <jannh@google.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 10:42=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> GCC has expanded support of the "nonstring" attribute so that it can be
> applied to arrays of character arrays[1], which is needed to identify
> correct static initialization of those kinds of objects. Since this was
> not supported prior to GCC 15, we need to distinguish the usage of Linux'=
s
> existing __nonstring macro for the attribute for non-multi-dimensional
> char arrays. Until GCC 15 is the minimum version, use __nonstring_array t=
o
> mark arrays of non-string character arrays. (Regular non-string character
> arrays can continue to use __nonstring.)

Sounds reasonable. So this means that, when the GCC minimum goes over
15 in some years, we can both remove it and move it to
`compiler_attributes.h`, right?

Perhaps we should mention part of this commit message (or the sentence
above) in the comment to clarify (it will also help to clarify what
that "only supported since GCC >=3D 15" means).

If you are going to use it in a series that has a use case:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
