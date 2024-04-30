Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77019537E4
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714499319; cv=none; b=GETRNxSfFSVIH3bWkpsuE4WKo2bL+98IeqZgVJUEmRhh1IcxOlloAo5xe7BjpRj7dwxHIC+2RrSzNMS+LaWebetO3M2moG73Hhd6/Ys9mTwngfw9dQHVkuKPvFFWH3FIkQZmyQlFC9OvNzBSgTnBR5plBMtwpp4apcAsNCV4noc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714499319; c=relaxed/simple;
	bh=ru2MPyzMZQzjMduhv2N2UQ/9xbQn6QLmgfDKm1rsklI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcBLSO/A/cIsrXqW93nYKICativuvLX21y+rAJHh8dccS2/xXuYLYo9SPeWMkdbI41EzWn2ga85Q4QgngHQqmoznsW95WX83ySKRHauoy6XhnmtAc2R1ccGNZhwdUHOVMkGIrrTK9dwa69fRpYu4KOEMWmXoFKVDUL6MZa9QGaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XlprMmmV; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XlprMmmV"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5aa28cde736so3921640eaf.1
        for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 10:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714499317; x=1715104117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PDq8d+gYPhH6UpCrQkijKEWZF+TRlH556m+C6sytk2c=;
        b=XlprMmmVtu+epabCQPduevp+E1ef76WjnGodoUxOl2OKkNIumvMm09j1xJAX9IQi5C
         E/auW4+nInaJ7HxztHDqsJy/hg7bOsdvqp5yLssCohW3WhrbOp0wADwto468NlBKUYXP
         zTrtGux41iTFR3p2AchrHiFpvZVNyW2ssctz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714499317; x=1715104117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDq8d+gYPhH6UpCrQkijKEWZF+TRlH556m+C6sytk2c=;
        b=CP++UUBpuliQrNrPGNi0BZMks1QopYCejJbhmtj/D9bX4aADMgPHsvNsalLCtWfqoO
         nAXh9dt4w1+6qWSeXuIY/OFtH0qZhCf2DJhpBnQhRyF3tfEk8980M7/8Y5ATAG2m/eby
         n28Vc87jyO5QljH2CfELW88zfJy4VhSBmMEzsVBMKOvwc9HcW4tQYNLmJwsLb4Cpl0rI
         5J7s+yTbcSs8mg5ixarPlc0++eOeaeywMdpvdLebdB06M2c/weA5KzVtHjXTficv1By7
         uNlvp/43HtEQAsOdS8A3qa6hQjAmPu32FWRIlSD+EmHe4lrgrpuBoOYZMDeJuJL/FFXk
         XbpA==
X-Forwarded-Encrypted: i=1; AJvYcCVwEv9IUO1iiZHdbZqC1+3ghZkvHyuhLO/2rGrm+YoQg+OP60N/0BWFgkqcuiDsKuxbg1q4WOBCaVZH4sy5xq8j9rXJbg==
X-Gm-Message-State: AOJu0Yy/aWDIwsUlCIMvsKKGnXeUEbmDgnhFYgWEAPmuxSccTvPy3rAG
	zWFoiEF+ZnJCZQZ7dSx2Ze/gJiNw0KnCR4yar6aRJ1hSc2L0Km0rRdkHf75Cfg==
X-Google-Smtp-Source: AGHT+IEmbtVwIHw8WS21DEFm3vZJtcsGN62O+K99Z6mISqTw/HC8GJbY1ZGTCLogwTQdWEB73IJAOg==
X-Received: by 2002:a05:6218:2616:b0:186:5c1:1dd1 with SMTP id oy22-20020a056218261600b0018605c11dd1mr672678rwc.19.1714499317510;
        Tue, 30 Apr 2024 10:48:37 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l185-20020a6391c2000000b005ffd8019f01sm15483435pge.20.2024.04.30.10.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 10:48:36 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:48:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hardening: Refresh KCFI options, add some more
Message-ID: <202404301037.9E34D4811@keescook>
References: <20240426222940.work.884-kees@kernel.org>
 <20240430092140.GE40213@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430092140.GE40213@noisy.programming.kicks-ass.net>

On Tue, Apr 30, 2024 at 11:21:40AM +0200, Peter Zijlstra wrote:
> On Fri, Apr 26, 2024 at 03:29:44PM -0700, Kees Cook wrote:
> 
> > - CONFIG_CFI_CLANG=y for x86 and arm64. (And disable FINEIBT since
> >   it isn't as secure as straight KCFI.)
> 
> Oi ?

Same objection I always had[1]: moving the check into the destination
means attacks with control over executable memory contents can just omit
the check.

But now that I went to go look I see 0c3e806ec0f9 ("x86/cfi: Add boot
time hash randomization") is only enabled under FINEIBT... seems better
if that were always enabled...

-Kees

[1] https://lore.kernel.org/all/202210181020.79AF7F7@keescook/


-- 
Kees Cook
