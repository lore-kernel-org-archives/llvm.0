Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E562F5A0B
	for <llvm@lists.linux.dev>; Mon, 20 Oct 2025 12:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961692; cv=none; b=Zyc89BQeTElttNiqu1GKCUIXkgED/RP7Y5mEv1n5WLow4vLMZ6zshwOUmMyjylp9gRAAzUAYMHK3kTBDcOU2UCjPwaxvzP6NjiAGew/sUmVoEZIx2W9dUnLKNDz+WTqBd6U2ebW/eqrwDvQlhgkeeqQR5/am7FwfcAoNIi9t5QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961692; c=relaxed/simple;
	bh=nswVLSlbYyIVmMcPMj0v3iW0yfGwDL9+Y9cKMGs77Q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vlzr7wMXt1/qdNg1B70Wz93mGryH2Xy5f30lIqgKd+l1C9YbdW1omLczsqGw2NqMFhu0cJomyKsvnQfNsVE/sAaucT6o5qadu+F610EnS1scvGQExXOxFUeto0zcDhlvLNRCtSpb6RaSZE/q6fY8kNpsAyikafdIszgvEyT43Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8YNE3CA; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8YNE3CA"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3778144a440so51182881fa.0
        for <llvm@lists.linux.dev>; Mon, 20 Oct 2025 05:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760961688; x=1761566488; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDBqBQPK3W845ufeKNd3TWXFM3Y5p/GSoX4pSkk8Wtg=;
        b=P8YNE3CAQEH/9aveyQHZzEq7aFwhqS0jJMPWd3dVIv/SlKzcI0LFbys5mRVeAtPbcE
         MegDrKr0n0bcdiLMCoVRwB1ZEIUskO/pmH8PwGxyiXCT8P4NesQrpwkO9xymq0dmVQHf
         Nk6tVoqiQnT7I8yWiLCuSNbq4h4ZHWpUVCqJk33M4BbAao3dPUsHKcyHL/8DPaCFlxBS
         x+RLiWEcDZ86CdSU16y5PZzRMUTmBRx5CpjqC5UCPyn6Dz6XNIxZG8mYEVGmdDhqdo6C
         thH2d0dGOS7dVQxXFCDmQQpMKn0LkOk1O1jqIfxNkHmjiPobfayrqYSFe4qiMJvyg1B6
         cp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760961688; x=1761566488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDBqBQPK3W845ufeKNd3TWXFM3Y5p/GSoX4pSkk8Wtg=;
        b=rjNKHAjYRRtJ9n1ebp6gQu2q1bCWZWeMFPXioDNphqV+82ljNTOReAv7O/KnPr4kRs
         VieX4iCTXwHa5Dvw7z/itAUKge89cEYA1Ub1b3kPQhxCQZEG8QiONcLDoHQj4yq0Kmtd
         RwmyScuN7XS1+7CF/VBREcrEd/JVy8K6uujcNVNmNt6/ZY+Fc8HrDbQojsHGz1se/P0Y
         6UQGGlCEQQbSaX5BBTRddeBUMzwKZYm0p5E/+Mj8bXmfnjOvQV1xYYaflhY/to3ay1xP
         XvZ9WKZDFBbM7AUeljwevz2JnpGhK+ZONk8hyz4H092oNScyvEfjCf6MUDOq40PSgMJg
         H7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTNMhCsiVqZHt0JHH/8dE6Ff0WUOMynxXx/ArCl9t3wvLIqjLgEoqcSuY/hOzJg9K1rhSW@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9JgsYE9304Wls6gzH/BaSxAEXTJh8iWtkd2GzjRzfe6MJaqbA
	B3ts1hMPBKzNV+pUxbHE+0DD/fAqKoOt0BlwJDp+Oq2OTSk+cqHVLbZX7O4YsT7UWkYFZGYbovw
	Nd4qe6Zh9908ilZKoX2Sr052/cmMHh0Q=
X-Gm-Gg: ASbGncthidACxhfRxNAeUj0HBTgmlVgBsv+USZ29q9ksjvdsVs71uScuAHFsJptr9NU
	/7kMsmt90l+nFvAYVQT6CWSgZpDHV8rtj66fUAmGCPVsc1e6sn0jFcYs2a0/RVGdTKsljiGJeLd
	D04BW5GLSCtk9Ti/X/BDZ04A0kXBfHuFM8VMhVlYsAd8P+JH+t4kYpmLg5mghfoSA4/wsiQtkff
	cJoU1acbUgz2zbTtCbHpLHq8QVHDwQFJKnIN0rFFwhMwuQo0wDPEOW19cdAZTDfw4CGIwUqa/Fq
	kR9gEumqVz+O+FJ74U0pe/gI1xaJDjPhQiG+jYcQuYlx1l6o9+dg/EOAO9jphkvoSwPqYb+6eYi
	V1xFTrgA8ep0+fjWuAVXJZH0HccfK4Bc=
X-Google-Smtp-Source: AGHT+IEhCuohkwKfudrL4ecEpqT4Pm0eEKlOvtKN3vUBgHr7QNfd5MrUBwC1sgCPBzz/Uy3S9ZB2EUGsXRcV/xV/m8c=
X-Received: by 2002:a2e:9a14:0:b0:36c:b120:37b6 with SMTP id
 38308e7fff4ca-377979418femr48975661fa.19.1760961688121; Mon, 20 Oct 2025
 05:01:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
 <aPPIL6dl8aYHZr8B@google.com> <aPPJ2qDhxXNh8360@google.com>
In-Reply-To: <aPPJ2qDhxXNh8360@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 20 Oct 2025 08:00:00 -0400
X-Gm-Features: AS18NWAW7Di7K5boBLr0jIlvVCdIJykxaOqzRMhRONzgEFu_niaDAXaU_M-718U
Message-ID: <CAJ-ks9=VJCwKxZRyDHOb7Lun-BJ3tPrvbscpo0XkykmnF_zfCg@mail.gmail.com>
Subject: Re: [PATCH v17 00/11] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 1:09=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Sat, Oct 18, 2025 at 05:02:39PM +0000, Alice Ryhl wrote:
> > On Wed, Oct 15, 2025 at 03:24:30PM -0400, Tamir Duberstein wrote:
> > > This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> > > have omitted Co-authored tags, as the end result is quite different.
> > >
> > > This series is intended to be taken through rust-next. The final patc=
h
> > > in the series requires some other subsystems' `Acked-by`s:
> > > - drivers/android/binder/stats.rs: rust_binder. Alice, could you take=
 a
> > >   look?
> > > - rust/kernel/device.rs: driver-core. Already acked by gregkh.
> > > - rust/kernel/firmware.rs: driver-core. Danilo, could you take a look=
?
> > > - rust/kernel/seq_file.rs: vfs. Christian, could you take a look?
> > > - rust/kernel/sync/*: locking-core. Boqun, could you take a look?
> > >
> > > Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-v=
adorovsky@protonmail.com/t/#u [0]
> > > Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> > >
> > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> >
> > You need a few more changes:
>
> One more:
>
> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> index 69efbdb4c85a..5489961a62ca 100644
> --- a/rust/kernel/drm/ioctl.rs
> +++ b/rust/kernel/drm/ioctl.rs
> @@ -156,7 +156,7 @@ macro_rules! declare_drm_ioctls {
>                          Some($cmd)
>                      },
>                      flags: $flags,
> -                    name: $crate::c_str!(::core::stringify!($cmd)).as_ch=
ar_ptr(),
> +                    name: $crate::str::as_char_ptr_in_const_context($cra=
te::c_str!(::core::stringify!($cmd))),
>                  }
>              ),*];
>              ioctls

Thanks! Sent v18 on Saturday. Those `as_ptr()` -> `as_char_ptr()` were tric=
ky
because they relied on deref to `&[u8]`.
