Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E941BDED
	for <llvm@lists.linux.dev>; Fri, 13 Oct 2023 17:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jj+Awj16"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6b5af4662b7so476826b3a.3
        for <llvm@lists.linux.dev>; Fri, 13 Oct 2023 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697217461; x=1697822261; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mMVyDqu7F9L/NyUu216jVo0D3sCma51x1zVdF7INqlA=;
        b=Jj+Awj16xkbJRKFKSvCqewPGazmT9V8koFd3K+B/DU50JODfGiWekVzX3vkhyrpVEI
         uaHf68RM0xUpvz2GFHBUEdaWthhrrDgYkZ04z6RQXnZGWtH1QSCVPK2gf/r4HZloDRhT
         P2J5aIeMZqc1a82v5szQZwqidzWUCL/TBEUvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697217461; x=1697822261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMVyDqu7F9L/NyUu216jVo0D3sCma51x1zVdF7INqlA=;
        b=xEPyY4FhNLRjw3mHo37LCet6GR30BdMnpyFrsOhdVglcrcoAI+2omb54RadR8miqU2
         N7qNZUfR4e8pqSopErt9KR4H1xxQ0W0QlWkaq4SQ1o1ynArMwmtXaMtCdW3FyS4gPttz
         WW/bPZz2dN5ePtd0sxxUGE1UTvdvBrnc8+jzqrXMZljn/xDCQUVeM/xwe0oysjwlnKmE
         sU6VWUhfFONfukGMd8UP3qaNhEU/2EwqAL0YfdD6B4zpnhuBnRFxZSO3SwdfKzGjtN7v
         XRtY6MmmUo8mfI6WKvNvNRTYq5wQxwzIpN091vwf1ryV44QDGRbhRz8zGYsqiDvl+CFc
         1Sqw==
X-Gm-Message-State: AOJu0YzSBUVPPB54btt3A+lSbsSVVC3H1Qs6CRxCEc2dmkDUpGR3vCoL
	9WyulrtzebjqkLcAFSnBRKMbFA==
X-Google-Smtp-Source: AGHT+IFytYUTIBC8FW/Qxus4CgszolDPefICHjGeUN23FkbYqR9m1jil8+cGojt47ylSx+iJiYgSLQ==
X-Received: by 2002:a05:6a00:4188:b0:6ad:535e:6ed9 with SMTP id ca8-20020a056a00418800b006ad535e6ed9mr5463978pfb.16.1697217461415;
        Fri, 13 Oct 2023 10:17:41 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h26-20020a056a00001a00b0064fd4a6b306sm1268545pfk.76.2023.10.13.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 10:17:40 -0700 (PDT)
Date: Fri, 13 Oct 2023 10:17:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Samuel Zeter <samuelzeter@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RESEND PATCH v2 0/2] *** Fix reformat_objdump.awk ***
Message-ID: <202310131013.DF45B0A82D@keescook>
References: <20221112090418.284656-1-samuelzeter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221112090418.284656-1-samuelzeter@gmail.com>

*thread necromancy*

These patches still apply and are still needed to correctly process
objdump output. It accidentally doesn't produce any errors currently,
but manual inspection shows mangled results.

Can an x86 maintainer take these two patches please? I can carry them if
that's preferred?

Note that there is an older Ack from Masami:

https://lore.kernel.org/all/20220107205259.e66ff1bd90ac218611bf1178@kernel.org/

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

And I've now reviewed and tested this too:

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Kees Cook <keescook@chromium.org>

Thanks!

-Kees

On Sat, Nov 12, 2022 at 07:04:15PM +1000, Samuel Zeter wrote:
> These are two small patches which originally dealt with
> the problem found at:
> 
> https://github.com/ClangBuiltLinux/linux/issues/1364
> 
> The original steps to reproduce were:
> $ make -skj"$(nproc)" LLVM=1 LLVM_IAS=1 defconfig
> $ scripts/config -e X86_DECODER_SELFTEST
> $ make -skj"$(nproc)" LLVM=1 LLVM_IAS=1 olddefconfig bzImage
> 
> Which resulted in the error:
> arch/x86/tools/insn_decoder_test: warning: objdump says 0 bytes, but
> insn_get_length() says 2
> 
> Upon inspection it turned out llvm-objdump was formatting its
> output differently, which caused objdump_reformat.awk to incorrectly
> output its values.
> 
> After fixing that bug, a second one was seen where the instruction
> "wait" was incorrectly matched with "fwait", which again caused
> insn_decoder_test to fail.
> 
> Samuel Zeter (2):
>   arch/x86/tools/objdump_reformat.awk: Ensure regex matches fwait
>   arch/x86/tools/objdump_reformat.awk: Allow for spaces
> 
>  arch/x86/tools/objdump_reformat.awk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 151297128990b4b44be8d70b983053831fa857f6
> -- 
> 2.38.1
> 

-- 
Kees Cook
