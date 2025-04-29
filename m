Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110772522A0
	for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 19:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745955681; cv=none; b=i/4zVYZt/h9uMfBN4Xd9kbxhLEBXQspQD3zLE8kzNs0/XnCBqmjpP6kMOw7ifyD2WoNUuGqEAdtJ4aZzwFucz22JhPp6Ctoxfimt4aD0ylCGtUnQpq1wxYburvcwTRo88qV2fNfyGxALSounXSCcRZwJSjdQ9WCybfF5nNFYBl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745955681; c=relaxed/simple;
	bh=emoQcqlb+HW2sgPwTA9ftx2rqI7sEqj4UbrS4WjRv2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mv4eWWySFmNOR0EwZCH00jhIVO4DkH+OUMDaGMtC7sCnN0/NdXa+FTeRxzo6gxAtx2suOfVKTjZOUKc0S7Ab8NH+Me0+zDKWAApYHE1W/o8yUZ1t8BGaiys7NcWbZCPPIt2796V1okgIy8h1xOv+5ozx+YIbd1N2L65OAeJpD7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Znx89KlS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Znx89KlS"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3054e2d13a7so480137a91.2
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 12:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745955679; x=1746560479; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emoQcqlb+HW2sgPwTA9ftx2rqI7sEqj4UbrS4WjRv2c=;
        b=Znx89KlSlLn4MnZoAjOo5U7aVV8oxPcz5hoR69oKOJLMoU2w4V2ppLD2EVjsk5gjod
         EfUkjOJTROqzOxENqMUYxGYRjAtJk4FpAOB9mOY0gxlm/+0ArkHAA1HL/046sAl6RG/r
         OOe3ZSE7CvNM7F2UAJXGW7khfQ11D+R2/Pp6WyOkELCB9WYXCW7J6nh0K/dn/M5D0hKK
         FQz+w/s8Run3+TDgh/jbk4Zy0LGL/a/olURJoPaHU1m8Jf0GlHqC2G93NRicSFrkAcai
         1gtcn2C0iFdiMcGQiAts2z+0b9mWJXOpaCHNFcTp97+iZFTnVtZz2nTOVo/xXcHXaZ9F
         PlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745955679; x=1746560479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emoQcqlb+HW2sgPwTA9ftx2rqI7sEqj4UbrS4WjRv2c=;
        b=THGXrWwvAg+Qg49NijVn3go59VEl7SkJYKRPmr2mWIj09JzHvJgzmH8U+7uHTTVtIh
         FQESdhJlvE/T734R+HtJVJvU87OL2O3Tpzy+Kvb8RY4ibDhkmBUWv3c2Ci4A/ml2zNeK
         IKr7+l1uOrg2gZAf05UTJj2Q4CGEkJHhi6Jfa9Q7yBTH5tjaBarHVhay+03VhXsnXHJD
         nSLoEGY8qnWTXY6m219Ng8Rc3OlO5kgtHbErmQ2qrqvfPZVpP4OgSOnPFZGWgYRQbX85
         rPUmVkEObJdJzbpGXc+Px+hEnD2zK752I2KcP/QH6Pj4KxqT7T6eGElIgWlY+9D7hSsq
         pJBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4uNL58utgq1y+lKLpbcAHGpVAbifZ5h4C2g5hlnS3/3FGi7eIaKTr7iWBRKAQbw4kAxGB@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/6lYkFhJVWFb+OQlmgKAQb60LMqTYPtAfwZVeNXSdSDOnnP7Q
	2B0K+Vg1G3JIL+03GHtKJ9pRy77SxNc+cXtHiu0WlpFyhFbPEbnparuZemYuKUDUCPvRvGzznec
	A1ew8ZQ57RcIJBa408QyLVogggi0=
X-Gm-Gg: ASbGncvxE2e+TEKyihtZ+Y1OBgqCClw0oIH0D1gmfruwkOoSFTz2dxC7JhsydFlp8+m
	IpEHcMC7BtV7JkAVmhxzZgkNNbcwsxE4os/H6x50mw4iFZ63gCY5UHD44SeFPkkDwvdi6rt3N0d
	SVoVbjTu2nhIwFL1O+Xrohb80h2XbEXog+
X-Google-Smtp-Source: AGHT+IEsz/JWpYHIQB2ND8TAPWjryOqVEs6NcRyR9v4Xj2Udz+EeqWASFStYh1DEZBXGsTgzXSaBNResIErXGEAwKsg=
X-Received: by 2002:a17:90b:1643:b0:2ff:7b41:c3cf with SMTP id
 98e67ed59e1d1-30a333530efmr190898a91.4.1745955679171; Tue, 29 Apr 2025
 12:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250429185839.1807005-1-irogers@google.com> <20250429185839.1807005-5-irogers@google.com>
In-Reply-To: <20250429185839.1807005-5-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 21:41:07 +0200
X-Gm-Features: ATxdqUGjrsQgDER8osuejNAHo00_Sx94goMIQhOsN8FiYorxUkXhdheN2z5OT-A
Message-ID: <CANiq72kF+XFFMzFYV_O6kVK1oEaWca5iw4r6f8CU9OvSnRMzfg@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] perf test demangle-rust: Add Rust demangling test
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, James Clark <james.clark@linaro.org>, 
	Howard Chu <howardchu95@gmail.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:59=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> The test cases are listed examples in:
> https://doc.rust-lang.org/rustc/symbol-mangling/v0.html
>
> This test was previously part of a different Rust v0 demangler:
> https://lore.kernel.org/lkml/20250129193037.573431-1-irogers@google.com/

Hmm... this sounds like it comes from the previous demangler, but it
isn't in-tree, right?

I don't know if reusing those examples count as "code" or not, but
just in case: the docs (and the original RFC) seem to be under
Apache/MIT like the rest.

Thanks!

Cheers,
Miguel
