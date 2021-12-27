Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41029CA
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 15:48:42 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id b13so63141661edd.8
        for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 07:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ruYVqDjSzvKE9ESDPOstmLOwEK7+kWJthKgCsoXnHVY=;
        b=gncD0yuRaX+MOn2Kq0j/LeVUg8abEo1ACRTxQ6aLtpDnN9/a2GUIwaLmSNy7xfXDmH
         +5ecYsxj+WJ49A1B1MAWUBY667WuJ/xk18ROqTqZcFB/xiSeYrZybosg5tTWvSWnePOF
         /MaNtMrJ/QFkLpQLSOB57zKZYNQZtRs1pQAM25x1sPo/ZXzF9/Xr575HQO8zUpKBPzXc
         Pim6X6E8EiYFsdO+XelUg0gDZHgxUbq9waD8Ep37ER/fVO3qbepfA3LDtBU231R0PJNa
         4Ib7NkZ6AejM255yP3a17tRZgAtUx1gB/6OAxqZ6pyAszJclgSw356QQMsQ8Z4ZTH4oN
         W/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ruYVqDjSzvKE9ESDPOstmLOwEK7+kWJthKgCsoXnHVY=;
        b=gZxlxfur0J5zmCc3oigp3GEY4+RBJcZjlPsLAfNOjxJBukdxrJ3VYKbmv3Ih079A8w
         /sjIGkT0q+V/8OWjGtEYHoVgidK9YMwYwTOHUqthcZphUevzIYHwPcNmDLx6QodFy8sZ
         Wv4OJi9ypc1GAnj7rLz28rcAbE8nlhL1GGp3rVut84VtDMF2yt/t0p0d5l5kCfuNN39o
         5MbpHLALuO5lhyXhYBtD/WwhMOr38H2SLQ58+hOxBipthtHQU8Lwm9u4mfG9OQzbxN81
         xH12RHyOK02xX0z3uyaHweOaW2qt8t5f+MpLE2+OudWHO5NYPLEz/OJuSfW7UiW2xkEO
         dtXw==
X-Gm-Message-State: AOAM5335EcveIOSGbMv/3my7HW0zTrZ24glgQrhSwe/e7nB781j67wEx
	k5JkMg3hDM/ND9gWskzJ7pCBZNfs9eE7bBdvreMe
X-Google-Smtp-Source: ABdhPJykLSQBHob3XG4bD0UAP8+YA6SVKSYWEEW+4XpOd3xphqx/nenjfXqcIvc7dsZdFgHEfd0gNvauJ5cgfEAh/qE=
X-Received: by 2002:a17:906:7304:: with SMTP id di4mr14134518ejc.327.1640620121150;
 Mon, 27 Dec 2021 07:48:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211224150739.3278019-1-trix@redhat.com>
In-Reply-To: <20211224150739.3278019-1-trix@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 27 Dec 2021 10:48:30 -0500
Message-ID: <CAHC9VhR+ou3fx_b0dKgu12L6janT8_7DEHQ54QY-QYsZcUDEag@mail.gmail.com>
Subject: Re: [PATCH] selinux: initialize proto variable in selinux_ip_postroute_compat()
To: trix@redhat.com
Cc: stephen.smalley.work@gmail.com, eparis@parisplace.org, nathan@kernel.org, 
	ndesaulniers@google.com, selinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 24, 2021 at 10:07 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Clang static analysis reports this warning
>
> hooks.c:5765:6: warning: 4th function call argument is an uninitialized value
>         if (selinux_xfrm_postroute_last(sksec->sid, skb, &ad, proto))
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> selinux_parse_skb() can return ok without setting proto.  The later call
> to selinux_xfrm_postroute_last() does an early check of proto and can
> return ok is the garbage proto value matches.  So initialize proto.
>
> Fixes: eef9b41622f2 ("selinux: cleanup selinux_xfrm_sock_rcv_skb() and selinux_xfrm_postroute_last()")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  security/selinux/hooks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks Tom.  I don't think this is something that could be easily
triggered on a normal system, even if the compatibility mode was
enabled, but this is something that we should fix regardless.  I've
merged this into selinux/stable-5.16 and will send this up to Linus as
soon as it clears the normal automated testing.

-- 
paul moore
www.paul-moore.com
