Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB64715497
	for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 22:58:41 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b3be39e666so1544985ad.0
        for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 15:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686783521; x=1689375521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mZoi1bNKOhXBExhJOXQO6XVV9KpmpLb4lBwItpjnHWY=;
        b=ANMU/U0yEYhD1KjeGLSBIAtuTuo/Ml3KgnPppr37JJzBNonje37HRd/JpahvqLr5vH
         9D7jtvTs7u+LxcJvBSAm1jymib1LzrDm9LMawLSpOYpj3SVvphpR9CXs4F+eVfUFE+d2
         y104M8h5KpRSP+tYhybTo78cxZ3LsFezLvjbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686783521; x=1689375521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZoi1bNKOhXBExhJOXQO6XVV9KpmpLb4lBwItpjnHWY=;
        b=Ydc7PkteLFB5wPP6miyOedgZ3m88FORpE4BDXQUw4ZQR51Ve2a0ln9njfusBnUPK2N
         2qG3uHJrLPsMxbO5zHcrQlQO2ea9WmKMa0xgwrZjtXnT4d17lZz0V1Zdus5e5jnoZGeb
         ll+P99KyJ8ueNGxi1WcKYuGHvN0CLO63JY5tvbhhf8RB0mbEIitLWR86qE6OS0n0zdYC
         FqMiasVu+Gg4lSHt0B8a2+PsaDtWXTRTyr6F0zTR64ck6MGAX+dER43lB8VQ875p6J19
         5MpAhK0f2jRW/ddn8Zg6Blkwf+nuj0GH3k5CKj/KuUeNqC/ZRnVngXh2NDsW6X4KX8FI
         4yaw==
X-Gm-Message-State: AC+VfDyFLIKDkaa9PXnuOJMFQ3mO5FQauLHp+5NHN5e/+HbX93kGxi2D
	iwHRqZM+FrFgr6/iJYBfHhFmag==
X-Google-Smtp-Source: ACHHUZ6wohFkQ9WR3wFAYVoYMKv3LJuhQaDuFM/LHXBWC+CjOXeEnsyLOw57F8R/Z2i+9M28S8mV4Q==
X-Received: by 2002:a17:902:c951:b0:1a2:a904:c42e with SMTP id i17-20020a170902c95100b001a2a904c42emr4759122pla.24.1686783520999;
        Wed, 14 Jun 2023 15:58:40 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bg1-20020a1709028e8100b001b3a21fbb4fsm8910888plb.12.2023.06.14.15.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 15:58:40 -0700 (PDT)
Date: Wed, 14 Jun 2023 15:58:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [linux-next:master 3357/8413] drivers/scsi/FlashPoint.c:1712:12:
 warning: stack frame size (1056) exceeds limit (1024) in
 'FlashPoint_HandleInterrupt'
Message-ID: <202306141527.95B9960@keescook>
References: <202306100035.VTusNhm4-lkp@intel.com>
 <202306131418.35B5D649DC@keescook>
 <CAKwvOdmZ7fMB1Kpat3wbcUxaVbWmjO30MzQcytUZ=2Yj-NLmTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmZ7fMB1Kpat3wbcUxaVbWmjO30MzQcytUZ=2Yj-NLmTA@mail.gmail.com>

On Wed, Jun 14, 2023 at 04:27:46PM -0400, Nick Desaulniers wrote:
> On Tue, Jun 13, 2023 at 5:22 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Sat, Jun 10, 2023 at 12:58:23AM +0800, kernel test robot wrote:
> > > First bad commit (maybe != root cause):
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   53ab6975c12d1ad86c599a8927e8c698b144d669
> > > commit: df8fc4e934c12b906d08050d7779f292b9c5c6b5 [3357/8413] kbuild: Enable -fstrict-flex-arrays=3
> > > config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230610/202306100035.VTusNhm4-lkp@intel.com/config)
> 
> ^ I just checked this config. CONFIG_KASAN=y is not set, so this is
> not a case of
> https://github.com/ClangBuiltLinux/linux/issues/39
> 
> UBSAN is though (maybe a red herring) as well as GCOV and TSAN/KCSAN.
> 
> Disabling GCOV did not change the stack usage from allmodconfig.
> 
> Disable KCSAN dropped it down from 2272 to 2160.
> 
> Disabling UBSAN produced no warnings, and changed the inlining
> behavior such that FlashPoint_HandleInterrupt only uses 656B rather
> than 2272 via allmodconfig.
> 
> Seems specific to:
> ```
> CONFIG_UBSAN=y
> CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
> CONFIG_UBSAN_BOUNDS=y
> CONFIG_UBSAN_ARRAY_BOUNDS=y
> # CONFIG_UBSAN_SHIFT is not set
> # CONFIG_UBSAN_UNREACHABLE is not set
> # CONFIG_UBSAN_BOOL is not set
> # CONFIG_UBSAN_ENUM is not set
> CONFIG_UBSAN_SANITIZE_ALL=y
> ```
> but adding these on top of powernv_defconfig I couldn't reproduce.  So
> perhaps we can do a config bisection between allmodconfig and
> powernv_defconfig to see what combination of configs in allmodconfig
> is causing this to blow up.

I think you're missing:

CONFIG_SCSI_BUSLOGIC=y
CONFIG_SCSI_FLASHPOINT=y

Or the function doesn't get built. I'm using powernv_defconfig plus your
UBSAN configs and the 2 above:

make -j128 O=clang-ppc LLVM=1 ARCH=powerpc \
	KCFLAGS=-Rpass-analysis=stack-frame-layout \
	drivers/scsi/BusLogic.o

And I see the huge stack usage.

Having -fstrict-flex-arrays=3's seems to contribute about 200B:

Enabled:
	Offset: [SP-2032], Type: Spill, Align: 8, Size: 8
Disabled:
	Offset: [SP-1808], Type: Spill, Align: 8, Size: 8

Even just a quick check of structs, I see several that gain UBSAN_BOUNDS
coverage as a result (i.e. that have trailing arrays):

	struct sccb_mgr_tar_info
	struct nvram_info
	struct sccb_card

So everything is working "as intended" from that perspective.

Is this just the result of inlining? Some of the called functions are
short, but FPT_sres() is not and has comical indentation. If everything
got inlined into FlashPoint_HandleInterrupt() and all the array indexes
get instrumented, maybe that's it? Though I'd expect stack slot reuse
for array index instrumentation... so maybe it's similar to what is
mentioned in:
https://github.com/ClangBuiltLinux/linux/issues/39#issuecomment-1273688761

-Kees

-- 
Kees Cook
