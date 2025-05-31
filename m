Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A40F1F03D4
	for <llvm@lists.linux.dev>; Sat, 31 May 2025 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748687417; cv=none; b=k3IT7QQUjK7UVyUvRgusDbmmbNOIDhXNZf2W/wN5ZtXxpbDZnjZb5mWoEjuKogcWFhfuGvvXZetIuNllLAENjjig+uE6PU98pbOe4TELQJ5/nGzs7Z8JtVgPZbDaqGESxDGyQaCBm80xTuWGBb+vl5sMXDn14yeCWp0BTvI6QJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748687417; c=relaxed/simple;
	bh=i718d8Duyh5E9uq4Nx7rsx3JGkX/J1FjKhmbX+FjY1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BM6WPS6WSX+Mpb4ojBu/5WO2LZy51lTEpNNu3PEOhBcdYuPWLz5YvRO7WxeALqyAeV9sGCb7ZgHti+aauuYorl0gCs3Hpzax5URIn4UW+jHKGmheURNaoW1n1p6BIv+9Zafl+PJmL7d+KqTfFjGhxSb2ILQw2YMgjA7tuzmcAew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqGfVoKP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqGfVoKP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2355360ea88so1360115ad.2
        for <llvm@lists.linux.dev>; Sat, 31 May 2025 03:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748687415; x=1749292215; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i718d8Duyh5E9uq4Nx7rsx3JGkX/J1FjKhmbX+FjY1s=;
        b=AqGfVoKPOmgMHyhoc8dmSop06UAwBwdkc8tgssXLNQ0qcERsSCw0gupiL080bhXZtA
         cGnlyMWEL7PDBB0VlVRe08HbefvNk5Egra58r6o+HjMs9tQBY1mZy0xFsElMilho2Vm8
         pY7PzCjZONWFjqFbVWZqF+I0ykbKBg/2WDTR25Z6sNvpfi/n2oyBWnUiiR4UxUFl032Z
         Wg82TWUt2SB9uNfJuqKtSnY424NJTI2rfmwt142HuSvLdEbqq93qm+lWW0ya7KBkm8mi
         1NwK7DLYKc4T1XhUScD4lMfJoqF6NOMgrfe7mA8iFzFNx4QE8mYfpEiJ5aZXPdLPgR2N
         o4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748687415; x=1749292215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i718d8Duyh5E9uq4Nx7rsx3JGkX/J1FjKhmbX+FjY1s=;
        b=mzN87PLeJDyqNc9yCSRLLZhxupDQsauqUBD4HI3fvHkyc4D/Yxp5m3Iep7gD2DKMmO
         A+6DLJiJ6ilr5OoZclQM8X1h7qWYuW8JvPP06OqkYHi9rQbD7NtFBFU8o0wQ8iP2ex3X
         1bbgSpny3rPN6f0z3Hon8kz8rfgkhcnChsqxONXZIYluI+NKgQLMkCkoLAC/ENU6TvR2
         m+MBfVyJt4gpDeNdUBr+vrPqXMfkZ28UGrpbBskgfogVZWcRRSbp4jCEmA/UGDbqX3N5
         MLjUIdFiv9pW6z6n8HLuJYOksemJY2ZqjAh9WvZ3cUxDjZ0o2W3T/AH02T2v381U7J3+
         o6ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWLX6N6JechprPD1RAtTusNVIrkggI8EGXIAqPjam0xnvDBKF8jIIp7hCtIUZ1ODw10GG4+@lists.linux.dev
X-Gm-Message-State: AOJu0YzOz58FTfrgRR84QQLd7DPim+XdapngTudOJuxY9Mg2K3jRh/nC
	yJfh/z28SBlY5yVaxeJyQ2WLu5Z1mnwE9k1H0ph0gbqBWLk0dEh4hx+ahIEVbntneIC+ZAwLeZO
	OGKjN1ENglg875v1rbLX5h5G+s1ID8W8=
X-Gm-Gg: ASbGncv9WWq6tsYPbv5DTph0WZhM2a6BJOoDII9Tw9NO2PEQzNcbXJxiGmO933dP4hc
	Wpx2+RlAmvTeiktDdCVZe7/3end3kWLHiWUgb04oAyD8e1xnWWoWvClXwYwBYkiqO7hTOBIXr8M
	iz2BvtH9CTtvpmQsqtxWHp9E4Gmkjk3p/o
X-Google-Smtp-Source: AGHT+IEbO1ffe0caragupEno3gENSspwEftXpgcfxBUJd5P3Ep1cAVhmqn5914m+yG1FPZmmkUM89TYSRepSPIaMPZs=
X-Received: by 2002:a17:90b:1f81:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-3124daf3e85mr3030330a91.3.1748687415466; Sat, 31 May 2025
 03:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com> <CANiq72n0EcibX3Vx95tiPEkd04DA4hjY-TJQs9YSOmHj=VZ_5g@mail.gmail.com>
 <0dfe6958-1dc8-4e36-aab8-e83a6da4d0e0@gmail.com>
In-Reply-To: <0dfe6958-1dc8-4e36-aab8-e83a6da4d0e0@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 May 2025 12:30:03 +0200
X-Gm-Features: AX0GCFs3MXHNxZq2SeqMHg0ha8grcijFpwljtPcXMw29rIeS3ZM8W8eeSAE_A58
Message-ID: <CANiq72k2DyB2dCMxSz=uE5SCuECxOHM60d1fzF3A0MsTf=aZcg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
To: Christian Schrefl <chrisi.schrefl@gmail.com>, Sky <sky@sky9.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 10:22=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Since it seems like Sky has not responded for 10 days
> is should be fine to just drop their COB & SOB.
>
> I only offered to add it since the upstream implementation
> that this is based on was entirely done by them.
>
> If you want to wait for some more time that's fine as well.

So Sky and I shared a couple emails in private a week ago, but I am
waiting on a reply. There is no rush, since this is not going into
this merge window, so it is fine.

As for the tags -- it is up to you both; just please make sure it is
fair and that the DCO is respected. You can also consider another tag
that is not a SoB, such as Inspired-by, if that is more fitting.

Thanks!

Cheers,
Miguel
