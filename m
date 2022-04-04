Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F197C
	for <llvm@lists.linux.dev>; Mon,  4 Apr 2022 18:14:27 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id q14so13971103ljc.12
        for <llvm@lists.linux.dev>; Mon, 04 Apr 2022 11:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jA9O88Cl7Cj3DV9YqV3pxHKzHcpN0w127uH0DJrDu6A=;
        b=cSyT5s8jfuk/1JR9/fI/Gqs9xQ74yToQSFVeEVZE16CzTs4y1cTOu7dQy0iEotcwpp
         QXie2PHfvs7leMvJi+X5kQ9GgPivCzeYCJMWlKDtfiv2fOJIgHccPOImyRc3tPvaXTWK
         I8gGR4josMrjK3iFj9rmn3/SieCQXjuOAEUL34WHsC4u4g2N1HZD+eDal9zVcALYiNGD
         z97IvYhjqplonvMwwlZxugT2/f2yTjszKbrnzmJxMKd/56uQxqNMRguv/Obf8GOX+7v/
         dUVZIvh+sRDUDSFPb/VkLSB7RsQkgdLAVyXMGApGh89rPO6CofiKvMSSLJXP4dWDEbfD
         A3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jA9O88Cl7Cj3DV9YqV3pxHKzHcpN0w127uH0DJrDu6A=;
        b=K8SyIaHMwubbtMsq1Ydl0zeGfXrdiTmtDzshI93dyQevAyAL6CAc39kik66KZxP/gV
         XGaCNWQWOqgrGBl1jeEus4iYVX/5FSEPOt/4az4r9rsYZgtKYUfYmeIHhiDBz1NU25zB
         WEnYe+yFlRZc0VvG7NRUBAyesN1regx4HTZLZ1V4vVNsr/XwcpmXdJkXkBNeIK0Cyc1v
         SDAebeMiZ7lJ0bL2CrQeKrZSVbWMzbzj1JcCDew2UfFj48gk11A+UTwYQ8VkTcECPVP1
         4n5ERmylAYs2dfOJt5VL3AWGSjM41+oiUaStiKMI6kl+NMJqLhgGyN2uyXiyMUrYFwN8
         Da9Q==
X-Gm-Message-State: AOAM533RRVon5TMBEcW/7vxwTUPsDeAxAEx5hdgHb6A19Z4fvmxJ8NQQ
	8b08LRprg7GgWp7Msyu8VcLOxvqSX9Z9XI5ptJw3NQ==
X-Google-Smtp-Source: ABdhPJy6X4VfItY0Exvmm9zT3KLeOkR4u/yRf3ZAF3nadtPeZPD3a5V5gvnOVvP+rwxXW2K1ofGissW4GbSk2e/aaR8=
X-Received: by 2002:a2e:611a:0:b0:249:83e5:9f9b with SMTP id
 v26-20020a2e611a000000b0024983e59f9bmr546393ljb.165.1649096065187; Mon, 04
 Apr 2022 11:14:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220318003927.81471-1-colin.i.king@gmail.com>
In-Reply-To: <20220318003927.81471-1-colin.i.king@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 4 Apr 2022 11:14:13 -0700
Message-ID: <CAKwvOd=jyrdkMHPR3ZNQHattOxXcS1SseAHvrXWQC2H6tDB-Xw@mail.gmail.com>
Subject: Re: [PATCH] scsi: message: fusion: mptbase: remove redundant variable dmp
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>, 
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>, 
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, MPT-FusionLinux.pdl@broadcom.com, 
	linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 5:39 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> Variable dmp is being assigned a value that is never read, the
> variable is redundant and can be removed.
>
> Cleans up clang scan build warning:
> drivers/message/fusion/mptbase.c:6667:39: warning: Although
> the value stored to 'dmp' is used in the enclosing expression,
> the value is never actually read from 'dmp' [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/message/fusion/mptbase.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/message/fusion/mptbase.c b/drivers/message/fusion/mptbase.c
> index e90adfa57950..9b3ba2df71c7 100644
> --- a/drivers/message/fusion/mptbase.c
> +++ b/drivers/message/fusion/mptbase.c
> @@ -6658,13 +6658,13 @@ static int mpt_summary_proc_show(struct seq_file *m, void *v)
>  static int mpt_version_proc_show(struct seq_file *m, void *v)
>  {
>         u8       cb_idx;
> -       int      scsi, fc, sas, lan, ctl, targ, dmp;
> +       int      scsi, fc, sas, lan, ctl, targ;
>         char    *drvname;
>
>         seq_printf(m, "%s-%s\n", "mptlinux", MPT_LINUX_VERSION_COMMON);
>         seq_printf(m, "  Fusion MPT base driver\n");
>
> -       scsi = fc = sas = lan = ctl = targ = dmp = 0;
> +       scsi = fc = sas = lan = ctl = targ = 0;
>         for (cb_idx = MPT_MAX_PROTOCOL_DRIVERS-1; cb_idx; cb_idx--) {
>                 drvname = NULL;
>                 if (MptCallbacks[cb_idx]) {
> --
> 2.35.1
>
>


-- 
Thanks,
~Nick Desaulniers
