Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ACA23BCF0
	for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 23:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760915061; cv=none; b=KWojyEQcADFkMdyA0waDyQyu0vB01OZOepLchs6y6YJ2zV98dm69zOLnX6Qw0ZxnUFcxKDwOV4hMn1/91a3yK72d0pInfhtyS9dydWtZVBnRneSFVTk465KfBPClUdFxP9F1DHV4NqoYH+RaJ1YP33fUHeU2JDi5IWaRuXxmwFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760915061; c=relaxed/simple;
	bh=AnqY+dCYnc8UF5OuQ+qs8apE1qzRi+JPuhlLZjOnIyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EsuH4vXAx0K1/HPKeq1VC9Vw3JqF+6icv+RegRrvBTI438tLfxmKw0ipcHyvAGfeVRprPfarud+ejuTzxeY5KE2d3eW+Pz79gfUONrcaV3egEscI/7tMOZlBlvAk832e893+xP6zGU+qHNZNjmZOiyGo0lUpulYo0XaGhyeHcCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRdBq3NN; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRdBq3NN"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-33badfbd87aso915438a91.0
        for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 16:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760915058; x=1761519858; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOEeh6O4RXrjCbdM/YQb/OmkajAlxiTKW4cEYv2MTfU=;
        b=NRdBq3NN5Rsx8D01wJ/DIqC6DlNZzNCR+32z/+nniHl4oOggI438ICFvS93yFBIpTG
         uM5W5bGAiGZcWB0unTO7+BZHMprQ33UdK5umcereuIdGH1bgHyItnvLmHQh08l3b8EA+
         IhcERvZVR7OsJpmHAK5exMTuw9AHqZRHLZt6yFi7VGrOqnk6YK0uzkka/qPIlddemgA8
         9rA6HIlXLMhkx8joZ1ANqFMPlIpvdBLQuomv9zN9pQNpSNIrdvqUVCfI0ATfMKrBejdU
         62UgeaYFBHfxJ0aCA11coQy7eMoaj41ugPS4DcIZULW1WrCbgLuUzaLOG1Q9pdzT4xMq
         fNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760915058; x=1761519858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOEeh6O4RXrjCbdM/YQb/OmkajAlxiTKW4cEYv2MTfU=;
        b=naSCKViEHzGEbkOY/uzTnTugnRzZPad4IHVmop1dGVutHgM1iWCUz9vhj0Qy3MFidm
         1VUxmalvQ0lb8kS7BscvcWyXk/I9CRYLVfPeC7HA2/hVTB5ydRL4DJlQqtiBaQunAAI2
         UNql0bUZUhP567Y1iTPYWb2503qchr9ND8DBcRqp3nAgCzdqorDloCXqn+fvMzClEP84
         bsOsll/VBle1/27li4iQJVuz4CeIRWX78sNYEnnD1S0RgnWEMLV1HxJVQBvb7PO5vm9C
         t0EhnxAe//QB+k+iCcxBoWlPKYnI04YQQwDolvkL+4ZJgnGyH3k0FZ6bP9usbSEH1jib
         KIGw==
X-Forwarded-Encrypted: i=1; AJvYcCXDJ6tsj0hAOGwkKL6LNMKiyvftTwF+Qgcg0uo9rnRseIu6/SVoPwSBlD6l/E283sH1a0iL@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6GTXuqXq5ngkDnyfr6JA1qFlQ753I5ec1q8yWj5latpikecO1
	vdpwiCyDLzudRjABGo6TCOSFmxAHC0QYQrOcbRGs3+kFFxhhAQFPQIGKVKWk2QvAUuWkUqdHzZo
	JdUVoiai1OzP8C/u8nqQLNn2oNEvHueg=
X-Gm-Gg: ASbGncu8AAjRmjfg+Z2TKVrcmd2j8m4ppvhezG1WRpcrAkwEJHIwpUZhkv4WEBsXL09
	fMfZrbabu0Y9cyV9OY+8LMFsCnZ0Jp/vIciRSZYFTFLm0EztV+Oix+YL5LcOkm385Wt1dB29xAF
	Be2GrVQRUtmXqStDa2J7Mk7ePbo5AhjnKRHcI1AHZe33QDjlugBXuIzXmaJl5lx5Lb8dmqgGnx+
	dIEtDI4sSHsATYk9EFImYiPDmF3otIZtdKkbsX26PDlzcUJs1lvlA19Vd9HzPwyNgNdxrdUK5ij
	UZK+UoAwuijlMkS3Hv9fq2VtocSSThBsHs8dMIUf+OZunfbAZWtzpgBGup5Zqcy+4PoioWGHzRD
	Q/WeLSgbB2VZD3w==
X-Google-Smtp-Source: AGHT+IEHoe7IdB8Fn4blPj1kZr2k1PDvwkLeFqEjMadUT99xbKyU7kwS9dgklhgQJkFrx7iKJ+XmLkdzgYdk7hZ0y1w=
X-Received: by 2002:a17:903:b8b:b0:290:c5c5:57eb with SMTP id
 d9443c01a7336-290c9d2dd08mr74335675ad.3.1760915057866; Sun, 19 Oct 2025
 16:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Oct 2025 01:04:05 +0200
X-Gm-Features: AS18NWBk6jlJf0RifcBoOPS6BkMb0c8T8AQmrZIWVCq_Mep36ZL7bfRUqV3fx64
Message-ID: <CANiq72moW2VULd6EMQe9X4d1S+ftOG4Mcpp2_+V6zG7xVXj+qg@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 00/16] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Tamir Duberstein <tamird@kernel.org>
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
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
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
	Tamir Duberstein <tamird@gmail.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 9:16=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> have omitted Co-authored tags, as the end result is quite different.
>
> This series is intended to be taken through rust-next. The final patch
> in the series requires some other subsystems' `Acked-by`s:
> - drivers/android/binder/stats.rs: rust_binder. Alice, could you take a
>   look?
> - rust/kernel/device.rs: driver-core. Already acked by gregkh.
> - rust/kernel/firmware.rs: driver-core. Danilo, could you take a look?
> - rust/kernel/seq_file.rs: vfs. Christian, could you take a look?
> - rust/kernel/sync/*: locking-core. Boqun, could you take a look?
>
> Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vador=
ovsky@protonmail.com/t/#u [0]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Tentatively applied to see how it goes in linux-next, but I will
rebase for -rc2, so tags are very welcome!

    [ Move safety comment below to support older Clippy. - Miguel ]

I included the additional patch I just sent. In addition, there is a
`>` typo on the `Deref` commits -- I didn't fix it to avoid adding a
note everywhere.

Thanks everyone!

Cheers,
Miguel
