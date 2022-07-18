Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC6CECB
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 20:55:35 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id d12so21439206lfq.12
        for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ngAg2yVO32eBtQbv+5HGxymaiT96wuzbFVwUnPbkYPs=;
        b=Lekm+r2aRj8xx29RD0wy/9Tl0pPKcs7oHW9Fd98cwNBSfHby25BNUaqXile6+m1W3J
         YlBpcOTBiSgo4GLV2EkMvz09EnwHmUNnw6N8DrwfOSvrx6y91FkuJ/CZPj2CsH7lDGv0
         o2tWRKHqhw4fCFTn9zXdMRxsg3zuz5eXOmvdR5+WDd61Z4EhpVK0l964j97jzc7hSIZG
         q2J1Idq/NpA3PMmskY2EYKBHPMWN+Jp7nFw61/1Ri+T33vzU7cYw9Fynr92ZeC156nXK
         zk4/C0BlRTyLcmaIVFcYuBR9D2IaW3gHdwiPhzFUrc3rEKXyHE8Kfkxz2QpTlaLG0D8m
         K/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ngAg2yVO32eBtQbv+5HGxymaiT96wuzbFVwUnPbkYPs=;
        b=0kXpZdmF66uKkdXKJ3EaOs41GlhfFKst5i99k9E/nC5Yd58eHqQPNBzF0vM+dYGB+E
         j9wyENRIlq0zCWOVwjC6iAhZSl2mmSPCHBdJz2iz+JuWGOYei8IjZxl2bjbXArWVRLR0
         WZOJWKpkhCrjdW2ZG+QUsUSQOfFqad3/H9gjK5lKycxkhvsgltZUiMTgrg5vGzPY1Npd
         JcvhqJPXGEohyXHcCenndA30UCJjj/zysCxsa7iL1BgusXO7CZQFv4O8vZuqP1mMrQQm
         RK/2N8zbjbTEwUsislujFtRCIV9ufZv5frmUxMc0rwzbaiWMWQFaTUhivC4iwtF6bZ2y
         CBMw==
X-Gm-Message-State: AJIora892wnrvtVqSm059EoB+FQZGzRRLNkLnAOML0JrMsC/AC7OLxnd
	F8CiY+Ts0rhkGShTgMcUDT6wWZqN4D7BZfacZPWhcg==
X-Google-Smtp-Source: AGRyM1tcWZRhnGREO1HBCcsOSiZAmhbB+eNTAxfA1VHqRBIMV5ol//3U7P7L3hH5mPy40BaNkgIjSUUGC1iWFEDtcX4=
X-Received: by 2002:a05:6512:31d1:b0:489:cfee:3600 with SMTP id
 j17-20020a05651231d100b00489cfee3600mr15798595lfe.432.1658177732994; Mon, 18
 Jul 2022 13:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220708211447.135209-1-justinstitt@google.com> <20220718180421.49697-1-justinstitt@google.com>
In-Reply-To: <20220718180421.49697-1-justinstitt@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 Jul 2022 13:55:21 -0700
Message-ID: <CAKwvOdn42__0Z4Qrh0rVzotCGFdecfyCY-=C_OE0U3z20A1NmA@mail.gmail.com>
Subject: Re: [PATCH v2] target: iscsi: fix clang -Wformat warnings
To: martin.petersen@oracle.com
Cc: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	llvm@lists.linux.dev, mgurtovoy@nvidia.com, michael.christie@oracle.com, 
	mingzhe.zou@easystack.cn, nathan@kernel.org, target-devel@vger.kernel.org, 
	trix@redhat.com, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 18, 2022 at 11:04 AM Justin Stitt <justinstitt@google.com> wrote:
>
> When building with Clang we encounter these warnings:
> | drivers/target/iscsi/iscsi_target_login.c:719:24: error: format
> | specifies type 'unsigned short' but the argument has type 'int'
> | [-Werror,-Wformat] " from node: %s\n", atomic_read(&sess->nconn),
> -
> | drivers/target/iscsi/iscsi_target_login.c:767:12: error: format
> | specifies type 'unsigned short' but the argument has type 'int'
> | [-Werror,-Wformat] " %s\n", atomic_read(&sess->nconn),
> -
> | drivers/target/iscsi/iscsi_target.c:4365:12: error: format specifies
> | type 'unsigned short' but the argument has type 'int' [-Werror,-Wformat]
> | " %s\n", atomic_read(&sess->nconn)
>
> For all warnings, the format specifier is `%hu` which describes an
> unsigned short. The resulting type of atomic_read is an int. The
> proposed fix is to listen to Clang and swap the format specifier.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> diff from v1->v2:
> Combined two similar patches into one:
> * https://lore.kernel.org/all/20220708221314.466294-1-justinstitt@google.com/
> * https://lore.kernel.org/llvm/20220708211447.135209-1-justinstitt@google.com/
>
>  drivers/target/iscsi/iscsi_target.c       | 2 +-
>  drivers/target/iscsi/iscsi_target_login.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
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
> diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
> index 6b94eecc4790..0778591abae7 100644
> --- a/drivers/target/iscsi/iscsi_target_login.c
> +++ b/drivers/target/iscsi/iscsi_target_login.c
> @@ -715,7 +715,7 @@ void iscsi_post_login_handler(
>
>                 list_add_tail(&conn->conn_list, &sess->sess_conn_list);
>                 atomic_inc(&sess->nconn);
> -               pr_debug("Incremented iSCSI Connection count to %hu"
> +               pr_debug("Incremented iSCSI Connection count to %d"
>                         " from node: %s\n", atomic_read(&sess->nconn),
>                         sess->sess_ops->InitiatorName);
>                 spin_unlock_bh(&sess->conn_lock);
> @@ -763,7 +763,7 @@ void iscsi_post_login_handler(
>         spin_lock_bh(&sess->conn_lock);
>         list_add_tail(&conn->conn_list, &sess->sess_conn_list);
>         atomic_inc(&sess->nconn);
> -       pr_debug("Incremented iSCSI Connection count to %hu from node:"
> +       pr_debug("Incremented iSCSI Connection count to %d from node:"
>                 " %s\n", atomic_read(&sess->nconn),
>                 sess->sess_ops->InitiatorName);
>         spin_unlock_bh(&sess->conn_lock);
> --
> 2.37.0.170.g444d1eabd0-goog
>


-- 
Thanks,
~Nick Desaulniers
