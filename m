Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794A2337102
	for <llvm@lists.linux.dev>; Wed, 17 Dec 2025 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765958805; cv=none; b=g34k2bE7dTzigxNvkOhJLaBXJ/o0jkzZnYa3hcv7xnImKB5iKylxou2Rmq/q4LPKW4p27Y85zsG49Dm0ZhALcuecqe87pUATCsVngTDA6D77w4SFvC94E5BZ4Sga7R7JNImXD5O7BPN5sP/y1HEf34xJ4JSB5husw7NxIHW5d5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765958805; c=relaxed/simple;
	bh=bq7BliE/NjEHPTcJ+hqfuLZ5dvCT2Zv4pztbvHrgXi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=my5xHKsQvGz4JZIvbsdJiXEzlDp1bYodl9fFB53YY65d9Ds+STskqluq3umy0xXgbNCA+qM7n5mOIUuA1nKYaYUbQjc+ZC8TbQkJb34D+GP2huPXBBy+zpeZnvkGy+ZKS0FyThvBlkfPM85ZneugoeWjBs074ooD2MbUJBRLTIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FaJM3QQh; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FaJM3QQh"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so4582170a12.0
        for <llvm@lists.linux.dev>; Wed, 17 Dec 2025 00:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765958803; x=1766563603; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bdB/aSgFib9yNMnSjtnjVwQzHDWZlq9a/a2iwdeEH6I=;
        b=FaJM3QQhzph3MolSMO7F54jBf2hIJfModjifQ3KsnYEliVEGGBbraxUvsHOrBEhzl/
         iU3sUyUDo61ZN1/3MjjIMZza/bJkyCDclU5kQXzhrBPB/XreOMkpwkR4QaZEedojYKpm
         Z/jQadJv2F8WZe5zfxA4v7Cy7xwkMNwk6FofiFZo4YHXi1UmEqLTrnhfmZwn0K+zKT3x
         /SagCQ0jAYkOwO4mnUY0CqsPB6398AKxt7Kf47vL7MM+PSw9UCpB5ZrJk9hon0pr+VLv
         GcNs+ZpdCnLw+gBFN+uC4aHV/Q1ZxcxwU1aBeNB0m2brN84LIQiSitbvht4EvhG8jlEg
         T8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765958803; x=1766563603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdB/aSgFib9yNMnSjtnjVwQzHDWZlq9a/a2iwdeEH6I=;
        b=FAK+OTfkvK35LmwxTmTWA17vfAacWO+kHzZybn+evpoe8BhC9wdOGbHNou2XlQxyRr
         4LWedn/bxLrp/1O+fY6ZHAKcyI/MINbn6wTePnf6mXzn/kKgZVrPLmNmHg+yB2tS+ufH
         fLrc2ofUXB3zr5xQvr5k9CobyP/f1lJN8H4yPwrwPtsApSUH6Y3lZ7DOoOkWepbEYjgM
         sy/nxc88Cr9AVDdMMZbNQMAV0Bt2VMzAQT9sstOqiYYrN/rAQ8p9UldbACQM4PTD38o+
         AZB6keZUjb33bFwIfZZdXAVAlnbJLifrmOge9xxrocj1ytj1RNSJi9kccX5WfX59CNA0
         YurA==
X-Forwarded-Encrypted: i=1; AJvYcCXMNCAaJ4syawCktCyuDdOdRiiPSCA89/gLCGPMglXjhgL/Q9cRiWI6IhiZ4rk+rhBzEF3X@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+qgZFtrc+BBqJ29jMCQvJqSL+JAKMVGUVJGzK5fXKP5V9u0DW
	njrlsYOJpcd3elqPRUpl4Xfl98SFsztK8MQjjCFsYhRKY5WoonFc+2IWrTXBve79XGRWiog9grc
	5GDmPWpoGQxD+2NDdQOBvoJk60jqchXqSNbqUPxRUxQ==
X-Gm-Gg: AY/fxX7vywSsNBWOLpbWdRvbA28r+ZIB62Gl0dKJeEmKHP9a2+XjBQ1bFbjdj9K+arH
	SuiIM/9wK9RgyqonRedzm0z2v/e6IwJKyDeyX4IAjpmTeQc+UMuVt/BfHy9ug9matxvJAfratg8
	kztZTQp1QkyvcFXFBaDA+fSbdSTsIW8qud17gAYuC+0+CQnM+pMjwWY1jvG8uqkkPxUehtPq701
	+NclnoQG1rnwYw3zfP5XnOSVnJ6C8/eaugVIwsaRxakajK4fxErkeXXN9TFILj8ZRi6+wSGXV6M
	AzV2dee4H6N3oisfrsGhKdfPSlRu
X-Google-Smtp-Source: AGHT+IETkt/jVd6uk/R3QClwG8B5S2yNELg/JhUbEoBFWBg/UTAAcaP0rqWFCRLlCLTgvIDR/ubLYtPnNiiQ7GZIBHk=
X-Received: by 2002:a05:7300:d10f:b0:2ac:1bb1:68ed with SMTP id
 5a478bee46e88-2ac2f85e863mr12003914eec.9.1765958802517; Wed, 17 Dec 2025
 00:06:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216111401.280873349@linuxfoundation.org> <20251216195255.172999-1-naresh.kamboju@linaro.org>
 <2025121719-degrading-drainpipe-fb2e@gregkh>
In-Reply-To: <2025121719-degrading-drainpipe-fb2e@gregkh>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 17 Dec 2025 13:36:31 +0530
X-Gm-Features: AQt7F2rN0pF4kAzdVPk6eazQcFQyu-jClKs6CdNRybqUHycKnrNF6TQT-vGyPj0
Message-ID: <CA+G9fYvc==Vz83Kka7J84XHA-hhig0CKGHixRVBAzGDv-1BA7A@mail.gmail.com>
Subject: Re: [PATCH 6.18 000/614] 6.18.2-rc1 review
To: Greg KH <gregkh@linuxfoundation.org>
Cc: achill@achill.org, akpm@linux-foundation.org, broonie@kernel.org, 
	conor@kernel.org, f.fainelli@gmail.com, hargar@microsoft.com, 
	jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux@roeck-us.net, 
	lkft-triage@lists.linaro.org, patches@kernelci.org, patches@lists.linux.dev, 
	pavel@denx.de, rwarsow@gmx.de, shuah@kernel.org, sr@sladewatkins.com, 
	stable@vger.kernel.org, sudipm.mukherjee@gmail.com, 
	torvalds@linux-foundation.org, dan.carpenter@linaro.org, nathan@kernel.org, 
	llvm@lists.linux.dev, perex@perex.cz, lgirdwood@gmail.com, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Dec 2025 at 12:00, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Dec 17, 2025 at 01:22:55AM +0530, Naresh Kamboju wrote:
> > I'm seeing the following allmodconfig and allyesconfig build
> > failures on arm, arm64, riscv and x86_64.
> >
> > ## Build error
> > sound/soc/codecs/nau8325.c:430:13: error: variable 'n2_max' is uninitialized when used here [-Werror,-Wuninitialized]
> >   430 |                 *n2_sel = n2_max;
> >       |                           ^~~~~~
> > sound/soc/codecs/nau8325.c:389:52: note: initialize the variable 'n2_max' to silence this warning
> >   389 |         int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
> >       |                                                           ^
> >       |                                                            = 0
> > sound/soc/codecs/nau8325.c:431:11: error: variable 'ratio_sel' is uninitialized when used here [-Werror,-Wuninitialized]
> >   431 |                 ratio = ratio_sel;
> >       |                         ^~~~~~~~~
> > sound/soc/codecs/nau8325.c:389:44: note: initialize the variable 'ratio_sel' to silence this warning
> >   389 |         int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
> >       |                                                   ^
> >       |                                                    = 0
> > 2 errors generated.
> > make[6]: *** [scripts/Makefile.build:287: sound/soc/codecs/nau8325.o] Error 1
> >
> > First seen on 6.18.2-rc1
> > Good: 6.18.1-rc1
> > Bad:  6.18.2-rc1
> >
> > And these build regressions also seen on 6.17.13-rc2.
>
> Thanks, I'll go queue up the fix for this.

This build regression is across the 6.18.2-rc1, 6.17.13-rc2 and 6.12.63-rc1.

>
> greg k-h

- Naresh
