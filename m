Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DA56E605
	for <llvm@lists.linux.dev>; Thu, 25 Apr 2024 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714035779; cv=none; b=OKxbNIsTHSizpuAy8W9xf/6ln+sQNZHve7KPtuBh+fEj1be3CBFVXYlU4+BBW7KmJ5gTb/DGYfscWvrNmU5V79CxHfrypXQfRx4IocJPBBgQoXB4v8xB4uRONjfJaF7zsgvEvv4gxDA7kOhMpBhriiq7AMhhrvu8VfBo1DqPhHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714035779; c=relaxed/simple;
	bh=W7mC5WuQrqbjlEo+atEH7kcmysOPPGuDwpb/k2zZ//4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkhGH9A/cpcMMrNHomhTXzDOv1ZCc7vwV1m6rnPxLZlp0THdUH5SfhnDPPz8dK8JKJkPT7cQU/H79ZfjVKdPTRP9UNYRq34EDuEqxDMo8szc5v7eLqzN8OALhwwBTSWVg1ogzUeBV8RFLgqyJ8yHpYSWGXGHPIM2w+ePqCldBjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGeWKU2V; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGeWKU2V"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so545610a12.0
        for <llvm@lists.linux.dev>; Thu, 25 Apr 2024 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714035777; x=1714640577; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1wjs4SavXGnazssug9F+cXfiFMfy+d6wFHXe7CeUJE=;
        b=OGeWKU2VkhMlxNly+VACWqsal54xuoWP9bIplmQS5ngYtjiXGw7dXzh5o/Bpb3UvLD
         GRyCUTE14gWBEbJvQ5s9pb40ZmeTJsZNEB1ojbTNQISBXYcJ+oQIPa9jgY2egu5mv/2I
         iHx5at0tliPwK5abbB+00CIxe3kracjpdP3koOAzuu6kHjc2+rHZmQCRT9K8HKXRltsd
         D6H2SvMIcxCdnniFZPvZscIcqB5MU7Ick/j5ssCE/Qcz/92L3NI8BHOOh80DReYpbSWW
         J9V83vg1H2k5EcaPdVx7g/EDoxsl7v0Dpf6L1txQ/h1z9sWzMFf8kohRWy+1UP+x3jMG
         LZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714035777; x=1714640577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1wjs4SavXGnazssug9F+cXfiFMfy+d6wFHXe7CeUJE=;
        b=EZMSsLBrurlvzum28iMA9+DLbcVLiiiIN/LNtHyF2lLafE2egejRmd35s06JEgaJai
         GsSyWxwKabWsl4H8eDInSbJvm74D1DTDKvFZG47slqNz34jJHQPxvB7wikoP7p8gsY82
         169fR7BL0Zx4EBWaPT4IaPN/bRpqu1jxusdlx3zO+BoY3gUIqFx3HvhIwy+vNG19CNGQ
         7ybkAt6+g7YWtoMxsJ4Cdc7SK0MJ3oknH+cw7G5mmJmwqpjMAgm2Vf0LrV/X/G1Uhlrc
         2obB0IwWuaWFOBHOst0Mvbs+EBoKFinBsjY/cnQ3FMc8TJfvBWLxF814IPKinxxpGrPp
         nkTw==
X-Forwarded-Encrypted: i=1; AJvYcCWGwFldz/xUMKzQXkXszEBesMrw0vx4hSVANLM4yvDGmn64JaIwIdh4rcZEKm9Fm0TjZS5yV+ou30SBNIEKAwbWQEZ+Aw==
X-Gm-Message-State: AOJu0YzZeQ2bpa5uZXBysXb4R2uI/rg5P0CayBd9HSWkwaV+JTtheW5o
	voSZFO4Fo2N+cGDAGVk1Hsau+tQD0vHhrbyeWomRAp4FQroSZk/DwDt8AicD3t8pAQoslzCoZCs
	ZU5CGxwXSIGOFMaEY6L7a9woJ/Mc=
X-Google-Smtp-Source: AGHT+IG2cmnz6emFDz7lQp2KPETZK7BFwCLTK8VO7MaLGjWuFwq/87lzEtLoInfK6L39CtOjWMtSsiVer6P7L7hXQxE=
X-Received: by 2002:a17:90a:9313:b0:2af:2978:bd59 with SMTP id
 p19-20020a17090a931300b002af2978bd59mr4509955pjo.6.1714035777134; Thu, 25 Apr
 2024 02:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1713875158.git.siyanteng@loongson.cn> <81ab8f4ee8eea1d7a67de0595ec964614c5e2e00.1713875158.git.siyanteng@loongson.cn>
In-Reply-To: <81ab8f4ee8eea1d7a67de0595ec964614c5e2e00.1713875158.git.siyanteng@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 25 Apr 2024 11:01:51 +0200
Message-ID: <CANiq72mdhwadg_PCBkz6fTcYBTr-gHFY9N9JFL2B_uFuMgtzXg@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] docs/zh_CN/rust: Update the translation of
 arch-support to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 3:07=E2=80=AFPM Yanteng Si <siyanteng@loongson.cn> =
wrote:
>
> +``loongarch``  Maintained        -

We had a recent rendering fix here that you may want to consider:

https://lore.kernel.org/rust-for-linux/20240324010915.3089934-1-tim.chenbw@=
gmail.com/

Thanks for this Yanteng!

Cheers,
Miguel
