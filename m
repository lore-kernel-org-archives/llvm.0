Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0BF4E36FB
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612406; cv=pass; b=UyFTg8oXcr/1z7sDxys82O6nc/hC/O8ygR/JSRH4QXYiBxDDQb4pKsiEFqC27JV7Cmz+1OyTozkL9TdQOeN5YsDRxdvVI8f3stzNwA8NfJ9AODaN5O7cTl30rFGVOa9aPOJ0SHKSmlneVgvercevtU4ceKnZsGMZHfQPIHuNIoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612406; c=relaxed/simple;
	bh=fi949oQMxoIpu6w4p86whaB5RahCgAexfWrkdtJ+AKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPRkDB76Y6TUAXDGkm/j2ghSh28IkoHxpx7gRqf5BwaKU7he8iaUkkNkhdlJPf5tvq7FQacQbFdBMlVlecP3gfNwI1Gn4OsquvFWJly91M3sD2R79SyNDtiikuaOmF4e7o84PjzXibiq588FvDTXQb4KEcUJ125wodldzegT4/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UM9Tign/; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UM9Tign/"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b926f0so2044058f8f.3
        for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 09:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612402; cv=none;
        d=google.com; s=arc-20260327;
        b=HEPluDRq5kAI/8494N8YjJVLyKdzdOhWiOGrgz7LWI8TM+psgKYGCxqhPocxGzNwy1
         okVYfFD/nvodLEOdNo9nYhB+iDNN9hnDro/dbFtCRONlLp0dN0G6ye6aDI1KIttmHg0G
         1Hv6nv+7VxyOXmdj+6scbQN9zNSieeNo3jXBeg6U6h24mHwI7dWinRd9P59hBmjJByot
         Ji6m6SOkdLZgMnD+L4+keinLRCYvMpRFofbxhgpt12BH+W8z7KtP+MCc6XVe7JMH+DsL
         AHeqGIivcjlIwCxMVpIyr8A+XyHeioVPbSJKf5oJt+qRlaNDymFhl95dihfj6gPzg3D9
         4fGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Idi5LKEyTFs2voreuzbcbppZ5nLIeoJ5tGdhI+MVBSA=;
        fh=/gaXDGge6yZbOwS92hQ3h0fbuFYQhok29f/s/2WUv7s=;
        b=heNCXbt/y/LVEWxjn4Th6O9U5JLtGiDKnIqi+7Qafgvlwi5Yj5ntqKKODH5wIGbbA/
         G60FjK2hGKaxqXpgfDTnZayoyANZT3NrY5WKWqZOD2iTOP27EwR+MioB2K+L9HyDF7Wt
         CI+3sGfrfJpbjJFTf6HwbXlW7rIajKnQ1ytLt5Ld06hUMnXj15DeI/VpY2o22+iuUWY4
         1EpaMCIaxmOldPREeQY3Bbs7ghUmFvH/XxilaZZfREWgjoIbGrIeOGy5SK7Yj3HB/FzF
         hsMdAOUgdtbH/flJEPbHiasoo+qm8++BdqLJ5gmGbS1Gb3/iJQFNFw7jFz99i06CKyP5
         7bAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790612402; x=1791217202; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Idi5LKEyTFs2voreuzbcbppZ5nLIeoJ5tGdhI+MVBSA=;
        b=UM9Tign/89YKIx9RqLdnP0yFOmtr+g0PBRaMr8lrRHoc72cuSXkW2ne+Km66ClITdz
         FGaES2nctkowzttBYeFDPJrrcifKlDPWhSA4Uds4JPD4dCpAjuhnGzQyTm88vjnyLede
         ElQGu8FHZIdlhZRYUkh/b22CkarRqsNYrqemgnc1DRagPXElpcTu9VKjALNEWarPbDiK
         LZjzFQqLWrDnq58iQei3R9Iw1putgjIulLEgEYQzyHwoD4j20Nlt1QdxetWYRQ0FFGfh
         4hE8CrluUJVNSyZ9LcXWJbmDYyeGiQdynynfxffYR8cvZnHKBzIn0PmPwaGW4geo3d36
         O4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612402; x=1791217202;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Idi5LKEyTFs2voreuzbcbppZ5nLIeoJ5tGdhI+MVBSA=;
        b=eHcnOTwf9lJtSPpyj5HKTIny+ajxerVVIjSu5t2D+R22knPia7wBdTdqUKPLXVNgom
         BpyJfZMflnjwzPsSl71NtkBNBjmB9jSteXeThAFn4BRYDziZHOPWsla2GNeRafXt7/0V
         7FpQ+rFbeAuB46pKn7vgggE2IHvk9Ru/b7N1LV7Xd4qQpBQuL0rZYKinO+CdxDeAqM0z
         FKX7lPfvwwSrjh48yES85Xxa5lTvmlZ4rrARDakkO4Bxkvahq5Ros2BtdEfBJck1t1ZP
         r7UFte8JS3rt92PRX9xOPf2inP3HwugOjjDAebZUswtY/N2WOgGNHMCe1CDxQT8YnzN8
         elaw==
X-Forwarded-Encrypted: i=1; AKwUvByZxtA3+5XQ9+7+fThDN+NLYF2zM+5ywJ60Ou4aTzvrU4LO46CWvIyeLlTH/TeVqPqqwMnY@lists.linux.dev
X-Gm-Message-State: AFq9FYKv+YlfKCc6+6c0uhnjjupboaNjnvGfl4TT0XT2wqCXFmad8Uny
	AruY6Ce2PfqGfkcEHXVXej03Z9xCvKH62em7qnFo6T2YjgMWrIx+wh0BVxedWhAefTcKrJIDlw3
	dbQSEKpgmUJCd55zl8VoM7sDj15Sys6js7xGaoow6
X-Gm-Gg: AYBFou2jd6xuABSZlS9bpZNe8aZqIt1GZC1mnoxzvd0y0/SJmI0HRy4GS59hduvYLf9
	AZ7C5CevPppXWcZRySI1EUy4/rbPRUliSP6kq+8UWH6r9SZiqi1r7oUOPSExy6Vg7Hjdku/XI/V
	hbjPYuhvRU2JGqMjX4d4GOT2kqes/mg/GI1Bu92kHz/sOUirMgsrW7vc3pFkdfn6iDI0cTdbyuk
	11lIA6Ch2xewIPyw7uln+DAWA8CJ8N0yz5F2t8bLe1+v4oQwchxSE949ymSzOPl9la0aF8jy2W1
	yWBtmwf6DQJLCqqnwaSdtIhbz1nmgwNaFeAT7x0uohEhKdigKWE1rJ1apywn1FIWcZORMtCsESJ
	R0DGP7+xwW84+9F5Uvicp6RdUIPKMadao3CYVjGlyXuJlmJ7Fb8lZkew=
X-Received: by 2002:a05:6000:41ee:b0:487:1ac0:32af with SMTP id
 ffacd0b85a97d-4887197853fmr26855385f8f.51.1790612401692; Mon, 28 Sep 2026
 09:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
 <e801211b4c71ddd919fa5d7b9c859b86addf3fb7.camel@sipsolutions.net>
 <CAKwvOdkMK9Tj=JgsPeQj6_Xtx3FgZK2SWTSJVU_BJ7G17pDC2w@mail.gmail.com> <20260926195145.GBargiUSEEqjWPpuaK@fat_crate.local>
In-Reply-To: <20260926195145.GBargiUSEEqjWPpuaK@fat_crate.local>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Sep 2026 09:19:49 -0700
X-Gm-Features: AclHuK80ygbd3wiyZigI_Z6HIjLwZPQopGivmPnn4hRCPTRgq5S7ll5QQxv7VJs
Message-ID: <CAKwvOdn2U5xy5T3kc3epPX74nr6ja4NBFVGCqLD4GPwKYX6hBg@mail.gmail.com>
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
To: Borislav Petkov <bp@alien8.de>, Elliott Hughes <enh@google.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Oleg Nesterov <oleg@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 12:52=E2=80=AFPM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Fri, Sep 25, 2026 at 02:25:47PM -0700, Nick Desaulniers wrote:
> > On Thu, Sep 24, 2026 at 7:54=E2=80=AFAM Johannes Berg <johannes@sipsolu=
tions.net> wrote:
> > >
> > > On Fri, 2026-08-21 at 15:45 -0700, Nick Desaulniers wrote:
> > > >
> > > >  arch/x86/um/asm/ptrace.h               | 4 +---
> > > >  arch/x86/um/ptrace_32.c                | 1 +
> > >
> > > This seems like a simple adjustment for what you need to do in x86, s=
o
> > > that's OK, but I don't think we'll take this through the UML tree.
> >
> > Appreciated! I agree, maybe with Oleg's review this can go via the x86 =
tree?
>
> Do we want it in stable too even if it is not really stable material so t=
hat
> userspace does not have to upgrade kernels just for this?

I don't think so.  Android, say, is not going to upgrade kernels just for t=
his.

>
> Or are they simply copying upstream UAPI headers from the latest kernel s=
o
> that stable backports don't matter?

Right.  IIUC, bionic doesn't have N copies of UAPI headers (one for
each branch of stable), just 1 copy which they do move to newer kernel
versions when they need something. (enh@ can correct me precisely).

>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette



--=20
Thanks,
~Nick Desaulniers
