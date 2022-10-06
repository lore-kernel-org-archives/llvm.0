Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DAA7F
	for <llvm@lists.linux.dev>; Thu,  6 Oct 2022 23:01:41 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id h8-20020a17090a054800b00205ccbae31eso5660144pjf.5
        for <llvm@lists.linux.dev>; Thu, 06 Oct 2022 16:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=5lHHNxEaw1N/qiNsX/rZAMgE4JCMxOihLZEqjiwD3Cw=;
        b=UHQCpECQbmOofvKvJGmZP0kvMdNgl4biR1ihxCVbMojpao1VL+iUW/hxrOsd+Gwm4o
         riePqZBQywLj53+7yV9mye0bOBGYGQCT68w3AAvYjAgcaAbzMvzFPg+7JXk10fX00EYp
         jTBHm7xM+VInwkMHzdrGhODgSo+YDOJGuPUNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=5lHHNxEaw1N/qiNsX/rZAMgE4JCMxOihLZEqjiwD3Cw=;
        b=erivpcUWxvGULvK3uvbhF0RKUw4hjlTK905l9/UTjZvZW5HJirSp22Tv/M3KGaaWdS
         zn3PUFaZbGh1N/8Si3VhgTImG+7yBlIbVy4XNTdyrA9WlYM5sYh7pWWer1tO/vGPpSci
         qVH571VLyvH9/EQifJFjXMH6+tGQ9Yp9ET4vTYlWod6bSBIqA8PEFWNqN3RIIt1g57WM
         BN+IGMm7Y+lfojXDKz032oWi1qOjJv0S/baSvLKi9ADHsx0yAMZGjBD9o9yT7AABnL2l
         dg4tIrV60Vb4kw7NmI3HlsQf9gxgfFraDwrwhpKYz9JMCvRmU59/lTyFD122AYAbVbOn
         EfrA==
X-Gm-Message-State: ACrzQf2InBmcAD1Tu5AQBR/bdqd37O9ZEdDIYAdnUnO4Xjr62fbbMmlx
	n1DnOZ2YU4Cs27JL1zPLDGe10g==
X-Google-Smtp-Source: AMsMyM5WbrKYoemcqZEbVaft4QIlTUAzKU/G+QDttz1riQII4W8oSyZcqTd/hNVbxTpH6I1LSXR/lQ==
X-Received: by 2002:a17:90b:1b06:b0:202:cce0:2148 with SMTP id nu6-20020a17090b1b0600b00202cce02148mr13141905pjb.84.1665097301152;
        Thu, 06 Oct 2022 16:01:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g29-20020aa79f1d000000b005627d995a36sm162160pfr.44.2022.10.06.16.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 16:01:40 -0700 (PDT)
Date: Thu, 6 Oct 2022 16:01:39 -0700
From: Kees Cook <keescook@chromium.org>
To: ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org, gustavoars@kernel.org,
	dlatypov@google.com, gwan-gyeong.mun@intel.com, nathan@kernel.org,
	trix@redhat.com, llvm@lists.linux.dev
Subject: Re: [PATCH v2] overflow: disable failing tests for older clang
 versions
Message-ID: <202210061600.84A665DA2B@keescook>
References: <202210061321.xSA91B7C-lkp@intel.com>
 <20221006171751.3444575-1-ndesaulniers@google.com>
 <166509712398.1833114.15283539764161050044.b4-ty@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166509712398.1833114.15283539764161050044.b4-ty@chromium.org>

On Thu, Oct 06, 2022 at 03:58:49PM -0700, Kees Cook wrote:
> On Thu, 6 Oct 2022 10:17:51 -0700, Nick Desaulniers wrote:
> > Building the overflow kunit tests with clang-11 fails with:
> > 
> > $ ./tools/testing/kunit/kunit.py run --arch=arm --make_options LLVM=1 \
> > overflow
> > ...
> > ld.lld: error: undefined symbol: __mulodi4
> > ...
> > 
> > [...]
> 
> Applied to for-next/hardening, thanks!
> 
> [1/1] overflow: disable failing tests for older clang versions
>       https://git.kernel.org/kees/c/2d4df670c64c

I sent a follow-up that refactor this -- I realized I actually wanted to
see "skips" instead of just having the test go missing.

-- 
Kees Cook
