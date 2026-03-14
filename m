Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476E325A640
	for <llvm@lists.linux.dev>; Sat, 14 Mar 2026 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773489511; cv=pass; b=ANQcaln61VZfzOVbFB5Al7FfMfwxgDKHymgW+2dqlpUlvKpW6C18NTm6V7HjaoI92ce7aJ9S/HulACDBjWyCdL0HrdSwdZPV+szy7Kh4I+pf+wn2+VvU0Zr0VghgTaGlsflTdsV5wobJC3oxZsImfxnjFhZFw+XEwAlvG4JWtkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773489511; c=relaxed/simple;
	bh=tDUhjLbO8rNxXQmgp1rHTtbqYnNDwW9KMFRsKCA0ywM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+GExK1m86BQkAyIk7nKUX5dzQCnTlc+dQGTIp7Pofd0hh7hwDyoh3/2iZEfiYpwEwNEZ+wrcd8VzQAkfW5Y1HSac3lmEWfooJAIcBMMJsGbWL4wHk2JIWWHZHqNyF2FHODrzbRnLLRWi/bEtivsvyEXMvbfbVu/ZZUnn3OtKQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E+GuzajE; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E+GuzajE"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b78b638eso3216024f8f.2
        for <llvm@lists.linux.dev>; Sat, 14 Mar 2026 04:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773489508; cv=none;
        d=google.com; s=arc-20240605;
        b=OJbcbcu7487pP2poV+itEmkZ9uasn5GpQCtcAJ06gBF5Ow28Ny03n/zTEg014RxBvE
         LwvbIrtS6QsBKyuJrmArwKb2auJESbgpfw8ikTyJ2Nu0rFg5ExC9jAxJdmh2QdKgU89f
         n/uEhsyfsfuGXAZNUZR/P+n6sS99qLKN6Vvgw17fsNpJsBSq1n19kPSmGOhiM4efhv/y
         vEWtl5f1dYvhZkhsGUhzSyPU0caZdL0yKjJVNFnEvb3ELP3o3sWXfz09uXl0VzSs1tPz
         hjOhBOrewg6Lv2/gDK2cAAT5G0dh9LQJDcO2BqMC+++3+OHWHdcIFSn7M/xHmhNFaHEL
         kfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDUhjLbO8rNxXQmgp1rHTtbqYnNDwW9KMFRsKCA0ywM=;
        fh=KoablrBHkchVZWmco4UuIazZ5hJZ+vqqXF/eEEvhqFo=;
        b=eq8gjERSadpeFmPVPOZGqR8UAj65/LKcm6a48mnoEi5rn1gn7HOYk+Dw0F/KpJkJ0e
         gSAfsVUdx7zloXKqG6ROOT+8DH//HcOO9kUsXFaKALWocz/B4COUFseS5zGyDWw3E/DZ
         Gqvza7Nz3nGuI8AUdFpoYfad4BHkYD8J2sV0yUhWPiZw9uvGBY7OH83M8/ioWSI45tBf
         8mVQ+l0kBgtraSuWDxtZ2Nl7fswM81m5FZTdD0beqWsn2RaLs2On8iJ3+OMEDLYeHxtp
         GWNM+ZjTGL6gPAuRmuiclqKCBVbo8dvb6LrfJ4Jb0tRyQIlKaWyhHpFkYkVBS0iCjg3D
         B54Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773489508; x=1774094308; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDUhjLbO8rNxXQmgp1rHTtbqYnNDwW9KMFRsKCA0ywM=;
        b=E+GuzajEKXhFCLdkNhAHAAedtFtwz8e0TPtW0nwLF4SRuEJPBRJ4vepBUkABM1tx3w
         Vg4195D7YIWPXVLqggTmVY5gqggWS2rfddyMO68JqG5loabWubGeV4XeJRF1UteS7uDD
         X4paTN+v8pl3bQtcKmiAXp+eDpS/1YPvq521rLspT+G7Cyz9CBOQ6WobQlRg5d1fCplK
         XFVjXIqrzQroYKobnq7Tao35T6RQm5TbN0CDLzfgTMgLC0yupfH+Xs8zOLcZm73uVU8b
         m0n+CMN2C3P2N6lxu3HEdL9yUiKAA9FP85l+DRBRTOKLFAjZJ3qWLfko3PNyHCLYAneC
         OdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773489508; x=1774094308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDUhjLbO8rNxXQmgp1rHTtbqYnNDwW9KMFRsKCA0ywM=;
        b=M8qNVBhD54fwZckziUVN/gVMvVJ5Vozf2OpaA7+lCMBW5MjFtrfaYSpzBJDH0K3o4K
         nq7TnqiKMEkoknNH3Q93HubrnUELtuEIZ+WIQd3zPnakaVZcltgPZnX2bXBE3SGbRWp+
         5zUXyKc4Nq1LDftUmKnzYXn1xiTvQBDOgv513lTN2IncB2YK/NLt+b6tWaBIRHyIrsuA
         GAdeJs3spKNRw8T1E8iUOXua97lM0zi4/ZdszxZ/Yu3mx7NhpeTKxX2uWerx8Xy1WPWC
         w787qv21JW+9xL34sQRclG4aTmAtN0i/5NN3h2SPyqaHJlAVfnYfEh+JrWVC9ElyySUw
         Ouag==
X-Forwarded-Encrypted: i=1; AJvYcCWu5cjfYd4xNEO/BkvNy2j3qa/rm7UrQyHuWZ4Om8x1iR8Z8QtBkAc3b9lwwBs2mhkaz66H@lists.linux.dev
X-Gm-Message-State: AOJu0YwFrqItsG/Re8v5vFnzDU78TPdsR1iuGkI8p7W7C1rqQUADBVt3
	jKglI9UAX8lhaWDQY4XRZIWJtmFzlunXZJiH7OTM4ro7YAV9PR553T2eV+dRw6UC69wF/ZjQhLT
	TZCMGrF/P5Vz3lqDtoJb+BRhwKf+Q7bbabNrBQYsw
X-Gm-Gg: ATEYQzw6v/ZDMnWFoUqdi3k3C/25rclU94NY1iDw1YSuyM6k4nXBG8bDwVuRdVIQrLf
	U3YzDMP7gCWer9q3vJ9QGdHLfk5InzNsijZsPBWzqwCHjH9WRUMAzT/umJ6I0gfmeDsTk1MlCMm
	gprdYfCEH1dlzHuVtan7J7y7i8ge0k9ZErTVTtM2P9Qpu+BRL7SqE5V2pTdUCAznYwqzmMTzwO/
	ApTZxEELjDXagZlOWBxg1xO76d8k7S7UvmQM++MPNVfvkWhn7qVa5LnXdjAKvcabS0HXla/9zmw
	xWL7zT7HesB5q+mbN+vCF8FZhEMv6X021b17Xw==
X-Received: by 2002:a05:6000:1885:b0:439:cd8c:209f with SMTP id
 ffacd0b85a97d-43a04d87c31mr12531040f8f.23.1773489508090; Sat, 14 Mar 2026
 04:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603121235.tpnRxFKO-lkp@intel.com> <20260313213638.GA147391@ax162>
 <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>
 <2026031422-catsup-rectal-f886@gregkh> <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
 <abVG0JypVhDxx1Tt@google.com> <2026031444-wriggle-tradition-245f@gregkh>
In-Reply-To: <2026031444-wriggle-tradition-245f@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 14 Mar 2026 12:58:15 +0100
X-Gm-Features: AaiRm53w--KuwJ99Osd9jUt6yvtILxF4awX5YKpSHdok6ctk4q24IRBVS1ZMNeo
Message-ID: <CAH5fLgjruspkrLagRirzfDbq=k3OEnA5JBLY-BNXMD+JsJam2w@mail.gmail.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, kernel test robot <lkp@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 12:53=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Mar 14, 2026 at 11:30:24AM +0000, Alice Ryhl wrote:
> > On Sat, Mar 14, 2026 at 12:15:30PM +0100, Alice Ryhl wrote:
> > > On Sat, Mar 14, 2026 at 12:13=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > > > > On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <natha=
n@kernel.org> wrote:
> > > > > >
> > > > > > It looks like this is a conflict between Alice's "rust_binder: =
check ownership
> > > > > > before using vma" [1] (currently in char-misc-linus [2]) and Mi=
ke's
> > > > > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unsta=
ble [4]),
> > > > > > hence why it was bisected to the -next merge commit.
> > > > >
> > > > > Thanks Nathan, yeah, adding a raw pointer (not function pointer) =
to
> > > > > the struct makes the type `!Sync` in Rust.
> > > > >
> > > > > I assume this is best handled with a patch on top of char-misc-li=
nus.
> > > > > Perhaps creating a wrapper to assert it is `Sync`, since the
> > > > > `BINDER_VM_OPS` contents are unused (so far).
> > > > >
> > > > > Cc'ing more folks related to the commit.
> > > >
> > > > char-misc-linus should get merged into Linus's tree "soon" and then=
 we
> > > > can fix up the mm-unstable change for this.
> > >
> > > I'm working on the fix as we speak. It would be ideal if it went into
> > > char-misc-linus, because the commit that is wrong is mine, not the on=
e
> > > in mm.
> >
> > To clarify, to avoid breaking bisection, the commit needs to land
> > somewhere that is on top of commit 8ef2c15aeae0 ("rust_binder: check
> > ownership before using vma"), and before the mm commit. But I guess
> > there are several options for how to do that other than landing it
> > through char-misc-linus right now.
>
> I've sent off a pull request for the char-misc-linus branch now, and
> after -rc4 is out I'll queue this up on top of that to get merged for
> -rc5 to make this all work out ok.

That works, thanks!

Alice
