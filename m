Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCED728E2
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 15:47:56 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id w1so7471179plb.6
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 07:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=R7TNHVy3VEleA7R3NGQqJ4zyGtuvT0iWporTmytRR1U=;
        b=KON7l6sZDqK4j+UT/SLLl9wF0aR06ZernKJUjbdRwbfCJF4h8uSdazOttrU1iG8NaU
         aDhQOQ0jYzLFylcXFA+taa/4jHZodaAoym1QARbYZmSzL/dtrbqDNyP1bH7glXmkRDNB
         FgykfB4u+o0F5Wf7FQZatjp2JwJiMs99Jds6X9y6FTpVYUQfDJmJw4lwcpv/Bke0AcGM
         I9KzBB297Tq9W0BEPf3DdlvRXIJTreFFHtgRJxEyLP/qthEggEsUGDqsx4vOGXTbMXQj
         6pfGH4+qTrnMgO7msiSZaQu4ZEWxJe8HvXUAiuDmXrGYvJCHe3iaponKD1TLutiDi3YY
         +hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R7TNHVy3VEleA7R3NGQqJ4zyGtuvT0iWporTmytRR1U=;
        b=674yAmK4SyuCwnqZbQhz45HzpjJSQkVPooKy3OvdNkfejICutY1kDyGIwtZv0eL/yN
         XpZXyi00MRE129aTnOI8QwOPpx0APS3svR7c5/wIM84/sV8I8jxjQua1YOOD69P8dwJS
         7cB7SXt0zQ5zcmJbbYidhI7E76xHYurqDq1KH0fw9sbuEH81CBzsETptFurdX0Szlxdf
         0JsLrmGqukCD2rd97Ajiajl6rrSJw3RNzRWogSSBEtKM8EFZEVncbS4vjqDHmOc2/fnM
         G6l5bNBOwPsG9NZAD08ckTmUiGTsfp7Mjc3Hdv5B2rPn63eHZmDJ+5T5gGdEi7uXm3Oq
         1b6g==
X-Gm-Message-State: AOAM530ufPZGRwkSjE5LTxgcvJTMhApM9qcqlINXuDsR+o1i7PzKlVwY
	FHYOyoR4fYWGQx1GBIy/zBmHEWpBv6+iSWQ41VbM
X-Google-Smtp-Source: ABdhPJzodkaf8k/ZT66s8Hyu+Nb97VQ60hfUBvzEFWPT3b+9kE7PaFflndfYJBSvH3GRCP/p8PpArYs83Tx8ZDOUlPU=
X-Received: by 2002:a17:902:b94b:b0:14e:f1a8:9b99 with SMTP id
 h11-20020a170902b94b00b0014ef1a89b99mr8066539pls.28.1645199276295; Fri, 18
 Feb 2022 07:47:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217142133.72205-1-cgzones@googlemail.com>
In-Reply-To: <20220217142133.72205-1-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 18 Feb 2022 10:47:45 -0500
Message-ID: <CAHC9VhSuVr6NPVToScGQ=6Ugm1BFbijtzXxuTW3bs4ze57fn6g@mail.gmail.com>
Subject: Re: [PATCH 2/5] selinux: use correct type for context length
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Austin Kim <austin.kim@lge.com>, Kees Cook <keescook@chromium.org>, 
	Yang Li <yang.lee@linux.alibaba.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 9:21 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> security_sid_to_context() expects a pointer to an u32 as the address
> where to store the length of the computed context.
>
> Reported by sparse:
>
>     security/selinux/xfrm.c:359:39: warning: incorrect type in argument 4=
 (different signedness)
>     security/selinux/xfrm.c:359:39:    expected unsigned int [usertype] *=
scontext_len
>     security/selinux/xfrm.c:359:39:    got int *
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/xfrm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged into selinux/next, thanks.

--=20
paul-moore.com
