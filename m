Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71047C
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 21:19:34 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id a15so35079491lfb.9
        for <llvm@lists.linux.dev>; Wed, 08 Jun 2022 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ilRet/KteeJG0WVmL4enbjfFb2OgDEAZfxK9I2Kp4c=;
        b=orw7vd9hf+k7zjOWPiiZOZtmqN/hWFJl5pW99wtt+Rq1Hm7YBjzEOSP3mhwJ2DORMw
         XSmLhs40wtsUHUvaHtig6ZRdICE1hd1M2vPBhZYOEMmpQSr/oqykZPZi/K3YfP17SfTn
         /7vU4RiM7cvzSs6mBGmPZtmWWr6qQA+O3yZ+z6v13v9zqyTLh7TZQcpJO4LfbhbpDp+8
         nIkXxUT+AOpLOvvprZnmPzdG1JGPb7sZTLMDpGtWlxp8fxrR/eq1Unx7+ZxLofC0X7l7
         02nNRjyXRadcrqWHAI5Iw99RiXaL4UjpfIxCqUJCTAhqvJCoblJg3hJgqhfxEXEvkLug
         odgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ilRet/KteeJG0WVmL4enbjfFb2OgDEAZfxK9I2Kp4c=;
        b=lRULOPN7iNY1X3G4PrgsAQFkzWHBKHFOSqn5Vh0WGslkUAwEiw2DCayvWqgf12x0BC
         o74hd+DxYcTvi8gGkJA6RHpHFzuRrMK0EYxBVGxa7lC+NvzNqLfeChJ0GUg2gtqYQ97e
         Q8EhCiQUvmu9NLbCqCPAWdpSLcHiO8vfdShZ3UEUS41Yuotim43/Imrby/Y9GAKG8/Um
         V/ioW+Xs1wAtWGb2hSospTAawoufpEEK7jQdGyxhg1+3A81YRY6hRQ6+hZHlxZpl+SoZ
         yx+XiRk3J1m0BDmvwZfJ+ZcgsxwGNXlf0RGyOYlu9ky4/GLC/JcaOGMJ55OvSmsnXk9Q
         IFkQ==
X-Gm-Message-State: AOAM533mtkTJy+K7/xAe4qe3QMzHjM1nylbhu72WxzvmgcedlkCuXMVK
	J/2Yq09iyNGpVwCM8rlTq77UZL4jFkk2agGaLGDV519hyrvd5g==
X-Google-Smtp-Source: ABdhPJwwAW2b+mfAhfkM0cP+SQRSXeyrHsaUSLs3aLLpRzT3By9pcpZYszrhRm4pOIhPQhNMmMpBn8zAokUuYAV6JT0=
X-Received: by 2002:a05:6512:2614:b0:445:777d:3530 with SMTP id
 bt20-20020a056512261400b00445777d3530mr70405545lfb.647.1654723172773; Wed, 08
 Jun 2022 14:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOd=-NXR5HoHwwEUZMsCt90oaADH6XHifje9n-8S8rj9SFw@mail.gmail.com>
 <20220608001422.26383-1-jstitt007@gmail.com>
In-Reply-To: <20220608001422.26383-1-jstitt007@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 8 Jun 2022 14:19:21 -0700
Message-ID: <CAKwvOdn7Dj+BJv6LSCs93fp767_J2ZisAHJJV3uAbtws+YjgEA@mail.gmail.com>
Subject: Re: [PATCH v2] include/uapi/linux/swab.h: move explicit cast outside ternary
To: Justin Stitt <jstitt007@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 5:14 PM Justin Stitt <jstitt007@gmail.com> wrote:
>
> A cast inside __builtin_constant_p doesn't do anything since it should evaluate
> as constant at compile time irrespective of this cast. Instead, I moved this
> cast outside the ternary to ensure the return type is as expected.
>
> For instance, if __HAVE_BUILTIN_BSWAP16__ was not defined then __swab16 is
> actually returning an `int` not a `u16` due to integer promotion as described
> by Nick in this thread. This has repercussions when building with clang

Also, "this thread" won't make much sense when applied if someone is
looking at git log.  Consider phrasing this instead as "in the lore
link below" then include another link tag to

Link: https://lore.kernel.org/llvm/CAKwvOdmXeRbFjkHgFXps4pLH6Q6pGWRNOqA85=h2aFnR=uaggg@mail.gmail.com/

Though, I think it's simply more concise to just include what Al said,
and drop this sentence altogether.  You can send me v3 privately as an
RFC and I'll greenlight it before you resend to the list.
-- 
Thanks,
~Nick Desaulniers
