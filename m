Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E937A2105
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 06:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75155C433C9
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 06:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686896881;
	bh=NK6NuNFj6+ESLJk6aKbG68bt0tVJtq65SC771NXQPfg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WwCkCulQ6VNP6YtmzKbofwhV7Z2+OKi2JPo0GjlVrFuD+Ok0Yq/Gg++NnVw+iYMDr
	 5iz7p5PFY3HafVtWf0I9vr3r09RSpQJ9oJO0rQRExuh7qb1Jzg/rfAXSb4jYhl9K/J
	 o+7Yz8vSs0P484qhoE2tlZssstXQQo4MiOGQmx7e2otY0gNALtDe2W9igNHZLeL1jX
	 /OiOwBr+65CIlNbJ0DJGBH4bGj6MQFO3zt/BWScq+/3OemQKsAwqulJMMpQE6jOsP3
	 Jq7RpQ2U069FvzGKo3OICqcDDPjwpXHjmOBQ0yZuvD1CtxmLCfg3u0O9V2AtOhPTp/
	 kTek1+U/Omx6w==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f76b6db73fso1912258e87.1
        for <llvm@lists.linux.dev>; Thu, 15 Jun 2023 23:28:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDyns/wpGYOD1lAzblNF996CXjjSTyQsTL5HzTPX/lycpbehy6Nd
	4HZZ4kAC4Y99td5lRfbEgLPNmWv3zqh8BMAlOGE=
X-Google-Smtp-Source: ACHHUZ4/Yfz6iefR4/LZNWw3H9bD7KIpGKrwWMx1kWDdh4k0Fq0YPCWWuMoccGxCBeNVge+THgNUshhhznV0O6TiVkU=
X-Received: by 2002:a05:6512:1289:b0:4f6:19c3:da30 with SMTP id
 u9-20020a056512128900b004f619c3da30mr2240526lfs.29.1686896879390; Thu, 15 Jun
 2023 23:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230616012136.3047071-1-yukuai1@huaweicloud.com>
In-Reply-To: <20230616012136.3047071-1-yukuai1@huaweicloud.com>
From: Song Liu <song@kernel.org>
Date: Thu, 15 Jun 2023 23:27:47 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6aSvCEa1khjjmDYGozUEs+Tx75RxfaE1+xL2Y1T6aN=Q@mail.gmail.com>
Message-ID: <CAPhsuW6aSvCEa1khjjmDYGozUEs+Tx75RxfaE1+xL2Y1T6aN=Q@mail.gmail.com>
Subject: Re: [PATCH] md/raid1-10: fix casting from randomized structure in raid1_submit_write()
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, nathan@kernel.org, ndesaulniers@google.com, 
	yukuai3@huawei.com, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, yi.zhang@huawei.com, yangerkun@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 6:26=E2=80=AFPM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> From: Yu Kuai <yukuai3@huawei.com>
>
> Following build error triggered while build with clang version 17.0.0
> with W=3D1(this can't be reporduced with gcc 13.1.0):
>
> drivers/md/raid1-10.c:117:25: error: casting from randomized structure
> pointer type 'struct block_device *' to 'struct md_rdev *'
>      117 |         struct md_rdev *rdev =3D (struct md_rdev *)bio->bi_bde=
v;
>          |                                ^
>
> Fix this by casting 'bio->bi_bdev' to 'void *', as it used to be.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202306142042.fmjfmTF8-lkp@int=
el.com/
> Fixes: 8295efbe68c0 ("md/raid1-10: factor out a helper to submit normal w=
rite")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Applied to md-next.

Thanks,
Song

> ---
>  drivers/md/raid1-10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/md/raid1-10.c b/drivers/md/raid1-10.c
> index 169ebe296f2d..3f22edec70e7 100644
> --- a/drivers/md/raid1-10.c
> +++ b/drivers/md/raid1-10.c
> @@ -116,7 +116,7 @@ static void md_bio_reset_resync_pages(struct bio *bio=
, struct resync_pages *rp,
>
>  static inline void raid1_submit_write(struct bio *bio)
>  {
> -       struct md_rdev *rdev =3D (struct md_rdev *)bio->bi_bdev;
> +       struct md_rdev *rdev =3D (void *)bio->bi_bdev;
>
>         bio->bi_next =3D NULL;
>         bio_set_dev(bio, rdev->bdev);
> --
> 2.39.2
>
