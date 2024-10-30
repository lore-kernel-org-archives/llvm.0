Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46AA213EEA
	for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730301719; cv=none; b=c+8aHUeVjyJDALcLmNS+pIDQqfQ0FGlOpzuXppheLp6ArapXXEj1YcRQqyZXmIZcR2xj45xPy+4FpppWsbMoaW20gyRMTHbWho5W+Fh58kf6Q3WL7/Mvbf65Ms14AN5qI4C6eehJxV+ltEM4/YTHzOfbp7dmWFbJ7UNdgl+e74o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730301719; c=relaxed/simple;
	bh=q28afKGBxlWaTBYntLh/Nt9kA9+T1WZwBlrU/Kj/q2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pc6+g7e/x5lSp8sc/7T2FIHEZxs0OlrC/dRODAE14KS0MSGywQmQjhvETc53HiUBLt2reyYHDz8BrZxgGzEfZLpFbdNZC65GXKLvEBeAnmRXbcq/ZdqDiEZL1IBRwvFuFf/YEnceCkW472+oix3eyhShjdLvmojIzo1/jKceshs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDsPDVP+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDsPDVP+"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e2a96b242cso817833a91.3
        for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730301717; x=1730906517; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q28afKGBxlWaTBYntLh/Nt9kA9+T1WZwBlrU/Kj/q2k=;
        b=BDsPDVP+vXG9LM14IYP7HXQ5webKVQQP0oPsAPKCY6XTMY3uvmgIN3h09cD/GTN4Gd
         yRYhz0+/Eaj8t4a2ywPHbfYrPcQJGmhfecNcP4Tj18nLBXyv7ULrtdWrBG35t2HfEh1f
         kgmCDfXsIRCEvEYU8N2SNIjMcdPqxIar2H3Jy8LKos7AvIizATUqbay/tndoaiwaYj3L
         t5jaGvjFDyF46ExNeHXWr2yCuvyUsOXkmX+0vR6Mic3bTY+a2Kjgl9lj5iS6GxT6kiJv
         ZeCfGup7HAxVYUQ4BHvf/yOUQ/PTjRN2f1ZIt2ZSJ+7g17qDUMjQnQnR7nymH3pXPm+q
         0BTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730301717; x=1730906517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q28afKGBxlWaTBYntLh/Nt9kA9+T1WZwBlrU/Kj/q2k=;
        b=ww1oBABnFFQR8Jahx4jkuVhgRcwNHULNtA8fBydJPqG6mI9/ShU4mlnR9Hgwtml08e
         A2WSpkhK2f18HJ32JrW1eT3kpQl0aiFHyGizl1duHcgrobG53JIIQw/NTvSIT7C11Cyf
         EgPC6mpleVQZDTEzBEexHYTyxHQ5vfnuZr/u5I0PVg+o6KkGd3j+8ipTVxKHYIMU5Ik/
         Fp7xQHXpAQBFaiKlSNr8mAeXdAYBLQDbAOAG4lekFInjMGo3cuyu2pJLO1BMLOJIy02F
         OYrjTtF85DrW4gdKVNV4VpuceyRwXdaFRctWMRI+3UaZ20Qgwwh88kU7nGT3ITFjUKlK
         w7eg==
X-Forwarded-Encrypted: i=1; AJvYcCWPrDXSDEVVFPZNOLZO99al9vVlJjOvJsG/VpaRm1lHikQwhRxFiH6HBoVeOPqBTBzLAHUT@lists.linux.dev
X-Gm-Message-State: AOJu0YybQ9lsUC+GM4vFX7eUOkrrH6xylyfMH0lYVTQ/VKb6XtKXjomC
	66F4jAcumqr1YegAiofVZOoO7QG9TgoZ48UE4JTlfwgAXiNgZlA9+dlI0sU1UDj9vd9Ame5e5E9
	ASG/SJZoc43lB8L5NQkO7qoOJmgU=
X-Google-Smtp-Source: AGHT+IG+aJnZ7jclz0dMGPso6SfR+Fgv1OkYRsN/+ljD+v2cjeK5jtibjdfVkk6WAVK6iHGm/ocR141Vkiewt/KDjKw=
X-Received: by 2002:a17:90a:5205:b0:2e2:da69:e3fa with SMTP id
 98e67ed59e1d1-2e8f104fc1emr7272695a91.2.1730301717024; Wed, 30 Oct 2024
 08:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030-bindgen-libclang-warn-v1-1-3a7ba9fedcfe@google.com>
In-Reply-To: <20241030-bindgen-libclang-warn-v1-1-3a7ba9fedcfe@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Oct 2024 16:21:44 +0100
Message-ID: <CANiq72mkKsj2JNg-iT4UTC_fRt88n8PWuFW96cAj17oHpW0MQA@mail.gmail.com>
Subject: Re: [PATCH] rust: warn when using libclang >=19.1 with bindgen <0.70
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 2:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> However, the regression fix is only available in bindgen versions 0.70.0
> or later. This means that when older bindgen versions are used with new

No, it is also available in bindgen 0.69.5 -- it was backported there.

As I was mentioning in Zulip, I want to gather some information first
before deciding whether to put a warning here or do something else,
especially since there is no code triggering it yet in mainline (that
we are aware of).

For instance, I have been checking some distributions. Fedora 41 will
get the backported version in 2 days (according to the maintainers),
and indeed the new one does not trigger it (and the base one does).
The Docker `fedora:41` image is OK as-is, but only because it seems to
have the update because it is still a pre-release. Fedora 40 is OK.

I also tested Debian and Ubuntu: Ubuntu LTS is OK, but Oracular is
not. Debian Testing is OK, but Sid is not. I have pinged them to see
what they have in mind.

Cheers,
Miguel
