Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5E0A31
	for <llvm@lists.linux.dev>; Wed, 12 Mar 2025 01:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741744601; cv=none; b=EW2B69HiSZTbTvP9+j3DzcDW7OooD6DYME9TKXoaPJm1qIW1wswCNEkSJFDf0jApd7zMchuWVnhgaGIkGb3SbI1pCR3yNvc5Wz4r/ClGUpCEEjTlWxlbZ13K92V6xPplFZax2TsQlQpRVX1XYWD22hgudCSW6JSkgZdCN9ufhwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741744601; c=relaxed/simple;
	bh=i8z2Xb9lFxcMgAI2K80UrHzxA3FJTlfeKI/zXvLiMok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJqqzhxzq4192V58HDui+O8GTWRxdcp2rJaTgtLu2c9O4AweQsthKuuBA2EvVSBnxlg015/c7Z+GB6W8bxYyAW5vXG8OcQD02DyQ7AI3E0eSC6NBOgn8EGbkV3OvqzJv2TRVAuQ0jWIC0+kMG6oxh6e5g0G7EUwwLAnPUPLcaQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVlSb7+R; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVlSb7+R"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-301001bc6a8so385783a91.1
        for <llvm@lists.linux.dev>; Tue, 11 Mar 2025 18:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741744600; x=1742349400; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhWzg/d0ytpwp9W4Azext2ZzMQHgy1fZGnKhTFyW2CU=;
        b=FVlSb7+RVroQcA46wmuVEUq9yt/Zq9giuXFKHIZXq4mSz+ab5pRUBDKInSSlrUI3QQ
         PkBHmNrWQCrQeOmkCBOfVaf3fRUtUckFu6AWurV6DgSWoUne1Ny9XT43hA6YbTE1JT5b
         znQ4si6q16CGfQ/hf70VDYQc24BGe9jMpXdNqn7mH9UxmZnPpkJf9Ottn4hfEmtnd2VA
         ITLps51HRnj/fSKJ/TL7HB+voK9SjvpokiWx5hrk7nazMwPczaOkxTlEcWiqbg/KnTex
         XgspW8AqsmBioXZnbJHzZuJxdfq0wpDqmyKkueKYEp/DNBOJ9Vlit4mqjefE9UOHf9W1
         L1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741744600; x=1742349400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhWzg/d0ytpwp9W4Azext2ZzMQHgy1fZGnKhTFyW2CU=;
        b=mH0l3Ncm3nUOK9IIVBptysnEwsc+yfTZ38ymc6UyjekiuOswHX/4LC6kzLapg+eWox
         v+HelOdCIx0mkCwnLHSyfXx1EojZxRu2+O1q6RMWcPLEfcRLfcG8S7mxRu76CACXrQYp
         +8FPLDHrEj/wnccniR/8+6RqLu5b//oRLiR9ggTfp1ZCsn+EhSIeZfHoTvSo9suSYDoP
         nmZZYVlajIa3q0kw+iAXrABxP78+B9DJlzIq/XHymev6cFmBgC7r7+DqOZI4RzUTE3Fa
         olrbZefWClWK59dVWG6v2BY3SG9jb8GHaMLIHHWtb/QxyQnRihE5OU/QeBfDEI+miW/j
         UWRg==
X-Forwarded-Encrypted: i=1; AJvYcCXhAiSttFTfKIw6Fzh+WC8r/lNdCXLxFpDvLoLBvVtL3o/gKp10DSWf/Iz8cPsSCONAu1+y@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7K+f5lFnpA84CJnt3qE5rVAImB2jesUhBxG+LLlnBFT12sMtw
	Y/tm0VpAI5VuNCfUUZpt0rXpRT17JcGo77QLBwZM0o3j4onhp/LXSegg+YRPcwJf0NJTLkbjmVu
	R6cag+JS/ECQHL0niaW3p/a+dJms=
X-Gm-Gg: ASbGncsOYW5XI0QrtWOCGeQraP7eA4dO648nMtKve+fZruQu0BPWqjFXYEgVpZI7G4e
	4VIb48A+ZBPJlYDItdaRDgQpTObT3LWM+cx+0/dKb+LPdy3BP7QA498tSMqdyZg2hhOZmTsb2JN
	CrZ91+3ZGLEqT5G1lNt7Gdfc4IyxU+2iQktZtM
X-Google-Smtp-Source: AGHT+IH2TOWzUeGxG1/VvM5umB2zQLllV6LRmfHEFJ6bEJKnEcBXB5BqfvcaUtU8PlHUHYAax8MNb/fMhf3PDUmziAs=
X-Received: by 2002:a17:90b:1809:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-300ff380aaemr2857882a91.0.1741744599798; Tue, 11 Mar 2025
 18:56:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <010001958798b97c-4da7647e-d0bc-4f81-9132-ad24353139cb-000000@email.amazonses.com>
In-Reply-To: <010001958798b97c-4da7647e-d0bc-4f81-9132-ad24353139cb-000000@email.amazonses.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Mar 2025 02:56:26 +0100
X-Gm-Features: AQ5f1JqsRDOX4s34-mUC-bMUKfIpM7ebb8PdNYncW_1xsWSlQpvBaseM_USJnec
Message-ID: <CANiq72mV=160jejuTO8jmsOszrkbXX0UAa1dvZ0VSyKaWcLqBg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: uaccess: mark UserSliceReader methods inline
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 12:44=E2=80=AFAM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: https://github.com/Rust-for-Linux/linux/issues/1145

The Suggested-by tag is meant to explain who suggested it, rather than
duplicate the link -- please see:

    https://docs.kernel.org/process/submitting-patches.html#using-reported-=
by-tested-by-reviewed-by-suggested-by-and-fixes

(I typically also put the Link after the tag, if the link is meant to
show the original suggestion, just like the documentation requests for
the Reported-by/Closes pair)

In any case, there is no need to re-send a v3 just for this, you can
wait to see if there is any feedback.

Thanks for the patch!

Cheers,
Miguel
