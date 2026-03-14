Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BC11A5B90
	for <llvm@lists.linux.dev>; Sat, 14 Mar 2026 11:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773487828; cv=none; b=W256OFLznx94BtlFTnglf5jxL+Fg9YHaYtFz6jx8/EO//fXC8476LpwhKCq4eIhasqOd4kHivRhnZJKyk5WTtLhC2AtTCYe10Dqp3MMzicE6d48oMHZ8lbFXfZIi7QrrKK0O8VC96dgP13CzBSJrWrQmY8e0HnEq+jwbdxI3RL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773487828; c=relaxed/simple;
	bh=i5/Mv7r0O1xhJ0MOUYqm/aCKF2kenGBq/6wEKwTk7fY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P33KdfPAIfkgFefo+2J7NLkqAXLp3aQDGCLhrGgQ6qQqae1uoQQx1axCNwefhqB3nbSDzoj982zwS/9Ur1umWbw3MminAWuSUF0Zr/S406Q1LUEEoiK9+rOsI596nHvlTkKquqObpfV8H28Zh7j4A7JC69k60WF37CxSVC542J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wZJYQsti; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wZJYQsti"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4853b00f9f5so29429235e9.2
        for <llvm@lists.linux.dev>; Sat, 14 Mar 2026 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773487825; x=1774092625; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5/Mv7r0O1xhJ0MOUYqm/aCKF2kenGBq/6wEKwTk7fY=;
        b=wZJYQstiqcmpTifJ8HeFY52uEF65cmgsNghvZ4YeGSUXy0kvlj4F5c37JjTam+g4gw
         BzGmNPyBLta/QCBh0lqxEcKbIi3L77GAJCJr+WPWJaIfY2FEtz1l6i35Axr1nT4T7PYp
         LmTdlyttbouWxg60NVthWNHdMFOy6gBEvqHQjgtkeQfSeoTEa3pA1LOp+qH5XzN/vI5/
         z5DZZj7ycU9DU4qtJ1x7sZ2phzbNmxFRvFXX6Kgldwu+U0AfE6KU4GetBvCp/9brWOQB
         2ZaYr6gtWgztvx5W89IXTnsvIG/kzmNyY6AU8BCw3CQ25ls6TIloTbHhH0exeO2eNKCw
         YciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773487825; x=1774092625;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i5/Mv7r0O1xhJ0MOUYqm/aCKF2kenGBq/6wEKwTk7fY=;
        b=oZ+1pgMxntlV5zk+x08X886seQJmuB+PjZgaWRA3h3Ph9bGGQIwrcluvxVPJOZYNxo
         YfFNLX3HfsthotGwqjw0F4iZXFUi7vxGkoYEwVIEiVOtXKDSj+Zoa+clwj0OxK5uWfCA
         tkgcQsbRp2iVIyRtrWwDsBlfUjVOqRedVzSaSH+5immzop6Vowg71n/ur/j2MfAtR6KJ
         U5TXYM+y3pM6g5vbFjrsUlOwNuZOstsvCGoavPmgZYtBokYcKx+PYGk72SAgpzsV2sN1
         oAlzl+ztIX25c2EbQoVptGulfxG5XbSfIKfEMcnsCRs4d9bq5vdosrUxzcGFXfnn3jkY
         OE3g==
X-Forwarded-Encrypted: i=1; AJvYcCVDm88rsegoQgJdfICHRbtAHYNMq8bfWNrZ3RzqqdGMljF/weovFGnMUVxtdAzx6j/AAYwk@lists.linux.dev
X-Gm-Message-State: AOJu0YzCPKSYWUtASeu0CT+PXBoRn7p/VxD//LsLcuCVsl4HdL8wM1qx
	+ntqHgbQObM1/gEY4IGLac+T4AeuqcIjwl6DetM0MPsy1b/FAQ5otYQm51fROsf+ilc5U2kkPYE
	62vem3mOaQ1d+oNZdMQ==
X-Received: from wmpj3.prod.google.com ([2002:a05:600c:4883:b0:483:509d:729b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b25:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-485567029b6mr109864745e9.23.1773487825162;
 Sat, 14 Mar 2026 04:30:25 -0700 (PDT)
Date: Sat, 14 Mar 2026 11:30:24 +0000
In-Reply-To: <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202603121235.tpnRxFKO-lkp@intel.com> <20260313213638.GA147391@ax162>
 <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>
 <2026031422-catsup-rectal-f886@gregkh> <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
Message-ID: <abVG0JypVhDxx1Tt@google.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, kernel test robot <lkp@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 12:15:30PM +0100, Alice Ryhl wrote:
> On Sat, Mar 14, 2026 at 12:13=E2=80=AFPM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > > On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <nathan@ke=
rnel.org> wrote:
> > > >
> > > > It looks like this is a conflict between Alice's "rust_binder: chec=
k ownership
> > > > before using vma" [1] (currently in char-misc-linus [2]) and Mike's
> > > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unstable =
[4]),
> > > > hence why it was bisected to the -next merge commit.
> > >
> > > Thanks Nathan, yeah, adding a raw pointer (not function pointer) to
> > > the struct makes the type `!Sync` in Rust.
> > >
> > > I assume this is best handled with a patch on top of char-misc-linus.
> > > Perhaps creating a wrapper to assert it is `Sync`, since the
> > > `BINDER_VM_OPS` contents are unused (so far).
> > >
> > > Cc'ing more folks related to the commit.
> >
> > char-misc-linus should get merged into Linus's tree "soon" and then we
> > can fix up the mm-unstable change for this.
>=20
> I'm working on the fix as we speak. It would be ideal if it went into
> char-misc-linus, because the commit that is wrong is mine, not the one
> in mm.

To clarify, to avoid breaking bisection, the commit needs to land
somewhere that is on top of commit 8ef2c15aeae0 ("rust_binder: check
ownership before using vma"), and before the mm commit. But I guess
there are several options for how to do that other than landing it
through char-misc-linus right now.

Alice
