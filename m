Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A663FE7
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 21:09:36 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id v17-20020a4ae051000000b002b5a56e3da3so2013684oos.2
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Dq29TxJ5zpM4XHFteYmjRFf+8vB0LPfL9SydtuPUex4=;
        b=QXoqixS9dSwgotQCR4tPOH2boVVWjkQ9G/7fRvVPwOODbCs72HTY16UDes5QZRApcH
         KpzoIV+7PFON62nO10VhOP3msaqlF2KOpIyzg8TyhBSU5ysGfhzrSAtrTmwwNlYPKVP7
         SXcSfXUWpQz0lHdH1A4JuyE2FlzoL4tlEyHcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Dq29TxJ5zpM4XHFteYmjRFf+8vB0LPfL9SydtuPUex4=;
        b=Iooe7Le63HA4BjWSkq2kPpDnn4t+TsJn0r6M3YykttiNDE6jssbzWgEbefee1qQbaA
         OhC228qTO+sAcjY7s/sfsopkGuExktWRNTUWKFjz5NDig//P/RSN9IazpJAHkCIYRwni
         UsCnjXqJxxvjmTFK3wi7pVgkb8wZt42chojrasW5V43aVpuCdOVAPfrINQjwTrKRFSWL
         j+jh2xrQN76AwBOyYpfPCz84CY9ZNVuB1fcY8uAOiMRx+q9TNv4Ll+n+KF6W4sI2arNG
         Mq/jU8SNOq8BsiQiseHjTPX1GBHZqhb5sSjn9cxIsX7ipppIX03zd028E1SzsAKrd1WE
         9HFg==
X-Gm-Message-State: AOAM531YHt24s51cEpfa8TAw5mIYaWR53INVR2zwuuleb7Wzb5GQCdeG
	i3Qm4JxrtS+vuGdnYwJtUoL8ZS9ZUKNb4Nd9aTqZnQ==
X-Google-Smtp-Source: ABdhPJwsE/D0A4gu7LK9Uo5aq776hYHg6zVFtNMjoHs4nXxtn9C+5PEy6DETLnx3RKhAzWNHPiAUZenoQ4MczmEq2U8=
X-Received: by 2002:a4a:c3c2:: with SMTP id e2mr1747622ooq.8.1632776975637;
 Mon, 27 Sep 2021 14:09:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Sep 2021 14:09:35 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210927113632.3849987-1-arnd@kernel.org>
References: <20210927113632.3849987-1-arnd@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 27 Sep 2021 14:09:35 -0700
Message-ID: <CAE-0n52=yYW6SuMUPwGiv374K7D6DDpOZdJUudHdhMa7x2p1CA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/submit: fix overflow check on 64-bit architectures
To: Arnd Bergmann <arnd@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
	"Kristian H. Kristensen" <hoegsberg@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>
Cc: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Quoting Arnd Bergmann (2021-09-27 04:36:23)
> From: Arnd Bergmann <arnd@arndb.de>
>
> The overflow check does causes a warning from clang-14 when 'sz' is a type
> that is smaller than size_t:
>
> drivers/gpu/drm/msm/msm_gem_submit.c:217:10: error: result of comparison of constant 18446744073709551615 with expression of type 'unsigned int' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                 if (sz == SIZE_MAX) {
>
> Change the type accordingly.
>
> Fixes: 20224d715a88 ("drm/msm/submit: Move copy_from_user ahead of locking bos")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
