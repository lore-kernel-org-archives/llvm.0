Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD6EFC07
	for <llvm@lists.linux.dev>; Sun,  8 Oct 2023 21:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hXmXnBQN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c8a1541233so4044835ad.1
        for <llvm@lists.linux.dev>; Sun, 08 Oct 2023 14:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696798951; x=1697403751; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+637J8JrxpPBKVObYJuwDVzNM6P1JOtG34tKxFSpPmw=;
        b=hXmXnBQNWe0AyzVHau2BaAd0pa9OegSnEomBmtnIIBEG50XuLYJdM7Utns4Fkgdz4k
         +csfoMW/UPxFheGxbu1dgl27baZnOuGui3QAtbp9I92wbPBM9Hx9Ns6voMpNbPMR1ILZ
         /bRza6xc4PwfGMyxLlmbVCIy1SUT+nWn0tbS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696798951; x=1697403751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+637J8JrxpPBKVObYJuwDVzNM6P1JOtG34tKxFSpPmw=;
        b=JrTLbllwE3h7ywJkTGVXCyIkMQCwmoSxEL0SFc3lcmZ1PD8+KuoBz6ql8aoZSaZXnU
         t5w7hl2zXWictJ+hTro6jGxvaclUPmL4jfpNZkTSqcqqUwqaGA3DSqfRPhIV4LJ/hgHS
         c5qKZD1LUhAmBV7HwP81hXTjmF5LyufSpBKGY0oXa7uwJJTmKeV2+3HxFrfFhhFLBAyv
         fSpCPQCxafldaRLaLStoTohxS6DKOayZY6HqT6jPqy7BXPfH9dJJfPZxx5oMNMPENB4Q
         /t0jDOSLhY2ab5Inwe8r/cd49EWLlsZIfCdPn1mWa94M73DSkbp1G248j372qiBdzpD3
         xVUQ==
X-Gm-Message-State: AOJu0YwOlgG2gG627/TCCOiO2BdXgQjTyQuFFlNxFYS0kHdXxfElGu2Q
	jtsmo4G+upXnTrE2iyAzvInlSw==
X-Google-Smtp-Source: AGHT+IGA+gNn0/afQ19stAKcVih0BRUUfkT7EAYUidRwr3O0DF16NyVLt6G/9/uEJWXsIq4Yp/7DBQ==
X-Received: by 2002:a17:90b:3a8e:b0:274:2906:656a with SMTP id om14-20020a17090b3a8e00b002742906656amr11799946pjb.5.1696798951057;
        Sun, 08 Oct 2023 14:02:31 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id nv16-20020a17090b1b5000b00271c5811019sm6919052pjb.38.2023.10.08.14.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 14:02:30 -0700 (PDT)
Date: Sun, 8 Oct 2023 14:02:28 -0700
From: Kees Cook <keescook@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, lijian <lijian@yulong.com>,
	linux-media@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-event: Annotate struct v4l2_subscribed_event
 with __counted_by
Message-ID: <202310081402.F4DBC2B@keescook>
References: <20230922174951.work.160-kees@kernel.org>
 <169662411867.2154917.2192633783167073007.b4-ty@chromium.org>
 <eeeb183e-f6ed-4158-8852-04da5e452d9b@xs4all.nl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeeb183e-f6ed-4158-8852-04da5e452d9b@xs4all.nl>

On Sat, Oct 07, 2023 at 11:21:26AM +0200, Hans Verkuil wrote:
> On 06/10/2023 22:28, Kees Cook wrote:
> > On Fri, 22 Sep 2023 10:49:52 -0700, Kees Cook wrote:
> >> Prepare for the coming implementation by GCC and Clang of the __counted_by
> >> attribute. Flexible array members annotated with __counted_by can have
> >> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> >> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> >> functions).
> >>
> >> As found with Coccinelle[1], add __counted_by for struct v4l2_subscribed_event.
> >> Additionally, since the element count member must be set before accessing
> >> the annotated flexible array member, move its initialization earlier.
> >>
> >> [...]
> > 
> > Since this is a trivial change and it's been 2 week without further
> > discussion, I'll snag this patch.
> 
> Ah, I picked this up for media as well. Same for the other patch.
> You should have gotten an email from patchwork on Oct 3 that it was accepted.
> 
> I think I should be more pro-active and reply when I pick up patches from
> non-media developers instead of relying on patchwork. It seems that it is
> easy to miss emails from patchwork.

Ah! Thanks for reminding me. I'll drop them from the hardening tree. :)

-Kees

-- 
Kees Cook
