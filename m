Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4116D315B7
	for <llvm@lists.linux.dev>; Tue, 10 Oct 2023 20:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ulSzN0dp"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3226b8de467so5733439f8f.3
        for <llvm@lists.linux.dev>; Tue, 10 Oct 2023 13:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696971070; x=1697575870; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMvNgoqd6YMY6PytxtLuyuPyCuqVe/N25XtwaEAPuzs=;
        b=ulSzN0dpuKixK2Ek/QAxyFYYaOVL5QN2lnos9dhbh51EHeMfKSh4oKQZEFo7+XpH42
         9h4CnXTASn3LSbGygeK2ciXUFjyW+JEOsi17SeWG5u6MdoxPD4Y5DvIbn9QGJulKhlXB
         XHlWpqgO5pnmsgUE9NqmSmsFga5gM6FWpClI4EB6YshCu6GU7X1rq/S9hxWC+4ZGJ22Q
         5bR34hsNHmXGfkaaiR8VdYL39bYnBNvYQmnPLSzSetY/5mrJuvi7/OMWEX+CDmRUE56I
         cDHuzLclxw9gtSmgt+BNvczjo/JkbpJ3oSvBGebpTOrZtUR2HqGvsaLTu8hV42HmFeuI
         D2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696971070; x=1697575870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMvNgoqd6YMY6PytxtLuyuPyCuqVe/N25XtwaEAPuzs=;
        b=b0u2mWpUlzZcFwK+zk03AfIHjfn6HYLcuFsoVY4BNt+giwxBZgMCMvuclpYQXTdqu+
         DiM2+3dJn9K5CSXmRCnzUDHIfsvBuz6EMMvzoNOw1v/XMXkvowu4O6oaYpFDVQ9l/og4
         Q7dOUnR/TEdiox/50k0SlCw8CoXOvR0BL3ezSmMCKOGvVDpBKbUJWsWPcK/4VwxpCZlS
         TxUGC9VLesNzjPPjl1TeanUaPGlCpqr7LpSmoj6RYWh0/yoo0yAfO6l9LWB4gdqEP93i
         7Zb9tz+B4uzlZ/utYjHOO591zIHb3VI8nF5ORy40DBWMN0Jty6AiZt6dBf5P7Bgf3KF7
         Ae2w==
X-Gm-Message-State: AOJu0Yw/V5/iRMyC/YtVf/A0dnoNp5vWbulbPFXReSknRLA9hDl0Q1BZ
	8PTy40X+Zb2RoY0+PX7CaItyMiipE2AokZ6NSk5fyw==
X-Google-Smtp-Source: AGHT+IFD5aFZr73w4wpXqWke4TyoAYdTiGQEP1nzTNLXm0gTwIHlIeUCxqfh3wqRsquyDHBiotWE1pLg+3EkY78tg1Q=
X-Received: by 2002:adf:e788:0:b0:31c:70b0:426b with SMTP id
 n8-20020adfe788000000b0031c70b0426bmr17483743wrm.63.1696971070288; Tue, 10
 Oct 2023 13:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231010-ibmvfc-fix-bitfields-type-v1-1-37e95b5a60e5@kernel.org>
In-Reply-To: <20231010-ibmvfc-fix-bitfields-type-v1-1-37e95b5a60e5@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 10 Oct 2023 13:50:55 -0700
Message-ID: <CAKwvOdksaN1j_y4sVGZYudt3920zE8oXfwy7=x9FdBXiaK_ZUA@mail.gmail.com>
Subject: Re: [PATCH] scsi: ibmvfc: Use 'unsigned int' for single-bit bitfields
 in 'struct ibmvfc_host'
To: Nathan Chancellor <nathan@kernel.org>
Cc: tyreld@linux.ibm.com, martin.petersen@oracle.com, jejb@linux.ibm.com, 
	trix@redhat.com, brking@linux.vnet.ibm.com, linux-scsi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 1:32=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Clang warns (or errors with CONFIG_WERROR=3Dy) several times along the
> lines of:
>
>   drivers/scsi/ibmvscsi/ibmvfc.c:650:17: warning: implicit truncation fro=
m 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bi=
t-bitfield-constant-conversion]
>     650 |                 vhost->reinit =3D 1;
>         |                               ^ ~
>
> A single-bit signed integer bitfield only has possible values of -1 and
> 0, not 0 and 1 like an unsigned one would. No context appears to check
> the actual value of these bitfields, just whether or not it is zero.
> However, it is easy enough to change the type of the fields to 'unsigned
> int', which keeps the same size in memory and resolves the warning.
>
> Fixes: 5144905884e2 ("scsi: ibmvfc: Use a bitfield for boolean flags")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/scsi/ibmvscsi/ibmvfc.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvf=
c.h
> index 331ecf8254be..745ad5ac7251 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.h
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.h
> @@ -892,15 +892,15 @@ struct ibmvfc_host {
>         int init_retries;
>         int discovery_threads;
>         int abort_threads;
> -       int client_migrated:1;
> -       int reinit:1;
> -       int delay_init:1;
> -       int logged_in:1;
> -       int mq_enabled:1;
> -       int using_channels:1;
> -       int do_enquiry:1;
> -       int aborting_passthru:1;
> -       int scan_complete:1;
> +       unsigned int client_migrated:1;
> +       unsigned int reinit:1;
> +       unsigned int delay_init:1;
> +       unsigned int logged_in:1;
> +       unsigned int mq_enabled:1;
> +       unsigned int using_channels:1;
> +       unsigned int do_enquiry:1;
> +       unsigned int aborting_passthru:1;
> +       unsigned int scan_complete:1;
>         int scan_timeout;
>         int events_to_log;
>  #define IBMVFC_AE_LINKUP       0x0001
>
> ---
> base-commit: b6f2e063017b92491976a40c32a0e4b3c13e7d2f
> change-id: 20231010-ibmvfc-fix-bitfields-type-971a07c64ec6
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>


--=20
Thanks,
~Nick Desaulniers
