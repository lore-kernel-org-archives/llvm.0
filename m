Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37572DC761
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 03:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745984277; cv=none; b=d01PjZlpju8ribJupg7P0PBp+HEKu3BbK4ykKtAxqq/8x4xcgnGeQogP2NOrgdzedpTbvIgE0LkqA/FYcyjsi6f2uauht/bvdOmi3sNcmzIUqi2voWnnOofqqnbzRJMWiGMEJZlyTQdvukt4cBbMucTelYBmBUetNvxhp3XqdR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745984277; c=relaxed/simple;
	bh=nFGGmJ5/n03v9z1/QgjnpQmz8tz7KZGnHiZq3aSa61o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GrfNWglOVMDIomundDeNtLFwr7eo5a6sLvsQ6LEbw+RNaiDOiJyHuy72aUJhJUf2fSDkeaBHjDhVy+ErzGM9+Y5dz3uIiOZFTHylJGDeaJ5OT6SxJmwaY2+j/Y3eIPS1U4dylfQQJxf5vzb1dgDyUKv/Rzi28SGAXFyn3V3emdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkIduYAa; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkIduYAa"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b078bb16607so742770a12.2
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 20:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745984275; x=1746589075; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFGGmJ5/n03v9z1/QgjnpQmz8tz7KZGnHiZq3aSa61o=;
        b=dkIduYAaFV2mcLKYiVswDf2HkW01TfT28LecmkZ5+BR2FdNPOf0IYEAlrXJ49L0OMi
         sLcxJzg4C8lTuvyMqIXaaqcwfEfqOtKHKkYSn6UdRZuvYoPtWRDErPGX4A2GZ9iFlom2
         M+esEWC+V86Mhe2inWx89/ZDfU0yaWbzI5jnsoe2kv4yfFktIgUo7tu0cH+7t+KvM5Mm
         2Tq/yQN9JpOtbE71xO267r/adY7t5ck0ELzE9Jxn/d8w60Xpd0MwNsTDERYdp/hI5U40
         4Vb7McZ0w0eZ4PXahr6LIZRijH8U4rXZmF0b/XGSxPzopiZOt0qKIgJQ+HpK05XKicmt
         DZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745984275; x=1746589075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFGGmJ5/n03v9z1/QgjnpQmz8tz7KZGnHiZq3aSa61o=;
        b=wWiLcAOMKUCJCIjR0P6wVV8m2RPKyFzfLlY/8cRNqsqNOmPhfaFHUNnZE4makmYWVn
         maLb3R0LwykluwTLAGuQqBkgWN++4nnKcc9hzfCUZ8JvWB79Syc8EvaHu7o+hZgudqPD
         grsVLCEgY+mgG3QdAFew5Dlg6BMsF5na1ywwUvK3XmQ+mPJ4MTOTv1+Q9plts58aB4h7
         83hfWYXZtCTR6qWiouCW+w6nbT+9GSwcLtJj2XpKo6GS4RQDm2483tsXU4U6oIlPqt51
         d8rG6cAJ/dbiM4ScTSgUt+sKzelL4eIVVf/aJ/Q0rmrmJknuvHTXHXEDKatNxgt3qsNg
         BDIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfPp5VptaXg8G9dU4/ukUpLzYrbye7c97c02wmoK+6DOj9zYsDFXwFoKfTMqzMsYIFFnVX@lists.linux.dev
X-Gm-Message-State: AOJu0YxNnuCl8Cla6uUVJoZl96aizmGISIfgey4AUcoJVpChcm2JLTre
	u1cSs52zrvC2OcssccJ8nnkxjC+QmgRK/Hczqj3nOUNUFcYwwp8NKcymEVMne74hPZF1dRrgf7B
	z0DzLvekOoVcQ9E1q4WN4MsL7YGM=
X-Gm-Gg: ASbGncvPb7ZGP8Ghh3/oNrDEGLGcUBSzuLXVTz31ESudjRTRL7sdoY1mNTuLnh0/MpV
	CLfAfiZ+Sx6tj++7MbNhnbuRPGrR88rsrUD1OMdWBXlBZky+g8xKJoacNurr0NqHPQxEPyZiPtM
	/kIAwY34XFfvbFjIKt0m813w==
X-Google-Smtp-Source: AGHT+IGeL4q3Sdp0CYP9/FmEFq3Sy3JI7KbV2ri0jrVCotH/QaRkIFoag3MCddg/nXXdBUd3LyaNFbeyeJgjrqZdu9s=
X-Received: by 2002:a17:90b:1e05:b0:306:b593:4551 with SMTP id
 98e67ed59e1d1-30a34a96d45mr481543a91.6.1745984274894; Tue, 29 Apr 2025
 20:37:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430004128.474388-1-irogers@google.com> <20250430004128.474388-2-irogers@google.com>
In-Reply-To: <20250430004128.474388-2-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Apr 2025 05:37:42 +0200
X-Gm-Features: ATxdqUGa7WM7kfr9cHYmn3SM4PPOkRBfwRxxJYsjswOMOQKEEXrxM_mPUUtmvvg
Message-ID: <CANiq72ksEJdnT86V42hoNVfB7OpmaouD+eBQwpRJR899nPsttA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] perf demangle-rust: Add rustc-demangle C demangler
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
	llvm@lists.linux.dev, Daniel Xu <dxu@dxuuu.xyz>, 
	Ariel Ben-Yehuda <ariel.byd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 2:41=E2=80=AFAM Ian Rogers <irogers@google.com> wro=
te:
>
> Imported at commit 80e40f57d99f ("add comment about finding latest
> version of code") from:
> https://github.com/rust-lang/rustc-demangle/blob/main/crates/native-c/src=
/demangle.c
> https://github.com/rust-lang/rustc-demangle/blob/main/crates/native-c/inc=
lude/demangle.h
>
> There is discussion of this issue motivating the import in:
> https://github.com/rust-lang/rust/issues/60705
> https://lore.kernel.org/lkml/20250129193037.573431-1-irogers@google.com/
>
> The SPDX lines reflect the dual license Apache-2 or MIT in:
> https://github.com/rust-lang/rustc-demangle/blob/main/README.md
> Following Migual Ojeda's suggestion comments were added on copyright
> and keeping the code in sync with upstream.

Thanks! I doubled-checked that the files added here are essentially
equal to upstream, modulo trailing whitespace cleanups, the header
addition and the change to the include name, so:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

(Typo on "Migual", but I don't mind it -- it sounds like "M-equal" :)

Cheers,
Miguel
