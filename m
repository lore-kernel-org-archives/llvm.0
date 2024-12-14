Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031811AA78E
	for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 22:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734216510; cv=none; b=ljl/+TqANBbftywXyRqxxdLTlrZwAQleU6oOJNWsdWFof+R4+Z25dk0p6jT7iwSzsLT1RPoaFZaFUvpU4UWzglSMlBC0ghY0XJ3ns1ypeWgCJ0A7TJCXGwIocb2HBZu3NZfMZdW7HR8pRXRWzImcCA7kWhyXhPLbITEq5WFFPEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734216510; c=relaxed/simple;
	bh=mN/QbefYvgqpNikuORpa9UwnpfDph9udgK3kqfaxc6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1j5H5kHScKm9DeFgGyvpSyI1+YLEPJffarwPOPv8Z1ipH+AjLd6u0q+qprS3VGpO9DFrf9ySH/sKirjRWT76MvNnkGt39F8KjfPvzAqmdD3W0fVACr4AxidqSGbZLBK9DZSfrVPB847+EnwOQqXSilcSDWvZFLtxpLHOlJCShM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ETp0Q/jU; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ETp0Q/jU"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f29aa612fbso2491307b3.0
        for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 14:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1734216507; x=1734821307; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZJ4scXTRmS7RPf8oo625k7m0SKrT5j5fYdKEOC7Hfo=;
        b=ETp0Q/jU+MXcCTiXZkrcB4Oxf0H9nAenTIDxOf7sYimjOOdfv1eoCFosgdzkPtuJlg
         TZpWULAEB3AyPLqsq2cUUp23qDKb3MxTDjlj7gxPnA7d3uuiSpx/oP1wy3fut6CrieGd
         V1NWEIox91rYZ8E/rdnEn7QkVVUNU1OInR/LOqzDKQK+FtuGrCa9fgAIFor80LCW4Du/
         lfV46eHSeisMu2G2oU/ESG9UKkeJstDVi/t6CFVqHb/Wse/seSudrH1905dPwSAiwCvp
         hICw8VtOGnf5TkjF00NYEckU5XbUJYNguuMa0pRFc4r6uYMUTr6h82y1+YNs7pPXW11I
         L5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734216507; x=1734821307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZJ4scXTRmS7RPf8oo625k7m0SKrT5j5fYdKEOC7Hfo=;
        b=qw7ZN2wDpf8N0ZT/6sA2d3d8Yrw3P5RWyKEuxgOt11L95hT+JtBk4+Z56fPOI2XWCl
         shaiXiAWgjymRGTc6+vO+mMyZTzG+kv1tP2xxEOPJzA2yEQ2Bx1n/66q8pSeJbgv5JFc
         8UbOnZp7/vwcrZC6vcMTLZA/ZiP6FnJ4eD+MK5GVklBsjmSTP60+aPYcUlUAYb6hwueB
         ADgO+PGJSjP+EWnKLZe854FbTUhQKvk9LxVRaZWUEJf4wYyh2hDUe6Fs/Ua2W4aSCklG
         KHCVW24xNUfvWpNTVKXf3P1zRPRKUDSL5PGRrfM+ID59wCJr8RTpnBLawFp6C2UXAssK
         pXcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDORDGoyhFkik+uhI7cwO/itCmYMzbx11Mz5Fm55U60VhrQI25KjJbWcAH244Yh5NX5Gsm@lists.linux.dev
X-Gm-Message-State: AOJu0YznBPRCUF2rcUfQDxlyPHtzc0qIcAHXP+Jj/iSOocl/PYZCvjuf
	584f9ZuJxOwLh2dv63y+hdN9aCY66VAM6HL/ISHABws+3vQpo+8VqNLjECXgUdSHjEx6YlHCJHM
	AFbHqvlHFXx1nGpkzY3HyOH2l2nwrcbbk7CXo
X-Gm-Gg: ASbGnctL65+uDigny3+10H1x3LdduE6i8v0Kq5fodxe7hWgmZIjLuOtqLQXF08yo9Kg
	NfewEYtgbaWkQwY7sVi/5nU942BgT/YN488Rg
X-Google-Smtp-Source: AGHT+IFbiM++nNw75ntI6RZMI+YfteGrryJVeEm71wShEK1qQgsUqDOT4fhaa7MESeCYL+h3/swZ5JktuRR/PL7IRDs=
X-Received: by 2002:a05:690c:6388:b0:6ee:a70c:8727 with SMTP id
 00721157ae682-6f279b9df88mr69827557b3.41.1734216506880; Sat, 14 Dec 2024
 14:48:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241125110646.50799-1-cgoettsche@seltendoof.de>
 <e43da8418fc54a5eba7cdbb594b24bb9@paul-moore.com> <f7bfbf89d2ac4b929637bbb25f749c96@AcuMS.aculab.com>
 <CAHk-=wgraNfcOCZ4n_C+ircQkD_AhsPM-=z7snt+eLgE-6otkg@mail.gmail.com>
In-Reply-To: <CAHk-=wgraNfcOCZ4n_C+ircQkD_AhsPM-=z7snt+eLgE-6otkg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 14 Dec 2024 17:48:16 -0500
Message-ID: <CAHC9VhSDfn5QgQsF9qq6-k67bQB_M6UZoLODDYs4qkwHcr4-gw@mail.gmail.com>
Subject: Re: [PATCH] selinux: use native iterator types
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <David.Laight@aculab.com>, 
	=?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, 
	=?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"selinux@vger.kernel.org" <selinux@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 14, 2024 at 4:10=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Sat, 14 Dec 2024 at 13:08, David Laight <David.Laight@aculab.com> wrot=
e:
> >
> > Isn't this an example of why -Wsign-compare is entirely stupid and isn'=
t enabled
> > in the normal kernel build?
>
> Yes. Please don't try to "fix" the warnings pointed out by that
> completely broken warning.
>
> I don't understand why some people seem to think "more warnings good".
>
> -Wsign-compare is actively detrimental, and causes people to write
> worse code (and often causes mindless type conversions that then
> result in actual real bugs).

I'm not going to argue the usefulness of '-Wsign-compare' in a general
sense, but I will say that in my opinion the changes proposed by
Christian in this patch are correct and an improvement which is why I
merged the code.  If anyone has an objection to this particular path,
especially if you believe this introduces a bug, please let us know.

--=20
paul-moore.com
