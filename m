Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77350134740
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 21:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707946346; cv=none; b=bsQoMqXyFVwE/HRYa6bpVMlz2/STbPupCXM+IENzK2Fz4Vd4cFjL5FhxmxlGmBoiHj4uvCDDL4mIzXg3nmTpDTMWxyIkXXtgInLt8PJoTtbxFVbpL/SMDMksCyqImKtSx+IuRdCFQJy8DNLTeuWmwlKMxIRj0blUL6iMJU6NiBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707946346; c=relaxed/simple;
	bh=mzDDSMUcdlm0Up4f4mJcp+HyVxmyqjTrTC7RCdD9z7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FH3h27kVeYQxWppjGGA9J6NtNFQI0EnW2+3MKOQhfnI1COAXXT1hSXhlhARInJJN+TG5+Mq6g/xnGRBTUpSaw0J6dEeFzoeYz+7+eZ02YT0CJOZWvslRgxGLRVQDG2aCH3G6zXUD0yNpLfnHrJ81/cMs2od8JdhEKEcqoM++5rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UwL42+YV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UwL42+YV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-410acf9e776so3095e9.1
        for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 13:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707946343; x=1708551143; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7jzhXS2LwlH6Na13t2uRB5AnuKFssoLivXgy4Bk1Ws=;
        b=UwL42+YVVhLh5Ai627JEnY6JOT7soNQsgqCipaPdq1iYgmwNRULc0bifvU0b/VRikG
         LTYsfLvZA4GGgoo74HPDkjamdqJV0J04TGKsLdxebr4R8dfBdNbn6QNyJeUIfhnYveNl
         U9qAmjhL1V8L0FV0FpvMLidBLiwCQUhL3klD/NvZP7tDvPVjgnVZlhpPJz6IMdPSvavh
         Rn6FxRETmLNf/rH59qEoDSB6iezEux+k+W8nbu9mvE1ea3JQqa7qDeqx7uzC/u9877Vq
         zNgLfXRtWXcYIl60MwIVvmbhQevNTlw/uRZP37mY7Apxgh8ulWQd0MVtz/9BVPG4O/5l
         E5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707946343; x=1708551143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7jzhXS2LwlH6Na13t2uRB5AnuKFssoLivXgy4Bk1Ws=;
        b=CNfG1P+jD6Zysj39JX251rISgoSCowN5q35F5xoKQSmD8GCYf17P3HFHcb8DouREeD
         HZS3nEFBDq+B/FczZxAPcIASrS9ev1a1p/jX4kVvg/us4bwCkoXLyylK1PaMxPnBpJyj
         d1P3guGc+NpqVc202ObIZipS5v37A0eg9ZqDbNrM7/i4WeFpeaI3zEWz7CwhvEXDYEFi
         3SEZRjD4hUub2ifwKchNPZ1rWDZbuzBarjJP4jJ06V9FKyuwq4mAjZBd2g6NS9UMBBQZ
         lwp7c5dNIOPHR9fgbC+BnoVfxJ18ZU3yqHbwRxkY4IdLr5jHGFsmulPBdhlHlQhTYmnq
         PvUw==
X-Forwarded-Encrypted: i=1; AJvYcCUatBDSet0N8MdoatUDLxVt+vZNrVvUQmMPY//j8nw9+EclL/YCW8ck/GThuq6eZn41RMk+dyilEDJMquyXVa2Sd5kSyg==
X-Gm-Message-State: AOJu0Yxf01oa8RN67zRDa016AyUnkZU86w0RU6iDtyZhbd+yecLP4cmY
	SOsAKIeXEbxO9xVKSlIAKzkBnkSMQSuFLgKWS5XShOL5j6wuJxOHSVQnHkNSuxsJPrVnnEXAMBd
	hHPB0x4PQDyCc+rHccuvqf3z3vx1zD3bnloZ3
X-Google-Smtp-Source: AGHT+IE5ehL53MTjl/C7JyHdLt/tpxzFhvMTW9TYqxUkVLe03JhGEAREu202kUoVCBnpW7EKcv+ZGc8eHAGUZNCg7gE=
X-Received: by 2002:a05:600c:a01a:b0:411:e72d:e5c9 with SMTP id
 jg26-20020a05600ca01a00b00411e72de5c9mr223035wmb.5.1707946342669; Wed, 14 Feb
 2024 13:32:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240207-s390-lld-and-orphan-warn-v1-0-8a665b3346ab@kernel.org>
 <20240207-s390-lld-and-orphan-warn-v1-6-8a665b3346ab@kernel.org>
 <CAFP8O3+L6Jpgktk50UBKg_SodH-DTAW2syZueUqxdZsxrOT3bg@mail.gmail.com> <20240214121755.6438-C-hca@linux.ibm.com>
In-Reply-To: <20240214121755.6438-C-hca@linux.ibm.com>
From: Fangrui Song <maskray@google.com>
Date: Wed, 14 Feb 2024 13:32:09 -0800
Message-ID: <CAFP8O3+uLO9a2n3NuQd9bhzRtpG4GvzoJyMuasGZuCrkBRqq_A@mail.gmail.com>
Subject: Re: [PATCH 06/11] s390/boot: vmlinux.lds.S: Handle '.rela' sections
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Nathan Chancellor <nathan@kernel.org>, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, ndesaulniers@google.com, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 4:18=E2=80=AFAM Heiko Carstens <hca@linux.ibm.com> =
wrote:
>
> On Mon, Feb 12, 2024 at 09:18:34PM -0800, Fangrui Song wrote:
> > >         ASSERT(SIZEOF(.plt) =3D=3D 0, "Unexpected run-time procedure =
linkages detected!")
> > > +       .rela.dyn : {
> > > +               *(.rela.*) *(.rela_*)
> > > +       }
> > > +       ASSERT(SIZEOF(.rela.dyn) =3D=3D 0, "Unexpected run-time reloc=
ations (.rela) detected!")
> ...
> > Commit 5354e84598f264793265cc99b4be2a2295826c86 ("x86/build: Add
> > asserts for unwanted sections")
> > specifies `*(.rela.*) *(.rela_*)` but it's not clear why `.rela_*` is
> > included. We only need .rela.* (see also ld.bfd --verbose)
> >
> > This patch LGTM with this changed.
>
> I'll keep it as it is, just to be consistent with x86.

Sent https://lore.kernel.org/all/20240214212929.3753766-1-maskray@google.co=
m/
("[PATCH] x86/build: Simplify patterns for unwanted section")
to simplify the patterns in x86 vmlinux.lds.S:)


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
