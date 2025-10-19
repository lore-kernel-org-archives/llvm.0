Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1A119D074
	for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 21:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760909237; cv=none; b=scJMVRviosJ5oOi5+zConn+p7QO0WFfuhoKZqNT/KnSDyEE6Nk/vPRAkDHb8Bu7QWhN5qMXi/bhry5+lzGqr9oURI1E0ubYOqwS0zDaBVxZZXdqKALWeRcWfbKxctEDkYZS3r5JWBWoEu0oN8t1/YGyzBE+ip+9b4YBQCiSAy9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760909237; c=relaxed/simple;
	bh=7QXi4ECa31zhkm3BeJtv7O0uJSmHaXRwVyarc11pYYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9BL08mVr/q8l2xx9QGt4Xd+fCpf9i/cAkISyuE0b6Ly1CjonHa/vGWrEqa1coL40mGvPXgDzpQBvfZX41XiCq96UGoMw1Swl10/SpD/3dhpTfW48xk6S5B9rMcV0dP2QhNqd4T2iWs4kWQgJE2BgU/VYWpWBgzwLJRRTrrHMQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1gpGsVu; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1gpGsVu"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33badfbd87aso900162a91.0
        for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 14:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760909235; x=1761514035; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QXi4ECa31zhkm3BeJtv7O0uJSmHaXRwVyarc11pYYg=;
        b=g1gpGsVus6gjntyRyJvqQOn2uMenTwwRBjz6VfT643CI5Djoszqji8O+8km/GF4LkJ
         YCvOoqha8awyyXzoWHVfAnS3BsiSBOFbulYQ0R1aj4wbAkRfDBH2apldSXguW0QcSoLZ
         eWm6gMgttL+qZxw65bv+65gB5fPYphwX5hs01rAOoCj1RcclITYZ/WUSqUZ4UaQ2oTMs
         p8j7EHfIIfLrz1Le8qHK5yIEunkdGw5E2ctluPtXSLgV/CFeoe30U6DD/SZcWuZG5BTx
         PfTnmwVr/CN7gawsXkfF8hAHAYQETVf+fFj3Ccv5WXQeiEsE2FpBj049GRJgvRqfnUjT
         W2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760909235; x=1761514035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QXi4ECa31zhkm3BeJtv7O0uJSmHaXRwVyarc11pYYg=;
        b=BzbroTlSY8OGa0OEt7sY1MCv9vBn3XtJeZU0f4WsP1ELYXhKRwoQIEXyf9HPgyCRQt
         +JCK3kFkZ506oOg/icpq6SvzZxEr47Ga9h5RjjUK9sawXaN/CCYQc5cnt6hPwkdPlwHS
         uDuCCA3aEaemeaTwG1adDVjM8Xb6S5hfELLMF5w7UY4dDkbxVNqI/VXqK8X0AZqcBOvD
         j4UE4LXnWXHTHWO1U1w0UofzUo/x+6zYeZHx+Sb8w4rcWqJRP255ktGFrLsjWh4J/GFI
         GUhS4QAr5AcPf/N/4mLUASwGvBXEXSFiOtCjbFqVHzG9/KhEzjiR5OxitK0WZqHbfAlb
         mrug==
X-Forwarded-Encrypted: i=1; AJvYcCX+OTbisbR4pRCsxBvGWrkBZYjn2gcW8lm1x/k26AtXVm8ru2Ku4JVvtVl1PBJ8tkZ3Sh9s@lists.linux.dev
X-Gm-Message-State: AOJu0YyfuegMXB6tuVeATYITPWSt2p8iX8WhiZLfaeEDXcP1LZiSAKQe
	48/pB0VOJiXfaCCCburCmM4myQyWjX0FouxJVdL9+kQSKMzfVNUbl2phRtOxqtb5/cAQF9sSXEY
	KGTHpZAnUsCQZhUjA+OOYPw921y0R4hk=
X-Gm-Gg: ASbGncv3Ox3NQEH3o6639nrpx4qDgxfKNtwwdZ/Tf2iXWVz6L5LgDO5/GzD2CQfSigW
	P6ZiU5QH05eguAaQnvVBInsB+SvYzb+Ie30nDFdUqpZ8wntG/ExuIbLnxjCEeM2Ta/ZdVKShCjs
	e5CVj4C5oXmdsGMXw0FK6y+2pramiTGk71/jqALXrBV4RB7dnk6qPHohLRLl8X2h0zHCIyik2X/
	L5weBu3WM+LWHuNHCkjOzAedwfA0bnv9HbZFHCfHOU9rPxXz5tUU/p3Uvja+29mu8HZnDNDVkz8
	cW4OOLaOMtI8ZDMC4I5IyD5MUXqHLfVm1zdTUlhVoQZn5bB6aiuaiR4aRlk4U1OuWl+eoB6aFo1
	cb9hxYWXNPbT4mg==
X-Google-Smtp-Source: AGHT+IF1VFFJwy8ygSX6eoBXAmkQpi5ZSm3xG9mAwnAEV9eBFnYF+NCv7z0G4tbtRrIxdCU8CTeu9qRXC9i913/SiXw=
X-Received: by 2002:a17:903:2f87:b0:290:af0d:9381 with SMTP id
 d9443c01a7336-290cba4effcmr71823605ad.7.1760909234948; Sun, 19 Oct 2025
 14:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com> <20251018-cstr-core-v18-10-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-10-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:27:02 +0200
X-Gm-Features: AS18NWD3K-E_pn_Z0H-XvvQwoMFJQoy6QnxlKg55_WYP1vw1bB7QYmn04Fruiws
Message-ID: <CANiq72nTRAW17RRKHjdfmy-HQk+31vEHyksOs8XGZZKBY=54EQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 10/16] rust: opp: use `CStr::as_char_ptr`
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
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=3D&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=3D&[u8]>`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Viresh, Nishanth, Stephen: I will apply this since it would be nice to
try to get the flag day patch in this series finally done -- please
shout if you have a problem with this.

An Acked-by would be very appreciated, thanks!

Cheers,
Miguel
