Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC23B38A1
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 20:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578102; cv=none; b=mJJFm9RoXPfXBTjQfvggKZN0/u9tI1S04zADKytpQx+CawbkC814N0LL43yoRu8MkmzuPKdlfaVElcG6a8qSjS4lJhUZ3p1h37mKpqhq8W+EiMrdHll62wnS10io7ruwzzS3van7aKCuQsKG68ljU39hd85c4/00/vMbgiH/q88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578102; c=relaxed/simple;
	bh=EYsXbupgT8p/3lXTHZn/wM30/+DPYmtje10OBPyG05M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=rhRz459Q3Y5Lg23VL9Nh/21GucUwrR86backKprajFRKpv4L74Tzi/dxkDiPYPU5KQx9HdPIYhoTi/W+rXgLIZ4YhnJVGcWp/uR8ey2AS1kcopRwQO5Wro+vY5Aa6wl7FT+ebROSXbV2Aq5URJbRd6k7IQaNrDwQNnjTQqreFQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QhBogjBz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QhBogjBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784578100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJmWcK7VtygAI73hXpZCkgCwblOmQljwdFQvepVqOmU=;
	b=QhBogjBzhG955lpLmfKJ492sQArz4S8pM6B08pNuetungmVYRwrpXUwjPs3ixFcZCQxRej
	2I/02ndOpwke3D14hrXrCBeXr0RAIt10uo7XoGbinh8U+WbfZeXDJ9pTmCs0MZBEs24Ml/
	e7sLgnXXXg4O+fQFluU81LLzziPC9OU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-bbsKmw0nO2mRJ-e1xJuekA-1; Mon, 20 Jul 2026 16:08:18 -0400
X-MC-Unique: bbsKmw0nO2mRJ-e1xJuekA-1
X-Mimecast-MFC-AGG-ID: bbsKmw0nO2mRJ-e1xJuekA_1784578097
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0867a75ecso100968086d6.3
        for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 13:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784578097; x=1785182897;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tJmWcK7VtygAI73hXpZCkgCwblOmQljwdFQvepVqOmU=;
        b=dNtncZYemnOWyIEZstdgUlgLBQTUZyyPXchaD8Klu33buPF7pix1RV9RE0e93FDm0u
         gstO2z+hUXkZdccoFVtYH3RWkvOkFTdFC3WT+gmf34lwY9uifSaJqMMorM1CgOgyiH4E
         yMHl8fnZ1EK6jqt1BTRxvqFm+g5CdZ6xmjyhgN3jmSwsg4UJokaG7d1XrU4nOjClhBvn
         lXzOTeQ4dowEL0lw4QVY4KT+2Z0lcQAR2QZ3H0s3UStpE8jMitRs2DhfhL1Q49IaYVOF
         nSMjdMU1l1hDafKtW88LLcNPJ7MDTSzjHUk69fn0WrbM369BP1HFd5si4ph2KGH9jOhn
         TvIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+MwH8mE60UIfOSb+qE7IxNOoLVmXphn402VFuwRXgC6kv7AYLMxVMY/OKh0vHwYnEk3HD@lists.linux.dev
X-Gm-Message-State: AOJu0YykG/wExz3w5pfhflBH8+gk2gkoc9auTggGhJ4qdn/HzNmad3XB
	XK2LxiYuEFEsEU36anaueGWdUkT8BgEQF5JNyJmG+mNokpdNIEFA65qKPWnzGdKF0uOBmiM3t+Y
	3UTaSRq+Z//BIp1fhIDAnWCbmppJiu2EV906yGYFcISEMCzHOnB7XTpU=
X-Gm-Gg: AfdE7cljK4FPqwtkzLosMKj55OnxzWzPc2yZI4YEh/d18OIBlCv1U9LyVA06RjcMf5X
	VgSVy6/0TJWXGQZegW6tccQ69McEywhtocY3tUoegptXceHHshyvOPHecK+RTo+/k2NfNQ4lSo5
	w5gzQrhs+PRWZmWEFFpERJT1Ehv5gXJD3aqyrz1KoNKOJwkAAHvIURnHidR13Y+Pj7+fNi19AAC
	ZbUbvhXWf0uMDf4wOYpZHOm4DwaS+INSHzSKV63+ZBBgwYY/BklVGC8iweiZSCTcNseNe/CRIxe
	f25T5Jtk4uaoq16DIaPz82GbwjR1xTL4+WS9xnEX2Ye8vc5Di9+XWgEJgiY7O8mxOl2LCIWCiQF
	5ESZz7nLmRk6qkQm+C/Fk/ZM0NgqO6KmPYpk=
X-Received: by 2002:a05:620a:2985:b0:915:94f7:55df with SMTP id af79cd13be357-930b3ed9e37mr1488514685a.20.1784578097378;
        Mon, 20 Jul 2026 13:08:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:915:94f7:55df with SMTP id af79cd13be357-930b3ed9e37mr1488512285a.20.1784578096959;
        Mon, 20 Jul 2026 13:08:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b52e02desm954762485a.10.2026.07.20.13.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:08:15 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:08:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Marvell PXA1908 SOC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: mmp: allow COMPILE_TEST builds
Message-ID: <al6ALM2eIWots1Zr@redhat.com>
References: <20260719214349.734351-1-rosenp@gmail.com>
 <YBsaITDCQyaUWFnnWTe4Fw@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YBsaITDCQyaUWFnnWTe4Fw@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sasexKmejcl0K1wbbaFpSjH0EWYTOB3q_k-dvz0-GkQ_1784578097
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Duje,

On Mon, Jul 20, 2026 at 04:46:40PM +0200, Duje Mihanović wrote:
> On Sunday, 19 July 2026 23:43:49 Central European Summer Time Rosen Penev 
> wrote:
> 
> [...]
> 
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index 4b2c089f46a1..8383f9f1da51 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -130,7 +130,7 @@ obj-y					+= 
> mediatek/
> >  obj-$(CONFIG_ARCH_MESON)		+= meson/
> >  obj-y					+= microchip/
> >  ifeq ($(CONFIG_COMMON_CLK), y)
> > -obj-$(CONFIG_ARCH_MMP)			+= mmp/
> > +obj-$(CONFIG_COMMON_CLK_MMP)		+= mmp/
> 
> Could it be possible to select mmp unconditionally, like most of the other 
> subtrees are? AFAICT, that would also require creating new Kconfig symbols for 
> the PXA168, PXA910 and PXA1928 clocks, but I suspect it may be the more proper 
> choice in the long term.

Just by sheer numbers, the CONFIG_COMMON_CLK_XXX approach is the most
common use case right now.

    x1:~/src/linux/linux-next ((next-20260720) %)$ grep "CONFIG_COMMON_CLK" drivers/clk/Makefile | grep "+=" | wc -l
    68
    x1:~/src/linux/linux-next ((next-20260720) %)$ grep "obj-y" drivers/clk/Makefile | wc -l
    25

I have no strong opinions about this either way other than to drive
consistency across various drivers as much as possible.

Currently the mmp directory currently only has COMMON_CLK_PXA1908
defined. When the other PXA* drivers are introduced, will there be a
CONFIG_COMMON_CLK_MMA_COMMON that all of the drivers will use?

If so, we could put that MMA_COMMON in the toplevel clk Makefile.

If not, then yes I agree that obj-y will be fine.

Brian

