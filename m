Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603DB221F2F
	for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 21:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760909170; cv=none; b=WLSDLTMi2izFUvfx/arjAmDt5M0gCcN6VVuVFhiO4VsNw7c/gXkjGLVJOmkVijevHah8aYh7vGeYQttzgPt9hSBlj+BbsoAleMW1Ghy3mtr6fk7F2POkdZlRbCSaDqApz7HK9FcrMeXZUAp+fiGkLmwnV6J+JhBp9PuCuwx0ZfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760909170; c=relaxed/simple;
	bh=i+LGfQKWIvVBT05pMeCKog85n15IAvxhMtSIzthF5hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8a/2Gq/KTf+2fo87Sk2nh34W/wSTGEZYXFNjkeg6Y28JaFwo+Nmo1rPA4sJZIRPtPcvHsuWe7cMZuvTTjfRFO2hJ8j+U/8h+F9WG0EryHUEgMGDd+ipDkOAWYviuWKp3xCTV+sqQ2DK52gC17Acqx5Xupd1NiVq3jz32ii4mM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ4Oq0uH; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ4Oq0uH"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-33bb66c96a1so1048986a91.1
        for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760909168; x=1761513968; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+LGfQKWIvVBT05pMeCKog85n15IAvxhMtSIzthF5hw=;
        b=GJ4Oq0uH9qYJ1MhhDNSbx1/gAlNrm3bnCnaNwuOh7EVa86NDHEy2vQLgljiY1OB5We
         OZrLWMaR+rPrS/E1UUUPkkSgki5aWLatfRasbpDYH2n1CNatT5ob8h62kIOdG5hO9gGs
         Bs/8LBYkw0gbIaSiFCZbPVJtbHt3QGlJcoyQQyjmdG0NQC5lk+OeBoiXvJ6Xmgrc1Yo6
         DhZVhg3aWVIGkQaDbnFS60wHLk84y0Lp5pBDrfHcmReSsqWsiHgOgpeapK8zpb42ErwF
         YyJ9/feSLAtc6vuoEdV8RO0EmRC/GarpZtLPLzh/K9/bRJZyfLeP1zJfN20lXMGsBrWR
         qp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760909168; x=1761513968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+LGfQKWIvVBT05pMeCKog85n15IAvxhMtSIzthF5hw=;
        b=LeP7UFMiWM/WrUt76zCf2rPD5FoiZuju3nq/6jRuyfzK9ZVym+m0HvZxxf311aekw+
         zCHj2AG4WEoj4NcRgSF+z6UwuHTQ+uwjRI9T7hIgTDBqCbXm47BewtB5wN1J1dPrxJWl
         L9vhk1oJB4Rxc8OiyPij9aTYRCBQfMStrq0QeG6jGq5fejkZwivE+s3ej3s9JtR2yju7
         ZSIzpV9gJ3IR6WxtykTtPtvY3XVWqFYBZyU+ncPItXUyNpmHjE0CF0rHQtRlTnzW79Id
         A1mSXG3z1VHCp6J4O/IAn6EYTrm+14agPvaDHHYNInJ6kcAQLJepDecfSqaWMFCf/nN9
         w5tw==
X-Forwarded-Encrypted: i=1; AJvYcCX659Y5jhuUCRC72C3yAj4TM3usXAHaV+bQRATL63DXxWDD3ZjIoy5dxK8VXPFvt8NhZxKi@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ9QKwQsr5PvR2nfz/6oQUUvmhksUubQXEzOdy8yk3y4VQDqw+
	pSIAEs23U6Vh2QNaqw6HQnEn2grM0KuXi/bYYg79U9R6fL1Vu+tYDptCXcCUCRNWm9tmfLQT+WE
	Ikt98lJUbjYiy3fmW08gftHJkPprDA74=
X-Gm-Gg: ASbGncsKn/B0yiNnudpqSK/32NIXbn11xLFRPB1l/TahIb/tS+F5uPpBUVr6P3t/vED
	LDUzYD7o/lR6FE1rMXrOYRhMP5J1jCPcyPQBY1LiVCMr7CHz0ORy3wpjzIprQpMc4jN/6DiT2Tx
	pGyHwGw3UIF2L9ToXi/wIW9992Rp/V4+0PsCvtdqCGltiE+lKJzNox38dNkQ3WiI+/X/E0mTUT4
	3Zfni40uRfDVrTO6NzwShRyl52xukp/M8ZDR7xZxMIpwZZHh/RU2hQKqe46Rf/ktSrmEyNUJCiA
	pkRsFEYrsiIWHwJt6bADkMs1DO3NVMXTeBIhQhzUNxNuLsVqVc6vy9M32Sv8bstNm+6rTIgxHmn
	SJVo=
X-Google-Smtp-Source: AGHT+IEwx4nwwBhH/hNxoUVwvTs3X2bARut2TDi7HRPmGCV4tokc0LBHgVVevC+PQZA8tTr6XyTnNa7XyeNocxVrSx4=
X-Received: by 2002:a17:903:b8b:b0:290:c5c5:57eb with SMTP id
 d9443c01a7336-290c9d2dd08mr73269955ad.3.1760909167598; Sun, 19 Oct 2025
 14:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com> <20251018-cstr-core-v18-11-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-11-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:55 +0200
X-Gm-Features: AS18NWDjBjMG5pR4bntjwqt3T7EHDFAllndAmj435I7b4c65f3XvqG9PcKa-Qb8
Message-ID: <CANiq72==SKsYkogrQhKTzCXwxeYfbL3V5jOiQKiunwzLta5=Pw@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 11/16] rust: opp: fix broken rustdoc link
To: Tamir Duberstein <tamird@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, llvm@lists.linux.dev, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 9:17=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Correct the spelling of "CString" to make the link work.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

It is private, but it is good to have this done so that eventually we
can potentially enable a runtime toggle for private docs.

However, this is independent of the series, so I would suggest that
Viresh et al. apply it independently.

Fixes: ce32e2d47ce6 ("rust: opp: Add abstractions for the
configuration options")

Cheers,
Miguel
