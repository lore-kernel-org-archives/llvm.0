Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB6812F5A4
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 22:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663504; cv=none; b=mBoG+WKwlnYTbu8RqfSj7NTjXyfmo7jcTsPxMlKelUAT73Xv7MRRxF48CunxEXu57rZVG5BPPbM+rFu2X0zVyW0ZuKw0oHP4fpXBh+20Nz9AxI2uIut+/eUQcO9Nt700USAXURPsnkRCDZrFiYLSzgQWVZecVfr71F0k4QB6Jg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663504; c=relaxed/simple;
	bh=9ZSPvENfmgfhIsnuJFWhvL6BmUkVhFz5PSQ7INGUgHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1Z/yfD1RankBlPeAiTs1QEqrjJijMJehfn8Qw9NXdCwaLZucOSjlziUzzMt/pjhDme0uIKMUcjTyejKDqHwgDe2LUEgy66LmZduaIUpIyCmpKLDMVkETDyIBtn/yTFO7rHAVaH2hgllq2oS6V4EK4ZZ8ikgPiDi8eArybS2dOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mqke1D4f; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mqke1D4f"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56c4ca65dc6so1802383a12.1
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711663501; x=1712268301; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGMxoG8AQ8BGP67PTNjLH3VS7bl1OwfTgMURF7OtwG4=;
        b=mqke1D4f1Ogx+clo0212f779OIBiwQ4DcBnwxfuSdDT0SwvKbSZuHqmau23Zo4do3J
         bMfI0PxwaqHvozbYjVjMlF/8SA+sxJKBAIKAzqvTEo6V9UtzVFvo9pL4JmKftvHnwt1C
         JDscH48L+SSWKevYbGuVsyC58lR4rhSsNElvvt2q0G/ff9QonUwW+EuPatUIezhJNspZ
         YquuvU4MmdY9zOX7cQJuCKBlP6vBAQVJn4I6Y/RxFQByrqr3DnDM70ppPA2/dfjjx4pg
         gHlLsAtidYpsGXH44JkqbaoS0513aP75pJqqYtdun8cjkAZwkFc7hJICrVGm7dKL5a+r
         kXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711663501; x=1712268301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGMxoG8AQ8BGP67PTNjLH3VS7bl1OwfTgMURF7OtwG4=;
        b=SViWvt1aDXE8UJmzimd73CtMa6O2V7yyPYmmlOLKrOEzEvDk+t8JeTZctgcT/2+rZG
         4dPmORTmA2/S1yuh+iCYr5Of99dHvtLjXgFJ/BfvydjOFBbUkAQMk9aJpAT2heSU4Gjp
         erOkJtR/JixJqSrcEnVwe2CpPWfmED2mLO/PxwT386AbVTU37N4DYWnBD8seBH4VRJs4
         nhXpI8Zqp5qjTrKNCWHxPzob8pilo56yMcbiEnDe2jsXoomCcIJVnrQaHCaaGiGz+rW6
         yQucMH/DQqBlQUhyPjZ/Map7ZjNEOkmQRCzV3+tavYCOM51Afqh9Q/kdezGswhQrasJ4
         VBvw==
X-Forwarded-Encrypted: i=1; AJvYcCWxl77/3uniLMR3m4m63H3LbFAKsM+NpuxlflK2DcJ31/pkrwJh5BsQxe7AyU+PrDLCeKEvt3pQzINoFsPEVLhIXR7KYw==
X-Gm-Message-State: AOJu0Yw/s9HWk49HoPJXQAISvTF6kwTmIDAHDWjj3XFlQLMPnGC8s1yY
	6SS6ClhlpYi6/YoLqGgiZEMzWi5dBdQIEltjXLSmrdl1UwI3ISAP4q3XERi3HrlrwrHj47hhOW+
	+IOYVBh6wV/q07F8hk+vxjS6NWo+PcVCNkIpD
X-Google-Smtp-Source: AGHT+IGI1NuivKb4Ji1liwhmjoNA08qow9K2J1nHBY2lkA7t+bjvkMMP3tHaIzK6dIha9lwR+QhUcEEc6nDcKmlEY7E=
X-Received: by 2002:a05:6402:35ca:b0:56c:2ef7:f3ed with SMTP id
 z10-20020a05640235ca00b0056c2ef7f3edmr442959edc.35.1711663501455; Thu, 28 Mar
 2024 15:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328143051.1069575-1-arnd@kernel.org> <20240328143051.1069575-7-arnd@kernel.org>
In-Reply-To: <20240328143051.1069575-7-arnd@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 28 Mar 2024 15:04:49 -0700
Message-ID: <CAFhGd8oJ5trNE7na9jCDbEt5kox1rg0mia59EHj+XikHUnay5w@mail.gmail.com>
Subject: Re: [PATCH 6/9] nilfs2: fix out-of-range warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Philipp Stanner <pstanner@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Thorsten Blum <thorsten.blum@toblux.com>, linux-nilfs@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 7:32=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang-14 points out that v_size is always smaller than a 64KB
> page size if that is configured by the CPU architecture:

Is this only with clang-14?

>
> fs/nilfs2/ioctl.c:63:19: error: result of comparison of constant 65536 wi=
th expression of type '__u16' (aka 'unsigned short') is always false [-Werr=
or,-Wtautological-constant-out-of-range-compare]
>         if (argv->v_size > PAGE_SIZE)
>             ~~~~~~~~~~~~ ^ ~~~~~~~~~
>
> This is ok, so just shut up that warning with a cast.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

My question out of curiosity aside,

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  fs/nilfs2/ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/nilfs2/ioctl.c b/fs/nilfs2/ioctl.c
> index f1a01c191cf5..8be471ce4f19 100644
> --- a/fs/nilfs2/ioctl.c
> +++ b/fs/nilfs2/ioctl.c
> @@ -60,7 +60,7 @@ static int nilfs_ioctl_wrap_copy(struct the_nilfs *nilf=
s,
>         if (argv->v_nmembs =3D=3D 0)
>                 return 0;
>
> -       if (argv->v_size > PAGE_SIZE)
> +       if ((size_t)argv->v_size > PAGE_SIZE)
>                 return -EINVAL;
>
>         /*
> --
> 2.39.2
>
