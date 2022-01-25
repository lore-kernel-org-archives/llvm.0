Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69686D17
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 22:48:06 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id a28so29460188lfl.7
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 14:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mGu4hUVfAAPMG/lySmrJGJl6zgwYxA7GIIsE6nUuYeM=;
        b=F8cdrBtSHqo2Z0Wdu2hZS6TosImMwSBca7DPk7TU+0dPo1RQzmbWmsGN+2aV81aGaN
         81izACf7gyAjcLV9mkx+6Giz0f7M8f2nIey89tbfswPBzAgyzyWlWjD4a+gtGQzR39RF
         IKb6ZiR5Kkj9qwbwHwF/YexTDhfQEF49pqApQtFPt3XsBo+oM6LOz3HTnD9SP6B09lcq
         yj3oBE03IT9NdM5kMPf51sZun0hta9DeBk8eLKXsgu6rppFVO0URuOPgDAvs6L2kgPgs
         LauhbruVRXhQd3K0TNzPF/7sbi1qd0ad9GSU0iwY7ncFTtkd5tvwdB0qNFg8RkbUGfNo
         WHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mGu4hUVfAAPMG/lySmrJGJl6zgwYxA7GIIsE6nUuYeM=;
        b=RHR3QG4/AGqtXGKMytvnWd8ZcOpYOKf4ThFEhnwkq8MAsLxyiqwlJPruY9OkIgB/NX
         +l1iT0wrnWtnNbzrhhsWblW24c0eReZ3CFNfQmuj3YkQ/o8bhrl1zx6JgHspmtOyFQPz
         JO7WQXfsqiN77RucEDN/fcMLfAI+36d/kIRo9BL6hTMwx0yiurWzl+sTLpyv3G45A2DV
         BOoZjMHql/mD3Kyg0SLGt+oeqx6x7eXWb8N7gfQhj8Iuf74BGmGlPDh+UhsO0vI7OPBf
         Htm9bBottSf7tduZ2m7AkxhIsP67A8CJJNh2Uq4KB3eHnrgXQ8lvZte4xHWunB5GUi00
         DQCw==
X-Gm-Message-State: AOAM531CObOhx+lblJ5k1WjfPDXyi+TmJnfoUmoVHb9PkawYQLkuAxSa
	MXUUkajAoFcUHQ4SX+IjZvtj8QNedHLpNp1EML/stw==
X-Google-Smtp-Source: ABdhPJzmT2Y2xsealukDgOL1p4z8US3rq7Fw9rDMzOG6kMf1xrw83Fr6LXmzEo8/vnYGtFzKjztv+NqSXUZdyu0Aygk=
X-Received: by 2002:a05:6512:1506:: with SMTP id bq6mr18829314lfb.444.1643150884606;
 Tue, 25 Jan 2022 14:48:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125141422.32655-1-cgzones@googlemail.com> <20220125141422.32655-8-cgzones@googlemail.com>
In-Reply-To: <20220125141422.32655-8-cgzones@googlemail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 25 Jan 2022 14:47:52 -0800
Message-ID: <CAKwvOdkFOCTE5tTjrhPrfTWDwogvJ59LXZDnQ4wruHE93_6qMg@mail.gmail.com>
Subject: Re: [PATCH 9/9] selinux: drop unused macro
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, 
	Nathan Chancellor <nathan@kernel.org>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	Xiu Jianfeng <xiujianfeng@huawei.com>, Jeff Vander Stoep <jeffv@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 6:15 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> The macro _DEBUG_HASHES is nowhere used. The configuration DEBUG_HASHES
> enables debugging of the SELinux hash tables, but the with an underscore
> prefixed macro definition has no direct impact or any documentation.
>
> Reported by clang [-Wunused-macros]
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  security/selinux/ss/policydb.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policyd=
b.c
> index 67e03f6e8966..d036e1238e77 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -41,8 +41,6 @@
>  #include "mls.h"
>  #include "services.h"
>
> -#define _DEBUG_HASHES
> -
>  #ifdef DEBUG_HASHES
>  static const char *symtab_name[SYM_NUM] =3D {
>         "common prefixes",
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
