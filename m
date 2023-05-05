Received: from out187-15.us.a.mail.aliyun.com (out187-15.us.a.mail.aliyun.com [47.90.187.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD0E1841
	for <llvm@lists.linux.dev>; Fri,  5 May 2023 06:20:03 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047187;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---.SYnT2SU_1683267260;
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com fp:SMTPD_---.SYnT2SU_1683267260)
          by smtp.aliyun-inc.com;
          Fri, 05 May 2023 14:14:21 +0800
Date: Fri, 05 May 2023 14:14:20 +0800
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Brian Gerst <brgerst@gmail.com>, linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>, x86@kernel.org,
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH RFC 16/43] x86-64: Use per-cpu stack canary if supported
 by compiler
Message-ID: <20230505061420.GB103506@k08j02272.eu95sqa>
References: <cover.1682673542.git.houwenlong.hwl@antgroup.com>
 <7cee0c83225ffd8cf8fd0065bea9348f6db3b12a.1682673543.git.houwenlong.hwl@antgroup.com>
 <CAKwvOd=zgjWdg2+_bg3QByh_2hve8yoKzCfEBZ5md+k8ytkqcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=zgjWdg2+_bg3QByh_2hve8yoKzCfEBZ5md+k8ytkqcQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Tue, May 02, 2023 at 01:27:53AM +0800, Nick Desaulniers wrote:
> On Fri, Apr 28, 2023 at 2:52 AM Hou Wenlong <houwenlong.hwl@antgroup.com> wrote:
> >
> > From: Brian Gerst <brgerst@gmail.com>
> >
> > From: Brian Gerst <brgerst@gmail.com>
> >
> > If the compiler supports it, use a standard per-cpu variable for the
> > stack protector instead of the old fixed location.  Keep the fixed
> > location code for compatibility with older compilers.
> >
> > [Hou Wenlong: Disable it on Clang, adapt new code change and adapt
> > missing GS set up path in pvh_start_xen()]
> >
> > Signed-off-by: Brian Gerst <brgerst@gmail.com>
> > Co-developed-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
> > Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
> > Cc: Thomas Garnier <thgarnie@chromium.org>
> > Cc: Lai Jiangshan <jiangshan.ljs@antgroup.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > ---
> >  arch/x86/Kconfig                      | 12 ++++++++++++
> >  arch/x86/Makefile                     | 21 ++++++++++++++-------
> >  arch/x86/entry/entry_64.S             |  6 +++++-
> >  arch/x86/include/asm/processor.h      | 17 ++++++++++++-----
> >  arch/x86/include/asm/stackprotector.h | 16 +++++++---------
> >  arch/x86/kernel/asm-offsets_64.c      |  2 +-
> >  arch/x86/kernel/cpu/common.c          | 15 +++++++--------
> >  arch/x86/kernel/head_64.S             | 16 ++++++++++------
> >  arch/x86/kernel/vmlinux.lds.S         |  4 +++-
> >  arch/x86/platform/pvh/head.S          |  8 ++++++++
> >  arch/x86/xen/xen-head.S               | 14 +++++++++-----
> >  11 files changed, 88 insertions(+), 43 deletions(-)
> >
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 68e5da464b96..55cce8cdf9bd 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -410,6 +410,18 @@ config CC_HAS_SANE_STACKPROTECTOR
> >           the compiler produces broken code or if it does not let us control
> >           the segment on 32-bit kernels.
> >
> > +config CC_HAS_CUSTOMIZED_STACKPROTECTOR
> > +       bool
> > +       # Although clang supports -mstack-protector-guard-reg option, it
> > +       # would generate GOT reference for __stack_chk_guard even with
> > +       # -fno-PIE flag.
> > +       default y if (!CC_IS_CLANG && $(cc-option,-mstack-protector-guard-reg=gs))
> 
> Hi Hou,
> I've filed this bug against LLVM and will work with LLVM folks at
> Intel to resolve:
> https://github.com/llvm/llvm-project/issues/62481
> Can you please review that report and let me know here or there if I
> missed anything? Would you also mind including a link to that in the
> comments in the next version of this patch?
> 
Hi Nick,

Thanks for your help, I'll include the link in the next version.
Actually, I had post an issue on github too when I test the patch on
LLVM. But no replies. :(.
https://github.com/llvm/llvm-project/issues/60116

There is another problem I met for this patch, some unexpected code
are generated:

do_one_initcall: (init/main.o)
......
movq    __stack_chk_guard(%rip), %rax
movq    %rax,0x2b0(%rsp)

The complier generates wrong instruction, no GOT reference and gs
register. I only see it in init/main.c file. I have tried to move the
function into another file and compiled it with same cflags. It could
generate right instruction for the function in another file.

The LLVM chain toolsare built by myself:
clang version 15.0.7 (https://github.com/llvm/llvm-project.git
8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

> Less relevant issues I filed looking at some related codegen:
> https://github.com/llvm/llvm-project/issues/62482
> https://github.com/llvm/llvm-project/issues/62480
> 
> And we should probably look into:
> https://github.com/llvm/llvm-project/issues/22476
> 
>

Except for per-cpu stack canary patch, there is another issue I post on
github: https://github.com/llvm/llvm-project/issues/60096

The related patch is:
https://lore.kernel.org/lkml/175116f75c38c15d8d73a03301eab805fea13a0a.1682673543.git.houwenlong.hwl@antgroup.com/

I couldn't find the related documentation about that, hope you can help
me too.

One more problem that I didn't post is:
https://lore.kernel.org/lkml/8d6bbaf66b90cf1a8fd2c5da98f5e094b9ffcb27.1682673543.git.houwenlong.hwl@antgroup.com/

> -- 
> Thanks,
> ~Nick Desaulniers
