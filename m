Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17093234
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 22:51:04 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id u29so2377952pfg.7
        for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 15:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NmbaSnv4y5xMGTlU8ENC8ho38hjGPo6HcBQqGFgE7fg=;
        b=A6c41PYgjZELRGT1LHkHqYeqfZGz+IzMDcM/eK2CdoLx9x4Rk2I1cVR9UwITG++aDK
         0ed+4YkHiOBhJrkJtq2iPZbxc/4bTZBg9moRAgShSetICYBI4TUIAIxInHnznwo9roCM
         OCXyr2StDJzksDqqYYvaWQDgmdhuTluksYt5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NmbaSnv4y5xMGTlU8ENC8ho38hjGPo6HcBQqGFgE7fg=;
        b=MrSaqpzHQsznHsOPNlIfrwXl3uONUfiVUFJgiqwqY8zJ5gUqjjHrIzykramHBknndJ
         lAmFG6lvIReJuHMCYhWe1CEjrjQsKYNSG8qKGAe0gGCRRmiMz8OB5CdZ3CY18+F051N8
         kznk+Nqw1gI99gNVwKhxe0NGNQS9wS54LpROCXxZixoLd9k5+qpZ+Hmyh8fCOMaqApbW
         Bi2uA8uzv0E/y0lBvL/Ui+l76cLddhZmddUc2RbJ2aySeRQE4EgPr0B8z75/te+c892j
         H7wLWtxn4/dl4QPRbUPkKGdFH3bKE+c7e47Oz2twyHrUoF3EB+x9a8DAqpoJ8EUDpsHZ
         DkYg==
X-Gm-Message-State: AOAM531hOrn/YJKlXCZuYUL3ORQ0EiBEdURxv5VkL8U39I9LU3XRDLUK
	pCIkq9exPlZmniWo+W7TVac0AQ==
X-Google-Smtp-Source: ABdhPJw1WfdQgJMU5KTNCN8tOxbpMzFChkkNktUkUq6tl7GNiadTyrSzIM3Bwd/MZY5PXKg3iFO8ng==
X-Received: by 2002:a63:f34d:0:b0:399:5abe:b2e1 with SMTP id t13-20020a63f34d000000b003995abeb2e1mr4112093pgj.451.1649976664252;
        Thu, 14 Apr 2022 15:51:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id fv7-20020a17090b0e8700b001ce18c551dcsm2584285pjb.19.2022.04.14.15.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 15:51:03 -0700 (PDT)
Date: Thu, 14 Apr 2022 15:51:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Qing Zhao <qing.zhao@oracle.com>, Bill Wendling <morbo@google.com>,
	"Moreira, Joao" <joao.moreira@intel.com>,
	clang-built-linux <llvm@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	"Jose E. Marchesi" <jemarch@gnu.org>
Subject: Re: toolchain mitigations plumbers session
Message-ID: <202204141549.B1DE158@keescook>
References: <CAKwvOdniB-+F37ygZhRytBGVFjwnukyOpmoiJTCeusMdb=6_=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdniB-+F37ygZhRytBGVFjwnukyOpmoiJTCeusMdb=6_=g@mail.gmail.com>

On Thu, Apr 14, 2022 at 02:30:33PM -0700, Nick Desaulniers wrote:
> Hi Qing, Kees, and Bill,
> Jose and I are currently in the planning process to put together a
> Kernel+Toolchain microconference track at Linux Plumbers Conference
> this year (Sept 12-14) in Dublin, Ireland.
> 
> Would you all be interested in leading another session on
> kernel+toolchain collaboration for mitigations?

Yes please! With work Qing and Bill (and Sami and Joao and others) have
been doing lately, this session will have a lot of new stuff to talk
about!

> Do you plan to attend
> plumbers this year which will be in person?

Yes, my current intention is to attend plumbers in person this year.
However, I reserve the right to shake the magic covid 8-ball again as
we get closer to September. :)

-Kees

-- 
Kees Cook
