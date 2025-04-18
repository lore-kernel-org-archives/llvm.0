Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12556E555
	for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744983132; cv=none; b=uDZGLZh3DWPIa0qcvpLuTXqIDSeOEk2R7grv7r1V/wEHdv316wZLBUVGbT1eiolNmkKfRbLwfCc7g9cuSCGGb6AuZalR8CWsVvJECrLn5BDUjoV2mLItE14QLneT6XAp7x93bnHYU2zwcOaazdQ924U36Rt9BWuZhBypafhDBps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744983132; c=relaxed/simple;
	bh=b4njmjs5FEWBZVcqpZPtlDiz0Y1JpWUQ2Ktm5h9sD3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaMU064v+1rLyk/suiDVIzq7mgTvYxiyNCRmw1K/iGldM0zP/DQDAG/wveAp6SRMsnwNFjsYZ+CzytsQgWFbySLEgvPXUlmM4oNs1EVHjl3Jb1jEVtCmsKT1MXCmS7UZbpq7VqSafEbxheFQhYOQIeuWvIYKKCKMmkGeHbisvjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfTWLXE0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfTWLXE0"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac345bd8e13so286638666b.0
        for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983129; x=1745587929; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b4njmjs5FEWBZVcqpZPtlDiz0Y1JpWUQ2Ktm5h9sD3k=;
        b=TfTWLXE04D5iplzUMk2lQ4OWvx/UksXSEXk7EUjPv418Pm9aWhDEwtAoNdrXX36eAj
         r6SrGBZQuEor8hHbhl3MrTrsoDgTdKdf7QtMSPdzio6H+Mxx7qMhk1gGf38ej9Rt41eb
         +uuiIIBQJaDamTSgvIvWxlmsaj/ZAriu49To+KeUmFdpEXAUBPrTmxK3XAf7OrOLQcAf
         mIH2fucCLtZl9IoiQfzwKIzzJyXhhSwBG/GSn4Pg5P/+MJdTnMpx/Sx4yCFOorpYgL8U
         ApFJD1u7300IUoJpGLTrsUq+BPuiLv5SXmxr+aoVZOWAmrwjJfxWsCtbb7TW7tgKz6WA
         ZTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983129; x=1745587929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4njmjs5FEWBZVcqpZPtlDiz0Y1JpWUQ2Ktm5h9sD3k=;
        b=i5E2Q3gO27XnRAUPIzmR1+o2hxXNDuuY8m5FbxriLaUIUz9LAQ/oZV3q7qE4Bpt5oz
         StTm+gCutav80UuqCfJ8Nij/7VBQ7R0ubMt10ztUtzLZwd2hvSPFcV95KFBIcdDRwaFw
         gImLyNJ+rooX9Dg4ogsxrApKqXP8d7rVppEfA8b9T78VLnG2pmMdS4bS+vWeQRi5GOre
         LP4UA+RlMxJX92jVVDc+jTeM5weYNtmXpMfO1VNU1Gais25r2kS3b8YkeGlEzM5qwtu/
         pHwHwuDigaHvqBdSs/hsaZBIVtwK8UFb6x5a3FQ2A2CD23sGnU8sY/fUxrLm9J03myB2
         FDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtIXbTXwmh8XCdeSIFeKvHj/loIsN5qsfuzUZQiSsgHXh/dMfG+9f2PIDfAgNl0MOUj5/t@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ+i9VFAi/7PCkhLbqncwd0X4h0zYPRTvqZfdMkTvL2gF3w0xG
	8oU6TPxC9ZYkhq436yQHAeiOVxTtys0YZJKiCwZAv+8S5x5QKBov2lJZxSGzi7wphr4pMLg3hxT
	uRVqCK3l8R5I8IwxTAPZk2Qja6Bc=
X-Gm-Gg: ASbGncuMrbHLYQnuJDsCusXea6vpjlIZ5zUrnOXVlCzmMSbnc8PojO2HWg21eusICZQ
	KP8SY9JiX/CbEtTAX5jesCZbdEOJDS0cVdWFXdffSUXS39HDVB7JFD6RlsxdtTL3EIlGUOmsnja
	OJgX1D1o5dq0HXeUCoi+XA
X-Google-Smtp-Source: AGHT+IE5yZsOitApY6hlFkOYwOYpZYTB/YxlFvfZ57kvY4H+NoJApljac4H2AaCIqMz5qAQqGyh7Um3lY526ikobtao=
X-Received: by 2002:a17:907:7206:b0:aca:d560:d010 with SMTP id
 a640c23a62f3a-acb74e0261cmr227580366b.49.1744983129087; Fri, 18 Apr 2025
 06:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250410063754.5483-1-linux.amoon@gmail.com> <20250410063754.5483-3-linux.amoon@gmail.com>
 <aAIJJKGif3i3-97g@mai.linaro.org>
In-Reply-To: <aAIJJKGif3i3-97g@mai.linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Apr 2025 19:01:52 +0530
X-Gm-Features: ATxdqUHZRAneISG_0dWfd2Uk4LjrjEG3JlIyII728_wOPaPTeWkKGUoSPf19fAc
Message-ID: <CANAwSgTpQ32XLfRpbngZkvw4ws_L7t2N6hQY0YNykZgZhGt3wg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drivers/thermal/exymos: Remove redundant IS_ERR()
 checks for clk_sec clock
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Fri, 18 Apr 2025 at 13:41, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On Thu, Apr 10, 2025 at 12:07:49PM +0530, Anand Moon wrote:
> > Remove unnecessary IS_ERR() checks for the clk_sec clock,
> > the clk_enable() and clk_disable() functions can handle NULL clock
> > pointers, so the additional checks are redundant and have been removed
> > to simplify the code.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>
> Typo in the subject: s/exymos/exynos/
>
Thanks for your review comments.
Opps, I will fix this next version it got skipped.

Thanks

-Anand
