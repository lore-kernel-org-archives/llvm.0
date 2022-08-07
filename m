Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553833C15
	for <llvm@lists.linux.dev>; Sun,  7 Aug 2022 17:55:25 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id gk3so12811505ejb.8
        for <llvm@lists.linux.dev>; Sun, 07 Aug 2022 10:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=tH9P5Ev6KfldpgA7IyGsP6cuudklMvx95MGD8TKUKT4=;
        b=C4CL1iu+qx5rdNpY/Qdx3Op6dbE/9zKXo4LCAeV+cbmx/rvLCK+FcObJUilhM226pd
         qtTxjZWV0gQfDYjqPT/IttAiEKQ6zFvDllkAQkGzhczUFYexBZVFtNxH/hwngF0cEm0M
         jFXxpFIfpzmNNaiVAKGaWiV4JLbHqQY4j7Qg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=tH9P5Ev6KfldpgA7IyGsP6cuudklMvx95MGD8TKUKT4=;
        b=ZF/Er7btPD53d/BsveRarupuV0rzCqhwazXkjSqw/PHOfw2vxxrxgX/huhxzVii7no
         HDn/vgVwObQbk2CCuGjFn1F+tg4YqsqtPrJeeHxHmhDTIqHffmNCxoklBjh4m3SPmcy8
         HHpJRsOqYtPRlIWwoMJVmLEGIiVcDKZnw4Ewv6vvseSVEsqROrzwZSV89Tz7h02mB94E
         wN/2wcbeeLRo+vyy53aGM9JriUbOrdpfp70JT6B6Ydyn8XGc152wsoh5LnnTmxFVIepb
         WYem1w4BZZt8n7hPku+nf7sGfnDy992Cn/RMV3euoKjaNQ6Zbse7VWmKpOXUI8ap31dw
         oYsg==
X-Gm-Message-State: ACgBeo2I8zL4ZESnA/YapaYa3hvvFXmVO2h1d62tRBw5Gh1wMVjcyUy9
	pauu6tQNM3wy4B01h0zf9EJsDsQndN9Az3TA
X-Google-Smtp-Source: AA6agR6KPCtfw+XqbMi2wbmXvJZ9O7AiWQlzCsr3TcNVkQ4J2QAzeTbSfAU4gDamzRrdeZ3n+Qb+QA==
X-Received: by 2002:a17:907:c12:b0:731:6473:baf6 with SMTP id ga18-20020a1709070c1200b007316473baf6mr481394ejc.522.1659894923422;
        Sun, 07 Aug 2022 10:55:23 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id a1-20020a170906684100b0072fb3704e49sm4037048ejs.46.2022.08.07.10.55.21
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 10:55:21 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id 17-20020a05600c241100b003a536b6d536so1258146wmp.2
        for <llvm@lists.linux.dev>; Sun, 07 Aug 2022 10:55:21 -0700 (PDT)
X-Received: by 2002:a05:600c:1d94:b0:3a4:ffd9:bb4a with SMTP id
 p20-20020a05600c1d9400b003a4ffd9bb4amr10178442wms.8.1659894920750; Sun, 07
 Aug 2022 10:55:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YuwRyQYPCb1FD+mr@debian> <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
 <YuwvfsztWaHvquwC@dev-arch.thelio-3990X> <9fb73284-7572-5703-93d3-f83a43535baf@amd.com>
 <CAK8P3a3Fv=_+GV9r=k4jP72zZOjJowL-GOue-51EhyVDBaEfEw@mail.gmail.com>
 <Yu1bMqL5tsbq1ojj@dev-arch.thelio-3990X> <CAK8P3a3PAxkctN6AXOsoTBTFgwHhk7_OSYwJ4Rgk7Dbs+bc0Qw@mail.gmail.com>
 <cb3ea155c4e149eca30ca870e3f2546d@AcuMS.aculab.com>
In-Reply-To: <cb3ea155c4e149eca30ca870e3f2546d@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 7 Aug 2022 10:55:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wghheK1pKhpu9SuQkjzUvu25-vTu8nyxozooarhAmaXhw@mail.gmail.com>
Message-ID: <CAHk-=wghheK1pKhpu9SuQkjzUvu25-vTu8nyxozooarhAmaXhw@mail.gmail.com>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
To: David Laight <David.Laight@aculab.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Harry Wentland <harry.wentland@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, 
	clang-built-linux <llvm@lists.linux.dev>, David Airlie <airlied@linux.ie>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
	"Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 7, 2022 at 10:36 AM David Laight <David.Laight@aculab.com> wrote:
>
> Or just shoot the software engineer who thinks 100 arguments
> is sane. :-)

I suspect the issue is that it's not primarily a software engineer who
wrote that code.

Hardware people writing code are about as scary as software engineers
with a soldering iron.

               Linus
