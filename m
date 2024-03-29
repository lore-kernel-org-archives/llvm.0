Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2C93BBE4
	for <llvm@lists.linux.dev>; Fri, 29 Mar 2024 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711704053; cv=none; b=JYSN/XYn6N3um4sm23zEssyhEmStjtTQCHAgSE4LL4DZUB0Ti2dmK2ZKmbuD76ISNykF9YM6n8XxIgdgXlCKQ62Yxka1X0+lvc6pOYdWOtvzgzEenFpj9FpjBWlFnOPQmZRYZqJoJ3jbsnalOsqD+9b+9wFuHdjv2LOoIaUL19o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711704053; c=relaxed/simple;
	bh=3+KzKfoPxJkXYBWH4jETA2PB/rqfcklrqomjdJgXvF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRCR6GtUI47snLajuYso2BBV1ZXh7TP1QIYUezYa6UvDDgEc1XbIT3jO+GoZOgO81Hk2aoCNoaI2Z251r391V7nZd94Vq7nYUxDUQrK+9PiIZu52sJ6Zc4YjTpjJvPLN5Vpm1zpqCe8Sg8vohLYaduyPRK+BibHgw5KIItQRhsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiOfytxx; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiOfytxx"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d717603aa5so5458711fa.0
        for <llvm@lists.linux.dev>; Fri, 29 Mar 2024 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711704050; x=1712308850; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lBcjPdLmjGCTnnG0LCAOX7aShBT4O93mQYNeFnPHhk=;
        b=BiOfytxxRnjUE8xdCjqCcvvT6+8CpVqElp1LvKNlYrYoHDl0Aa08xbvEbko+9GHXf2
         +GkAX+fgSSucBWDSTlkNlMNuP/BL+RDa0ek8vxSuXtuuoXYOHH8YTTgidKhQQ0OfgTjY
         zXuaBRUSCWz8dZqaIvrX+7JD36TflRkoiUzTpXGkQWUye9xICE03PfRUfE24QWeqQAKQ
         jG4xeZVIIXNkVAsqHnbrzHz42IecJjpOxSbLy0OBH9kvBkKUOOTyNRArRcQULWnAsxly
         IKPGT6/fQo8TFYrI3PW+CFnP14XQ5l8nk3DD7rF8ZiZAq9+ybVH7/D8U4SwPBO7VlBmw
         uXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704050; x=1712308850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lBcjPdLmjGCTnnG0LCAOX7aShBT4O93mQYNeFnPHhk=;
        b=bS6NQwlkfcZ93hyICz3masb9cZ8bHTqmx3bHinEXbHHuH4WpN0CagFGJ9goZbGRfap
         JGwO+8SaxVHGYhJ6lOKw0wV6ObfxMHUzvVupmaB/GcyRwYmCCzF5plVs855URTA+BjTD
         qlSI152ezUoTRSXeLdTc3SDryVLgEqGvuz0+ukRtPxWFhqvv7GnMlCPNpKnPEjPg6R33
         pO8OJgAclZF8wSU1fCJ0mSGBI+sMGdAStC8JAqUv+x/5LM9mNYq0nXwcFXjGQOg4VYao
         ACv1Y7eiaQtoBomd1b7D6WU1v3duXE7G/c0A/h/Ckek61HIUVm/tPPDN2F9RkrxyY6wI
         mNhw==
X-Forwarded-Encrypted: i=1; AJvYcCU8vOaOrLThIgDFvSM6og9nxw3O+SgAqJCIGd9tZNQzmjsgP4buZRi02BjmIwT3zMBkHtvBojALCPe8gJFnHqfeA811Qw==
X-Gm-Message-State: AOJu0Yzg36UMkGeYPRTvFBVvinO1oKtmP9PMhWRYdVHSYzvt6RKw6ALk
	j40U9e5xG1OxY2I9EtLp1WIhIM9OIEhs9/XuU/jbQpKgQfD8U5kONMCblEPpIqZEzzzqKH7TrB+
	yAHouiu/tR8LdreqGES3BBIyso2M=
X-Google-Smtp-Source: AGHT+IEvNfeOSZz8foV9UcNnuHUSiocg+9dt7y0SfIy5ywRQtsqYBK4r66KNFjq0SIqf3ZE8DH1iYRbFyCTHa0wmbVw=
X-Received: by 2002:a2e:a366:0:b0:2d4:57c5:886c with SMTP id
 i6-20020a2ea366000000b002d457c5886cmr921811ljn.13.1711704050115; Fri, 29 Mar
 2024 02:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328143051.1069575-1-arnd@kernel.org> <20240328143051.1069575-7-arnd@kernel.org>
In-Reply-To: <20240328143051.1069575-7-arnd@kernel.org>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 29 Mar 2024 18:20:33 +0900
Message-ID: <CAKFNMonPyESp5m2fuUn+w2mvwxxfaZB19ansXix9kV9jJCzUew@mail.gmail.com>
Subject: Re: [PATCH 6/9] nilfs2: fix out-of-range warning
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Philipp Stanner <pstanner@redhat.com>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Thorsten Blum <thorsten.blum@toblux.com>, 
	linux-nilfs@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 11:32=E2=80=AFPM Arnd Bergmann wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang-14 points out that v_size is always smaller than a 64KB
> page size if that is configured by the CPU architecture:
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

Andrew, could you please apply this to the -mm tree along with the
following tags and Justin's reviewed-by tag?

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Fixes: 3358b4aaa84f ("nilfs2: fix problems of memory allocation in ioctl")

Thank you, Arnd.
I didn't notice this warning existed depending on the environment.

Ryusuke Konishi
