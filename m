Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5BBBA57
	for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 16:35:37 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id c24so2068749pls.9
        for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 09:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=urppZBfNFt0XJ3ZhcESG7TULR6plK7BmAb/zbSwQDp8=;
        b=o3a3iNSMsWwMI8Y20Q1ZqbfszHCrda/DokFv8WT3R06YwqLHyCk3o7Q2VO4FBGfful
         8/TYklRnQWmaJj6+zSLkIsIuIng1aBSUX3x1Kzmf20jb8DW5/3TsxhFN8LspTo28XrpI
         AmdGSGrwARlf7D8rFYMgOSfvB40taSFGsydXRELdRv5Jdj8ftqly/Jyb2BKB4OiK5Wvz
         VkWn40Fg50p5OjrJW/mGO4PCxzVWKPtdOnwnWIbprRjRBeF0yjfZ9Lem1fowKz8Q+A6j
         dynGNplaXhtgFBB7eWEEBXoDPFDQiVtF5ELANn1RFUvfa+jlY65x95ttljaye2345fZs
         QaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urppZBfNFt0XJ3ZhcESG7TULR6plK7BmAb/zbSwQDp8=;
        b=dvq0kD7s5lGcBC65MXrFD5ezJrjUA8Xh4dGd38r3+a18I/OMUoMY0LYWofsdSM/Z0M
         ZZJcbNGd68GC5J1Q86+4iENE0l0DU6GJwQjkSeabLOus07AOXh9xuBdlQ/XHhL14yt4O
         D1sVlGF1aiTOWZUY1ArcMC7gF7TlJSBanpYyUqVS14TryJ+0ySp/H/Wn34SeaxOE5Bfr
         XGMusyiyEEkWhnZ+5sFOVttKBGq8Bd6UmUb6k93Ojuk/0wDcbSnRWr3518RkNb2VExV7
         qtRHTbS67dCXEZ+qYPBwhb0xK6YHzd5mSpvBwL7OZDZ20+I8EWOnNlvdCjuLi6UoHg8h
         WHnQ==
X-Gm-Message-State: ACrzQf1zs4utNJGmyY/A+qJyHYn6YuOBbOQ9sX1mgxsvC1wTEBuzkbw5
	XGqv/18BjQtJAfIK1xRumneAmJW7bv9v68LNYD9o/g==
X-Google-Smtp-Source: AMsMyM6It3+2j+zCgkl6u8Y+MHPUVoTqKr7o+Ow0VF1Q9QWhO8mAeIBq0NfhI8RqsxJEIFwO2j5pPV1V41nIRNdWByg=
X-Received: by 2002:a17:90b:3a88:b0:209:f35d:ad53 with SMTP id
 om8-20020a17090b3a8800b00209f35dad53mr11113376pjb.102.1666888536691; Thu, 27
 Oct 2022 09:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221024210953.1572998-1-gwan-gyeong.mun@intel.com>
 <87mt9kppb6.wl-ashutosh.dixit@intel.com> <Y1ercgaqQwfqt42U@ashyti-mobl2.lan>
 <87ilk7pwrw.wl-ashutosh.dixit@intel.com> <Y1h8yn4QHI3aBlCe@ashyti-mobl2.lan>
In-Reply-To: <Y1h8yn4QHI3aBlCe@ashyti-mobl2.lan>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 27 Oct 2022 09:35:24 -0700
Message-ID: <CAKwvOdkpQvk31zbipLDPXfsDZ8FpGHs9t-+9JfFQO85Bs4h=wg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/hwmon: Fix a build error used with clang compiler
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, anshuman.gupta@intel.com, 
	intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 25, 2022 at 5:18 PM Andi Shyti <andi.shyti@linux.intel.com> wrote:
>
> Hi Ashutosh,
>
> > But I'd wait to hear from clang/llvm folks first.
>
> Yeah! Looking forward to getting some ideas :)

Gwan-gyeong, which tree and set of configs are necessary to reproduce
the observed warning?

Warnings are treated as errors, so I don't want this breaking our CI.
-- 
Thanks,
~Nick Desaulniers
