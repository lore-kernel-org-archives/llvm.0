Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CE91AED3C
	for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635062; cv=none; b=i6ZovnfFTov0sTmwbwYUbf42VM0QbgdjqKPm7iuoJwSugPLl9nZP2vyUMasNtDvKgsiKGpWLGVMehqlpbLBlne9cZwwUULciJ/bW//km3WG0EgxjR9jbiql+vGKfBqOFJeLbte3ky26eIQ4f+T2Mc8qekIGelTRm7doUWOdKsNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635062; c=relaxed/simple;
	bh=InUtdB5UpKfrtYqYOgnR4uD76Y1IegLDBX2+qnakvBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acbK2ewCXEauvwPbpEXKUV8+zJOA7e8wmFhlyVxtgy/XXUzNuXCfDKgek0jrlZi/tZs8xlylMIrLdOoRK85Fu/n7zMyQfQdWp0fiATwRs7bWwfj59BmhU0E33Ml+epkmF3hPzin94TPpTYTvS+xXt3hI842D3y/eQKcsoswxbVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZHaH6cR; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZHaH6cR"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d3bc043e81so30765a91.2
        for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 04:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723635060; x=1724239860; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InUtdB5UpKfrtYqYOgnR4uD76Y1IegLDBX2+qnakvBQ=;
        b=lZHaH6cRpUazenHyyGnbvmJG2+8HA3xdnognJP8aBxNBr1I6fhbIm87mNXjJwIB+TL
         3SD8J3+cZp8g0HjjPTxzJM/ssS+RVgzMl/BeDXwQ3JKX3Y0dc/BQ+/hjbtgU0YKWjziG
         bYF+5FkynaMzhS+WLMNSmoiRWjYaW5QuNn2PSid8W4h5cNzIWzSZ6c1hnrHub1f75/lK
         kkq1Hw8rhWA5oIB465OZxMRIctxv4KBpoNKlznfp5nDYOClr5z2e6e+BMbdDX6nm5Q1+
         tEuxLRv4/FSbkLoQ4tqAh+FcNFJtmHAHoVoixtZn9Y37CQnODAfefFWmzk2lpv8GKqXW
         k2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635060; x=1724239860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InUtdB5UpKfrtYqYOgnR4uD76Y1IegLDBX2+qnakvBQ=;
        b=BnP6Y8hP/stKvXcJYe4nnfywU2lUhZU2Uvi0UFT6tEbdDaUGCoS8yxmUEBS1MHn4FW
         pgkEnGCkgS1UNMI9IzkFBy1rvDoYnKG6H+YKbSqVYy+bgF/4G2rrjBra6E4D3Wh1DBxl
         HfSn+LOFub253PnmB84U8a+bmXcXvgwrZyq0BYi6q26uMX9YxEFiztubZT9M9kjsoo5G
         /gH+fHtkupfMrqvRx1G9l/VJdmuwrVOpB6dx4RBLUIo0TF0uiYlPYSgJ7/vAfh4H4ZWY
         vbLrdAHIfSNkSFuBdEb7CcWHf0fL4Gq6UJJ7BRroXLOnrvHh99kn10nphZAddPwP30CB
         Ta8w==
X-Forwarded-Encrypted: i=1; AJvYcCX5tujSU0raqPxZi+AZyNOq5fs5XmrauE56VLl2V+Brm27JVR48u5Gobi9jgyOBI463w6F16jP8cZPL/IRRWSixyYdICw==
X-Gm-Message-State: AOJu0Yy8P/oiJugniWG1qjNegU8c2+fwX+obxzFTcXExtfQg4oFCK5bM
	mIDQ/fEPuFVYuwpBORzZ0u3+Ql8b40ZwmZyvldQ3D91/Xij011TeW9Xf1wSBxRyuZC66D90fPVw
	mgtEHLO0T8Psa5qjj9yaVzoiFNVo=
X-Google-Smtp-Source: AGHT+IGHqVVY7AZWrBMuOmVDEc8fUS5b6xT/BMfprxxksFMS7/qwt/78Na8gyK8oNQBGsC23z/3ZryBjtIb+Fxr04As=
X-Received: by 2002:a17:90b:1196:b0:2d3:b49f:acdd with SMTP id
 98e67ed59e1d1-2d3b49fbaa3mr728717a91.21.1723635060040; Wed, 14 Aug 2024
 04:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240812232910.2026387-1-mmaurer@google.com> <20240812232910.2026387-2-mmaurer@google.com>
 <CANiq72khUrha-a+59KYZgc63w-3P9=Dp_fs=+sgmV_A17q+PTA@mail.gmail.com>
In-Reply-To: <CANiq72khUrha-a+59KYZgc63w-3P9=Dp_fs=+sgmV_A17q+PTA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Aug 2024 13:30:47 +0200
Message-ID: <CANiq72mJ75ktX_n8jxALM4cVFcwm-OKVK3e6r8+-0AYbEGHk8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kbuild: rust: Define probing macros for rustc
To: Matthew Maurer <mmaurer@google.com>
Cc: dvyukov@google.com, ojeda@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, 
	samitolvanen@google.com, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 1:27=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I also had `out-dir` [1] since, if I remember correctly, `rustc` may
> create temporary files in a potentially read-only location even in
> this case.

Ah, wait, you are avoiding `try-run` -- is it because of that? I think
we should try to reuse it, even if we have to add the `TMPOUT`. Or
what is the reason for not reusing it?

Cheers,
Miguel
