Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728DB3201
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 20:43:06 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id 5so3140389plo.3
        for <llvm@lists.linux.dev>; Thu, 02 Feb 2023 12:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=exzm2wuPBhIQWX3E55joJefmS3F/bF9ALNvYVGgKnnI=;
        b=ex714A2Q1YLxh1ILPeVSa9eYiOCbWhxGIKP7PVd5qkRydmxQDb1IiAL/v/auB4T8WH
         TyeBQXWiqC9LriOoRr2NZTDym8anZ1FQnezXoBIo9Y6VXpv452MF2L8mFq87xzXSQ9dv
         sdjRaapW6CWRp5jOTnk2sxvMGqvNSvq5x4gLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exzm2wuPBhIQWX3E55joJefmS3F/bF9ALNvYVGgKnnI=;
        b=fA1Ww/YLQU6l2mrYKh5tOl9MD+eQ2h80ibKL7QIjvqlDXnxAaSoeScpq6exC+07OhT
         lWMPd4jgnlbItib33nrczIGGcOBy3oTO43Ce/m+5UZbMdYwJN5wdkipg5ah00m1RtSk+
         lJpVVNRlpcbkfn9weY0MdgPM2ri5CtfxThOhE6zEeNw5/8OT+2Xxka2EmRVRgdnc5SUu
         aW7YLLXC5ZWrl/nzHVrZeV9nE8l16wmi3Qg/Mx80KXHUp1cg7aWckTUDYW4n0W3c6NMz
         TQS4/rALQBcvIOIRQdgqLljin1mI2aDQP+npnEOzvCnES6L0H1JNeCEpMpuE/7/d5ECb
         BmAg==
X-Gm-Message-State: AO0yUKV+P2P6Hc3vrw6vZlL8l8SUkXvtg5xLFbPZCAEobkESxhtC+nxG
	hYmYr0R6yGOA/RWzzkVm73iLaQ==
X-Google-Smtp-Source: AK7set9GRXX3f8QjzXsIEJ0ialX9IyfrHuixWCo0DhS9txT/cacdMUVfWP6d2N76mb85HrEDMGjjvw==
X-Received: by 2002:a17:902:f608:b0:198:adc4:22a4 with SMTP id n8-20020a170902f60800b00198adc422a4mr2558868plg.31.1675370585899;
        Thu, 02 Feb 2023 12:43:05 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902a38e00b0019604f3fc3asm77929pla.265.2023.02.02.12.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 12:43:05 -0800 (PST)
Message-ID: <63dc2059.170a0220.25fcc.0394@mx.google.com>
X-Google-Original-Message-ID: <202302022041.@keescook>
Date: Thu, 2 Feb 2023 20:43:04 +0000
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, John Stultz <jstultz@google.com>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nishanth Menon <nm@ti.com>,
	Michael Kelley <mikelley@microsoft.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Won Chung <wonchung@google.com>, David Gow <davidgow@google.com>,
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH 5/6] driver core: Add __alloc_size hint to devm allocators
References: <CAMSo37W3gRkP02tSCxGX71ZDAt3WgPZrkTRTM6J1iQ4gvUS9vg@mail.gmail.com>
 <CANDhNCogJrvt=yEXFK-xVmGjkcRxSNGZUqUeNw2MV9bFRrwPdQ@mail.gmail.com>
 <63dbf04a.630a0220.2608a.0149@mx.google.com>
 <CANDhNCoJJs_jSAdr6uved=cK=-6+nzSJq3e_E3HgtiXHZXkVww@mail.gmail.com>
 <63dc0a89.170a0220.49507.0091@mx.google.com>
 <CAMj1kXHTwFH-OADZ5nZXfZyuH-x7XJL3DMyiz2Tr_nCuup+xFA@mail.gmail.com>
 <CAKwvOd=cuDb2NNK4uoUTYTLryFig47hvDQ08ta5XhjHsEhAG4A@mail.gmail.com>
 <CABCJKuc+GvTHXu-CVedZs6CvPKJ8ySrVztkP2V3dsWn70xf7hA@mail.gmail.com>
 <63dc14a2.170a0220.beb2a.0275@mx.google.com>
 <CABCJKueSasiWQvO2jZ-8KUF+c-dNgf87pR45sfHHCQMyyTvL0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABCJKueSasiWQvO2jZ-8KUF+c-dNgf87pR45sfHHCQMyyTvL0Q@mail.gmail.com>

On Thu, Feb 02, 2023 at 12:11:47PM -0800, Sami Tolvanen wrote:
> On Thu, Feb 2, 2023 at 11:53 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Feb 02, 2023 at 11:49:42AM -0800, Sami Tolvanen wrote:
> > > A quick look at Clang's source code suggests that Intrinsic::ubsantrap
> > > already accepts the handler ID (from the SanitizerHandler enum) as an
> > > argument and the arm64 LLVM back-end appears to encode the value as an
> > > immediate for the brk instruction. I didn't confirm that this actually
> > > works, but perhaps we just need to teach the kernel about the possible
> > > values?
> >
> > Oh excellent. Yeah, if that's all that's needed here that would be
> > great. What are the values?
> 
> The arm64 brk immediate encoding seems to be "ubsantrap arg | 'U' << 8":
> 
> https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AArch64/AArch64InstrInfo.td#L7571
> 
> The argument values come from the SanitizerHandler enum, which is
> populated from this list:
> 
> https://github.com/llvm/llvm-project/blob/main/clang/lib/CodeGen/CodeGenFunction.h#L113
> 
> Therefore, according to the tests, for ubsantrap(12) we'll get brk
> #0x550c, for example:
> 
> https://github.com/llvm/llvm-project/blob/main/llvm/test/CodeGen/AArch64/ubsantrap.ll

So the absolute minimal handler would look like this:

diff --git a/arch/arm64/include/asm/brk-imm.h b/arch/arm64/include/asm/brk-imm.h
index 6e000113e508..3f0f0d03268b 100644
--- a/arch/arm64/include/asm/brk-imm.h
+++ b/arch/arm64/include/asm/brk-imm.h
@@ -28,6 +28,8 @@
 #define BUG_BRK_IMM			0x800
 #define KASAN_BRK_IMM			0x900
 #define KASAN_BRK_MASK			0x0ff
+#define UBSAN_BRK_IMM			0x5500
+#define UBSAN_BRK_MASK			0x00ff
 
 #define CFI_BRK_IMM_TARGET		GENMASK(4, 0)
 #define CFI_BRK_IMM_TYPE		GENMASK(9, 5)
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 4c0caa589e12..36b917d8fa5f 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1074,6 +1074,18 @@ static struct break_hook kasan_break_hook = {
 };
 #endif
 
+#ifdef CONFIG_UBSAN_TRAP
+static int ubsan_handler(struct pt_regs *regs, unsigned long esr)
+{
+	die("Oops - UBSAN", regs, esr);
+}
+
+static struct break_hook ubsan_break_hook = {
+	.fn	= ubsan_handler,
+	.imm	= UBSAN_BRK_IMM,
+	.mask	= UBSAN_BRK_MASK,
+};
+#endif
 
 #define esr_comment(esr) ((esr) & ESR_ELx_BRK64_ISS_COMMENT_MASK)
 
@@ -1091,6 +1103,10 @@ int __init early_brk64(unsigned long addr, unsigned long esr,
 #ifdef CONFIG_KASAN_SW_TAGS
 	if ((esr_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
 		return kasan_handler(regs, esr) != DBG_HOOK_HANDLED;
+#endif
+#ifdef CONFIG_UBSAN_TRAP
+	if ((esr_comment(esr) & ~UBSAN_BRK_MASK) == UBSAN_BRK_IMM)
+		return ubsan_handler(regs, esr) != DBG_HOOK_HANDLED;
 #endif
 	return bug_handler(regs, esr) != DBG_HOOK_HANDLED;
 }
@@ -1104,6 +1120,9 @@ void __init trap_init(void)
 	register_kernel_break_hook(&fault_break_hook);
 #ifdef CONFIG_KASAN_SW_TAGS
 	register_kernel_break_hook(&kasan_break_hook);
+#endif
+#ifdef CONFIG_UBSAN_TRAP
+	register_kernel_break_hook(&ubsan_break_hook);
 #endif
 	debug_traps_init();
 }

But we could expand ubsan_handler() to extract the SanitizerHandler enum
value and report which UBSAN check was hit...

-- 
Kees Cook
