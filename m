Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E64C72
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 23:41:14 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id o7so140215lfq.9
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 16:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5eU4Pn+QfTubmNmsGNshAIHOz3MlAVSj+62C5s2QQP0=;
        b=YPfCC534/rpUeeQu1ADA77pUJyQmCCHALh/h1R+1Q51Gz57+L7IhzKcg47WrIA8wym
         L7+bevHAwkW9YksRTXPl4tK1B52C/Rlb0eEqa4CJdNxgBhhFkYY8DI0zXksxckpvRRWD
         D0hUiOpqBXjb6tuh1sMs9ABJt0SIHMJt5UeYua9Dxx6FFF6MSxywqe2O+dk70ueYyHyI
         PZgPQTvR8xuUJUQ4DOXQ3AY20QCOfX56fRUCHNX9C/Iys3P6ib+i3lKN3yvJTbcUXNEi
         5KQJ209dZm0hD4QrfetKIHEX/uSrXdiq+316wXVyXimUShvHpmsyDjvx2eI7XtigNicJ
         RDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5eU4Pn+QfTubmNmsGNshAIHOz3MlAVSj+62C5s2QQP0=;
        b=ppcaAh5/2vKgDy3mOzdNuV8+SR4pY+PoTk4yeXUMySnbGmkIMNlI/33RV0MMtOM1bA
         rdNpLoVhGjn6y4IjnG4uFPDszmQDJZ079VhO3eQub4KK21Fuvoztv5GFxxDSz/VsXBSZ
         TCFfrwBMo8uepSl675LtJBK10+qFHVl5P11MCXEcM8aKCHvF4QAd2ac+5wFCELxTz+Xk
         xmSrDjEwg4k14bwUAwbKYoj65axDXnF40XUMm9Y78Nj5i/fB4yoE6hgrhJZSUE8Yxqi0
         eVUPKri7xhw/y7inynmJLzBJPu2vcCCpElltM0z7FUnnz92ib6FTn3k2G+daaX/C5iO1
         r4WA==
X-Gm-Message-State: AJIora+wXQf3yMGCz05wTcEMYGBSSDB5MHYrRSwa2aUykmyfBHa+1OdX
	fxX9pLvvWGvOEGF0hfC6FP6BSaWBIPivvyUbULe9rg==
X-Google-Smtp-Source: AGRyM1uP9YifLrRKvafA7w1uy6h0ZJ7JTDYw1RTJw5mjCkRfNXTOUn69pM/MdgvhyJoN6Q41bZb5XuusaOL3IL9Nv7Y=
X-Received: by 2002:a05:6512:e9a:b0:489:c681:da2b with SMTP id
 bi26-20020a0565120e9a00b00489c681da2bmr2113455lfb.626.1657323672384; Fri, 08
 Jul 2022 16:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220708221314.466294-1-justinstitt@google.com>
In-Reply-To: <20220708221314.466294-1-justinstitt@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 8 Jul 2022 16:41:01 -0700
Message-ID: <CAKwvOd=uOrDe5DWnXn7fx8+kTCF6gQVYhgqpnDFbaKunfBBVVg@mail.gmail.com>
Subject: Re: [PATCH] iscsi: iscsi_target: fix clang -Wformat warning
To: Justin Stitt <justinstitt@google.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, Mike Christie <michael.christie@oracle.com>, 
	Max Gurtovoy <mgurtovoy@nvidia.com>, Mingzhe Zou <mingzhe.zou@easystack.cn>, 
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 3:14 PM Justin Stitt <justinstitt@google.com> wrote:
>
> When building with Clang we encounter this warning:
> | drivers/target/iscsi/iscsi_target.c:4365:12: error: format specifies
> | type 'unsigned short' but the argument has type 'int' [-Werror,-Wformat]
> | " %s\n", atomic_read(&sess->nconn)
>
> The format specifier used is `%hu` which describes an unsigned short.
> However, atomic_read returns an int which means the format specifier
> should be `%d`.

Thanks for the patches!

Please fold this into:
https://lore.kernel.org/llvm/20220708221314.466294-1-justinstitt@google.com/
and send a v2 of that.

>
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  drivers/target/iscsi/iscsi_target.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
> index e368f038ff5c..bfb717065344 100644
> --- a/drivers/target/iscsi/iscsi_target.c
> +++ b/drivers/target/iscsi/iscsi_target.c
> @@ -4361,7 +4361,7 @@ int iscsit_close_connection(
>
>         spin_lock_bh(&sess->conn_lock);
>         atomic_dec(&sess->nconn);
> -       pr_debug("Decremented iSCSI connection count to %hu from node:"
> +       pr_debug("Decremented iSCSI connection count to %d from node:"
>                 " %s\n", atomic_read(&sess->nconn),
>                 sess->sess_ops->InitiatorName);
>         /*
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>


-- 
Thanks,
~Nick Desaulniers
