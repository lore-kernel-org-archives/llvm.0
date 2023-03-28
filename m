Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A654AAFC1
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 23:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF77C433EF
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 23:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680045466;
	bh=FhXWBl3/P/hkvn7SURytWrxmi1wOCQCCyLVCHT/AjHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=blux9YB951/4mf9tSWq1b+PHavxvnDpNH0F+o3W9b9WXGOFlQOQLYOGWpg6+3GDdN
	 4iXS78ri3vyj1pLjS7eWdqzd30wh3mFZfK14beK70A/+KFcX1kikRtpSLS2Dcyffsk
	 MzEWAKErbiQv76avCUA52mGfg3Kwygj1KUJ7OqLs9iu5X2f7mQfkmJs/wq1v44pHvY
	 Nrew6jNidhflVxmCe95zkmhc2QEk7rkTNvQ5iK+mVbmdORMB6aY3Rs5ra+me/b1B31
	 vDVf1eJZlDuoKFUQ6Ue9u/G9t7d/q00C+dCdTVoFlnH2RvPOXPlQoodbrQBcL8/ZU/
	 oZ4XN+2ZykvvQ==
Received: by mail-lj1-f177.google.com with SMTP id o20so11338544ljp.3
        for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 16:17:46 -0700 (PDT)
X-Gm-Message-State: AAQBX9ft8TcV4Gvee/x715eTvXu7y7BVRQTuPnmZnob7LOtteGFyI05D
	dImiqZMadWvgJ3+VTWFfSp/r64jLeipFJPlGUz4=
X-Google-Smtp-Source: AKy350ZoOmTviqMFDD7yk6Ien8iqOJ+XgAz2HmnZ1y8TuhUngMovHYNfS/rL4IlQRLzEimtw6spi42+fYJOchvvQ4kQ=
X-Received: by 2002:a2e:9002:0:b0:299:b5e6:4c45 with SMTP id
 h2-20020a2e9002000000b00299b5e64c45mr5368280ljg.5.1680045464363; Tue, 28 Mar
 2023 16:17:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230327132324.1769595-1-trix@redhat.com>
In-Reply-To: <20230327132324.1769595-1-trix@redhat.com>
From: Song Liu <song@kernel.org>
Date: Tue, 28 Mar 2023 16:17:32 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6=zpRso=5wPUWTPKO+s1Z0Nf09BDpSnb5sKHkEgizbHg@mail.gmail.com>
Message-ID: <CAPhsuW6=zpRso=5wPUWTPKO+s1Z0Nf09BDpSnb5sKHkEgizbHg@mail.gmail.com>
Subject: Re: [PATCH v2] md/raid5: remove unused working_disks variable
To: Tom Rix <trix@redhat.com>
Cc: nathan@kernel.org, ndesaulniers@google.com, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 6:23=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/md/raid5.c:7719:6: error: variable 'working_disks'
>   set but not used [-Werror,-Wunused-but-set-variable]
>         int working_disks =3D 0;
>             ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied to md-next, with Yu Kuai's Reviewed-by.

Thanks,
Song

> ---
> v2: remove brances
> ---
>  drivers/md/raid5.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> index 7b820b81d8c2..812a12e3e41a 100644
> --- a/drivers/md/raid5.c
> +++ b/drivers/md/raid5.c
> @@ -7716,7 +7716,6 @@ static void raid5_set_io_opt(struct r5conf *conf)
>  static int raid5_run(struct mddev *mddev)
>  {
>         struct r5conf *conf;
> -       int working_disks =3D 0;
>         int dirty_parity_disks =3D 0;
>         struct md_rdev *rdev;
>         struct md_rdev *journal_dev =3D NULL;
> @@ -7912,10 +7911,8 @@ static int raid5_run(struct mddev *mddev)
>                         pr_warn("md: cannot handle concurrent replacement=
 and reshape.\n");
>                         goto abort;
>                 }
> -               if (test_bit(In_sync, &rdev->flags)) {
> -                       working_disks++;
> +               if (test_bit(In_sync, &rdev->flags))
>                         continue;
> -               }
>                 /* This disc is not fully in-sync.  However if it
>                  * just stored parity (beyond the recovery_offset),
>                  * when we don't need to be concerned about the
> --
> 2.27.0
>
