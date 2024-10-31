Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AD9360
	for <llvm@lists.linux.dev>; Thu, 31 Oct 2024 00:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730335314; cv=none; b=pz023Ol8HBhSApq/RkS5JslMrbR3zDBXNyPflQHT5M/kjymsqvxkYU7EwgGc7be/tO1ni2LXNEcJjt0ExkdZbBuGUyCHxekGBtfoqfjW0V6aYJgyhImEVJiuUecPZB2pv54J8H8eRVsi5/pdfM2lDep8thA051dKGj7oqd6Buko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730335314; c=relaxed/simple;
	bh=qA1rYBoTcRGu4j/brwnbXznrXHIEbVFk3fpviSwXAOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ks5NI1NVXSaronrlXxcBbXTRcbxaEnI8WHJ2nw7vu7/Q5cJrdPSf9xG9oJvLKrVWpS1q8MmYChfuXXa67xE4CDQTmIECwyU5OtvOltwSj2UBGLWLaOFdLsXHvV4w8wKnF37r0SnRGXUTe4KW+LYjtUW+FYS6O4RJ40EipFtpb1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buzIU1QG; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buzIU1QG"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e5b1aaad96so61257a91.0
        for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 17:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730335310; x=1730940110; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA1rYBoTcRGu4j/brwnbXznrXHIEbVFk3fpviSwXAOE=;
        b=buzIU1QGMMIU+LvIx5kRfB3nhqYNT167j+Y1y+ckimPMFlgpTeoOQWJMLhOZohQfAU
         FnxuiDEGBfRmZib5qxuh6W+QJNQYq7CDVodcepOCUPl6+wcShlcSvVaMiIh/Pr7SnTdB
         qR2EtYgJAemIhTDCwJeG6a9hCPPFEz/N6v15kUJYe3XkyStNiQpLszVVc4kARYUV6bUl
         e/KFlNUHdAZC7hoj17DPbufxtwl1Df+MnuUvkUoQYeruaVQRiQXENA83ogTYx8VKHb6y
         RFkZaXMs0bLNVVMvIuFYHjqT3eheFhVRtzs/Ut8Xgf+CxwOaZqIOzaTA74wIhSaD0f8M
         Jzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730335310; x=1730940110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA1rYBoTcRGu4j/brwnbXznrXHIEbVFk3fpviSwXAOE=;
        b=wyYckZXA4E/tVUCpUj6P0QZjFpPdioIDkOV8opNdBK0fJvBKiw1gVDGm586Ui/AzUc
         +EJo4Qq/AhVao0vvinVUpNQ/gPgYMaXtE1MVEDiRxMIAuEJAiMmy/unuoUvw013BabpX
         bNrh7fpvizp/QEvr4ZWa9VjcerzgYAxP5YTkhMHqgGAgpAV3O617k6PBNWyEs4sfO2JN
         I/9JcdoGVzxySCveVcLA1JFKuy/MODDtbPAn6mPpKy8Uzb3YHRk0dayX7NG+ycJJCC46
         Q3cLlr0kg72sjGGZn0XlcvUb30Kb83LBUFsTDq54stIbdLMFUdDbMPkb5/45BITHAuPP
         O4Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUxpGCEGOoO4zHZ9Vxp9xqGRJrQHu8OVnth4ntrBeU1qIfG5FcEwQJRmElerewMtuMCwNVO@lists.linux.dev
X-Gm-Message-State: AOJu0Yxyz3AGbW93fkf6GcJbBJ4mp8AOl2e00pdpW6Yj9UgzJU9FEdKP
	nE9pybf9W+3LfNJTo7Uf0O78gdCD/lDQlxfx+VwUBhxk8ZMYrDmH3GSrBZ+2obpYy5D21TZD3l+
	VyCX1fIiWgOgudg2Yy7EqjDdKO00=
X-Google-Smtp-Source: AGHT+IHhV0Xkp1Tr39p6coxF85Ir1uMvPPvrs9jINbR+k5GV/0iQHouMzFAY9zvvFItUs3YR8ROUukzamuV6Gzynz0E=
X-Received: by 2002:a17:90b:3594:b0:2e2:9026:8bee with SMTP id
 98e67ed59e1d1-2e8f12e2bcamr8883272a91.9.1730335310165; Wed, 30 Oct 2024
 17:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030-cfi-icall-1913-v1-1-ab8a26e13733@google.com>
In-Reply-To: <20241030-cfi-icall-1913-v1-1-ab8a26e13733@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 31 Oct 2024 01:41:37 +0100
Message-ID: <CANiq72nUBuqbKm6Z0mWRcZ_J3=LOEPEdTiPEq3vYTWtrfLpwvg@mail.gmail.com>
Subject: Re: [PATCH] cfi: tweak llvm version for HAVE_CFI_ICALL_NORMALIZE_INTEGERS
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 11:31=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> The llvm fix [1] did not make it for 19.0.0, but ended up getting
> backported to llvm 19.1.3 [2]. Thus, fix the version requirement to
> correctly specify which versions have the bug.
>
> Link: https://github.com/llvm/llvm-project/pull/104826 [1]
> Link: https://github.com/llvm/llvm-project/pull/113938 [2]
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202410281414.c351044e-oliver.sang@=
intel.com
> Fixes: 8b8ca9c25fe6 ("cfi: fix conditions for HAVE_CFI_ICALL_NORMALIZE_IN=
TEGERS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
