Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99A61B87D9
	for <llvm@lists.linux.dev>; Mon,  5 May 2025 05:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746424773; cv=none; b=U7rUoFHwH1e8PFktaAmBd+U1WbnJ1UZ/fX9q8bv0+oowb4GvI/elPWaLI8wNCR0gW4xIGZbIncmtqJIybT3Db6wQiRgUv39zmiwJ1Odfbj99YNwZ47tU8nkp6bI8oJOP/Cr0nH8lS95BeDrG0NBzpjewJTJLAH/6P9gRC/IEcG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746424773; c=relaxed/simple;
	bh=dKbHiB4RZA41z9Ie8R/mefcD/M19yRwwyT/XOpBK3WM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ro6zlcbW/QOXS8JLOrbVV4rvhpndfehPTt+1CBGbOFGCNK2y3Dfl2NA0jLdXIkT7qttl57N7ZkLj7f7gKDAZig56hHKplJTwEnkcoNGJZcvypiCaTjWHX+K7fPE4WyWucmbGWrr/VDNvmtMNEr4GOHDyhUXVcYeTg+qnyAQ70kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QPEUXRzg; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QPEUXRzg"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so33502891fa.1
        for <llvm@lists.linux.dev>; Sun, 04 May 2025 22:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746424769; x=1747029569; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKbHiB4RZA41z9Ie8R/mefcD/M19yRwwyT/XOpBK3WM=;
        b=QPEUXRzgSSnTy2HewQvWpiLpwCziL/JWwS3tcKfjSOX2atkVK42YDduCbaS+qQ44fB
         Iw/DB0Uq2782WMEcS9Fk6gVrmDZOT/F/sHyngLSLGZnfd/8OQ0gRv4h7P9kMlljT4GoS
         qkhKD3HJ7mOttEEyhteWLoNUdTse8jqupWREGO+LGS3fQdrOYe0+Otg4T0P8rSxs1h+/
         5pebvG3N5dwfR1ngdhhjU3MgFWkzE0Je3oJcw3lwWzmZ21XDc6STM/c2F4B0kPKr2viI
         zoEoPM96MHq8b2TbPwcJuH4KAV1Z1o+HqN7vb+iusBO1hJnmOhfWNnLa/WiZ/tSytcqy
         pwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746424769; x=1747029569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKbHiB4RZA41z9Ie8R/mefcD/M19yRwwyT/XOpBK3WM=;
        b=M576+zYoEVasAbnAICw4jrimLxXVLgJYxu8bxxaigOV45Dyqk0EQhrUlh3KtXUwxjk
         5kmJ+Z2cD2zYgNGgcswKWjXauXDfzxG80OY+d+DYX0rJy5VcEZfGcCODZ8yggX/itTSu
         EKxwnSDK/ycTm5kd786i24PZ3sVFaTnmTYQIGJ7riYzZBC9QjI2aptOVeZ++8pRUbGYj
         XuOLFb95+lFTzjP+WeGw/h6AAVO+38mtIgYpaGTfXSLxTOpmCfLlLWxuuZ5RYOBB63VZ
         wsmoknTKZx62WNcN0FSt8LEqktYcopABIGcmZCViA/8rZYAL+LrE0hplV0eg9Liohtct
         kO+w==
X-Forwarded-Encrypted: i=1; AJvYcCV+cFCkEteEL116cc1pQVyOb20xYaF1VWLaCX7q5DGmzP+lZq9rKRUxQquJLSBnICX4zpbq@lists.linux.dev
X-Gm-Message-State: AOJu0YxS9j9EVq+dEH6GyyDzPHEq+UC3NdlaWl2EXMfMJqSThdVI9EeI
	TikDyjxdb6PyBXjKC7d1qRJ1FnD6rgRPFr31b5BMu31liivkzE6MjzsacBUTWNyJ9DDW3LY84hY
	lv9H2kNpwWUhcV6PcEZfiK4u8m8F7O53DpdNp
X-Gm-Gg: ASbGncvjO854PE2YIqUzwS3Q8Ib84zVo8wLrMizn6gfDJpFGdlHA3zufouvNk7rFE2X
	Hi3oTROOMk8r2jwIDFeXHcUn2UQFtTBhWi1jsAPYeofVfj2ugqRh8NGNpvHt4D2GFvnSod472nR
	Q0VIip1MvNt43r2RTVRX4sNN8qFkQNT3pErOL28pm6Bh/Yt1wryYpEgQ==
X-Google-Smtp-Source: AGHT+IFD2StGXXU4LRBTieMiBl1477i7opw2k6zaQzZpZT7Xzqji9FSBQHuj++vQYVldHnNlC03ywPxgJw7rDH3n0w8=
X-Received: by 2002:a2e:a585:0:b0:30c:12b8:fb8a with SMTP id
 38308e7fff4ca-3233ebe48fdmr15610161fa.0.1746424768540; Sun, 04 May 2025
 22:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
 <CANp29Y41LKZg-kSP+j5hjUKMNeWnPsVd8VvDnOpN8+4WHHjEgQ@mail.gmail.com> <CANiq72m7GAZ4gfgiU5bXSb86R3-UMG2vsvi5J1Ua1EpVV5EdAQ@mail.gmail.com>
In-Reply-To: <CANiq72m7GAZ4gfgiU5bXSb86R3-UMG2vsvi5J1Ua1EpVV5EdAQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 5 May 2025 07:59:17 +0200
X-Gm-Features: ATxdqUE_jDd0HC0IONKRAtQ24jV76OHs3LwnQnbNgHzz6cgeJxyFcYPBg_mcEL4
Message-ID: <CACT4Y+Yavh4GkocO01GSP+0hWXZNVBEaD4-9W2V452Z5+C+kZA@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: rust: add flags for KCOV with Rust
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Aleksandr Nogikh <nogikh@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2 May 2025 at 15:47, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, May 2, 2025 at 2:36=E2=80=AFPM Aleksandr Nogikh <nogikh@google.co=
m> wrote:
> >
> > Thanks for incorporating the core.o change!
> > I've tested the v2 patch on my local setup and it works well.
> >
> > Tested-by: Aleksandr Nogikh <nogikh@google.com>
>
> Thanks for testing, very much appreciated.
>
> Dmitry/Andrey: I guess you may want this to go through your tree
> (although I don't see a `M:` there), but if not, please let me know:

KCOV does not have its own tree, it's merged via MM tree with MM
maintainers effectively serving as final accepting maintainers.
