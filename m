Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DE71FC4
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 17:19:13 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-63cf40716ffso16043606d6.2
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 10:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690219153; x=1690823953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHqlkjiN6F7mZHmC296PE6xQOoItN+fVKPLF3TUGTVI=;
        b=HFHY127KcwxOhKq5Bri1cro15FAkNa5SlM1FnQX3pl0u+VO3Bn11Vc+BLFKQsIh0qd
         4+3053sdoGd0VLrcSU+KtN0OCxZTjUqtSMCssDwasWUzfIoYX5+POQkWDxZt89M0kz96
         zIlQG61pCNSEKCeryktg+GDMoz9NSSszsiF2CptitKlAcDo+RlBOaSbyxGsETMFf0wLt
         qgzd9wtLBkB57uRY44bxZIabgouPeMWmBnOKge2XEc0potLBZTB7tXvdiO1T2+e+GZLy
         wBX1Mr3RKUi1mWgq8JyelZglpRXG7M2gtWKKlZ3o9x/qjhS4NRFAyo7niZCQalU1EwRC
         ch3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690219153; x=1690823953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHqlkjiN6F7mZHmC296PE6xQOoItN+fVKPLF3TUGTVI=;
        b=MC3xgGOadN0qwehPR9K/FJFyOShudIM18hVTMgXpi8P9SiA7u1bOb+w/xOIDl0U/Zf
         j+21Fq+eR0V35cXrPedsahqC0xXTK6O87ABTsoG4liFIkid2sD/EAk3mYO0H11R7EoGt
         ymu4LjHhRZMN0ARhhKSwfa02JOG+ZXM8YH8V2OXFdSEA+D7pK2N7w6gNsjMP28zHB7sZ
         rp8mzBIytMrQ93E9mXxBwj2PmmTIFrXOSTevHmoQeacu0QtFn9pnDCkOnkVyXnTivVZh
         htcHRrf16EQK5Yw+4OJ1NtB9dd0qJu7FOFkI/aTuGXoIR8VsszFS9i+0I86E6nv9cRz9
         pnbg==
X-Gm-Message-State: ABy/qLY7ayDcesej/GiW7OdUsSpLmPq5/PVvYQC6ozdHLsPi52zI8xTF
	oCqfADQQjAjJgNXKgNKh1igrEWFBhnm6B1+sPNedTg==
X-Google-Smtp-Source: APBJJlG0PzmZgMeYmmyxh6fQCtTCaFVli27ad8SwdfVceQNoqUOHJJbJZFe9iMSAnB6bk7i+ctom86Y91hMRQVsqDOs=
X-Received: by 2002:a0c:fe0d:0:b0:63c:a22e:ddaf with SMTP id
 x13-20020a0cfe0d000000b0063ca22eddafmr461068qvr.16.1690219152868; Mon, 24 Jul
 2023 10:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230724054538.163319-1-suhui@nfschina.com>
In-Reply-To: <20230724054538.163319-1-suhui@nfschina.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Jul 2023 10:19:02 -0700
Message-ID: <CAKwvOdk-fdJr9TcgUnOhCiU0LvD2Qe_c+6YOe-c1k0Ukm+negA@mail.gmail.com>
Subject: Re: [PATCH] ext4: mballoc: avoid garbage value from err
To: Su Hui <suhui@nfschina.com>
Cc: tytso@mit.edu, adilger.kernel@dilger.ca, nathan@kernel.org, 
	trix@redhat.com, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 23, 2023 at 10:46=E2=80=AFPM Su Hui <suhui@nfschina.com> wrote:
>
> clang warning: fs/ext4/mballoc.c, line 4178, column 6
> Branch condition evaluates to a garbage value.

Specifically this is clang's static analysis; not the compiler itself.

>
> err is uninitialized and will be judged when it enters the
> loop first time and the condition "!ext4_sb_block_valid()"
> is true. Although this can't make problems now, it's better
> to correct it.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>

Hi Su,
Thanks for the patch!  I see what the warning is getting at;

If `len <=3D 0` then `err` is never initialized, then is used at line
4178 (that is UB).

Would you mind sending a v2 with the commit message updated to reflect
the above points?  I'd be happy to sign-off on that.

> ---
>  fs/ext4/mballoc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
> index 21b903fe546e..769000c970b0 100644
> --- a/fs/ext4/mballoc.c
> +++ b/fs/ext4/mballoc.c
> @@ -4084,7 +4084,7 @@ void ext4_mb_mark_bb(struct super_block *sb, ext4_f=
sblk_t block,
>         struct ext4_sb_info *sbi =3D EXT4_SB(sb);
>         ext4_group_t group;
>         ext4_grpblk_t blkoff;
> -       int i, err;
> +       int i, err =3D 0;
>         int already;
>         unsigned int clen, clen_changed, thisgrp_len;
>
> --
> 2.30.2
>
>


--=20
Thanks,
~Nick Desaulniers
