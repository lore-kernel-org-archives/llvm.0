Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24932EB5B8
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 22:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778020589; cv=pass; b=J1+00cRXKtB7U6Ev6ZueWidlG7BdtWWBSk4KUHmet8oWwpDabcsNDBcz+8c6W7+7/UKt8ANVrvIrToCmlUIHXc7mCdmV2s7P/Jug/TvffcR4KcztsCVE/RKIDCTUFFnqSnCm61/yUq7+uRJ3QJfBMuW0YU9IWGMueEzBloEhaA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778020589; c=relaxed/simple;
	bh=J3ELPEUcrO2zmjxI5+NqmWqbHYDRud46K0IvIAAZB20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LX6DFzwIq28anAWX5Nm71eqFtGnTZLIrQ/ORfSI2VF5MCwuwwugOYS1ulND4PCjEesbX+idVgNmemJ4qU5Ak+XS/J8fQPDbHUVgJHxlYurVsCEn0inXnPekzdVJodimEF0vkP5TtozcUeGszo1GBKX9qQbGFZuNj1iXZty8clzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kx3LhI89; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kx3LhI89"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a8738c178dso1951781e87.1
        for <llvm@lists.linux.dev>; Tue, 05 May 2026 15:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778020586; cv=none;
        d=google.com; s=arc-20240605;
        b=VQq3ktp3NEQr8Yatw2c9HDo9niD285voqEIXWpgk+GgT5pnGYQLpMadFhxErvzCGez
         5vDvPbbh8MLlWJwP2UsWsBSkmKnl1ZO+9QcPpYRjqSvD5fw2U639KavwBQUuQLn6J2Z6
         rg1Bm7wqoNBCYr2wONkkLve3zMRivbMRsVY6C6PAX/neiHqotfQ4GBkxyupmnYx4KDEx
         4ZDnvdX9h6x9feSzVx8ZK/PqqWI5oOhJC/HcsgEzekZM9I1uNbwzbSoHNZuWcB2xPKIB
         YGbpTQxEXGZVjZcSihosKKjcmlG/oKoKyCRoK7WAbN77MZJgfQ+k+1gyixNEz/2eBZcr
         Vc0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rzqbw/nypFqS+4DSh/aG9WhAbZfgykDJtFsgi1ul23I=;
        fh=haEyaFp0XmXt8/NNr3EMVAOq40ILsH27Vjd/g3qSFK0=;
        b=B/DXz95JMzeQD0vk8T2uG3CEA1vc/hShEzetT4kDxQgjHvXyTVf2V89mlSft546ZT5
         K0z5nNVUO8tdK5HKbM25Qq2IOOKr7/iJItuBszx26pYP25n+RKikf7+30VsNTdZkO94S
         pQ/Dr6WT0i8ro+UEplVIeQOx4Ec+LNJ5zmK81pdGIXf2LbTPnR9YI7C0rbQ0CVg3UUXe
         yr4VrxoxZ31W1fk5YMZaBP5+CutHXbMki01Hq/n/AixzCo61JZJgov+Puvddrs2MFmeK
         e/t27pRw1g0VOGZMkiGqiAhGMOrhc5sFVMWJHDuz0HH5n4szm40NE7OLvGgAiN1JvutT
         Flfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778020586; x=1778625386; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rzqbw/nypFqS+4DSh/aG9WhAbZfgykDJtFsgi1ul23I=;
        b=kx3LhI89zgyIvpQcbvTRrGnMNLaIPTWIQT29IDCeFoSVT0Hukk84TemiLcqGcXl+IH
         OaKtDEzRFbKH22KXqC6TV6Emsy+HquDB7nT8UjND+Urgp09U6N8RjKlyhHX8jXWpmqam
         T7HxeQQbFtruNs+Rd1I+ZK37Z/JWsoRggZMlehq7DgWbh70XkpSv2K2gzLhY/I+ADibq
         PSpPQ/42mwMQp8NuLAOw479tQPFySt8F15p9freLPF8ltQS7Cx1eK2hFmXDjPjxZUglF
         3/DwR6Kk6MJn7MgHeGD2eGvA849TNIbRGC54KETG+nJrN16/PfaC1aDnvWxzhZaG7ImP
         7gEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778020586; x=1778625386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rzqbw/nypFqS+4DSh/aG9WhAbZfgykDJtFsgi1ul23I=;
        b=KW+hMyU4WlcAo9zmoVdHKtHryp8Hz5HpUOjvTG2/wZY57tpXDqNWa12Y2AKMMseIMM
         rwm9TVzjJtelJNom+iSOvuNacrBEu5811PKuvjkwz9Zm/hKTDjZT1TAaLq8m1PCpBKER
         M8naIvaeg8QZyKqdte70Eb4t+QZl6s93ag+vN+hERHCZd01DyDlzPebbTkrEPPs7VVoe
         Amw/CiGxfYRuLBesJa+b7KQeDjM57H7bHM+imeye3/l+Fo8jck3hFke08bFenv2koqAr
         fWhNITCSKGvryIPzoV0ukyfoMUTvYqZd5dpPrttfsec9BJ+Gh9R1rsxXPGCvgKeMgB0s
         GLnA==
X-Forwarded-Encrypted: i=1; AFNElJ+GD04Ked7A+0AqS1nqaBTBsprdTHRWnFu5s2EmJZMaKs8heIi1kMakUiVWFkNqbZ3Vab1h@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7ZvyNClKr4Q8WFX1XP3E4No4/FtXJqBRAEAEWK5R6zd+Et6L9
	oYpGmWhqpSO0DQFoS1QRP+7372rOn63yDrWsyqIc4EHDbcObjbboJZd0N587B5qi+ofGQ7Sz4l/
	hC8OYGlS0GSqUvmOsyl2C86ykDQKS1eQ=
X-Gm-Gg: AeBDiesV0WI/NKoj2J42VGeqUcjRVRv1IlAVijb/Z4/At1Jvil5BFKM+1HzX5uRJFYN
	itPkoxOPO/MhAyvbrxrrjS7UObZLSDW7BdPyUz2ALRPlVZ3cjdZUOGhs9zgn16ig8+IUvra9NnL
	1boRMfw6ftffOzOlBYxqRosAOMsC5RmMgS0/LrADQ2jGPvPS65a4hCLLAI6iZA0baP2nzA8fGLk
	hIqhZYhDEyrmC9QJVLxlzT8ABcTTWDBaJ6Qj13P+DBCgzaFRMXx5rQj4VHDBouUugp22AW2KJNt
	evJrp1zME3bUgFiNtIr+EozrCZaMkwOS88gLextP+AP4eccizOgNYGoiUrC1LNnvQp3BMQs0E0F
	OaEO5tUnXtX+jACcQ5x6f1WpvLqFqocs6EsMGRgr42UXTroDm0101jHnm07R0UUbS13JS
X-Received: by 2002:a05:6512:3195:b0:5a2:c4f1:2635 with SMTP id
 2adb3069b0e04-5a887cec51cmr208911e87.41.1778020585718; Tue, 05 May 2026
 15:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505010112.645361-1-rosenp@gmail.com> <0f11390f-e8bd-4f8d-aea8-59ef545b2c32@app.fastmail.com>
 <CAKxU2N92s06-L0+e=KZ7EbtU50tCpaCk2MYJD2xTFEHEsAhXUg@mail.gmail.com>
 <df3e889d-ac8c-4d11-a5fe-8ed2769953f0@app.fastmail.com> <CAKxU2N_moR8bs=NLUcW054a=oHB--4i+M5XKCBNF9LskYcjAhA@mail.gmail.com>
 <add152a5-09bb-4c6b-a17f-da3d817b93e9@app.fastmail.com>
In-Reply-To: <add152a5-09bb-4c6b-a17f-da3d817b93e9@app.fastmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 5 May 2026 15:36:13 -0700
X-Gm-Features: AVHnY4KmhUVE_Ek1NBAQLUwefKU2Vsdr5nkeVFvJ1HuHAbomEgHQB-nmVguGnIg
Message-ID: <CAKxU2N8E=s3==64xYGHGGCV80cw-c88vjRHk0ery6LzBhuit4Q@mail.gmail.com>
Subject: Re: [PATCH] mm: move phys_mem_access_prot_allowed to header
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 2:23=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, May 5, 2026, at 10:54, Rosen Penev wrote:
> > On Tue, May 5, 2026 at 1:29=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> >>
> >> Does this happen with both ld.bfd and ld.lld? Which version of clang
> >> and lld are you using?
> > clang version 22.1.3
> > Target: x86_64-pc-linux-gnu
> > Thread model: posix
> > InstalledDir: /usr/bin
> >
> > lld the same.
>
> Ok. I've tried to reproduce this with Nathan's llvm-22.1.3 build
> from https://mirrors.edge.kernel.org/pub/tools/llvm/, but don't
> see this problem on mips defconfig. Are you using a particular
> configuration, or do you see this on every build?
I use allmodconfig. And yes, every build. I'm using a fully updated Arch Li=
nux.
>
> > I don't specify lld explicitly. I assume LLVM=3D1 does that.
>
> Yes, by default it will use ld.lld. For cross-checking, you
> can try passing LD=3Dmips-linux-ld.bfd (or whereever you have
> installed your cross or multiarch binutils), which should
> still work just fine.
Arch seems to not provide such a thing.
>
>        Arnd
