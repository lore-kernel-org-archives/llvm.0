Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ADA3E3DB6
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962301; cv=pass; b=jt+9aoTdG4Ea7qzDbhgl6hR4GI6Gijd2aQ+xs4Cz0g+UEqzjch+PUQPcLeaL9bMl97JQd2ZrKvfZE/NyX2MY50sSIm49YY0Ukwo70S9Wg0YbQyHykLzXcAN2CGN7Lxojdfetrl1UOm08gsJ4oF8Wqkamqxk/edrQQiNi5T/b74Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962301; c=relaxed/simple;
	bh=EXe6ByVFgqHK9ot4yGzQ91DO+cEJ7cxXfss2LYdxr0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0JcUu7/XNPqN1iCLyhydexGlwOePFDDaAM1V40q/11zR/rLXkwHL3Z8B8Wq0bBJklJOzpzqimGWzbAPud+z/VBSfVOX+ktNVIy0DkDnxty8inoTaIEqsDWRtKiNb57yPQtsdilAZcBp5Ecv3xqTPzMjf7dcRfWwBzonValagdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p9GWVbMT; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p9GWVbMT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483487335c2so60889105e9.2
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 06:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774962296; cv=none;
        d=google.com; s=arc-20240605;
        b=aHlEY+uxHf67O7SaAJgXK4iZJskM1LX9RLsLnkDLTKOJVUhAF2HjZMmOft17mJdXLe
         46++WEwo9BF+RALgn2D3ieagBLys6Ch5H6ao4lZRamvdMjdlZ+bfeIsV3E8Hid/OfNLv
         kqPMJsYGr+w2Gs7hizpBJJbWp7YIZrEdB28c3d6MEukJZhldSk0CmV256GNJWTGN9SzZ
         2fbFiOhgs2WuMHRWAsepQUFC8gNvwOw+kZswk64lyS55pJtro4z1a/so+uOtTLPvspFJ
         uhcrn84ZiqzUWBxJaUYbaV7EcWVG3DIR4FLrwNW56MosJM2fOBCH3F7TbfDnSBk394h5
         m6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EXe6ByVFgqHK9ot4yGzQ91DO+cEJ7cxXfss2LYdxr0o=;
        fh=BNXtxrJK14ilV3zn7gN/VUVSoPyeVfxMbAu4sirwZps=;
        b=EM1v0G33131bZhqIjHHxckz+KrNUGPXrs4V4+rt1DCAsHY7D5XLoQxvK8UTcSmJ/Rg
         UujeIQEA6IFXavseChRzgaGoiCL948JSVOetmIVovgGsfJjaBOR6NbkeEfhOwRO7Ab33
         ursz8G4mvJHT091nfwJjj7FMjfy3BIu2YtEMnsqQd/mNQEJqf5KM8pe5JGRNU4C6OCHx
         mDzDurZdAWSDXaBgyyU9lnOjyq+TUlMoVtFKzkum/0FmE+gbl2O8Q3roK+CJU3QtNNi/
         IyVx4Su3w4A41jeUzJ1XaOeZ20GvkQPrYoZacTNpqqALxqRiNdJehUnfpj9gN3V5tD8N
         kg2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774962296; x=1775567096; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXe6ByVFgqHK9ot4yGzQ91DO+cEJ7cxXfss2LYdxr0o=;
        b=p9GWVbMTk1InVN5llgD/gfW53Yoq+yBCsbTP3b2gxViBYM8b4Ed0UiZ9kLoBDBo1Q3
         J1StSlMSE38f+B9t4R9tnhQBKUu8hh6+QzevotQZZT5XCVgNLuQvanClTE+YjwWI2i0F
         EBe+mGZD5pm2Xod/GG1vWQj34v8X2As/445h0/SIBKBn9k0Jixt5NydcxXgOa3AUl4uH
         au5wyrfS8dH0E4IDx6s1P6XkH2i53b8ylBC+GwO6mNj5F9Hr6ISUV8j5ULyOSj7LaQkz
         g2Qc6lZG3D+nPs5Ft6amsqW9WyUdxvuT2znqxpkKZ4P91XNuk/IcsKjDvCllmxIJk0VM
         jmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774962296; x=1775567096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EXe6ByVFgqHK9ot4yGzQ91DO+cEJ7cxXfss2LYdxr0o=;
        b=Mt7M4vi7JP3C3Jrq+Llc/T+QmTzRBHbaBHxO+JiXcDh1Zav64/AcKLC017z3iNib7o
         3yTfcqVa0RVG53j2c6aaUiRo07Smd1XU1zSNuMq2guotpeYs5sQOZiz+XlrsiN/9uXZt
         ZLTuBn35Wp+UKUubSXO/cKOlUPA7j0eOv7iQP8PEtXzx9MjUpGde+yvlxPY0pPRx1doT
         Zv8fc4At3+GRiWkGUwgn+TleLlFLC1MWGO7q0TzcIzjuPUwZNBEqEZcoDsY3kk620gx1
         JBcjwo9rrFrQPUmJg0eK0RQsXHpRXoNQXr/sWSFTTzpNgnVl2jD4nJ2FzjGrnmjNPDGo
         +d9w==
X-Forwarded-Encrypted: i=1; AJvYcCVTaFs+fVDpQOx/VWCOSjE6xG/mn41KQTdfxnR/H52gWZcpEf6QFO+GLdLRH05OFpV2PNhb@lists.linux.dev
X-Gm-Message-State: AOJu0YzcE8ltMc13HCiE+088w21mcv5Qs0rlZFJ2o6ZBZx2IWcduwWqI
	9ZhBPTiytxLM1wr3EH/UO6CA3nXtnhs1uOXBM6ax5IahR7oHDxNDGOgq43zU0u5LzRSuzkkb8Hq
	PRtlHOhd+O0+OPBUtfXMcl7m8XgItBiNvdXa6Ifq1
X-Gm-Gg: ATEYQzx0JC5BUqFtt2VIdzo0orEom7ah7HmuqfOsh7F1zwiwrctaDxvmd25PLIKvcYQ
	nxJu4Kdk9R7xMZweB5cdsjn00fr6n5quM4PwyAbCWWRt4dkakoBkAymIPE8Iap20fOBFq3JkBfj
	re7SlE4XFmM2o18eQaV1qpnD2ZjaaUNtDTh2glKPpIAbiK9CIDUMh3TbY0AYcnepcfv3s+5Lh5I
	Oye60nvO18Qx0oYZ9Fw9B9yh4RMpHUb+hVDv3OLwH5CpaYqfd8yZpdyZoqmuzYmgS1v3+hYEo54
	lNKstU3tjrrOSpayF6BXLQyE+v85OoO0MZy9jg==
X-Received: by 2002:a05:600c:c493:b0:486:fd3a:fd22 with SMTP id
 5b1f17b1804b1-48727ef163bmr265057995e9.4.1774962296021; Tue, 31 Mar 2026
 06:04:56 -0700 (PDT)
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
 <CAH5fLggMZM3kYWO3xqb4o-mQG27aCYOmiiODW67CKLTstkB-PQ@mail.gmail.com> <2026033142-distinct-tanned-f749@gregkh>
In-Reply-To: <2026033142-distinct-tanned-f749@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 31 Mar 2026 15:04:41 +0200
X-Gm-Features: AQROBzCLOGQX2tSfSkAhkWuzSolMKQYyl-U7kjRDRXWr57ayx_jzC1qnpjdIn-Q
Message-ID: <CAH5fLgg63SYHQ34yqy7o2cA5f2Gh0aNTwTeQkzbWb+kV4Rr3Qw@mail.gmail.com>
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

On Tue, Mar 31, 2026 at 2:59=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 31, 2026 at 01:32:03PM +0200, Alice Ryhl wrote:
> > On Sat, Mar 14, 2026 at 12:53=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sat, Mar 14, 2026 at 11:30:24AM +0000, Alice Ryhl wrote:
> > > > On Sat, Mar 14, 2026 at 12:15:30PM +0100, Alice Ryhl wrote:
> > > > > On Sat, Mar 14, 2026 at 12:13=E2=80=AFPM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > > > > > > On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <n=
athan@kernel.org> wrote:
> > > > > > > >
> > > > > > > > It looks like this is a conflict between Alice's "rust_bind=
er: check ownership
> > > > > > > > before using vma" [1] (currently in char-misc-linus [2]) an=
d Mike's
> > > > > > > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-u=
nstable [4]),
> > > > > > > > hence why it was bisected to the -next merge commit.
> > > > > > >
> > > > > > > Thanks Nathan, yeah, adding a raw pointer (not function point=
er) to
> > > > > > > the struct makes the type `!Sync` in Rust.
> > > > > > >
> > > > > > > I assume this is best handled with a patch on top of char-mis=
c-linus.
> > > > > > > Perhaps creating a wrapper to assert it is `Sync`, since the
> > > > > > > `BINDER_VM_OPS` contents are unused (so far).
> > > > > > >
> > > > > > > Cc'ing more folks related to the commit.
> > > > > >
> > > > > > char-misc-linus should get merged into Linus's tree "soon" and =
then we
> > > > > > can fix up the mm-unstable change for this.
> > > > >
> > > > > I'm working on the fix as we speak. It would be ideal if it went =
into
> > > > > char-misc-linus, because the commit that is wrong is mine, not th=
e one
> > > > > in mm.
> > > >
> > > > To clarify, to avoid breaking bisection, the commit needs to land
> > > > somewhere that is on top of commit 8ef2c15aeae0 ("rust_binder: chec=
k
> > > > ownership before using vma"), and before the mm commit. But I guess
> > > > there are several options for how to do that other than landing it
> > > > through char-misc-linus right now.
> > >
> > > I've sent off a pull request for the char-misc-linus branch now, and
> > > after -rc4 is out I'll queue this up on top of that to get merged for
> > > -rc5 to make this all work out ok.
> >
> > Friendly ping on this. I don't see this applied yet.
>
> Sorry for the delay, now queued up.

Thanks!

Alice
