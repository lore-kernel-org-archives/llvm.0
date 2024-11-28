Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49AC15383C
	for <llvm@lists.linux.dev>; Thu, 28 Nov 2024 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732789700; cv=none; b=iNxgqNWkZNUQRerRyYunV3g6WgmK9ya9dNN8pG41f109P5Gn5kVRRdfTkJvDH209yfA3JGpbZEmEVBjeuPhDdkN9zY8Kx+Z3627eHPxcs83G1dQN5x+emS8026aieDhEFek+LjS2LuePGzza977Y8745siO8uqgpNJe1n25xQHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732789700; c=relaxed/simple;
	bh=xBez7rpBLjMzyjYwf7HZa9dlrkgJrg+yAQKT8Au5N6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rsVQ3sM1sOSehpbVv5pn6/KKpXalRssHY8SyTKyuqROxlsLO3NoC5V9K45UJ3PtvcmDAeZHJb4jXNyx5ZjNxoDL7w4M42KzfizLK3xq8g/HR7JtW9kHRsVncAxEvgH3OyR3yZWyJWIUiizypQof8CJD9Rs/7Gs408xDaRTkmg4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XPZWXn+n; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XPZWXn+n"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4aef7d0cc2dso175426137.1
        for <llvm@lists.linux.dev>; Thu, 28 Nov 2024 02:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732789698; x=1733394498; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CKy9NFeqlqcw1t7BKiitB8spU33tefaJ6SaLKo921pw=;
        b=XPZWXn+n17YQhafrhl4LqOWhCqp+m8W1cKzhurGebFjUg8AbwtHRtxEW1PTrorBQLz
         ulLK5Jig8tBCsGENds/NXvAF/vwzduQvkSktdgjECHzMjlF+F41xV/4krhjtepgd+QeS
         M4MFbTS2gk0nGuvnSdTCxK26whAanYI4q2BXPGHc8oKF7O4Tp8quMiAQmNCZrZD5Tgnk
         GXwXvN60QiT3qrow3nXVcoJRo9bckCIdxSZDBb8A/OGy6TKx8aXphAvkeB89g9W1Cr/G
         ddtRfjHxnr6D50ESS6Y/OIEXucGpWFWECHBpg0rtrqSyszchHre+DacsJsByOpqaaQFh
         rD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732789698; x=1733394498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKy9NFeqlqcw1t7BKiitB8spU33tefaJ6SaLKo921pw=;
        b=WQHooQcPEtIro86E3h7zv8OoBxlBTmhtqRi2EnR2Ws560lAPw3mIMr1thX/ia9vyv7
         td8tHa71GowZzq6uQ2U4tR1nUlDD1e3oHvBhaXud7kwKvIr+GFH883W7WuotaTq3zHYw
         t+f08V8HfOVThtxj4ude9BGvYWnl8roD1hRxz24/Jo/w8mETwRZzcHY21q8YapoPUP28
         muum+NNEsmDnCdPYM05G6EAXakn9cadfdlome56AcKpyQ+1IAc5bcnLgxFz6t9w7mSma
         1TeqROs5gisa5RxaOLceczYwScQq4eERqxwz4jLdWi5Xi4n09rSARflBN4lnOKASKfy/
         vIlg==
X-Forwarded-Encrypted: i=1; AJvYcCVvgwdWYIwcA6O6LcM9RkdvdOQCbyCo3WL0fBtKPjYq5gUXTbBcJPGLG62QtWhz4AhTipS3@lists.linux.dev
X-Gm-Message-State: AOJu0YwpWk2FzXM+6olHl0DF/ZCLcR2YHWVi6ZVJKIPEttklxjLCvoIP
	rtHm3gLQv7rfxqXN+yahaBD6vG83/bVhT9fEj98y7qyq36AqD28xrPVPyGZ2f0VOkulh06+5wGV
	U9nBJUSGUZAVtK5sLM6nTe95lRxoLkAvQw/MoZA==
X-Gm-Gg: ASbGncsst1uVYHx2cKHKb7Um7etxtq7BEOBTUmnmJMg68e8WuO/6VmOb0+OCe2bPIBb
	bxlhhS8XQsz3zoPfkN6ME5nS07eBQgcjNMg==
X-Google-Smtp-Source: AGHT+IHNjCHSookykhJ0jiELmB8RMX1pmwKtceJGivKe5r9uvyYhkK2Li/fKdNaKGIC1FiwJ9jTRq09+7ToPFKBO6rs=
X-Received: by 2002:a05:6102:82cc:b0:4af:497f:aaa4 with SMTP id
 ada2fe7eead31-4af497fac19mr5014052137.4.1732789697607; Thu, 28 Nov 2024
 02:28:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYs+2mBz1y2dAzxkj9-oiBJ2Acm1Sf1h2YQ3VmBqj_VX2g@mail.gmail.com>
 <CA+G9fYvh8n=CTCmcCdLViH=o-UXH1Euncn+7YuYkvt5O-k8NMg@mail.gmail.com> <20241125154235.GC2067874@thelio-3990X>
In-Reply-To: <20241125154235.GC2067874@thelio-3990X>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 28 Nov 2024 15:58:06 +0530
Message-ID: <CA+G9fYshK6+AuXSnu7c=j+QJ38kN6O6t7B=DdzqQrMN_rGsJhA@mail.gmail.com>
Subject: Re: pc : qnoc_probe (drivers/interconnect/qcom/icc-rpmh.c:269) :
 Dragonboard 410c - arm64 - boot failed
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Georgi Djakov <djakov@kernel.org>, konradybcio@kernel.org, quic_okukatla@quicinc.com, 
	quic_rlaggysh@quicinc.com, quic_jjohnson@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 21:12, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Nov 25, 2024 at 08:43:44PM +0530, Naresh Kamboju wrote:
> > [Small correction]
> >
> > On Mon, 25 Nov 2024 at 20:33, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > The arm64 Dragonboard 410c has failed with the Linux next, mainline
> > > and the Linux stable. Please find boot log and build links.
> >
> > This boot regression is noticed only on Dragonboard 845c.
> > Linux next-20241125 tag.
> >
> > Good: next-20241122
> > Bad: next-20241125
>
> Can you bisect to see what change introduced this?

The bisection did not provide any good results.

I have been tracking these boot failures on db410c and then the boot
test got passed on next-20241126, next-20241127 and next-20241128.

Boot test history:
-----------------
-  https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241125/testrun/26040307/suite/boot/test/korg-clang-19-lkftconfig-hardening/history/

- Naresh
