Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8691078F
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 19:59:14 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68706b39c4cso127686b3a.2
        for <llvm@lists.linux.dev>; Wed, 02 Aug 2023 12:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691006354; x=1691611154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/aA++90/fHCZVh7rcJAqnB4uADfByOv/2qJK2PTK8tE=;
        b=AVzmg/QvoodRNbXCaoo6UCWEOmJTDZkOPCrWOd7bjQlQCeeTdfqXGImKbUmMcbqts0
         P/zl0oxtVZrnw13aqmoicSmo+GrW8bz7RtfVM3F1J4jtovkb811JIMCaBVmWnpfSXviP
         Gw0JeczO8k98S2psQSEENSvByatX1RS6Yckh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691006354; x=1691611154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aA++90/fHCZVh7rcJAqnB4uADfByOv/2qJK2PTK8tE=;
        b=Uaa40XG3/hQu+rFlomil95cBDdz2NenAaxFT+1UjcMnoUzZMo84wpOeKtQrY7vMnvw
         QFU+CnAjH9GoejuuS1A9Bz3E7FekFOVe2dTLSIJdrhXjJ98x1az7jFXgszndAY/aWHDm
         UusXIQCaQ8tXg63ePnDEqWCQz6ZNJi73O0gr7c0UWGdYkFPBH0wQRZscw8UhSaVtCHdP
         YFRDzCw6z5Effrwxbt7o/JbgUy4VSeqV+ABOzX3d71l3q6KIgAsoL15iL9WMfwIFxTfW
         ux2c89aw6OqJ7rvfCAtsDX+F96KZFU/icOsepENJQyLhI1/raWtEXWT2bBYv2ShdEjpE
         FIbw==
X-Gm-Message-State: ABy/qLZgK6cNl1p452IYPr3X7dfMZyMre6cv8Tm9s7ITIgRqrpHKjaZd
	NgpGZjQh2vb3n9g1eFSJx1UzWA==
X-Google-Smtp-Source: APBJJlGRIRM0zaiDLPqaJbDXG+V7IHTHMlItsJinyOGJ/4TgiIKhU0mdE0RQajnU+sOFZQM9vrkuRQ==
X-Received: by 2002:a05:6a00:16c2:b0:687:570:5021 with SMTP id l2-20020a056a0016c200b0068705705021mr19158141pfc.15.1691006353941;
        Wed, 02 Aug 2023 12:59:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b9-20020aa78109000000b0064378c52398sm11403642pfi.25.2023.08.02.12.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 12:59:13 -0700 (PDT)
Date: Wed, 2 Aug 2023 12:59:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, samitolvanen@google.com,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] mISDN: Update parameter type of dsp_cmx_send()
Message-ID: <202308021255.9A6328D@keescook>
References: <20230802-fix-dsp_cmx_send-cfi-failure-v1-1-2f2e79b0178d@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802-fix-dsp_cmx_send-cfi-failure-v1-1-2f2e79b0178d@kernel.org>

On Wed, Aug 02, 2023 at 10:40:29AM -0700, Nathan Chancellor wrote:
> When booting a kernel with CONFIG_MISDN_DSP=y and CONFIG_CFI_CLANG=y,
> there is a failure when dsp_cmx_send() is called indirectly from
> call_timer_fn():
> 
>   [    0.371412] CFI failure at call_timer_fn+0x2f/0x150 (target: dsp_cmx_send+0x0/0x530; expected type: 0x92ada1e9)
> 
> The function pointer prototype that call_timer_fn() expects is
> 
>   void (*fn)(struct timer_list *)
> 
> whereas dsp_cmx_send() has a parameter type of 'void *', which causes
> the control flow integrity checks to fail because the parameter types do
> not match.
> 
> Change dsp_cmx_send()'s parameter type to be 'struct timer_list' to
> match the expected prototype. The argument is unused anyways, so this
> has no functional change, aside from avoiding the CFI failure.
> 
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202308020936.58787e6c-oliver.sang@intel.com
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I am not sure if there is an appropriate fixes tag for this, I see this
> area was modified by commit e313ac12eb13 ("mISDN: Convert timers to use
> timer_setup()") but I don't think it was the original source of the
> issue. It could also be commit cf68fffb66d6 ("add support for Clang
> CFI") but I think that just exposes the problem/makes it fatal.

Oh man. I missed one! How did I miss that one? I think "Fixes:
e313ac12eb13" is the most correct. That was the patch that went through
trying to fix all the prototypes, and _did_ fix all the _other_ prototypes
in there.

Thanks for the patch!

Reviewed-by: Kees Cook <keescook@chromium.org>

> 
> Also not sure who should take this or how soon it should go in, I'll let
> that to maintainers to figure out :)

If no one speaks up, I'll snag it, but since this got aimed at netdev, I
suspect someone may pick it up. :)

-Kees

-- 
Kees Cook
