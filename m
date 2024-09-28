Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961DDC8DF
	for <llvm@lists.linux.dev>; Sat, 28 Sep 2024 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727530883; cv=none; b=Z5fg+L5AnGSAEMSwnTZvANJIgwQh/LGPBasbysrioV5+b5SNEG+5zLnwL1+ovtduBnWtlOyy7+YJiIVQfo+AtrH1brAtWuHi00QiYuwNTvQoaAZdrGrpoJzUcyczAGQ4BLZ4DTxMZvP9ONpQa+lym7xxMJsbmI/6ceCvkhdy3lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727530883; c=relaxed/simple;
	bh=orpQEHYHyBoCCUjzbaUktQopXRvr5Ek6mitfHI0agMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tV750czipMfwqyxI75cqmgBddBjWfznr0tE1Bvm/1Fb1gmutKMsOLkDSKMxUj5Qs5itjros78zMXWGSpnHbPG0ZjYbeX0TSkFwUOqV0/5QIwEXKR9E/mil4mLiWWMDWPz9cOfXyBAidGZA6KqcS4z9DeFt5/oqqPCa+Ft8WJwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mfd8FFsg; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mfd8FFsg"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5398e33155fso396554e87.3
        for <llvm@lists.linux.dev>; Sat, 28 Sep 2024 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727530879; x=1728135679; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNmBSpA2BmR/JT9QNG5130+zMmw0zS2R0933ikB5pGY=;
        b=Mfd8FFsgWuymSV6aiVCs3HXT9AsBpUyOC2FtYHcuEIjrfw1TXTrE9Jt4ROac99p+rb
         oDxvGf8Eiq7Ms1LZnh5c/9Ba8m/KxrsoO2NNnAFt3zAUdQQk42Wkw3VfVTQR8upQlLjh
         oDGhUTtRCmuWlDPX3ZIJXiPfRmGxz7klhdxec5PHmZne++R+OvzSzZKbWJLdPv3IPrfy
         xodsibbYlC+my5slBeD+QkFKAcPa2IuW9vDJE2Iy6z9+lXzOPoQcUT/Wasff4JCCdpJM
         2PeKrAPNi6zdbWBd/Obh2fp2lt+aTDiKLgHgsIerKOArUamWiXVB7F8H9h3Z9iJdnJcm
         zI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727530879; x=1728135679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNmBSpA2BmR/JT9QNG5130+zMmw0zS2R0933ikB5pGY=;
        b=lyNMMNnC6szemyvAq5/S+jCxWRy8c4pwoXCi67wqfg0Dqya1kUX74SwVCvZRb8WgUg
         6dgiRotkxQKJ8b+Z+jyFp6Qss/CIfAbx7Cm4xAk4r666/+0B4fXd7xIaNOy7Bq3W+Etr
         Tm/huRzPMyvKJz9eBVC9xckSpKdqbpRDlxHVFToqFfAPaa4vjZQr5ISbSM/uy+JkJC77
         h/zC6jnUgVnAAEJWgKTmP1QbaDBeJ+s21CMFivP8H8gc+ugZIjB2XGCVUNkwJ+gjIvI+
         JeUNYf2N52/9sMw8zYCA/WxcttlPuRhrPv2NgUTu3HhP0Z76A4MB1xSRgNgvfmQKY0Mi
         XZDA==
X-Forwarded-Encrypted: i=1; AJvYcCUh7sGo48UqXDWneDtacIAj77dd/ZuKMSVpiXkC4Wc41ao824JtFqHskPp7OUUEzXfDNCoU@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3zzvmWsCycJ2eC2ZmkyM5VwWRj+4JnIkj77FqeD1C3/6fTRZ+
	A/RbyroWSp99veo0DICLvfYnPC1Ic6XgHG/P4b5pxhqFk4Vc6CEr3SX/8JlSIWMmATR637Vf19d
	Q1yF1NRZJiolnBeT865OgYkcORw==
X-Google-Smtp-Source: AGHT+IHmvDJivNH43Y01ucMKJYFoc8AFcX6hzmgU+8XoeSSFhpvEaQoSvahoajb/ht++NQ+MH1stDT2FsmHiW/GwHn4=
X-Received: by 2002:a05:6512:3f07:b0:536:54df:bffa with SMTP id
 2adb3069b0e04-5389fc7fefemr3962432e87.45.1727530879148; Sat, 28 Sep 2024
 06:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-35-ardb+git@google.com> <CAFULd4ZNwfPZO-yDjrtT2ANV509HeeYgR80b9AFachaVW5zqrg@mail.gmail.com>
In-Reply-To: <CAFULd4ZNwfPZO-yDjrtT2ANV509HeeYgR80b9AFachaVW5zqrg@mail.gmail.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Sat, 28 Sep 2024 09:41:07 -0400
Message-ID: <CAMzpN2j4uj=mhdi7QHaA7y_NLtaHuRpnit38quK6RjvxdUYQew@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
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

On Wed, Sep 25, 2024 at 2:33=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wro=
te:
>
> On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@google.c=
om> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Specify the guard symbol for the stack cookie explicitly, rather than
> > positioning it exactly 40 bytes into the per-CPU area. Doing so removes
> > the need for the per-CPU region to be absolute rather than relative to
> > the placement of the per-CPU template region in the kernel image, and
> > this allows the special handling for absolute per-CPU symbols to be
> > removed entirely.
> >
> > This is a worthwhile cleanup in itself, but it is also a prerequisite
> > for PIE codegen and PIE linking, which can replace our bespoke and
> > rather clunky runtime relocation handling.
>
> I would like to point out a series that converted the stack protector
> guard symbol to a normal percpu variable [1], so there was no need to
> assume anything about the location of the guard symbol.
>
> [1] "[PATCH v4 00/16] x86-64: Stack protector and percpu improvements"
> https://lore.kernel.org/lkml/20240322165233.71698-1-brgerst@gmail.com/
>
> Uros.

I plan on resubmitting that series sometime after the 6.12 merge
window closes.  As I recall from the last version, it was decided to
wait until after the next LTS release to raise the minimum GCC version
to 8.1 and avoid the need to be compatible with the old stack
protector layout.

Brian Gerst
