Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E48C12E5B
	for <llvm@lists.linux.dev>; Fri,  5 Apr 2024 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712313045; cv=none; b=XbZH0hOtKEnKLDqq7RGAf/y2ksFlQ7wgNaNB/Ro77YTYIBt4O74ufSBykiybuxIYBhxQvz5+xSpwUGGAAVoR6gHL/RwXfDDRt3TMYvACCBFG/TT+nFGrDnkD4IpaBkLw8/b2nwYrZGdKwOIHMGfZDp/aT858yKL8U/DVibuwyc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712313045; c=relaxed/simple;
	bh=MjyZT3uHQHE76lUIF8K+O+k+aMaljvlerxoCcM2gaOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gPEaDH/fmjycF+1dJ3tUSf6VVkI0uov1iqMusAADx16ubkwvU3pJFSsiBFjPytOWM9DO0wUAfa/TYy2dw2duzA9DvEl1gfcHYdFHXyXF++yaLaXtuQcK659MshrxjfLn5jDIe9fElDUzzggc4cOKcGKmCYZ4a55tQku+27vnYic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fp+KQg9y; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fp+KQg9y"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2a274955aacso1427116a91.2
        for <llvm@lists.linux.dev>; Fri, 05 Apr 2024 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712313044; x=1712917844; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjyZT3uHQHE76lUIF8K+O+k+aMaljvlerxoCcM2gaOQ=;
        b=Fp+KQg9yoqYeVn2J1/zNjymrNguHVmaE162LUa2UmFmmZSbJUXxxV7C0k0KCwGQlK/
         IdKK9WAtK/o9WkP2/kKoL/EAcTgnQXDJm/3hGAi6wkRdK3vSYKFi22CIy6yOiijlIpm3
         hrBwp0TLgVPYip0xxwkGcVZQG2G5mdEwNxjVJxNwxekwKcQb486x8sftUl8QA4OVurkH
         6OcKxLrB2KyTMYSbkwwH/olg+8xKjVwWpZv4YBCBn8hWOPRuMaC+UsmF3wnUHWi6t2g9
         pBzrE5n0Ar7IZoFqLSOj2OZDsCFPEQJUtqLEMTgYcT4SwMaOS7CDDO41pKPB9g83hKh+
         M3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712313044; x=1712917844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjyZT3uHQHE76lUIF8K+O+k+aMaljvlerxoCcM2gaOQ=;
        b=I4tSNvD5wPfT1QU3hh3C37a/NxdcMuVZpKZ4YZfwiQpQgeYAHsMJLWoaZQecFeH26s
         t2msZc5jOcKzaHEiKQsMmrhZqnzVXT3o10ahjSqbtykkzXtOVb8TyzZ3kpEzUxzyQlrv
         LRibzFCh5uWzQ5C9S+FioTxBIPIbYx9F2ZtWvkavEJ+pKultAPxZkEpqVTppy7oZvujq
         c6EdySUkIheZjr/fPv2qA6URqaVF0AVCjDCUcNWzBn8xpkbUf7sQ/E2Ey1twyOT20GWX
         7NEv/cn8Yi2HJMbxg3W5OTW87UTand968Yt4FJSEK8uQRSLh6aGoYgmm9oQS3iVpg4Bc
         +j9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2MQOIdKtFRKouZZllFdmgBNkSDPlOIkVaNUwTvVWEpvuLjRkSIul4gaFbJwjeeMrPtw0PGbYQyjAibtXRxbaKMdzi9A==
X-Gm-Message-State: AOJu0Ywd+yg5mze5g/aymgGO8HTW0BBtoY/EQj2gkt1vhkFGXXOljUlu
	x9oZgcCi3XFUsRoZgJp4y2BSJx+LY1IkGE1WrnYHrjvRP1n5T+fthswYTwLMF75U5VZ7PEOMF02
	eCrfi5n+I9l+mNTO+rfPr50pLIm8=
X-Google-Smtp-Source: AGHT+IFYJriAFttp3bClZnkaGaA416ql9G0BWF43cyDOJfJ+9QjQwmRH9HhSoypwCYo/lJU4PVsdV36O4Srk2/lVIwc=
X-Received: by 2002:a17:90a:9ab:b0:2a2:38ee:66f with SMTP id
 40-20020a17090a09ab00b002a238ee066fmr762112pjo.46.1712313043351; Fri, 05 Apr
 2024 03:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud>
 <20240404153258.GA852748@dev-arch.thelio-3990X> <CANiq72kSfC2j07mAaV591i4kDwejWRYcFTvASgQmNnHVe5ZwCw@mail.gmail.com>
 <CAOcBZOTuqzwQncS8rMUMoOj3zE+FnLxPY6O=4EEaOP2xuFG9Vg@mail.gmail.com>
In-Reply-To: <CAOcBZOTuqzwQncS8rMUMoOj3zE+FnLxPY6O=4EEaOP2xuFG9Vg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Apr 2024 12:30:01 +0200
Message-ID: <CANiq72ko18KobmSp4x=twYRBT5NZmg80rBUC2_rXkDg=67aMOw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Ramon de C Valle <rcvalle@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 12:34=E2=80=AFAM Ramon de C Valle <rcvalle@google.co=
m> wrote:
>
> Sorry about that, I should've done this already. In addition to the link =
you added above, here's a tracking issue for KCFI support for Rust:
> https://github.com/rust-lang/rust/issues/123479

No worries! Thanks for taking the time creating the new tracking issue
-- linked now from our issue #2.

I also linked your update here and noted the benchmarking needs /
regressions report request too.

Cheers,
Miguel
