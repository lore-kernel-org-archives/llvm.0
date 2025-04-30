Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C791714AC
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746024553; cv=none; b=KUNpTOzqvlV2nbBtbsyFeD04B11C76xMi+nHbrqjjwsO62nQqlQlzDcev5EvkvLzSndlvr0DIoLeZNG7PrWGRkBvzAtOgworpZBbfPczL+WJ+fcjgGVzDUgRLudgEuvWTDj/RtT82B/Ub6Y9QM4XGt0greRxJB59wUglnn6LJHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746024553; c=relaxed/simple;
	bh=CILepFcQs26AEIw+dD8dvv4PB71xYniCij3C8i7ZDkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMuupDkMsoZZFcGEiJbFywSR8Fk7G3yg0NinNaW1Ga28iLFKpIX49qZMD6MT04irE/ojSS/r6QzUJAUENCN+wauYSRthdxDgRXpFQ99XCQrR4QQDjF5YUfz949u8LSil5R1q1ZQry+mumKIAj6aqpwUtjmdiKzJovzBTqzZ8LIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sQrHvjMj; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sQrHvjMj"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d8c4222fc9so340585ab.0
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 07:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746024551; x=1746629351; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CILepFcQs26AEIw+dD8dvv4PB71xYniCij3C8i7ZDkA=;
        b=sQrHvjMjeWkCaNU6y9RG3OlU3YsOL8iSNI8TahFzHOdyUQw0K3mNpBfMogem7oTlYm
         R8h39T22usVduZpoJ0U+OeVIZoVHZr4krTXb6ejXI1XtPKUdbbo7K5HnBX9YgRFK+FOv
         10uLJNEj+Is9rGy2EsMDapNXkfNaARvjC5vGs2yxdhV8gowPtAQQiIiYMXFd1Ho+n1Ma
         JRvKqA07lWJRav2fPyTe/0QJ3/m6w8vyP+O/O5bjDpiF1xMjOPJCpSOwFXLiP0NaeiNJ
         n3WC0kyiHdCzGuMUpPBAU1pt0WxCJPbM4rOFxXXMDatkgFG1an02EBPHWSJSSKnMNTa0
         Xy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746024551; x=1746629351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CILepFcQs26AEIw+dD8dvv4PB71xYniCij3C8i7ZDkA=;
        b=afqw936aD6LdBLgQuUkY6IHj2JGldUhCYYWCNNHQTb2tg9B1yly+L8oE0FY7MgV4wJ
         ZKCe1P0vcb+4U5feLIBsyPW6Lp/s4X8ML0EZ1KAoFf49+g6PdnlDJgU/FSDhjZ4qtN2Z
         jS0YL0Vz1Ung2QlF1l2yaUVRFbioTw7Ju9iC3fZOjKbmh8lCNR1HA8HUAuUMjBhxsHq+
         Br6DkQmeGRj7aZ+tJYxvRVUzIRuPsoSEm2lRCejVpdNVY84P57WUUlyzXhwJtWNJ3RB9
         tGoKiFa+iYA25xlr6hjD93q2I9uLpNcjQXBSN9dGsPrs0slzZC0q+C36i9kR3bUXkb+Y
         +pHg==
X-Forwarded-Encrypted: i=1; AJvYcCUEnlx27137R1qIJZ3Pf+aId3IOuypyKkVVzyXHw5PIzrcjR4vFZ69HgVSQq54tOZ6FIkBv@lists.linux.dev
X-Gm-Message-State: AOJu0YynblLTK9uGAdtuICjjBYQAbe+AM8cs+gmQffTQxquumxSe7pnN
	7opJVd9PJ867JmJbZNE68F57FiwuaxzdmBtyymWd0tDyjVTZ+UFcKU1h/pmfexujhSqUXK8yVDn
	yLGenNX/Oa0nA60Yx4ZoXjhgUYvIU9ocWl97l
X-Gm-Gg: ASbGncsGqFP1KdDM48nkHEzMFLd7jPwl9VEFnElGkS7/8QRmZfM0do07QOXJYIyD6Eo
	G5ShhYJwoDZ0YfBgq4FFpOkestz5FuyrGK8vYhr2/JLoirOcnYnsrrX+Kbfn9PYVNhm6yLY75lv
	t/LNR5dHGYgZ+TrKuRgyYRGwl/CebFab3LyWejEdKuYkuRLYF7366j4YKbk7UVYA==
X-Google-Smtp-Source: AGHT+IFAizhQRm0R8dfeN7EIqhIlzC2ZQ8SocO4Qcy1Af41c6pC0dwToFD9rV8G6++v1J0pmJJOGSp1vLrB23TKj2m4=
X-Received: by 2002:a05:6e02:b4b:b0:3d9:2425:b7e8 with SMTP id
 e9e14a558f8ab-3d96756dedamr3907875ab.12.1746024550728; Wed, 30 Apr 2025
 07:49:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430004128.474388-1-irogers@google.com> <20250430004128.474388-2-irogers@google.com>
 <CANiq72ksEJdnT86V42hoNVfB7OpmaouD+eBQwpRJR899nPsttA@mail.gmail.com>
In-Reply-To: <CANiq72ksEJdnT86V42hoNVfB7OpmaouD+eBQwpRJR899nPsttA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 30 Apr 2025 07:48:59 -0700
X-Gm-Features: ATxdqUEPHqIQG3OOhkd2oFmm3FzIuozjO9Pt1ZPG0aQ7nNJqjlxAeo96AVMkx1g
Message-ID: <CAP-5=fUjC0ozuTYbHd5CkSgOurZuG9b96uiC-jdR9V1qvrtKtg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] perf demangle-rust: Add rustc-demangle C demangler
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Tue, Apr 29, 2025 at 8:37=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Apr 30, 2025 at 2:41=E2=80=AFAM Ian Rogers <irogers@google.com> w=
rote:
> >
> > Imported at commit 80e40f57d99f ("add comment about finding latest
> > version of code") from:
> > https://github.com/rust-lang/rustc-demangle/blob/main/crates/native-c/s=
rc/demangle.c
> > https://github.com/rust-lang/rustc-demangle/blob/main/crates/native-c/i=
nclude/demangle.h
> >
> > There is discussion of this issue motivating the import in:
> > https://github.com/rust-lang/rust/issues/60705
> > https://lore.kernel.org/lkml/20250129193037.573431-1-irogers@google.com=
/
> >
> > The SPDX lines reflect the dual license Apache-2 or MIT in:
> > https://github.com/rust-lang/rustc-demangle/blob/main/README.md
> > Following Migual Ojeda's suggestion comments were added on copyright
> > and keeping the code in sync with upstream.
>
> Thanks! I doubled-checked that the files added here are essentially
> equal to upstream, modulo trailing whitespace cleanups, the header
> addition and the change to the include name, so:
>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
>
> (Typo on "Migual", but I don't mind it -- it sounds like "M-equal" :)

Thanks! and sorry for the typo.

Ian

> Cheers,
> Miguel
