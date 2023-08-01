Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F83F1ADF3
	for <llvm@lists.linux.dev>; Tue,  1 Aug 2023 16:19:07 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-63cf57c79b5so38412956d6.0
        for <llvm@lists.linux.dev>; Tue, 01 Aug 2023 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690906746; x=1691511546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bO4EMps/8stuDZiI8Gpdidb8h9+MIAhmvaNg3KYj1s=;
        b=o4UnwJgpk8yeTzZUK1FZTs65eYsnacdGTDhjwzMy+DqQRhE2jTupyokcvRFqP1MKuo
         qAu+yNtKzWXdHC5YGT3qGXgvBJ0yvodc24S05t5lVNoUZlrjld+c3ZYg84ALagFSl5E1
         0e1IPmRVyqT2GVIRYdARMkHo0CkuvhYNhdAmnof9UiM53aClnQ1FS5ZSzeTK2gVSd53B
         063XdvfBsZ51WyTLXABYzSrXYL1XyijHBazCJn4+IrTGw38FuZoFnqi2U6TZNyoEfv5r
         ytN07iG/2nB0AbEtc586oI3xWMZoIT8TzfHqCOMBm0ZBpqNjIRXHSeGMlbbE1pfY9N/D
         MP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690906746; x=1691511546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bO4EMps/8stuDZiI8Gpdidb8h9+MIAhmvaNg3KYj1s=;
        b=PAraNCjzVTYRBZC4SwCZB4W001Ft4ggXQs9bJ21RmWnliu7mgnZ5NXjsAEMRb8Ncqk
         DT/Y+r4wIKWsZNlG507APAs0IWRnhC6M6tv3ilRBWV0o0XjN86IXd6BXX2eLcRQAua8K
         K0AxWH8KEce2CPlSZdHKrJutTTV1M7iHo51cTttRrlhJ/1FeXYA//a+Yly6adFa/+WC+
         UZ3Yz+GoFhXgZafUnq1CRnokpE8Dzer7ztX17nvDgiyV77B4511//4l5PVxKtpitmu0Q
         2g/VkuM50fMPWk1XUOO/gy10q3aqmRoKy+dakHCe+vLmrocj2qozGH6bPfqZVfT8l57E
         XAzw==
X-Gm-Message-State: ABy/qLZfxosLAd6RVY2dN+O1HznbEMRzt7BEhNdrb4X0vO5I5P6maswV
	jrWjPRWEPyo9g1fdJUwEcARkpw2NkPb2CcGlTmr65Q==
X-Google-Smtp-Source: APBJJlExjHsbEshbD/7fM07TlWTefBlG0GYpx+aMVrkgKVZzEhxPirjTfZFjF6Rla5/eWjDqzfKNP/t4CWrr7MCsFFs=
X-Received: by 2002:ad4:5847:0:b0:635:fa7b:6c22 with SMTP id
 de7-20020ad45847000000b00635fa7b6c22mr10424824qvb.55.1690906745972; Tue, 01
 Aug 2023 09:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230725043310.1227621-1-suhui@nfschina.com>
In-Reply-To: <20230725043310.1227621-1-suhui@nfschina.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Aug 2023 09:18:55 -0700
Message-ID: <CAKwvOdn2Qn219Ys6vyR0Xryi_32XTARBWsfmuc3zhdH8TLREWQ@mail.gmail.com>
Subject: Re: [PATCH v2] ext4: mballoc: avoid garbage value from err
To: Su Hui <suhui@nfschina.com>
Cc: tytso@mit.edu, adilger.kernel@dilger.ca, nathan@kernel.org, 
	trix@redhat.com, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 9:34=E2=80=AFPM Su Hui <suhui@nfschina.com> wrote:
>
> clang's static analysis warning: fs/ext4/mballoc.c
> line 4178, column 6, Branch condition evaluates to a garbage value.
>
> err is uninitialized and will be judged when 'len <=3D 0' or
> it first enters the loop while the condition "!ext4_sb_block_valid()"
> is true. Although this can't make problems now, it's better to
> correct it.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> v2:
>  - modify commit message
>
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


--=20
Thanks,
~Nick Desaulniers
