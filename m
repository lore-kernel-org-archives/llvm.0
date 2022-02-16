Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1AC1844
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 01:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F12EC340EB;
	Wed, 16 Feb 2022 01:46:58 +0000 (UTC)
Date: Tue, 15 Feb 2022 20:46:57 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, Nick Desaulniers
 <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [RFC PATCH kernel] trace: Make FTRACE_MCOUNT_USE_RECORDMCOUNT
 configurable
Message-ID: <20220215204657.4a7e4784@gandalf.local.home>
In-Reply-To: <8b1d0d57-0bf7-8ca5-8b08-cd5a12f7666f@ozlabs.ru>
References: <20220211014313.1790140-1-aik@ozlabs.ru>
	<20220211214722.4373ca83@rorschach.local.home>
	<8b1d0d57-0bf7-8ca5-8b08-cd5a12f7666f@ozlabs.ru>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Feb 2022 12:19:14 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> On 2/12/22 13:47, Steven Rostedt wrote:
> > On Fri, 11 Feb 2022 12:43:13 +1100
> > Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> >   
> >> For whatever reason LLVM does not allow LTO (Link Time Optimization) if
> >> FTRACE_MCOUNT_USE_RECORDMCOUNT is enabled.
> >>
> >> This allows disabling just this option instead of disabling all FTRACE
> >> options.  
> > 
> > What FTRACE options are you talking about?  
> 
> LTO_CLANG_THIN => HAS_LTO_CLANG => !FTRACE_MCOUNT_USE_RECORDMCOUNT =>
> 
> FTRACE [=y] && !FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY [=n] && 
> !FTRACE_MCOUNT_USE_CC [=n] && !FTRACE_MCOUNT_USE_OBJTOOL [=n] && 
> FTRACE_MCOUNT_RECORD [=y]

So basically, turn off FUNCTION_TRACER and STACK_TRACER.

> 
> A bunch.
> 
> 
> >   
> >>
> >> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> >> ---
> >>
> >> Or disabling FTRACE is the right thing to do if HAS_LTO_CLANG=y?
> >>
> >> Came from arch/Kconfig:
> >>
> >> config HAS_LTO_CLANG
> >>          def_bool y
> >>          depends on CC_IS_CLANG && LD_IS_LLD && AS_IS_LLVM
> >>          depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
> >>          depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
> >>          depends on ARCH_SUPPORTS_LTO_CLANG
> >>          depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT  <======
> >>          depends on !KASAN || KASAN_HW_TAGS
> >>          depends on !GCOV_KERNEL
> >>
> >>
> >> ---
> >>   kernel/trace/Kconfig | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> >> index a5eb5e7fd624..87d82d2b0b0b 100644
> >> --- a/kernel/trace/Kconfig
> >> +++ b/kernel/trace/Kconfig
> >> @@ -704,7 +704,8 @@ config FTRACE_MCOUNT_USE_OBJTOOL
> >>   	depends on FTRACE_MCOUNT_RECORD
> >>   
> >>   config FTRACE_MCOUNT_USE_RECORDMCOUNT
> >> -	def_bool y
> >> +	bool "Enable FTRACE_MCOUNT_USE_RECORDMCOUNT"
> >> +	default y  
> > 
> > I don't think this does what you think it does.  
> 
> Sounds like it.
> 
> > This is not something that should be user selectable. What exactly are
> > you trying to accomplish here?  
> 
> I am trying to
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index b779603978e1..91c122224f83 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -153,6 +153,8 @@ config PPC
>          select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>          select ARCH_WANT_LD_ORPHAN_WARN
>          select ARCH_WEAK_RELEASE_ACQUIRE
> +       select ARCH_SUPPORTS_LTO_CLANG          if PPC64
> +       select ARCH_SUPPORTS_LTO_CLANG_THIN     if PPC64
> 
> 
> to get LTO working on powerpc64le with minimal change to 
> ppc64le_defconfig which has all these FTRACE_xxx enabled.

Well, you can add a dependency against FUNCTION_TRACER. As that's what
turns on the RECORD_MCOUNT, as RECORD_MCOUNT is needed by it.

-- Steve

