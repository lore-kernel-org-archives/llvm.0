Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E652F35
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 22:57:21 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id l20so587938lfg.12
        for <llvm@lists.linux.dev>; Tue, 08 Mar 2022 14:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8MuVYFNOaR9sliTT6PtGIJ1tDZacg9KCLiOwg2Rb9wE=;
        b=MXnPx5h0ijIvF7hzm97VrMTqvyic7sV48mwtFM03Cb2ZqYOIpnQ94270DTDJEPiPh9
         5CjRWWSGQtAApqB9y0tEUktv0WoI/5rS06ibAZJRqy6wYLCJ39pyFCAQa5vhGbS7jpt+
         RnHHXgNmhxv8e00HrU5+YGURkZWrbImCONWMl1DHCay8t/iiuqqtVW4ygi+TsCEAnnVe
         skhfJqTsnhWQHOKbDk3yD8UnHCafjqI1RpmaAPDM06Opmlw5WycySR/878Mppq8I00B8
         TSygBNI2YB8hFZCdpc9mwjDF1NaLFy4OrVQEjZ8wkBfIUT3UNgstcg7tJxHFRiikPcEM
         KnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8MuVYFNOaR9sliTT6PtGIJ1tDZacg9KCLiOwg2Rb9wE=;
        b=f7Fb3C/G+TIie3yyHzbbBF4z7YPLP23rreEij2xo13N22wjKVNghZw3CfYXyuLcp66
         KqlOyeceUThE5e2FlRpAHsAJ1PmKUaN9rNjehezKPRVErh0/P0ohzv0MufAhL/b4NJgq
         OPneceTInw9BEGL81KUqxWC80iQeQmFbevkUYmzMYKxFUBwbTVboRumBQIo6v/fSqWHd
         mC+550EjbweiWMDGfkLodC24iqSQlK56DyVB6AMV9Ua1nO+V6d+NOeD999YSYahMZ9kg
         L1/UT73sVajR5p/x0wI+QFSKk+YF7kQJa1OFbmrB4gwtPUlgxKYWyo0huQ8Ged/qGFhD
         JQjg==
X-Gm-Message-State: AOAM533+k30TWLFeFBbZ0fJXNK050Jull3fiidNS3vJ+u70JKZO7svUG
	ZchzOBYjRxWdQViLCoTI6lOKmVzev6Haq+QSuVNa3g==
X-Google-Smtp-Source: ABdhPJzdL2oC651g9gnqpZ43uG6CG69kcwxMsKSo599esFmsA3M5zPERun34wywdexJK6V1Ow3rB18oZvOBuem+8a1Q=
X-Received: by 2002:ac2:5223:0:b0:448:5100:e427 with SMTP id
 i3-20020ac25223000000b004485100e427mr176322lfl.87.1646780239304; Tue, 08 Mar
 2022 14:57:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220303201943.501746-1-trix@redhat.com>
In-Reply-To: <20220303201943.501746-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Mar 2022 14:57:07 -0800
Message-ID: <CAKwvOdnoV_SsFuWWJd4nOOd1vGG6_-gg-KvdOg4_NHuRp7_WfA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: check the return on anx7625_aux_trans
To: trix@redhat.com
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org, 
	laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org, xji@analogixsemi.com, 
	sam@ravnborg.org, tzungbi@google.com, pihsun@chromium.org, maxime@cerno.tech, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, hsinyi@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 3, 2022 at 12:19 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Clang static analysis reports this issue
> anx7625.c:876:13: warning: The left operand of '&' is
>   a garbage value
>   if (!(bcap & 0xOA01)) {
>         ~~~~ ^
>
> bcap is only set by a successful call to
> anx7625_aux_trans().  So check.
>
> Fixes: cd1637c7e480 ("drm/bridge: anx7625: add HDCP support")

Is this the correct Fixes tag?

I think it should be

Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid
through aux channel")

instead.

> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 633618bafd75d..f02ac079ed2ec 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -872,7 +872,10 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
>         }
>
>         /* Read downstream capability */
> -       anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
> +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
> +       if (ret < 0)
> +               return ret;
> +
>         if (!(bcap & 0x01)) {
>                 pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
>                 return 0;
> --
> 2.26.3
>


-- 
Thanks,
~Nick Desaulniers
