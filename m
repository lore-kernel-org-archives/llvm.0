Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6C83D88FA
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956740; cv=pass; b=Dlj5yeuoOXvOsJS+60WXfZj+tjLrE4kZ/812ng0UwGObvgufQxbwIlfP1YGHTAc82Z55ymp4yVLpCaFpLmlX531oMOA14eaaTI/X+HmbjcnEHFH1/wah+JuarxLLdj6Nmi6xabtvRfWEgRPf5S75DnIQlAqe0K4lzJyykZZMudg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956740; c=relaxed/simple;
	bh=M67a/b1x6rgEx0jm9LICh8Vkeoo3mKrczTQasuX51XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5Wu5B5h94wbTuy3WtBvDZIdXmXt+YFz2dFaNaZIbnHcuHHVz34gasmrzDkAmACgo28E/LM1pUn/yoH3q7AyJPK9eYnM4ZtL9pHIJj61BVly6oA9Quq1gI2Jw+Sn9yW3Ei6oNpxabyO7+7maLpvi71CejXtJbsih7qNMltdtNt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ED0R3e1k; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ED0R3e1k"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fb14227cso73722015e9.3
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 04:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774956737; cv=none;
        d=google.com; s=arc-20240605;
        b=IXZme6Rz1hWGpnZ3CqTm/SOiFbw3BEZ3/lA0fQcmZe4QvtSuNW3wDHlh1CLIHgCD30
         TJ6C/q8Hy0aTXeAmie9+Z7BW3pKGy4DBiE7tDXnQ6QtKog0+l2YZJMLWKwNl0H01lRjm
         MDq8Bx0JUnJB4dr7lIIO68pIm7hwbRef1qa/DATMdfP5vMIPfTcSYg27D0F44QMU3qIf
         O0mQ4yDpatpahVjcDLxqanbP+c4rfyOQ7ASx4acn0Fmua5YRLDpovHWcWz2HauCn4mfB
         CyeORhSVOueRUwc8D6ykRsXDWD99LJMompTFBNO8CJEljuEMqj14K1xtivMd8pTlaYtO
         c7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M67a/b1x6rgEx0jm9LICh8Vkeoo3mKrczTQasuX51XQ=;
        fh=9HZVsMmXC3c9TlTV/2v0CJDTKjZZzBudXcjtOqLD7Is=;
        b=TzZhgSfkn+GED6ytECdD2AEkgWxja4nJ1sPO6rcu+eXPh+DZclYB7MgHAFqcHqD4IU
         UTEdrJCd0TgJc6ADwniDM4k8jIgufDYYpYlqRoNMTDuizPGPfPNAcpX3JmbpZQZyOuyZ
         GabPhuECWa84TlF4lSDwsvooqB/YWcGo77NfgMJnkLZUoAZPeqImIm0QjWlAmw07N55p
         n4DJQodckcSPAOyzh3jnjmJzurZVmRUboQMwHzZF70VQy/hoqvV7FlgSV6J+F+eC3DnB
         ROFUVZroP/e3KqfN2vES0KYseL9cn79RXOL1s6QgQJehEsBf+Oca1eEdFPfgBxtMhQ2A
         Nf7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774956737; x=1775561537; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M67a/b1x6rgEx0jm9LICh8Vkeoo3mKrczTQasuX51XQ=;
        b=ED0R3e1kC+ZdKUXD5A5XhI9i20ykQG27DgdFlT9Bjxymy0p98uD1agNo7QBX2nn2qD
         rwgRFfRAnupubmg4l0L4bwzOA/EwPC7BVnOMkybNHp0duKEG+71EXb2FEm9WLZrrVRpJ
         F2dtqNrgRAoxPb0MjuhopoUFY7chaH91RP+LriGxOAgkrBTC8uVeVPEJguzmSdabCF+e
         JgAKd7NgfDUX1ohcrunrpIipEVa/IZAE7mXNPW4Fmxd4uS/DxB5NQCLt4LGwgl7aOF9D
         76nfeEW+z+kWBvMy5z3l3+50xPjX3ZdkV7q/GqHiLd8+LKoMLQzQdpivY4/yTWKh+DR0
         91SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956737; x=1775561537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M67a/b1x6rgEx0jm9LICh8Vkeoo3mKrczTQasuX51XQ=;
        b=tH2aamONiPS0dkTEf4jLQmM20xeNJ/Ohw/7DwpT6OlL/GYoHO+S79vWctN39wFEC4X
         Fj+g/R6epVVYQmw3sQeTDrESERP7qr5rtf8SXzWVNzkxwSP/5EHnaxuMCf2oLqd3a9AB
         azYPwuLpH9tH8JshvI5oVwA4bOx7RwSzWx+cVexqTo0jfejGy6CbrddBew2JnQDqMExH
         kT07E1tPLoyXBlzm46lCJBFMIb/DAH+Ve5EFqySifFvIcXNTs9SWjmGuv14mshC03Ciu
         yzDQ/ugSim1cOfpNCJwrKfpBvxfqvwhL3pCIuNlf0wnQZBjbj1zw3Dr0EdBmcTh96S9Z
         HOgw==
X-Forwarded-Encrypted: i=1; AJvYcCXz7U1gvM4zyQp7lYxN29JamVtxX3bTTnGcjUfNra5tP+pIl7EtsPBWPlr3Vm/fRA9yYOBv@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/WfNNRwPCMbXJj3yw3Kst5PPg6OMzw+JzzqJYZnvUTWx28ZXf
	dI1KUk4kSsfnUy1GA2dBsNppI6YKbnFBvXMMztG2TcUSgj4s92cX37LCvEk677DJ1lexglkgaGD
	2saOpuP0z5ZVHaytJDeJs+B1fKQa86dF+5yabRhTK
X-Gm-Gg: ATEYQzz8y9Zm+rGKSryYE5NIyQMlfFbunlo6mwW7Xv8R3PUeXQ/gR3MpjXxVQc87lVE
	jbppbY/SDNvVQ2dpGKfYTIt4oXuDO/rquZXo9x2cio5iLfM8fggBhH/mk0GyA1AkLtXPE6+Sd/k
	rwfCpkRLmBArpAjKn1cXc1MhYclxShpr+XoMig5NJlf5P2WXJMhc8ek4cN2B7XxOxIQrdZVvWXR
	NxoES92WlFv2j8q4ht9hfHsyFacjEtZ29GG7tpERsbM52OdpsZ8dCfF3/mFYz56Wj2Ud0sn7k0u
	KNL2HHM/2GK5wk7WkmkQyUkQgYmhr48CiwxLVQ==
X-Received: by 2002:a05:600c:638d:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-48727efadcamr273504385e9.16.1774956736497; Tue, 31 Mar 2026
 04:32:16 -0700 (PDT)
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
Date: Tue, 31 Mar 2026 13:32:03 +0200
X-Gm-Features: AQROBzCQEjffcE5il2ENOqxKPlkZVapSxJMQJFQeH4ua_CsBeZl83tkO6WEAH3c
Message-ID: <CAH5fLggMZM3kYWO3xqb4o-mQG27aCYOmiiODW67CKLTstkB-PQ@mail.gmail.com>
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

Friendly ping on this. I don't see this applied yet.

Alice
