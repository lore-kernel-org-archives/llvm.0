Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEB87C
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 13:48:29 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id p17so1972220plo.9
        for <llvm@lists.linux.dev>; Wed, 09 Mar 2022 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Awv2807Q48rVf5K7n4tpsQ5KWBJDVYHY3kmCWNGk/aI=;
        b=wcsOfALNDGWwsppDVr612z56RIFdWApQ9M7wYfkJMq8/nhsKXsyw0kUUx2ytQ3ByPz
         zxpSHo1d+oR+6+rDhvl/kyJW7BR7yQAr/q++8bz8KhQVUiUscD8mN7mE4ATjdySjvqnq
         einFiM8EQ7zx0LK5iXHZClxZkmp13xYREyuO/zvxbFnzaxyub6tECJA89p37uOCS9WUa
         j0bT5jMYmF+ZZRn6G/BQ02rNDkquRPi5dwKuD+O6u2EX14z1GLCiPowGsop2oYdThZIL
         u4gd1htJyC834tEP9cAT+ZzpmcnuaD6AADdllgz/iFBuh31TRqz9TQwAuG1DUu8vor1y
         B50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Awv2807Q48rVf5K7n4tpsQ5KWBJDVYHY3kmCWNGk/aI=;
        b=Csgy47XOaQ34B4YrAHmunvMabC0s1hJvP7q2zmm0pyUeO0NA/N/LVZfRUSoa3Y88cW
         qYXwb9UUQ438AbaFQlbvlQSMfiq4O1gVCYti5zGAt8XKkdtbXp3trODpP3XovZsnClZO
         K1Nwy2OwsiEHKtZjZwnZy/b9sz/huXnzvW2uo9sYsBoYWbD6NQ7CkQVF+AyeIernLbQ4
         9pb+Qgcpitl2RZqHW9e0bMzIKINUWzMe7jVDjr+WZQ0ZakrgmcSPz+Xvj4nfAjymyWxt
         uoJkek312J7SnpBt6SrZ+3M0T9NnPBplJ2aBlXQQLwJqtDgARc5biYQiGKzeP4iypsiv
         xcWA==
X-Gm-Message-State: AOAM530QOMpZ2g7TOWNUjsK0hSIzu5TdsoVzSavjFRCcDmM56/0CxSvN
	lh5vSodwfaQhk3L1lUzv6FJndIOjZ1a92wR4YiqitA==
X-Google-Smtp-Source: ABdhPJxxGgkv/4ONjg/97nbBdxzNOqwNnUzRdkuGoFC3g9OqxkCMUZRKN+0ZNpfJPSVMPuq50dxWQN74mQ3jU4SqXbA=
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id
 gx12-20020a17090b124c00b001bc369b7db5mr10521690pjb.179.1646833709168; Wed, 09
 Mar 2022 05:48:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220303201943.501746-1-trix@redhat.com> <CAKwvOdnoV_SsFuWWJd4nOOd1vGG6_-gg-KvdOg4_NHuRp7_WfA@mail.gmail.com>
 <5b6a10bd-5650-2924-d1cc-e4664a0e7255@redhat.com>
In-Reply-To: <5b6a10bd-5650-2924-d1cc-e4664a0e7255@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 9 Mar 2022 14:48:18 +0100
Message-ID: <CAG3jFyuBuJmr=NJROWHyEQqW9qng6KtwhJ1a9ACUEGfZ7g-Mxg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: check the return on anx7625_aux_trans
To: Tom Rix <trix@redhat.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, andrzej.hajda@intel.com, 
	narmstrong@baylibre.com, laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch, 
	nathan@kernel.org, xji@analogixsemi.com, sam@ravnborg.org, tzungbi@google.com, 
	pihsun@chromium.org, maxime@cerno.tech, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, hsinyi@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Mar 2022 at 02:45, Tom Rix <trix@redhat.com> wrote:
>
>
> On 3/8/22 2:57 PM, Nick Desaulniers wrote:
> > On Thu, Mar 3, 2022 at 12:19 PM <trix@redhat.com> wrote:
> >> From: Tom Rix <trix@redhat.com>
> >>
> >> Clang static analysis reports this issue
> >> anx7625.c:876:13: warning: The left operand of '&' is
> >>    a garbage value
> >>    if (!(bcap & 0xOA01)) {
> >>          ~~~~ ^
> >>
> >> bcap is only set by a successful call to
> >> anx7625_aux_trans().  So check.
> >>
> >> Fixes: cd1637c7e480 ("drm/bridge: anx7625: add HDCP support")
> > Is this the correct Fixes tag?
> yes
> > I think it should be
> >
> > Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid
> > through aux channel")
>
> This one changes the name of the function
>
> -       anx7625_aux_dpcd_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
> +       anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
>
> A return check from the earlier commit, when this block of code came
> into existence, is when it was first needed.
>
> Tom
>
> >
> > instead.
> >
> >> Signed-off-by: Tom Rix <trix@redhat.com>
> >> ---
> >>   drivers/gpu/drm/bridge/analogix/anx7625.c | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> index 633618bafd75d..f02ac079ed2ec 100644
> >> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> @@ -872,7 +872,10 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
> >>          }
> >>
> >>          /* Read downstream capability */
> >> -       anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
> >> +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
> >> +       if (ret < 0)
> >> +               return ret;
> >> +
> >>          if (!(bcap & 0x01)) {
> >>                  pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
> >>                  return 0;
> >> --
> >> 2.26.3
> >>
> >
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
