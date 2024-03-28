Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0014F20E
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 22:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711666431; cv=none; b=XsFm1kHkiMNtkEVzuXnfDtUvh8dlZSSM589V+tDBrZit29cmuE5zJiaaXVGzZPceWfslxm55ICYNazCBvYyBi0g0XxDvM+HSHkZMDj/uPL/vEYeoyna00JJ91FdIY/aoY738U0NOoElD4ZuaVl8wOC8e3L5q8BxmYPHxkLzK4K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711666431; c=relaxed/simple;
	bh=m2sHr69UQ23/+yNNagVCVSd+tL9gNcumuplvgXMM3eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTFag5MzTXrx3Z3juj6KBCgaNHvDouFmu3KSBKdPSWjvZkXtNUtx8hvNnrJ4p64pDoqrLTqTXffISDPq9Mcw5U8n0JS1r2D+oBEHesuUDi9FKloR39/9Qxh42e5X4mqybxXKDgJoboLaimWlboXLz1xE2KsO0Dfi5YaiaTfjGMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VMvBfV2p; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VMvBfV2p"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56899d9bf52so1954742a12.2
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 15:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711666428; x=1712271228; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEbIDW7kbPaE87dBPORDU/rsnpNPLPoHlh1VVnWn9NA=;
        b=VMvBfV2pi4iPLYzdqdGwTC1ePF6ORLzB9d51B+833WVSm1iFLW9buSMY289xFjd0XC
         Z/B2HEojVOixPWYl45gTVZZWn2yavFgrtKZcGclM1fC8L9ePxZ0vsKdJV+uW+tgMiJ4w
         so7ZKQyHckgfWPe5Pk4ca9NX4djJpNrWxhIs5QA3R5noGtknNR2VDM14JWyivi3VqnuQ
         TXxdUh6GS0KGuRYz0qO4612xGwEO0Uq3weB+rJzgnJVWX2CJQ62BCj925tSJQ9vx+vSg
         W/TmVRATiwOzL19irTbBRJLgqsX1Z9dDO/sQ1KXtfuq4Cl+i3ClE/CfznjMnddNADMe0
         daoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711666428; x=1712271228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEbIDW7kbPaE87dBPORDU/rsnpNPLPoHlh1VVnWn9NA=;
        b=B6MFLbQrJoq6s52YUkthg7rwX6YzGkJ3nLnuH4imMTsvQdvtc/qqFFgrpu+jUYtFN7
         gpONFX5petV9QkjVymJTNhGq08pALiXN2EYiAFGI1z1RuXbUyXxrWtokbkuzBPYT4YcZ
         Waong3tyCgReo5bSG0VBgP+Fv0EtPKKhxK1O3rkCIWvqz3yr+e13c41FjAComE97W+ew
         buovinxzWeS7mxV6lGrohAM5plLZwGvkwNEE70Vy0jVAr6RxBtXE5j5W/QqK/sKKAaTU
         ZuGe+mBiiMgiYa9ACr5safMFN0LwFKvsDMdfM8NlxY8ENIj+21Gx7u2E4tP6h050wzNX
         3RPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXymhHvlWaDi20gIq8kW0Nlelk4WuJh4oo2j9QKVn21fZWHlnjXx1IJ5pljTznK09j57b62duIKtfXpCdwOF6Tfiaty+w==
X-Gm-Message-State: AOJu0Yzke3z3CCJEZb17B6jQkYmaK7kQobI6tPXBvQ2Jplhoknw+atDb
	02oSmHO8Zkz94F5OuRl8DzTh+Ur//AxJHBSa0YbClHblk67cbDIbqaynEbL20CwfuSR4cwIeYKU
	aa8QA53w7nFQwhmPfoJuSy8ikPQFzA+RkpXst
X-Google-Smtp-Source: AGHT+IHSOF7Jz1HlwWi9ZnZS4sDGFwM0sUVO6wKPz80s3bzKUakcomIa558eS7Mlmg+NfUj6hjAXDu38td4y54TNQ6s=
X-Received: by 2002:a05:6402:254a:b0:56b:e089:56ed with SMTP id
 l10-20020a056402254a00b0056be08956edmr540944edb.39.1711666427673; Thu, 28 Mar
 2024 15:53:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328143051.1069575-1-arnd@kernel.org> <20240328143051.1069575-3-arnd@kernel.org>
In-Reply-To: <20240328143051.1069575-3-arnd@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 28 Mar 2024 15:53:35 -0700
Message-ID: <CAFhGd8rCzhqK18KLtLVLWyWHtQzJsHCkkkQQyLbmw83K6ExKkw@mail.gmail.com>
Subject: Re: [PATCH 2/9] libceph: avoid clang out-of-range warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>, 
	Ilya Dryomov <idryomov@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jeff Layton <jlayton@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Milind Changire <mchangir@redhat.com>, Patrick Donnelly <pdonnell@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, ceph-devel@vger.kernel.org, netdev@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 7:31=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang-14 points out that on 64-bit architectures, a u32
> is never larger than constant based on SIZE_MAX:
>
> net/ceph/osdmap.c:1425:10: error: result of comparison of constant 461168=
6018427387891 with expression of type 'u32' (aka 'unsigned int') is always =
false [-Werror,-Wtautological-constant-out-of-range-compare]
>         if (len > (SIZE_MAX - sizeof(*pg)) / sizeof(u32))
>             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> net/ceph/osdmap.c:1608:10: error: result of comparison of constant 230584=
3009213693945 with expression of type 'u32' (aka 'unsigned int') is always =
false [-Werror,-Wtautological-constant-out-of-range-compare]
>         if (len > (SIZE_MAX - sizeof(*pg)) / (2 * sizeof(u32)))
>             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The code is correct anyway, so just shut up that warning.

OK.

>
> Fixes: 6f428df47dae ("libceph: pg_upmap[_items] infrastructure")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  fs/ceph/snap.c    | 2 +-
>  net/ceph/osdmap.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ceph/snap.c b/fs/ceph/snap.c
> index c65f2b202b2b..521507ea8260 100644
> --- a/fs/ceph/snap.c
> +++ b/fs/ceph/snap.c
> @@ -374,7 +374,7 @@ static int build_snap_context(struct ceph_mds_client =
*mdsc,
>
>         /* alloc new snap context */
>         err =3D -ENOMEM;
> -       if (num > (SIZE_MAX - sizeof(*snapc)) / sizeof(u64))
> +       if ((size_t)num > (SIZE_MAX - sizeof(*snapc)) / sizeof(u64))
>                 goto fail;
>         snapc =3D ceph_create_snap_context(num, GFP_NOFS);
>         if (!snapc)
> diff --git a/net/ceph/osdmap.c b/net/ceph/osdmap.c
> index 295098873861..8e7cb2fde6f1 100644
> --- a/net/ceph/osdmap.c
> +++ b/net/ceph/osdmap.c
> @@ -1438,7 +1438,7 @@ static struct ceph_pg_mapping *__decode_pg_temp(voi=
d **p, void *end,
>         ceph_decode_32_safe(p, end, len, e_inval);
>         if (len =3D=3D 0 && incremental)
>                 return NULL;    /* new_pg_temp: [] to remove */
> -       if (len > (SIZE_MAX - sizeof(*pg)) / sizeof(u32))
> +       if ((size_t)len > (SIZE_MAX - sizeof(*pg)) / sizeof(u32))
>                 return ERR_PTR(-EINVAL);
>
>         ceph_decode_need(p, end, len * sizeof(u32), e_inval);
> @@ -1621,7 +1621,7 @@ static struct ceph_pg_mapping *__decode_pg_upmap_it=
ems(void **p, void *end,
>         u32 len, i;
>
>         ceph_decode_32_safe(p, end, len, e_inval);
> -       if (len > (SIZE_MAX - sizeof(*pg)) / (2 * sizeof(u32)))
> +       if ((size_t)len > (SIZE_MAX - sizeof(*pg)) / (2 * sizeof(u32)))
>                 return ERR_PTR(-EINVAL);
>
>         ceph_decode_need(p, end, 2 * len * sizeof(u32), e_inval);
> --
> 2.39.2
>
