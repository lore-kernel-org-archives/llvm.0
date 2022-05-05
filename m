Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E3F2568
	for <llvm@lists.linux.dev>; Thu,  5 May 2022 16:25:40 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id w5-20020a17090aaf8500b001d74c754128so8491253pjq.0
        for <llvm@lists.linux.dev>; Thu, 05 May 2022 09:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AMszwqVGUUkRlqT3bH9KZgvoJEDUJqYcdmFvwR43CTQ=;
        b=nqkUAGbObnsBEq0E+RdFzEBv9xuAOfg+/oONK+DfcjkFJ+Lqbk1Lxsyuf4E2dI9W0p
         wL4xpitBmfFa56MgN1186scmSSm3YB/7qrUEctUAW/Fk6aTk2AAkifz9WkeNpn+XaQUH
         SdP5hM0JRdmsjkaCO7o5uz9TiBKRdlWD+/Djg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AMszwqVGUUkRlqT3bH9KZgvoJEDUJqYcdmFvwR43CTQ=;
        b=czuL1bv9kAd2dVhpgk71b1BtMILU+U534Cz7/Vf/oZcV6ssROHHPx847GqMf1z+CpC
         Hb/OPQR7o+Wk4oor2MOYHrj8AmRI+8USYZZtYNE/JzDGDpKFPcHFjLEbnmM4nj7jdzIT
         iH7I1kEbRQ/VPFP8QGkU/vBMe/5x+F8odT1ia1qeqhz+UAUxO3QHatCCrT3mkeJvhB1u
         ySQhgY78/4AC/DD/7SoohrkY+l2SXvafHIDRLYXNoa+40g/0wEBl2NoYxkkOSnDeBSmQ
         la4DXFSAWUZ2qdZgy10sF+o8mVj9mFcoqPFbc220cV865pOrQmTXemNnzAHimRCw6TvM
         TvFw==
X-Gm-Message-State: AOAM531D5dgd4HkZ64QV1HziefGnnHBYBmcfCusBdtrjfn96KyENPHuh
	0te27QFL+qYUKj3MpQz+vsyJLg==
X-Google-Smtp-Source: ABdhPJx6wPVrYHxsa68KRgQKpBYm+86c0ZSHTSAAubzPSZ9HEe2FvIzxPyT8mlJ1clOyQ1w2FcrXkQ==
X-Received: by 2002:a17:903:2312:b0:15e:a6c8:a313 with SMTP id d18-20020a170903231200b0015ea6c8a313mr20672636plh.122.1651767940456;
        Thu, 05 May 2022 09:25:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c23-20020a170902849700b0015e8d4eb287sm1749040plo.209.2022.05.05.09.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 09:25:40 -0700 (PDT)
Date: Thu, 5 May 2022 09:25:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: [kees:for-next/kspp 21/25] drivers/misc/lkdtm/stackleak.c:17:39:
 error: call to undeclared function 'stackleak_task_low_bound'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202205050924.7D219E774@keescook>
References: <202205050943.HDgeO9iV-lkp@intel.com>
 <YnPG8dGulGqxMHt6@FVFF77S0Q05N.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnPG8dGulGqxMHt6@FVFF77S0Q05N.cambridge.arm.com>

On Thu, May 05, 2022 at 01:45:37PM +0100, Mark Rutland wrote:
> Hi Kees,
> 
> I hadn't realised the LKDTM STACKLEAK test could be built with
> CONFIG_STACKLEAK=n, and my rework of that depends upon helpers that only exist
> when CONFIG_STACKLEAK=y.
> 
> IMO the test is nonsensical for CONFIG_STACKLEAK=n, and I reckon we should
> either:
> 
> a) Not build the stackleak test at all when CONFIG_STACKLEAK=n
> 
> b) Have a small stub that just logs that CONFIG_STACKLEAK=n and the test is
>    being skipped.
> 
> Do you have any preference between the two?

Since it's looking for a specific poison, it doesn't make sense to look
for this property as magically appearing (where as this kind of thing
sometimes exists for other tests: did the hypervisor block it instead of
the kernel, etc)

So, yeah, I'd wrap it in an ifdef with an else: XFAIL.

-- 
Kees Cook
