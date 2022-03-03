Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81A12F21
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 17:36:10 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d187so5256356pfa.10
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 09:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m49HXKF0F88za89DDUNBzZqjeQUKTQDxFAN3KGV8CrQ=;
        b=mJ/4bsiv43dxbeH6zxLDy6LqGPqC3mQX1HTWpqM3WvEpSUfBRYfcpNRIvcP+AMdobO
         WGdbWaFSyi+1Q5MosqZL4xnNGqnfULwGrCI2EQDlNewyCh4IKR4hMEGV/eaDl8Gq4d00
         5avLZixY66m/uG9aZxkZpZqd0gBnVqekfj2J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m49HXKF0F88za89DDUNBzZqjeQUKTQDxFAN3KGV8CrQ=;
        b=ZYYraQDajJYNmODAOvTXbxBqmXRdE53Pox4B8ie2SC5miwe2q8395xzOvxDJemU9LM
         uFWT5nbeb4W3bl9CxApqV9c7XvyR72G8FnCKKMfSzBmRim5Z+gZJ1AGgvvqIVO1/9ga1
         FQwxwR8aWL67UTXCaOLT7uLVNHfYJVuVbYLLXn0FuokV7SuIW+Y6ijYbIyThvGBeWEqQ
         6v7pN5lSGwY29L6G9CpzwZ7ZE/gQqBCLkyfd8TAsgSTrvfEc6ok+nbF6pkvKSH1Pt8yG
         RfrWa9vf8rDMCZPZXyAN7tvr9rje5QecBmMP+rsIJ+c1T+desFqEGCIzVEe1ndUhzx4d
         YEZg==
X-Gm-Message-State: AOAM532Pt5fQAzDldHTOR1Ecg2clH+9tOondjJKQP2ucQ9JJIJG2YIHG
	wB6KY5NcXJvgssQZLsM0WLOLnw==
X-Google-Smtp-Source: ABdhPJxOK01MNavSQPVc0Od8CpqiYR746LGIZnFgGRrmxXQnMqPREGb6t6XSuGQ48OS4OReOSD6Ljw==
X-Received: by 2002:a63:1601:0:b0:372:c9d1:ea94 with SMTP id w1-20020a631601000000b00372c9d1ea94mr31232207pgl.520.1646328970056;
        Thu, 03 Mar 2022 09:36:10 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q11-20020a63f94b000000b00373c5319642sm2537118pgk.93.2022.03.03.09.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 09:36:09 -0800 (PST)
Date: Thu, 3 Mar 2022 09:36:08 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev,
	lkft-triage@lists.linaro.org,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [next] mips: clang-14-defconfig build regression
Message-ID: <202203030934.5CA7A132C0@keescook>
References: <CA+G9fYs3GavpYh6V_yTUGNbAU70mygVxBKvqoq=xh20pw1Wvow@mail.gmail.com>
 <YiD1UruDryIyZAJc@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiD1UruDryIyZAJc@dev-arch.thelio-3990X>

On Thu, Mar 03, 2022 at 10:05:22AM -0700, Nathan Chancellor wrote:
> Hi Naresh,
> 
> On Thu, Mar 03, 2022 at 09:09:56AM +0530, Naresh Kamboju wrote:
> > [Please ignore this email if it is already reported]
> > 
> > Linux next-20220302 mips builds failed [1] & [2].
> > 
> > Regressions found on mips:
> > 
> >   - mips-clang-12-defconfig
> >   - mips-clang-13-allnoconfig
> >   - mips-clang-12-allnoconfig
> >   - mips-clang-12-tinyconfig
> >   - mips-clang-13-defconfig
> >   - mips-clang-11-tinyconfig
> >   - mips-clang-11-defconfig
> >   - mips-clang-nightly-allnoconfig
> >   - mips-clang-14-tinyconfig
> >   - mips-clang-14-defconfig
> >   - mips-clang-11-allnoconfig
> >   - mips-clang-nightly-tinyconfig
> >   - mips-clang-13-tinyconfig
> >   - mips-clang-nightly-defconfig
> >   - mips-clang-14-allnoconfig
> > 
> > make --silent --keep-going --jobs=8
> > O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
> > ARCH=mips CROSS_COMPILE=mips-linux-gnu- 'HOSTCC=sccache clang'
> > 'CC=sccache clang' defconfig
> 
> <snip>
> 
> > fatal error: error in backend: Invalid register name global variable
> 
> Thanks a lot for the report! Our CI caught this as well, I have filed an
> issue on our tracker and the upstream LLVM one:
> 
> https://github.com/ClangBuiltLinux/linux/issues/1608
> https://github.com/llvm/llvm-project/issues/54174
> 
> CC Kees, just as an FYI because of commit 200ed341b864 ("mips: Implement
> "current_stack_pointer"").

Oh! That's surprising. Thanks for digging out the details. The comment
in the code is amusing:

Register
MipsTargetLowering::getRegisterByName(const char *RegName, LLT VT,
                                      const MachineFunction &MF) const {
  // Named registers is expected to be fairly rare. For now, just support $28
  // since the linux kernel uses it.


Anyway, I guess I'll need to send a fix to make this compiler-version
dependent...

-- 
Kees Cook
