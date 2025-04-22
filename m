Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC65B202978
	for <llvm@lists.linux.dev>; Tue, 22 Apr 2025 14:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331060; cv=none; b=SNTz+aP2xbVa/NIkqlsrwmiXqUhIYmSDMSz6hEROlv+WSFCTMSOiEUMbF8wfTaRYKojrYFrJzpmAUM1mLjsRPzjrnj7MToqSVPXjTXES6YEnvt62vPLp7scsCYvb0jx89JZIfT6JV/Mmqy/csQJYppunmKDA40Hr26tTj/3xrME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331060; c=relaxed/simple;
	bh=2MM6fvdAAQzaNltoa3ZzC6OQFO8sSXRGY0+MhpYMgCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJ4o1tVFBkmSUyr6Gog5e1iNFAd6GhBexubIpGJWInmccBcfKSikERT1w+nI1LDtoIDGzVjIxg86m8XgW9Kiiv+2hnh0V/VcaUzm3I+dh2qjkIf0HYaxx7zRsrr2MnDOyOlqgFupEHaIyo13WXDoSqkNDwGlL97EoaszxAs7gn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbYZUmZr; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbYZUmZr"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b07698318ebso346009a12.2
        for <llvm@lists.linux.dev>; Tue, 22 Apr 2025 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745331058; x=1745935858; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MM6fvdAAQzaNltoa3ZzC6OQFO8sSXRGY0+MhpYMgCY=;
        b=RbYZUmZr5wPM8it+/Jcm77pdF/shZ/3TRwz619rRecpl4p2VVRDXE9Draozth3chd8
         aY9QLTe2f7nyvk4vSX/jO8sR4Q4OsIx+Qw+1jaO6u2jrcxDbElgXWgBi7isBahV/QHZM
         yXyI4yTInm6Va+6WoAlxMr6rbKOgMwLSC6wcxTKlPgTmtjArMtLbB1FbQuOuh56WdpIa
         JDYG422zXUWN1W3ndzPZxxb5qzXZixIsWpsfLncyWiN6aDmyKz47sMrt5FZVTjX59V/A
         VdUASy3K1liDo/83dk+XndTCiO37EZS/u8RvPanF6+YCHlKya/3KDNAxNYT5+zGrMiUt
         zmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331058; x=1745935858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MM6fvdAAQzaNltoa3ZzC6OQFO8sSXRGY0+MhpYMgCY=;
        b=f7hiFlMR0J651SwJgKa3HUUX+JITzgGeD2Di/rrY/cWAenYI83XpP5y0tuxwxszyhI
         XKERSZMhNSUkup0M7o5CS2jZnqcnmOsDFC6fQRiHalMFJMQcQ+9whsTTtohxqPJFygIN
         RupnNPnl4Hez/5RNT/APMoDM/v6Dk0u0EMjm70oaU8BAXlpa0PBLfwkRyX7XZ/hKIoWM
         FbqBf3SVvjh7M6W89w/8kpc+IqFcP4ahbHoURam+eJrWEA30Zs5XvWnGO2/GU4j3jQem
         e39kZBkykte0nI2oSFfc02rc7fnYgJA1tk+aQrB/ItAGbeBtg4+F36HZXhlBTM5+w4x9
         7zSw==
X-Forwarded-Encrypted: i=1; AJvYcCVvjJeS7+U81BxldhsLipQ9Ipyc914wJfG/yBkNAqkiYeUL2DAyh/N7XUtaH5vQPgvTFD+A@lists.linux.dev
X-Gm-Message-State: AOJu0YyS+/CoOT0VoQXXcC/NgURI7/4JjxfkQFUFIT2bEQFBuxKs4EyV
	C2O46P6u2mI8uxlDp2gZtaN3LILHjf21pqJ1XiWmXpgqAr3q7qFs/LTvfoAWHxOAc8INZ/4ai5c
	z+ADfNji+yNgtYT8afuggJvf0kg4=
X-Gm-Gg: ASbGncu/tMSUGemTvETkhDWCUYhoyGHeKm0cXe4s5ibsj13v13Y/B46nByiHO7A9fF0
	+YwOkXiiXcO/cy8YN03JMbi4M4CWcZJMgYpJg0ofJEWytP/XtQmy2uw4wwhFrkyELcotL+9ba8B
	qUDmlZOMDSKzX5f3Om0BXXOfn2VyXiG+tt
X-Google-Smtp-Source: AGHT+IHNrZukhtHZqdbBi0rMLPXMhyRUwthSlOF6B/9nJ244nnrvPdxxYhxg5zPl9IwCLDR/Yn0OqTmVZ44CVdDTrRg=
X-Received: by 2002:a17:90b:1c91:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-3087ba5ccbamr8060310a91.0.1745331057902; Tue, 22 Apr 2025
 07:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250422125633.30413-1-contact@arnaud-lcm.com>
In-Reply-To: <20250422125633.30413-1-contact@arnaud-lcm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 22 Apr 2025 16:10:45 +0200
X-Gm-Features: ATxdqUG-FAOW6e-i0WqSstuY50PV6UgDsUfeNCfXkoL6rqSF8GshcvdRIVq93BI
Message-ID: <CANiq72mo+DSyFZ3gVWVhqH5LHa0hkJ6gyTN70=smhRYzpNMYWA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] checkpatch.pl: Add warning for // comments on
 private Rust items
To: Arnaud Lecomte <contact@arnaud-lcm.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 2:56=E2=80=AFPM Arnaud Lecomte <contact@arnaud-lcm.=
com> wrote:
>
> Background
> ----------
>
> The Rust-for-Linux project currently lacks enforcement of documentation f=
or private Rust items,
> as highlighted in https://github.com/Rust-for-Linux/linux/issues/1157.
> While rustc already lints missing documentation for public items, private=
 items remain unchecked.
> This patch series aims to close that gap by ensuring proper documentation=
 practices
> for private Rust items in the kernel.

I think this background wasn't changed from the previous version --
you can include a changelog in the cover letter too (some do that
only, instead of per-patch), which may help to mention what changed in
the cover letter itself, if any, since this is a good and long cover
letter :)

By the way, some of this cover letter (the "Results" section in
particular with the examples) could be nice as part of the commit
message on the first commit -- that will make it forever part of the
Git repository, which can be useful to understand the commit itself
and why you designed the heuristics like you did.

Thanks!

Cheers,
Miguel
