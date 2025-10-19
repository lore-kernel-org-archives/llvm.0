Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAB422A4D8
	for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 21:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760909134; cv=none; b=enVnAfNMVElPlKbxHzt/5ObGsPu0IWf8taKeYyM+ggQXVWumZ6eYVPHrHxgC8Hrd67CiiMMyFwA8YAw6j2L4p68Mi9Ol5TaRPBAZ0L5rzdEER2ffR30WwGx/lyABUjiHCu1EMYi92KcnnKtsEGKpMtAMddL50PoGvJhqO/F3TOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760909134; c=relaxed/simple;
	bh=ycAfcyNNCDvL8r+cj6EK2T80BYm3/AHXV1y+txWFqzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGT/ZW2klO1WyILao2TLFCyAKYN4+dKsfkRNwqPJ5HCqILdFIIKDxpadiz/5Q1uIoYTsy2cvyE8rTMvZFyTmBsr25ybF4PP/ehFujPosBPQxMR0RPvl2Tw1ZBExbUDRwvXn8qzlJgJo//D1auBAN+hi8mxJbQMaNwzNxs7bO6Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQ4Epwrk; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQ4Epwrk"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-290aaff26c1so10500425ad.3
        for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760909132; x=1761513932; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycAfcyNNCDvL8r+cj6EK2T80BYm3/AHXV1y+txWFqzI=;
        b=NQ4Epwrk5czSib8mhCNZq9C4KL07DLHjbdU+qF4wRpVVYIbJxg44CvgT3LMfFg23Ky
         VxC97RHUWzplEgbrtkUQjKMMBP0FwfJBCLIt46L8CyhEjKA7ahuQiQ5mRIOF0rDWtiUC
         /PbDp5+/T57qi4jL838gkqBzSGj9BMhIa3CpsA4VwRY3tQdzWr4t7r7wv2sLMOMfm926
         eTY28DV+WvgAWTfxa2QwHKBZpEskAAyD9sMblUFJah+FBU9IvYmS00y5GYg+BSFrU7JJ
         x+SiRjm3Jp4EUHV5xXLQL7SPOHEpzVEtGD0OY3HZISGCG61/p28NKt8bP2auDEG0Hyrt
         juCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760909132; x=1761513932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ycAfcyNNCDvL8r+cj6EK2T80BYm3/AHXV1y+txWFqzI=;
        b=jS1mvESzwY1TcvfA27ABeYB7XjdgT3DFQvq8I3yxvS3FVDjPkTQeInYidnpKvJIJJY
         8477FZtUhVbV5UO28+0AJjjtVqeSLzA4c70QUSF96dt+jua6TpRCnZmtZ7CAHy76MfmK
         8lAtrrxHdebPCX+h/wlkd3nDQu/kgk/m0DlsOrN5+7iyG5/wOLYlJhG55u5Atzxwl4vm
         ZOpl9bzoiYL7/LuJzYOpeAH+15kTECygL7/fMzdr6oA1LF3g1SAXMM1x7+/aW0PoggBj
         YoU2PCd4Hl36jeTtrv+FB2oobIzqbPtKi/+DT6WO2nyDbYm/IZPxDiwx1qdWb02jW3bS
         1pLA==
X-Forwarded-Encrypted: i=1; AJvYcCXo9f90cPc4uLVzUNIxhCPFN5BDUi0ElP/MsSwtbYZHIz8qmVd/anNxEyXG2BbW6O794qNY@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9N6pLOqvHssAvBfKD6Lo+q5KQKcUFaLlT3c9tywoUnQR5MCyN
	c6d5ndP/5+LsLndvpPHSoSAKrFLJxvytFh9satRPnxT7jAlxwtHP3Bu9CEhrm57tbCg/2vCTun7
	ElDOg1sXVOht/7NQp88iWSDm5QXOk3dk=
X-Gm-Gg: ASbGncuyNYtt0AVG4tMA5Bl1WsK8VYAtJeKpoeB9+x4Db2eActKYBglgp6yRawe5ps7
	l4wuEwMu8dua3h7tXNhjsFs/EUgqpcmpPEei7LrJhIUHO9nadyHWxE0oqfTgP9yVHIa9AGjbivQ
	L0TaMrMnl2kcu2RL6E4CkQ4SgaH/tnytfpzLoi1A+A+zwLsuu8xySrYiE/UcgDtIAvWB3ZiS5eF
	z98j7x7Iz4nQjlUESqKak9ACtliaufSk9rpig/AjSmvDS3X0QIWUuXSSyXJ+Ywd3PAcCIoppfOf
	z6B0CKdYlaXAj8NGlTTlo3QuxTwGaHD2b5zctme0IUnbDnFaEPvEV7ir2CxV9URGxAbdvfV1Lz0
	nkl/sM9SkTwFl5g==
X-Google-Smtp-Source: AGHT+IEqij5v9mJs5/CWA1m9c2NrE8PMDKfGOLkkgvIBrH2S+dVqx6DMlKfweKNo3iNjtFuT7Y5fW/l69CjJHY+CKa4=
X-Received: by 2002:a17:903:b8f:b0:290:c5c5:57e6 with SMTP id
 d9443c01a7336-290c9cff139mr74090165ad.3.1760909132458; Sun, 19 Oct 2025
 14:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com> <20251018-cstr-core-v18-14-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-14-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:18 +0200
X-Gm-Features: AS18NWAMycluR5p3NBfaTwCbAsRiC2-Lwc15QqFISNzvPKOcYBFx7NoYnd__ov0
Message-ID: <CANiq72md2Gt-UUpPdnoOimUW8d+M8Wp=9jDTZ47NzvruhfP6+A@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 14/16] rust: clk: use `CStr::as_char_ptr`
To: Tamir Duberstein <tamird@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
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
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Breno Leitao <leitao@debian.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
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

Michael, Stephen: I will apply this since it would be nice to try to
get the flag day patch in this series finally done -- please shout if
you have a problem with this.

An Acked-by would be very appreciated, thanks!

Cheers,
Miguel
