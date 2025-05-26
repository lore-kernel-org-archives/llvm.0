Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8383E19BBA
	for <llvm@lists.linux.dev>; Mon, 26 May 2025 22:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748298331; cv=none; b=F2pgTiTzEl7KApc4uLp1aWzi+4eqZFiRnyRxUjg8qfhGBWnBBlPb18rPPKSuYhT3vUuFrdtb7XWpqbqvW3J+kLozPaKPhaIhlF2z77Fl/0qeEwSMWFJfxgr192Fxu3FbH+jr+u/9Cy1viRv83SKLcjd6RUBmNBcFS1bSvAFy7OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748298331; c=relaxed/simple;
	bh=521R875tW8UiEALWHaEvdiVj6S1u+v1teNklmrhzE/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R0n3iZF52jVB09TVMM5ru9lYc0FtWaiceu1TIC6+RvyNhoOWPbRa+DYTJdcJirassZ7Hcxk5OxkcsoVcC4y4Jq+lU3Q4f1EsdfhlgAIviR1KL730LZ7hM3ewRmwRnWJHvrOND9siwdY8xFX2GDaX6keeb+RKRx6Fs7zt6bV+w60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3Jv0rIC; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3Jv0rIC"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32a6a1a5f6dso5344061fa.1
        for <llvm@lists.linux.dev>; Mon, 26 May 2025 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748298328; x=1748903128; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaenIVV6sgmeMP/e9IFhljAikGtRfCzZk1k/VfHMXwI=;
        b=c3Jv0rICabbKLRXPd5lHV2ivG2q7CKOPu2YHGFSih3UVBhQj7Lc0IRuuC234j/zciV
         ohwni6buK6q7oclGm6dLcWtD6qt3Bm7umYZA6VUguk4ZgwD5KYqw5GKilSB9o5hxIQdc
         wDlSt5WI4XTVrDIaYJ5PYokVuY7heSmssEkGqimlIDckLgQ/YSsSBOTOGS1IUP76bdv9
         whPwr9qNp9qGH4uSy96+2IW2oQIIPPzB6W9vmKb9irYKn9DTNH8jANTX9pWJ24wrVgvl
         hIcxzva5xGPe7kha5Z+yhosEIGEFMKYsMgiRTQpjnjFGQdrqYZzIS9HnvdeIMYquhexF
         vzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748298328; x=1748903128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gaenIVV6sgmeMP/e9IFhljAikGtRfCzZk1k/VfHMXwI=;
        b=TUA1jr/54gAs6NQdAUJaFnRrS+MXjAOPtnICjqfldaVYyQwDEklMqAwuI9owrXdEFN
         oq7DdoG8MBWxyYjeZF1LL1fAOVVZwm1QEh+DxqMDZwvc9qx7aF1KEfSf6oq7Vlm9VT+i
         +unc2X9tvkM9eumwnei2W31mHAU6F1vscEmhBlyzE7lR2bCNjs1ch7rVoSCqKfl8jQII
         0zA5LWvkqyysmOGjmGN3cjnGMPTMVdjHPwm0hojKceWazFQq4AeXudQmfyHAnGs8biX+
         mGSo7CvKiXHqtWLkFBr7F/CONKq0SPAoFeL9gqYlTmkI28yBcHz6ui62c6e3m5VgyZ4H
         668w==
X-Forwarded-Encrypted: i=1; AJvYcCVyOoQRapG9r2IzvncQECxTe3pCrLICrSXxbNEANfsTAnR5n382OXhB4zqRCAGQ5Sssp/Sw@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9Ql5gws5UnUUnHrbD9ouTCFKwdfPHIflY7C5OfTFPJWTWz4Bd
	oIQzd+oP+zAXH+xMFBK1TCWY/oeb81MKweGqykGdbiF+YQEq/69+NjDzO9erJkyXL8OK1TMKxgr
	qX63HROASdFNRtleH9z1cPEG1/skPCb0=
X-Gm-Gg: ASbGncsTQu9wG21v93SBa6BoLdWNQIXa/X6NxqidMCy2Ny5FU2pH50Ip/nZk8Utj/Ih
	WD2qrKIP5mHBgxvyOFNq+7jK3uCEpyUfQNgxWkCNo9RNnTjC4dYHyqkPPY5JDqwKThinsx8VBp0
	LfDw1In25/9qTxeNgEUoTAUE5YxQsuM/e/nrLg+zjVWeS2jRaQXSFTSc96R9O374hTRKzqfTkRu
	iMmYw==
X-Google-Smtp-Source: AGHT+IHcv7V2oazwv060W33dscTDl7PPQ1f7noMTAF+hm0IKskzHzh7MX/ZbURWbHci8ZixnjxyyZuMa+2GYUXijkPI=
X-Received: by 2002:a05:651c:1603:b0:30c:719:1145 with SMTP id
 38308e7fff4ca-3295b9f1d37mr26288281fa.17.1748298327492; Mon, 26 May 2025
 15:25:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-3-6412a94d9d75@gmail.com> <DA66HHUA8ANF.BI2FH7POFSRJ@kernel.org>
In-Reply-To: <DA66HHUA8ANF.BI2FH7POFSRJ@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 26 May 2025 18:24:51 -0400
X-Gm-Features: AX0GCFv_2H01vKjFOD3wQrlp_6f3fi8nlSDpIGif86GknHm_bqABvjuTuytW9u0
Message-ID: <CAJ-ks9kmDiOV_qH_s-r4Z4iQf2k6H7ZnqOf5okaQxWWxrj5Deg@mail.gmail.com>
Subject: Re: [PATCH v10 3/5] rust: replace `CStr` with `core::ffi::CStr`
To: Benno Lossin <lossin@kernel.org>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 10:56=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> > `std::ffi::CStr` was moved to `core::ffi::CStr` in Rust 1.64. Replace
> > `kernel::str::CStr` with `core::ffi::CStr` now that we can.
>
> What's this supposed to mean?

It means that kernel::str::CStr was introduced before core::ffi:CStr
was available. I didn't check this before, but it is indeed true - see
https://github.com/Rust-for-Linux/linux/commit/faa3cbcca03d0dec8f8e43f1d8d5=
c0860d98a23f.

>
> > C-String literals were added in Rust 1.77. Opportunistically replace
> > instances of `kernel::c_str!` with C-String literals where other code
> > changes were already necessary; the rest will be done in a later commit=
.
>
> Similarly this, the message should explain the motivation for the
> change, the change itself and can include additional information.

The motivation is implied (that using standard types is preferable to
having custom ones; this is also implicit rather than explicit in
https://github.com/Rust-for-Linux/linux/issues/1075), but I can
sharpen it.


>
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_panic_qr.rs |   2 +-
> >  rust/kernel/device.rs           |   4 +-
> >  rust/kernel/error.rs            |   4 +-
> >  rust/kernel/firmware.rs         |  11 +-
> >  rust/kernel/kunit.rs            |   6 +-
> >  rust/kernel/miscdevice.rs       |   2 +-
> >  rust/kernel/net/phy.rs          |   2 +-
> >  rust/kernel/of.rs               |   2 +-
> >  rust/kernel/prelude.rs          |   5 +-
> >  rust/kernel/seq_file.rs         |   4 +-
> >  rust/kernel/str.rs              | 358 +++++++++-----------------------=
--------
> >  rust/kernel/sync/condvar.rs     |   2 +-
> >  rust/kernel/sync/lock.rs        |   2 +-
> >  rust/kernel/sync/lock/global.rs |   2 +-
> >  14 files changed, 112 insertions(+), 294 deletions(-)
>
> I'm a bit confused by some of the diffs here, they seem pretty messy,
> any chance that they can be improved?

I'm open to suggestions. I think the confusion arises from git trying
to keep code from moving; fundamentally much of the change is moving
methods to an extension trait, which means git has to choose between
keeping the documentation where it is, or keeping the implementation
where it is. If I use `--patience` then everything moves together, but
then the diffstat swells. Thoughts?
