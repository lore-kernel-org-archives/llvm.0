Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4682F51
	for <llvm@lists.linux.dev>; Mon, 24 Apr 2023 16:27:42 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2470271d9f9so3329554a91.2
        for <llvm@lists.linux.dev>; Mon, 24 Apr 2023 09:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682353662; x=1684945662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFJ9uSsbbq6fAnU3Kv89VxYbJecjLW72W/BsfIeB9rQ=;
        b=7WIX6XPYI7rfI6hh42UI6sWlQhx9+LKXBe8Db1y/QvAQf+qO/GC2QqpYPFoRXAnZTY
         i49gD3v5iMIP9i2LGxTGBTXwvmGSeJ41WyTF/pArxQJlxh59Buiay20PgEVNBkwQPDxY
         9Zceo6WX/6zNR43ftcPHMAAxNDABYWMVPSPNruZgincKTPBncPsQORsD+moF3WHmL+jH
         yFyZgyJzZRlVvF9K8oRVi73oFD7ZgXokph2iRWDlOwnNFgPbl+dCLUABCzwyAdImCVcG
         x7979WgWT8AvKCHLJ8OMCeumUVFJ1n2obaDMWTJOiYB7BmH3pEE1rOcoWNt92oyrrdpY
         yrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682353662; x=1684945662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFJ9uSsbbq6fAnU3Kv89VxYbJecjLW72W/BsfIeB9rQ=;
        b=Cw7g9s63VWFbppCk14t+UiVEL5/zwZSh+b+QUOmMVoxN77MO7EXV/1npk1EIc9lamM
         YedzdaPWT2IF/BYu9P3dhxvbLndPTbNiZnTIn/gFVBXNCb4yviTksCCJ1IaG0rSkzyzo
         wL1seJBmSyt6XccipQh4p6x5puuikJPZsKW9btZAW6WRNiXUIZNMU+LZOE0X9RRjioSX
         tk9orcLmpF11Ss/zGM2N6i9/gWd8INEFG3O2B1DGeZ9BPS4p2N9fBTVTs9QT5NdvnuF2
         mL1qkI5LHz/u01fs4Q3fEcLA4HnW4cLWcJVX7nbr2VeYMWrn3uVEKDpg56jDQV0MyNlQ
         DErg==
X-Gm-Message-State: AAQBX9eyxETuhe49m9QxA46e7d5swibN53nrj1Hr6C47L6Mou/mYDdYT
	lihJkYFEowDyLX5X8MS7z/RQNKXVAZuElT5/tE4IrA==
X-Google-Smtp-Source: AKy350b8aiAxCyJyr7zba8Bh8V5VEKgimMMOMCQt+dlZihQrf/+7KBsPdSakpLSBULrc+qjyBWMlyos/sAIHVLgf+I0=
X-Received: by 2002:a17:90a:290d:b0:23e:f8e2:9ed3 with SMTP id
 g13-20020a17090a290d00b0023ef8e29ed3mr14856964pjd.43.1682353662007; Mon, 24
 Apr 2023 09:27:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221016182349.49308-1-masahiroy@kernel.org> <20230424162110.11082-1-lrh2000@pku.edu.cn>
In-Reply-To: <20230424162110.11082-1-lrh2000@pku.edu.cn>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Apr 2023 09:27:30 -0700
Message-ID: <CAKwvOd=sDakt6Pay08=xh4mDiFnq8esXDm-Df9z2jz-5PpHMFg@mail.gmail.com>
Subject: Re: [PATCH] scripts: Remove ICC-related dead code
To: Ruihan Li <lrh2000@pku.edu.cn>
Cc: torvalds@linux-foundation.org, masahiroy@kernel.org, arnd@arndb.de, 
	bp@alien8.de, dave.hansen@linux.intel.com, devel@acpica.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	nathan@kernel.org, ojeda@kernel.org, rafael@kernel.org, 
	robert.moore@intel.com, terrelln@fb.com, tglx@linutronix.de, trix@redhat.com, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 9:21=E2=80=AFAM Ruihan Li <lrh2000@pku.edu.cn> wrot=
e:
>
> Intel compiler support has already been completely removed in commit
> 95207db8166a ("Remove Intel compiler support"). However, it appears that
> there is still some ICC-related code in scripts/cc-version.sh. There is
> no harm in leaving the code as it is, but removing the dead code makes
> the codebase a bit cleaner.
>
> Hopefully all ICC-related stuff in the build scripts will be removed
> after this commit, given the grep output as below:
>
>         (linux/scripts) $ grep -i -w -R 'icc'
>         cc-version.sh:ICC)
>         cc-version.sh:  min_version=3D$($min_tool_version icc)
>         dtc/include-prefixes/arm64/qcom/sm6350.dtsi:#include <dt-bindings=
/interconnect/qcom,icc.h>
>
> Fixes: 95207db8166a ("Remove Intel compiler support")
> Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/cc-version.sh | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
> index 0573c92e8..a7e28b6a5 100755
> --- a/scripts/cc-version.sh
> +++ b/scripts/cc-version.sh
> @@ -45,10 +45,6 @@ Clang)
>         version=3D$2.$3.$4
>         min_version=3D$($min_tool_version llvm)
>         ;;
> -ICC)
> -       version=3D$(($2 / 100)).$(($2 % 100)).$3
> -       min_version=3D$($min_tool_version icc)
> -       ;;
>  *)
>         echo "$orig_args: unknown C compiler" >&2
>         exit 1
> --
> 2.40.0
>


--=20
Thanks,
~Nick Desaulniers
