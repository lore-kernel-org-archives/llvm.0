Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7801C183CC3
	for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 21:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760909133; cv=none; b=h1vGopV+5wDh9kuyXSGp/ELVgkLUmhDe2M+vepNGhA6L+HUlw2Bi+nhRLP4OCFMWe4SjqaXOI34cyuW4la8HrlnOb3rs0wJdULNUfZHt022/m4eG18OnTsJzPj/eNAulbdi0QZ9w6vUHGkTrZxBFipYHa0CyjmOhRr4vheTngY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760909133; c=relaxed/simple;
	bh=VMzOcGlzTmgP7Sx2K6Mr5nIuxpWb7Ycpm/3lBUKh9gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTNI10i2hPJntbMYY3WaBBe44cJ6nNlA82xmKIuVNQUrHxRwpRlVMQTG0pSzQQDWkN40SFzxWENAUunq/FOTA/gmBlcoH2nfpH50h+Gj+AkVa9h++CUZZAiMVOU4tIukZ6Kpgu+3FGYbOP1fW7QRt2wfGYrFQKoqCSSkzrAVHBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVZp/ytB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVZp/ytB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-28d18e933a9so5597505ad.3
        for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 14:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760909129; x=1761513929; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMzOcGlzTmgP7Sx2K6Mr5nIuxpWb7Ycpm/3lBUKh9gU=;
        b=nVZp/ytBFXBZUA2d8isHKFhiXGuWrpiKEM95nLxDrCgIqgshrWEphpEJ28k9XxCqio
         5nxuoVyQ8GTBmmhmyfeefxbZJHSlbLp1Z1zc+Hlg9BfwxfsbLRx+q6N+qRw93RiGC2YR
         QF9iDV5e4D3I42gkuODJ4kZ8YXThBKpsZHu5oIKgfmPUuO2fV3xNz3/q1LxIgIcQYXb4
         MSoGZcB2jR89EGL5WJ38U9wpuNm7NufgSmR7makUqnN95b6kGvUHQqTQxI2e1Y0iBh6G
         avqh0a0Recj9qNPW9xtjTgrSHQLLedj4qsnT0RAUSj/61O/30xBemBeUQJna92usrDzg
         4V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760909129; x=1761513929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMzOcGlzTmgP7Sx2K6Mr5nIuxpWb7Ycpm/3lBUKh9gU=;
        b=HJnhb+NV3eMCdSG9XVG7d/MgqrbB58w52eqJ9fx8EgTZzmVJ9W1H3a8eNjU6y1qbEI
         rk+CTFCHVL71Tj6cvlyI9G/yuoxqJeHE0ylNY32YBJwN/ITZGWyrJcU6iauswguiXgMY
         NtO82fSo4KmcPyxbDg0+yWJlEZ11pWJ8hBTarY00ZK+m+3zvDyatySo+xInIK6U9QIJ4
         BvgirsT+aIFb7D5F9K5Jly+uo0VmmIDHDYuGLIu6VQiLiN6zPFOen3bKU27kCN9HGDk7
         GnsvOwBIsEWCt94Vq44xxerMyB65TiT2obQrSGsefAhYKjl3/DBsU0c0WPkn5N3Fwkb7
         0qIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMyHFmunYWqhWRYak3n7qkbNAvSAQhnS7fMZ7wTSbkmidM9Cwob04Dou6gj9KoAlsn6r0Y@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0Vm4LmALZKQo799VeBCHWkf4DMZ0GxCBGT/fKFRSnkf9744Ck
	AD11wO6CE17sK/sTBL2x6oBhT6v1RMNRmok8MIOOV+L0upXtfhGFyBFhothY9LqAyHLx91D29/y
	XgA4+vvf48nRCZI5f0cZfcSLwD0aPk+s=
X-Gm-Gg: ASbGncu+UM+3Yz4qn2/IULSu5xiNj35tWrv45sHj61pSSkA+aQSliRk+xyrnwAVKA/o
	d1NwPGop/bNNNFZz0tYrh2oHNwTgqLRZErKpUVbLbQ9p2ZiS9Fvnz8Xe4aObAtX9slcx903QvIj
	MMazjVwjSgajbnPz8sOMmKZnSz6+LPTJ4c2YAuoAb6V9AryR8NlKEKlFCp8hirgMTT2JPw+zEfF
	OU/hJ9TWD27jI3SMPfQZkJFutvysVgpTcL8mmdieRoFJ4IdQsayY0iOA9eFUk98E9YBgS3j0NDM
	vIAaJb8tRlPR79URf+F72Ttj9vPbeFxmuIh0WcgphFxi44rLl+rRE+cm9hjO53Uv/VYEfM1AO+e
	mnWRrPOFeFZFiww==
X-Google-Smtp-Source: AGHT+IFkXmb/qgb/KgY8CoxXBFCqji+DioDep8k1ccK80l52uLY2VJCsOrEx4mXqL5zBbM0jkYzLAt9Oa8qgqgiQULk=
X-Received: by 2002:a17:903:1a0b:b0:27e:eb9b:b80f with SMTP id
 d9443c01a7336-290c9c9a8a7mr71999045ad.2.1760909129461; Sun, 19 Oct 2025
 14:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com> <20251018-cstr-core-v18-13-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-13-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:16 +0200
X-Gm-Features: AS18NWDXrZ8O-3KwwwBOxfZWPwAGhp3HE5GT4mOk-9o3K1qGCus24KCpGnZzuZA
Message-ID: <CANiq72mpmO2fyfHmkipYZmirRg-x90Hi3Ly+2mriuGX96bOuew@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 13/16] rust: regulator: use `CStr::as_char_ptr`
To: Tamir Duberstein <tamird@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>
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
	Breno Leitao <leitao@debian.org>, Michael Turquette <mturquette@baylibre.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
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
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=3D&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=3D&[u8]>`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Liam, Mark: I will apply this since it would be nice to try to get the
flag day patch in this series finally done -- please shout if you have
a problem with this.

An Acked-by would be very appreciated, thanks!

Cheers,
Miguel
