Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0A9247299
	for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745955198; cv=none; b=pAGXRhcGRQzUTFcREYjmG3Wz3cHoh+K34gjWqbDY5m8Gpock8zakHu3jxAbvKGM9x6bN10SEnvuCzMDJJ7sKkP1tTBjKGKqNM2UuE60/9dOb/QSC4jt8tVfy2abY0+DfXvgRQK7LfCZnvCY2DsZCbugizpxzgxt3iXQodX7p1sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745955198; c=relaxed/simple;
	bh=t/TaDhTEiYr8JZ9az+xPIoer1kKQ0EqLa+WBBbutaGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iqr/4DSGWAbeLkj7h7dGniwxuLzpg3DSCQiGF1v6NblbE74bhaXtNKsWz3QBzzJSpT+b5iWhcvjLLf1uX0d2tXSq7+Zl8y7stF/lMzwLo5lyM0ff9/wjWcwgbJH+DmJo2DQH8yh/MDukZlAgN7kAwh7wLIAdgK/VN/yZ8uPkeyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCZG2Xm2; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCZG2Xm2"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso510782a91.3
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 12:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745955197; x=1746559997; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+6R87BCw+XZw8t56W3vKaa9E85JmDHuUT63nFr7qjY=;
        b=fCZG2Xm2R0KI1RS+45ZvbynyyZEJMhzyffjyC26t11WkTMjftbY52nLpQapK2uIejq
         Q6wfOoHbkRhUNtHsl20EfcCIf4BVOJDgKcF8dFdsRvVNXRGIQTMJqXutJJl2mXSyd+7p
         BtizTJdpVPSryoHI7cRUXxIjqb/6jnc3r0Hlbe6vvrn7zw1hIQu/FqtHaDjNkFR2WRs9
         Itl2ZhcZhChy9m8Vc1w+kmSfwD34RB82awzBScyhVXgLTVQikQlDHqCFIownTTL7lYIe
         YoS8Ll6KHf03WzIVpATLBFgT7foqf37vH9PSIkGWI+klgJrnYCE0ouVV/ZXV0KcvGOf1
         yC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745955197; x=1746559997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+6R87BCw+XZw8t56W3vKaa9E85JmDHuUT63nFr7qjY=;
        b=csRugDMznuo5rP82AqBeOIL9EA7D3P4M/XqvKhNgvs87hyv70zugRvo05DTX9FIpQR
         wKR9hxZfZxx1P/ffXqLNu3EQVzt8rqqnn+3Cr6L9idy/61oo80D3HpfUQHmwoc94Xzdp
         awShXQ6Ie9wbyvA2VKXKeEtpVB1T28sYNDgL2FIb+Wx1/P9w8Aj6jvb3W02XBtovE/Ro
         B7hY+kL93gYpoGO3bblOmsTq8ld9UD7a7ZqZbshst5hJg+53cZT1UzXnEHZZWjbzAUpk
         5dM8ZfgETCT7TjTattWBNZ+FHO1lYYB+oPx3gFD992CIA8hmITa30WR461m8CqxtPKLE
         c98A==
X-Forwarded-Encrypted: i=1; AJvYcCUdr3pQ3+Twk6NEj+AfZjeNO/ecLVakb9A3ZYL+78DG+nbs+qEYgXh7cZSW+gi69m00hqlt@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4gkZXGrr+wZJEP7+SximgJzR1hxiZJvFnl2ehAjWJ++5BmFzL
	dpqVDxR8SJGg0bc0LMzJIwbR1KKLAwDaVrIatUIhpCyIr6tvXPKVQQXbL+3i/GHNw9LmjM2vEtu
	0hgYTFf45Zc+m1hzes9DhUonMYK8=
X-Gm-Gg: ASbGncvEOag1nGjdcmnCh2J3Lo1PPGg5gdnqpgHfkPKCaOTAQAn/e1HzK1vjiA1MEmU
	8nUYQr09CHssSfu+ZRukHscOyTzqVg6Kf01Qt7QG5WpKGMlpeR3PN7bdnna50pJNTFoOfMU1POT
	h2pZ7XfZf9umGF3b87C5UPGA==
X-Google-Smtp-Source: AGHT+IGQqF75KnMv+4bVCZkAaU+P9VRF9V2GaCglJcEOLFkIoEF/9gIcBxqPqDF/usHsH68nxd+NNiRHshS5SL0h1Xo=
X-Received: by 2002:a17:90b:3b91:b0:2ff:6bcf:5411 with SMTP id
 98e67ed59e1d1-30a332d60e6mr187967a91.1.1745955196640; Tue, 29 Apr 2025
 12:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250429185839.1807005-1-irogers@google.com> <20250429185839.1807005-2-irogers@google.com>
In-Reply-To: <20250429185839.1807005-2-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 21:33:03 +0200
X-Gm-Features: ATxdqUF8JMzltITilMhWL094El5ZtueGDzQXtv_0-w06j1KIuKQGPrNQhTePM5Q
Message-ID: <CANiq72kDkPgXS2SasysSa0MXX68kkkhYbSpvK9KAYxFbEKpLig@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] perf demangle-rust: Add rustc-demangle C demangler
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

On Tue, Apr 29, 2025 at 8:59=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Imported at 80e40f5 from:

I would suggest using the usual commit reference format:

    commit 80e40f57d99f ("add comment about finding latest version of code"=
)

> The files are renamed as perf supports multiple demanglers and so
> demangle as a name would be overloaded.
>
> The work here was done by github.com/arielb1 and I am merely importing
> it as discussed in the rust-lang issue.

Cc: Ariel Ben-Yehuda <ariel.byd@gmail.com>

> +// SPDX-License-Identifier: (Apache-2.0 OR MIT)

Hmm... The documentation is unclear, but I don't think parenthesis are
needed (the docs have examples without them and for this particular
pair we do not use them elsewhere).

> +// Code for demangling Rust symbols. This code is mostly
> +// a line-by-line translation of the Rust code in `rustc-demangle`.
> +
> +// you can find the latest version of this code in https://github.com/ru=
st-lang/rustc-demangle

Ideally, above this, i.e. before the original file starts, we could
have something like we have for other vendored code, e.g. what we
wrote elsewhere for some code from the standard library:

    //! The contents of this file come from the Rust standard library, host=
ed in
    //! the <https://github.com/rust-lang/rust> repository, licensed under
    //! "Apache-2.0 OR MIT" and adapted for kernel use. For copyright detai=
ls,
    //! see <https://github.com/rust-lang/rust/blob/master/COPYRIGHT>.

(And then below the actual file)

It wouldn't hurt to mention also something like we did for `alloc`:

    Please note that these files should be kept as close as possible to
    upstream.

I hope that helps!

Cheers,
Miguel
