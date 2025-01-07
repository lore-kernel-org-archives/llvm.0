Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE018EAD
	for <llvm@lists.linux.dev>; Tue,  7 Jan 2025 16:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267588; cv=none; b=dez+Mu47nCIgKyMb2CoT53Aowcir8NiEr28I462hE0pRTELw8LFgDRU/IvdmUdVDauAEGciTk0KGQeA/jnSAYORV10JGgS6Rs1irCMpQUbNml3AU+MZ6QCOIjWNNq2+69H94B2KLRL1AfzV6Jg9MsfRkO+OnRMnuj4oMgTADgOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267588; c=relaxed/simple;
	bh=liTE6uV42sa1Gzm/dqnu/eLrY1M/BxW/tHuKLz5XJ/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W126+k+Xd2EnRqjkSUU5bS5RyhwzsHBNGrsqgwHa32hqNHj74zks7Oet0kYmhk/75ZuytR9NEgmHwvVQw9/AT1bDKD9Aej3oR2Au2V2hxuhSUESApZHRmn7idd4ENrtOh6lJ3WS6CzhrxWSYMm3ZX02Mdy/WBGce09UVQdH8ksE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp9bl9wd; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp9bl9wd"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afe2a1849bso9072567137.3
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 08:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736267580; x=1736872380; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13/9/yjyywasTSBQ6NObq3v2ALYfJ6I+tEYYZLaV0yc=;
        b=Hp9bl9wdA7LGVWwR4Qr/kOuRhbbB7+ibzLSn/4m1pEOX1oWPtjr13RObFYNx2Ijv08
         7WHNPoTZ/P5O+PSNgleBXo5nEHMKZmCcPuMD38/ABbQDdqGIC2+GoX82RA+j1qcDwfKN
         1wYsRNKyC5noBganS431L/T0tHnSKH+b+g+g9a3DVzy6ZODZXsRChXbZrqwG4KgMLzIY
         FsSPG6qeig9UeXQxbJNPDuR589A2gkIp5tTCkyqo8/uVcjQY2uU+JxttE/mCGHNQLKzl
         owjnUDA4PNOavpoPE4dSBddxNLM6Cm49BMv9p4wmldtDF4hb+4SuQwTvxfKnK00iSMnP
         gICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736267580; x=1736872380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13/9/yjyywasTSBQ6NObq3v2ALYfJ6I+tEYYZLaV0yc=;
        b=nsdGf+8NcNNGeHiQu0QGHOxat0GuNzwsmzAvSuhizjRqX1dqFSLb8AHkIyt51+sxdh
         nAUgdUbKnI7DJBySlgoeeRGYS5hZuwRCue75/JFTnv6xtayZFI004xkw7eEZVjuw4/fU
         b29U0LEtmcOibmTPJ4Tk+fKT4ptqVYof02qnodHs5b5iXh8LnMH7VU3JP7CP8fgQshk5
         8OZJS/bgeWoke11BELiyBiPdGJlb6yZvL/mf33yd9hipl9ajXHIdSBAbqYn26mT83Mhv
         3Ze7KYBOgi4XuYPZbpsQMuCNQ56j70sl/24Wkt1MEaF4jTD31dDVAmUBUmugaahOA9J7
         FlgA==
X-Forwarded-Encrypted: i=1; AJvYcCUyQmtnfxktHC6UzGFT2kl8yw/mRSqLadw5w1NCyjt8SOCNsjFpNq4pYhNFHnv1RBu5cCW/@lists.linux.dev
X-Gm-Message-State: AOJu0YxCEk1UvZqxkrnwmVTda3Mp1XqQnz+fKgWOXuXtyYDEiPj7cIDc
	OWJ07EIezvhmyrLIwar3ewAGfYswL/mL0IOtJiMLks0wiY+6D5peoiz9Cu5tdYmznJgYKgnJ3nk
	X13afyaV1VDxRMjZKqLl2brLCy/k=
X-Gm-Gg: ASbGncsJ5Kw4snk451kglDv2zZf2LttPtCALCgo3+qG8BEo+QWpbftOgUwc9q/cWGrj
	uxuOZToLZyif+r5aUkLJ15S6ntM+sRUssHnlIjQ==
X-Google-Smtp-Source: AGHT+IHOgO35A7KsAXCntcGhrO/sYRTA/0+tQf+oPG1WO0j2n3ejAB8/55UzS7HRl/4g7zJoK5SlnBgWj1fHwbEeYOY=
X-Received: by 2002:a05:6102:419f:b0:4b1:11c6:d3d2 with SMTP id
 ada2fe7eead31-4b2cc472ec8mr44408804137.27.1736267579964; Tue, 07 Jan 2025
 08:32:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241216164055.96267-1-cgoettsche@seltendoof.de>
 <20241216164055.96267-22-cgoettsche@seltendoof.de> <CAEjxPJ7NdTWu4dspY9cbPMtRsW_jERoRbKBsObbvsEnwgmZ8Ew@mail.gmail.com>
 <EF4B3759-2C4C-4A15-A721-6B2D0FAFD84F@gmail.com> <CAJ2a_Dcw3KQUNv1HQFp4qPOoZ972hjr6Qa2LAXTTv6SkV_Pd0A@mail.gmail.com>
 <6b9cd467-cc34-4ded-b68e-c98bd5870537@linux.microsoft.com>
In-Reply-To: <6b9cd467-cc34-4ded-b68e-c98bd5870537@linux.microsoft.com>
From: James Carter <jwcart2@gmail.com>
Date: Tue, 7 Jan 2025 11:32:49 -0500
X-Gm-Features: AbW1kvZhafgNUvID5cjber50NBlxYOBvxM2DuzpAX5jm0imn-VpIwq-23ThAkbM
Message-ID: <CAP+JOzTuybcdjKoej1oprs9DCbq6TUEL2f0XRK+QtgjaPfdO_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 22/22] selinux: restrict policy strings
To: Daniel Burgener <dburgener@linux.microsoft.com>
Cc: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, 
	selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Paul Moore <paul@paul-moore.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	=?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	=?UTF-8?Q?Bram_Bonn=C3=A9?= <brambonne@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Joe Nall <joenall@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 11:12=E2=80=AFAM Daniel Burgener
<dburgener@linux.microsoft.com> wrote:
>
> On 1/7/2025 9:04 AM, Christian G=C3=B6ttsche wrote:
> > On Mon, 6 Jan 2025 at 00:26, Joe Nall <joenall@gmail.com> wrote:
> >>
> >>
> >>
> >>> On Jan 3, 2025, at 2:12=E2=80=AFPM, Stephen Smalley <stephen.smalley.=
work@gmail.com> wrote:
> >>>
> >>> On Mon, Dec 16, 2024 at 11:42=E2=80=AFAM Christian G=C3=B6ttsche
> >>> <cgoettsche@seltendoof.de> wrote:
> >>>>
> >>>> From: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> >>>>
> >>>> Validate the characters and the lengths of strings parsed from binar=
y
> >>>> policies.
> >> Excellent idea.
> >>
> >>>>   * Disallow control characters
> >> Fine here.
> >>
> >>>>   * Limit characters of identifiers to alphanumeric, underscore, das=
h,
> >>>>     and dot
> >> Fine again.
> >>
> >>>>   * Limit identifiers in length to 128,
> >> Fine again, our longest
> >>   - type is 51 characters
> >>   - attribute is 31
> >>   - boolean is 46
> >>   - role is 12
> >>
> >>>> expect types to 1024 and
> >> I don=E2=80=99t understand what this means.
> >
> > Similar to your list of the length in you policy boolean, role, user,
> > class, and permission identifiers are limited to 128 charatcers (not
> > including NUL), types (and attributes, which are just special types)
> > are limited to 1024 characters, and individual sensitivities and
> > categories are limited to 32 characters.
> >
> >>
> >>>>     categories to 32, characters (excluding NUL-terminator)
> >> One category or the whole category string? A single category longer th=
an 7 characters seems pretty unlikely and 32 is wildly short for the whole =
string.
> >
> > This only affects individual sensitivities and categories, like "s9"
> > or "c1023", not whole MCS/MLS parts.
> >
> >> Joe
> >>
> >>> One option if we are concerned about breaking backward compatibility
> >>> with policies in the wild would be to make these restrictions
> >>> conditional on whether the policy is being loaded into a non-init
> >>> SELinux namespace, similar to:
> >>> https://lore.kernel.org/selinux/20250102164509.25606-38-stephen.small=
ey.work@gmail.com/T/#u
> >>>
> >>> That said, it seems hard to imagine real-world policies that would
> >>> exceed these limits, and likely could make them even smaller.
> >>> But as Daniel said, we should make them consistently enforced in both
> >>> userspace and kernel, and potentially these should all be #define'd
> >>> symbols in a uapi header that can be referenced by both.
> >>> Looks like you left the type limit at 1024 despite Daniel's
> >>> observation that CIL uses 2048 as the limit, but as you noted, given
> >>> the page size limit on the entire context by various kernel
> >>> interfaces,
> >>> this is likely fine.
> >
> > I interpreted Daniels comment more like a assessment what CIL
> > currently constrains, not as a request for a change, maybe I
> > misunderstood?
>
> That is what I intended, yes.  My related request was "I would think
> that we'd want to end up in a situation where the kernel is either
> equally restrictive or less restrictive than CIL".  In isolation, my
> opinion is that the 1024 limit is fine, but I've been hoping James would
> chime in about the feasibility of dropping the CIL limit at some point
> to get them in sync.
>

The CIL limit of 2048 is arbitrary and could be changed to 1024
without a problem.
Jim


> FWIW we have a few generated type names internally that subjectively
> feel long to humans, but are still under 100 characters.  So 1024 is
> plenty of extra margin in my opinion.
>
> -Daniel
>
> >
> > Exporting the limits via a public headers seems reasonable.
> >
> > Maybe for a smooth transition one could introduce a build time
> > configuration (CONFIG_SELINUX_STRICT_IDENTIFIERS?).
> > This configuration can be disabled by default, leading to identifiers
> > not being rejected only logged.
> > Than after two releases the default can change to reject instead of log=
.
> > And after the next LTS release the configuration can be dropped again.
> >
> >>>
> >>
>
>
