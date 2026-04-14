Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FCF3E5EE5
	for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175420; cv=none; b=kbPqsrsireRHRNKaeq5uvJT2gxm9Y8Y87wYT91BuCah3wyUeCa40NRdh9eJvWdJvjWIYldyCJFy3eSWxWZ86+7NOq7dSAV1oa5Vko1PTEm9Ttn/JD4auiNHHQ13PmsLliOTHy3pTzm2GQiVYM8OYKS8ghFxfVlv9RmNNVCSBKZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175420; c=relaxed/simple;
	bh=dn7cwF6qtgGFLiqp0cvEjfsbZaGhIy7LmJ2lctcWX4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xlgk7DTLKmboWJ9aQ2srMs59qycqkT+4Y1pGLDEqS70NzdnTiQ4zO5gkOeUygPh4l7l1mzCutp2aU8vYer0tsPeE/B+J8Vf5j+3mj2Cn5HcZ/G/gLcx8Fflgt6lgiqmOhi5LTrNrkf+qrzt387UHX0A2di+0zl9GNrxeuTqjTy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVsEFisz; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVsEFisz"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6715594a4c2so2716306a12.1
        for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 07:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776175418; x=1776780218; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wAO2a8iejOd3UMUmzAscWYPPXFzcVg9pYpLVhKBtzBc=;
        b=PVsEFisz4BvCEeo9Fng6Ht8eZA9T8QDc8iGo/ImL3aWIk1i/iwv9djGS8TKI94ptGY
         RNQYIM31o4oYF8y+F1TyUuJh+5EbgKxHP9gps70dJnw+sF9bSperXQgD5rWJwBNs7gHP
         QXjfigfFy+gD26/itJKvNsKCR40piPn8R/I6biNce00fnLA0pYcAAgIazKgfqt3IxcAY
         moKcDmRhZknWuij9acapt2NIRnha92F8kLKXkxvrbNHv8zKtPL9LxOaxCP28ZXQNAGZH
         Xrm+lkoKNLL/1Y5BDN/IFQEKDUCEngPRcr2qzj2Rpycaou52ixAkyrW66zKTlYZCqoKS
         VJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175418; x=1776780218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAO2a8iejOd3UMUmzAscWYPPXFzcVg9pYpLVhKBtzBc=;
        b=i+5ou6OSW8P9fLhYrVrnMasGRoOzFvzPLqIB5c7M1CdE2QQyn1ajvX0dl7axzTl05A
         6j80HRY79gq48SD9syEsrsu39LfDTGzJ63KH2jDeUt1dscWPrhlLEauhw8cOeAb+MZWW
         LxeivElfTGa7rGTeW2JybzuhDs/Is6HHSGSBycX5EVcXPH3R0cFvJb42N/1BNgl6dOot
         nC5OHzcidgFuaeSXxJcztyBc/5P+npXi6HkqSAa1WlEzeEzfN8RnfnrVf6pwblsFnVwL
         kWeqwj6QJm3nQKXLCM7IjrSVahjE0fKyx014O+watUxp298ZQGrAmsqFbPFXaKtCaZGs
         cyUA==
X-Forwarded-Encrypted: i=1; AFNElJ+1m01cl5PiS64F6t6PMZWiqUCUoYv0WULIYHSeAT0ehOJdDu7W7+Pejsvmld6ho90aj+iX@lists.linux.dev
X-Gm-Message-State: AOJu0YzRxSE5RhTXoVoK3bU/eYprDNxAiEGJsLTmyvUYe9AByT7+uM8v
	cVJEgupxAjQhfTy8+w5zWF5Nc91bTcqMDtnKeu6AI4KcnLlPzYUzWtdQ
X-Gm-Gg: AeBDiet63msm+nxnTf1P3neRCsyxUiMFD3wBruQw+0ozhmtYXdVxNSlo9KqyzR/z/MV
	26KZ0rp6xBjmxmFE0apeSu0s7tme1x9fxOBbJMe4s5UWF8dmODlSMBopPXzrd8I/7W+1MX9zuN8
	6As+9128WfPwa9AmSfZhjjeQ/RXCmmLSjWSJcyEC3I9kIl9KXpYCzhYv+EP9Jr9YtTAd9k+K1R7
	olInHenlKRKsIji2/79eW6dQgQhLaX4wFTcEIxjdBEX8UA6U8R1itHuDTfWTio1PYEB2OzqxQG/
	SCO/xBYbRsu1wc5sr1MSgqSoTCp1SEFP0YOvS7Qn2H+0YtUa+Q3Z5PEZsmqsA2pO/+6WU1iQZTQ
	T1bJXHRZif8lWBrZB3zZ3XdtqeeYJP3X4UvE9Di9+I4BBavNrRiLue5olYXSO43dlzLh00tbsnP
	xMpKWTmeP5i8sRpUudQP4UCzKR01msBo2Rhcjf3F8q5xxixyIH4wKdO5FOPWqWiud8BmywTHnUY
	OsAslScSUPBEUJm1sbD2PJhprQ3E3KLoD924Rko/5jP46W2WZY2HNBoOpA=
X-Received: by 2002:a17:907:1ca5:b0:b9c:b3b5:bbf0 with SMTP id a640c23a62f3a-b9d724995a8mr1009594866b.6.1776175417496;
        Tue, 14 Apr 2026 07:03:37 -0700 (PDT)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-084-056-106-044.084.056.pools.vodafone-ip.de. [84.56.106.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dffcd7bsm384122866b.27.2026.04.14.07.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:03:36 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:03:32 +0200
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: WANG Rui <r@hev.cc>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, loongarch@lists.linux.dev, 
	Haiyong Sun <sunhaiyong@loongson.cn>
Subject: Re: [PATCH] perf build: Add clang and rust target flags for loongarch
Message-ID: <63jg2bzhv3udm6meehux5ssxcd5gfdksamuzhjw6cnxptztbph@wtwbe56az2vi>
References: <20260414080500.320095-1-r@hev.cc>
 <CANiq72=c2wniA2piByZNUVzSUA2YPhRPKBq7e_bBP-69Lo+wCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=c2wniA2piByZNUVzSUA2YPhRPKBq7e_bBP-69Lo+wCw@mail.gmail.com>

> On Tue, Apr 14, 2026 at 12:03:31PM +0200, Miguel Ojeda wrote:
> 
> FWIW, sounds good. I guess the commit that added the list should have
> had it to begin with? Cc Dmitrii.

Yep, it should have -- as far as I can tell perf supports loongarch in
all the other ways. Unfortunately I based my patch on
CLANG_TARGET_FLAGS, which turned out to be missing this arch as well.

Acked-by: Dmitrii Dolgov <9erthalion6@gmail.com>
