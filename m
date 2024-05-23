Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EECC128396
	for <llvm@lists.linux.dev>; Thu, 23 May 2024 23:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716505949; cv=none; b=L3wwWTLhQOGflAZjgqxA4/ANZmRQllNhzB7jbbo/Jcp4tyuHeEfsW8d3hIoPvd6HQGVZ+LVwW1Y8hVKzwBScr8/rNQkckBYd+63j6zu2e8UyUyYlKCVGEcOFqqgh0A2lUNvD+gtv9TEbkkDyE4Jt+z7FK/0pjc8n1Fckf1NZqeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716505949; c=relaxed/simple;
	bh=Pr5fclf/NyQdxEw21anVvy8WtHKkbRAUyx9Gl02m/X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4r1p86bCbbnkxc7V26t5u87l0Pc9S3gsHi1cNgki6NT61kqsuRo510UP3pZG5Vav95Dpl4An3DMm+6s0lYvBWMhbRylMsQs9qytCgKLw0HGpXWoGH5/vYnhKMw3A8b4Qvq68TolZ5QUBlDaAUPqJBM/ZSaQs2KkO1pJW8bcDaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=idxf5R5H; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="idxf5R5H"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f44b441b08so1701555ad.0
        for <llvm@lists.linux.dev>; Thu, 23 May 2024 16:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716505946; x=1717110746; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mMbC5KBXhHkDvBNusLgJck71yWRaMS5suGXHx+nBss=;
        b=idxf5R5HoqhoOhYvQmtlQT1c/Y+SW7XRYOowbtHc/ghdxwZaroPj51l1nP6C0YtiH+
         /Q0UOn2auu/z2y+OvbShDPvCWMczy0YD1zJsmzfRSKTaPlKsvb7xvYrGF9bcOrS5hjTn
         zB8RK9OS0tpQeeYWWJkNIiEqjxVYJaAPFFA8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716505946; x=1717110746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mMbC5KBXhHkDvBNusLgJck71yWRaMS5suGXHx+nBss=;
        b=H9D+jOuQ1qmIRKO3sVk0L5o7bgTKPISq5InS6CdQHnJqs8Oa2hbRHBjY1WxAQ13XEl
         50d+0iP2XA2rvTakIeizzTDx/FLuCdYt2gS4dQkOEX5qJTaxtPQSOzR43AM+P969mTkb
         gsEhZEvU64xGWDZp+c1MjBST+PdZU4uQ6A3/chJGXyeXJ4CInIUuvXlJVYX6pyxL/D4l
         VnSSAtnW7Ah4TH86zHMhcAhkm2x9S2WR5nCCDeEqKP8Zy0vTEtIkAknoTaHNy3sf11lh
         jEnhlBwJxRs+tfJDDOUWv/1DwfIApsnpoGowT/Zn6QiLfJXbwoahFayEnyoUdRBCXWdI
         5f3g==
X-Forwarded-Encrypted: i=1; AJvYcCVqBjZD1rc3Lxlg/S46xZWoW3hs/yIis9SWcGazG397mME/xLl7eh5KcJFBHxYeLElKwNvvV68qgQWUJexA2zz176MlGA==
X-Gm-Message-State: AOJu0Yxs1Xcjq5I4n4gx0TYdy/aKjQrajilLMnDiTuvCO/qHnVmBuSzz
	v+77YUO3OZY153TUxfe6q9++K3Iz2DTx9zud1yyGnKvHVS1wrhEZRdnCv+stEw==
X-Google-Smtp-Source: AGHT+IFbXrTeUCq7J46GiJ/p3IWwvb8fOgFDb0trMNcBbD+UJjL4KOevqFmzptXng6JsupSTGMLaXg==
X-Received: by 2002:a17:903:1d0:b0:1eb:73c2:6b4a with SMTP id d9443c01a7336-1f4486e5e10mr8167325ad.8.1716505946250;
        Thu, 23 May 2024 16:12:26 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9b2e88sm1125295ad.253.2024.05.23.16.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 16:12:25 -0700 (PDT)
Date: Thu, 23 May 2024 16:12:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] x86/boot: Address clang -Wimplicit-fallthrough in
 vsprintf()
Message-ID: <202405231603.2E810E3FC@keescook>
References: <20240516-x86-boot-fix-clang-implicit-fallthrough-v1-1-04dc320ca07c@kernel.org>
 <20240517095110.GAZkcojmJQoY_zU-OT@fat_crate.local>
 <20240517151833.GB3660288@thelio-3990X>
 <20240523115734.GAZk8vLgzOzD8Tv9pq@fat_crate.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523115734.GAZk8vLgzOzD8Tv9pq@fat_crate.local>

On Thu, May 23, 2024 at 01:57:34PM +0200, Borislav Petkov wrote:
> On Fri, May 17, 2024 at 08:18:33AM -0700, Nathan Chancellor wrote:
> > There was a patch to make Clang match GCC's behavior a few years ago but
> > I think Kees made a good argument that GCC's behavior leaves potential
> > bugs on the table, so that was not pursued further.
> > 
> > https://reviews.llvm.org/D91895#2417170
> 
> Really? Maybe I'm being dense but I don't see real bugs there... I see
> readability issues. :-)

There isn't a bug _here_, but this is about making the code unambiguous
everywhere in the kernel. We've already done the work to get rid of
all these warnings; this one is newly introduced, so let's get it fixed.

We don't want to have the same flow-control statement reachable from two
different "case"s where the resulting behaviors are different. Otherwise
we can't determine if a "fallthrough" is missing or intentional.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
