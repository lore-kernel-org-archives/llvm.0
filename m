Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ECE4C72
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 23:42:39 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id r9so169275ljp.9
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 16:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e1z/XYffrQE1ulbZWqvB17ZvgZDPHSFhdrO4bt0sud0=;
        b=rwQIfx2Rbka3ZHXrSst/zHyIhKR2xW8QfdqVBrkvu70qG4LbOgX2/R7lqpN7urgSGj
         kW/vig2rxrw5x7BzghZ113H429+v5QNUXswiV5ZJ4sglOAcVoa1d/8+i15DcFgPlA4F/
         FRbh2JPOxgmXZOYbz9bx0muHxBonv8wFVGhPibkcY0RkzlW3wmuKuW4PYg9BS1NTBJYO
         bBlB9zQqFoE1tfmMg3xHd9pgI11PYjcfO3Ta5JHIuhEzYKZTr4o9w5zuOnGrakuZoksG
         ZHVXkuBvG253i4A3tfL6Pwgf+HtvL4RaNLKtDz5Um8913lZvvDuPY1bD1Zad3vxX5WPE
         jQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e1z/XYffrQE1ulbZWqvB17ZvgZDPHSFhdrO4bt0sud0=;
        b=6G1IO0QlLz58r3fXZX1dz7f3qQVwU7BJec99qY5SDoKR08nFRMQBQYNDgimLuJaOTQ
         IMftW+02S8mPH3XrNNfAtgwbhgtAHD2z81g2Kk9FzR8ERBPv4gH6In+/5KgGBuv0WT2J
         BatZDaxuKa/pyYRxnpt12QPGA8gPUigSGoxhaTuSOzCJh4U+dS933xppMx1NoObXpax3
         cjzsSgetMvqw+RzRA2Ge5WYC7yepPGhytqYiCkkxVP2LUzjuRCmOecCbG4hTNiNaP4l1
         1SzeKkcyR0EklIQQh+i46U2itQPYHd0IpVJObW3vAbrKXlzWheUF/9eIqxQ3NGjDKGnR
         AvaA==
X-Gm-Message-State: AJIora8JHO/97Hk/ivx2LP1zRYfCQCkMTBStCsmlAgUIITqnUBl3+wvY
	5t/lLj8yXbxs0Wnf5UK1A7CeneYjKguTZQj/YOrFLA==
X-Google-Smtp-Source: AGRyM1vOYSphaV8U+fKakVnibkqv4glTuEdXHVh6JjOdl+7EiEGP/eDNnQirMA5rO1tyZG9VLt5QlYutmIVp385/51c=
X-Received: by 2002:a2e:3109:0:b0:25a:8a0c:40e2 with SMTP id
 x9-20020a2e3109000000b0025a8a0c40e2mr3237589ljx.26.1657323757825; Fri, 08 Jul
 2022 16:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220708211447.135209-1-justinstitt@google.com>
In-Reply-To: <20220708211447.135209-1-justinstitt@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 8 Jul 2022 16:42:25 -0700
Message-ID: <CAKwvOdmXCB7VoQLXfBgfyxdMvqaNeacMVbkCFptAqzX21KuPtg@mail.gmail.com>
Subject: Re: [PATCH] target: iscsi: fix clang -Wformat warning
To: Justin Stitt <justinstitt@google.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, Mike Christie <michael.christie@oracle.com>, 
	Max Gurtovoy <mgurtovoy@nvidia.com>, Mingzhe Zou <mingzhe.zou@easystack.cn>, 
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 2:15 PM Justin Stitt <justinstitt@google.com> wrote:
>
> When building with Clang we encounter these warnings:
> | drivers/target/iscsi/iscsi_target_login.c:719:24: error: format
> | specifies type 'unsigned short' but the argument has type 'int'
> | [-Werror,-Wformat] " from node: %s\n", atomic_read(&sess->nconn),
> -
> | drivers/target/iscsi/iscsi_target_login.c:767:12: error: format
> | specifies type 'unsigned short' but the argument has type 'int'
> | [-Werror,-Wformat] " %s\n", atomic_read(&sess->nconn),
>
> For both warnings, the format specifier is `%hu` which describes an
> unsigned short. The resulting type of atomic_read is an int. The
> proposed fix is to listen to Clang and swap the format specifier.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Justin Stitt <justinstitt@google.com>

See also:
https://lore.kernel.org/lkml/CAKwvOd=uOrDe5DWnXn7fx8+kTCF6gQVYhgqpnDFbaKunfBBVVg@mail.gmail.com/

> ---
>  drivers/target/iscsi/iscsi_target_login.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
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
> 2.37.0.rc0.161.g10f37bed90-goog
>


-- 
Thanks,
~Nick Desaulniers
