Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781B13D2AC
	for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 16:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150118; cv=none; b=DYF3uJ/aWZe1Nx91mXIjmyD5FyBHdoRJ99C0Ck+OdpfROLgitBc/PXM6my9jWg51TeZlWylH9tX86dlYD3ccOtcr46exMl2AJcHCb24xi+6NQ/GmTExSH3T7Ycz7CppoWYLOYTdv9LbGegAEg+NNF3rTNQdPhRCjJc+kpuefIUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150118; c=relaxed/simple;
	bh=isJanjft6Ijm3USO7GK2BudIrWLYWU6b2nnmV6911CY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qyPYkL1jayWR9EnXY/BagWnlXa0hqAxGC17Ac1zeKPBiroatZUVvVtc7lo0818GGA6nB8vIaSk61Jdlgc+bcS6irIflbPSMbLxxi9c4vIPk1uzQSLhh4njA65NyDplG3kuYMf38KKgVDxkTveCDGORK+EwYB8nrQWUV3h1LFPbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaZhP13R; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaZhP13R"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2a2da57ab3aso2083036a91.3
        for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714150117; x=1714754917; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmMXkGy7VPsvwtkKsXV/wpxBJRPdn7aku2j+I7TeRZI=;
        b=DaZhP13RaZ4TS3MseYdhVfEAQcogSw1wr00klgxNzo7juzc6idVx9x6a9xoi/mVM+C
         fRMxzmdt7cGxYUVzUndbqjhyJ8bVABdI+6x80JWuQZQXXi1jQna5Psfh0NX1YSm9tjMv
         3nQxnb69VaBUfB6lPsxETHl9k6Ey8oOrjNg2JvzmJGla0Z63vCt1ggT46Iixj673htCQ
         2ZjPXF8QTpvpV3rra16zNIpZ8JVK3lDsqV8b/vm2SImR2bpl3lWNLCfi7x6nKF1LcMJg
         KokK7DFjfgH6wdSxbA0rs6HVMtlTBvzLKSOgGfKsigqC1Hn4VaVechsfMRlbOY8tzBL4
         cnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714150117; x=1714754917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmMXkGy7VPsvwtkKsXV/wpxBJRPdn7aku2j+I7TeRZI=;
        b=Sc29c3a7SF6BArXxHo3sfIUfPL9GXb0xUStsugLo0wI4NWpxJANxW1SC9/xSd8Bzww
         3mrdnlFBURBMjb+4a+q9t5UkqJvhTpHWJqLYOD/EpFyVROVRyTsEIvjHpYbNcJHo384d
         /H64IvrB422qyXbYwekMNWnr6tZEujnPKKPfSJGCzCAkxg2fhlPy6MaxgJVKfX9hBAvb
         GakI3f/6bN7w8hvdjarBGCkM7It5hh9XSO8d2fwjYwO3hGcXhd49Tzzhhub/tCsDBVVf
         7zQA3hVzUuZ6rzDInMrkQ6LWWsOCIEO/Cp/If2/Rpdl8pwtHJiROSzN/Qsiw6++uySJk
         hlCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqIORZwZmOFosA+tSRQq38a9qU2oNjlIKqUJc7lt1g0tS2YPMOQ/rXaaESdIr7DYX1Iowwu3GThuRIN7FzgHNVGYvnSQ==
X-Gm-Message-State: AOJu0YwqieuMSIEJawyl4zGW9YQ2PgMf96a/jTj81N8cYGNtMfvPuKBa
	EcHB6YTGqlM+hNvIf8Iv9WIcb18HY45Nc0l9N9cwvdJDgQRq3VDYkyUvdB6Oy0Zn9SDaTLi6W+F
	XL4cRdH6Qjf1ITVgjcgZpuMmcRXs=
X-Google-Smtp-Source: AGHT+IGUzYot4aWxYmJQmmtJTaU0cDPgRlNF43MSJ+xR+zOvk17sLDT893O9A18W2SmanyZEbP3mYQ0mJ7tS2z0ZCN8=
X-Received: by 2002:a17:90a:34c2:b0:2ab:9819:64bc with SMTP id
 m2-20020a17090a34c200b002ab981964bcmr3011377pjf.32.1714150116642; Fri, 26 Apr
 2024 09:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1714113680.git.siyanteng@loongson.cn> <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
 <87zftgnsun.fsf@meer.lwn.net>
In-Reply-To: <87zftgnsun.fsf@meer.lwn.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Apr 2024 18:47:30 +0200
Message-ID: <CANiq72mHoh=qgOGPj29hpS7EhVcXi5Q_7GYsycKhYwj3QbsTag@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to 6.9-rc4
To: Jonathan Corbet <corbet@lwn.net>
Cc: Yanteng Si <siyanteng@loongson.cn>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 3:42=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> I guess I don't see any reason why the translation couldn't go through
> docs-next as usual?  It will all even out during the merge window,
> right?  Or am I missing something?

Yeah, that is what I am thinking as well, although Yanteng is
mentioning conflicts somewhere, so I may be missing something too.

Cheers,
Miguel
