Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2D41DFE16
	for <llvm@lists.linux.dev>; Tue,  8 Oct 2024 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728398179; cv=none; b=ClWuG2JzPzpAalWFTDK+H9Ooi8WFtnTburmrstGRFsu/tYPAjk2EIMgXbmt8Rd9HVlXwZNgWTApKx92oQEWHzajRgSZh3ja5u0p7TArPxlLRsI6UQPsf4LBmZdiB2bC40SS2Ylw/OUhdcJb8bxnykBVZcKJaLxfaMPzvWDeTcmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728398179; c=relaxed/simple;
	bh=gxxx5O9eecv163qWQ61f/5In0s1MkC0h2hYsYBgpd4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/zO1Y80mmqXqTMlScSxEJVGhXux7CI3+0h3l1ITSR0pAxNutZWEtYPlD1L1ILqXY4Obv1k3kDD/b0fs47HVIWiJ+KR5gxwzJvwngpKZV88XMLkADWzqKt4dbEa4UHxZDAO+MsCJysGykz8ZvJ6j3ZtlKUC9Gu0oF4qBFkqm5KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEER33Wi; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEER33Wi"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53994aadb66so5158367e87.2
        for <llvm@lists.linux.dev>; Tue, 08 Oct 2024 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728398176; x=1729002976; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAzASSCUQ2aUVsiLqBLU+OR2T2BBF/GKBA/6/Hrht2Y=;
        b=aEER33WiNH8aHMCLKvcYInuPxaprug9akA76QtHvRaWEFo1vA7eaK/i2oWpbPnGYxw
         6N6qp7DzHCtmGF7EbDixCx5fJHa4olqpiwTFUDLGDsaFpKOr/6Fxy8oieFNnUR99jdRp
         94BK7jiPcRh/sxFjkIB9zdeoGJN5DbQolb18V0HmJYkAD+q8PLupsGPHjrhRBSTPWsA3
         JSk2mOvEQ8Ec2a/7nI96VKF045Zb64VD+dgwBXvgOgqV9ApTJo9YKAtgMfercCs5N1ln
         K7x6PwbLa3/bejUw+kIFj82PpaEd9yhdTnEFjgZlercdRToFovzqGAN//7MhcgnJ8nbt
         wMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398176; x=1729002976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAzASSCUQ2aUVsiLqBLU+OR2T2BBF/GKBA/6/Hrht2Y=;
        b=bsW0d3NcxqkynIuxe9oP6esxampTQS1JhYfkYmS83nzcnI/G1YzyeeAHMetJ/6UvUg
         kQOlee28t6AXt9Cn4TKSLJ72dES9YASUI8EFkVqHotw7slzuhH/8d7jh6/8sSr6J71Lk
         4nRQp0Ok9iojRUtCHnjXQN2ALy9b/7t7sg4tRFhQFMNp+OUA2vJitLUEo/v1VS6LGmQI
         0a2qksmlGHVNcISXzYFXbBRYuvx8dsY1dgms6Mc8Md1SQnuyrjdNBJ/ODKj15/QXg3Vr
         lfctt+NlisuRz3K0RhxG2qftBfWQOYtCQvV9wS2gliaKoyZNjiTryakBjqiYOn/iQbuq
         TRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo9xudxihd1UhDvPNUoqhkJPiV5nTIFKrHRezJflX8WiJOrZRzN2qk/E58T9bbdjycEqZJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0opMTmlbVUToZuuA7LzUw6uInsaEOwOSWhT7INVAZ8AvvuyUw
	CdD+npreo7uzsklM/W5kNHvhHycd+Y5vvwXdrN45x8d3IM7Y+QvcqXN9LWKuFXbGLxzSK21WAiS
	GnbG7vGq2/iVF87I6Xv/ExnN7pQ==
X-Google-Smtp-Source: AGHT+IFk7uSGpMKxSJMgul6omDcmQyMQl5Zy1l8C5NVTbpCgjnnjxrxdxyhpPaT355keXYtQRCu422aiN8olYIcP4XU=
X-Received: by 2002:a05:6512:3085:b0:539:8a9a:4e56 with SMTP id
 2adb3069b0e04-539ab8c6fb8mr8574397e87.53.1728398175714; Tue, 08 Oct 2024
 07:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-35-ardb+git@google.com> <CAFULd4ZNwfPZO-yDjrtT2ANV509HeeYgR80b9AFachaVW5zqrg@mail.gmail.com>
 <CAMzpN2j4uj=mhdi7QHaA7y_NLtaHuRpnit38quK6RjvxdUYQew@mail.gmail.com> <CAMj1kXF3_Hj9j2f_cBtwTFWvEmB0UoEs_cGkRiWc4AErDx0ftQ@mail.gmail.com>
In-Reply-To: <CAMj1kXF3_Hj9j2f_cBtwTFWvEmB0UoEs_cGkRiWc4AErDx0ftQ@mail.gmail.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Tue, 8 Oct 2024 10:36:03 -0400
Message-ID: <CAMzpN2jWRV8-JzM2FjSvSz+VoDrNVeEJPgF7N5ksLaADHpnHsA@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Uros Bizjak <ubizjak@gmail.com>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 9:15=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> On Sat, 28 Sept 2024 at 15:41, Brian Gerst <brgerst@gmail.com> wrote:
> >
> > On Wed, Sep 25, 2024 at 2:33=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com>=
 wrote:
> > >
> > > On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@goog=
le.com> wrote:
> > > >
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Specify the guard symbol for the stack cookie explicitly, rather th=
an
> > > > positioning it exactly 40 bytes into the per-CPU area. Doing so rem=
oves
> > > > the need for the per-CPU region to be absolute rather than relative=
 to
> > > > the placement of the per-CPU template region in the kernel image, a=
nd
> > > > this allows the special handling for absolute per-CPU symbols to be
> > > > removed entirely.
> > > >
> > > > This is a worthwhile cleanup in itself, but it is also a prerequisi=
te
> > > > for PIE codegen and PIE linking, which can replace our bespoke and
> > > > rather clunky runtime relocation handling.
> > >
> > > I would like to point out a series that converted the stack protector
> > > guard symbol to a normal percpu variable [1], so there was no need to
> > > assume anything about the location of the guard symbol.
> > >
> > > [1] "[PATCH v4 00/16] x86-64: Stack protector and percpu improvements=
"
> > > https://lore.kernel.org/lkml/20240322165233.71698-1-brgerst@gmail.com=
/
> > >
> > > Uros.
> >
> > I plan on resubmitting that series sometime after the 6.12 merge
> > window closes.  As I recall from the last version, it was decided to
> > wait until after the next LTS release to raise the minimum GCC version
> > to 8.1 and avoid the need to be compatible with the old stack
> > protector layout.
> >
>
> Hi Brian,
>
> I'd be more than happy to compare notes on that - I wasn't aware of
> your intentions here, or I would have reached out before sending this
> RFC.
>
> There are two things that you would need to address for Clang support
> to work correctly:
> - the workaround I cc'ed you on the other day [0],
> - a workaround for the module loader so it tolerates the GOTPCRELX
> relocations that Clang emits [1]
>
>
>
> [0] https://lore.kernel.org/all/20241002092534.3163838-2-ardb+git@google.=
com/
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit=
/?id=3Da18121aabbdd

The first patch should be applied independently as a bug fix, since it
already affects the 32-bit build with clang.

I don't have an environment with an older clang compiler to test the
second patch, but I'll assume it will be necessary.  I did run into an
issue with the GOTPCRELX relocations before [1], but I thought it was
just an objtool issue and didn't do more testing to know if modules
were broken or not.

Brian Gerst

[1] https://lore.kernel.org/all/20231026160100.195099-6-brgerst@gmail.com/
