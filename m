Received: from out187-4.us.a.mail.aliyun.com (out187-4.us.a.mail.aliyun.com [47.90.187.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A381376
	for <llvm@lists.linux.dev>; Fri,  5 May 2023 03:10:20 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R461e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047188;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---.SYe4zj5_1683256196;
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com fp:SMTPD_---.SYe4zj5_1683256196)
          by smtp.aliyun-inc.com;
          Fri, 05 May 2023 11:09:57 +0800
Date: Fri, 05 May 2023 11:09:56 +0800
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: Juergen Gross <jgross@suse.com>
Cc:  <linux-kernel@vger.kernel.org>,
  "Thomas Garnier" <thgarnie@chromium.org>,
  "Lai Jiangshan" <jiangshan.ljs@antgroup.com>,
  "Kees Cook" <keescook@chromium.org>,
  "Brian Gerst" <brgerst@gmail.com>,
  "Thomas Gleixner" <tglx@linutronix.de>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Borislav Petkov" <bp@alien8.de>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
   <x86@kernel.org>,
  "H. Peter Anvin" <hpa@zytor.com>,
  "Andy Lutomirski" <luto@kernel.org>,
  "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
  "Darren Hart" <dvhart@infradead.org>,
  "Andy Shevchenko" <andy@infradead.org>,
  "Nathan Chancellor" <nathan@kernel.org>,
  "Nick Desaulniers" <ndesaulniers@google.com>,
  "Tom Rix" <trix@redhat.com>,
  "Peter Zijlstra" <peterz@infradead.org>,
  "=?UTF-8?B?TWlrZSBSYXBvcG9ydCAoSUJNKQ==?=" <rppt@kernel.org>,
  "Ashok Raj" <ashok.raj@intel.com>,
  "Rick Edgecombe" <rick.p.edgecombe@intel.com>,
  "Catalin Marinas" <catalin.marinas@arm.com>,
  "Guo Ren" <guoren@kernel.org>,
  "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
  "Jason A. Donenfeld" <Jason@zx2c4.com>,
  "Pawan Gupta" <pawan.kumar.gupta@linux.intel.com>,
  "Kim Phillips" <kim.phillips@amd.com>,
  "David Woodhouse" <dwmw@amazon.co.uk>,
  "Josh Poimboeuf" <jpoimboe@kernel.org>,
   <xen-devel@lists.xenproject.org>,
   <platform-driver-x86@vger.kernel.org>,
   <llvm@lists.linux.dev>
Subject: Re: [PATCH RFC 16/43] x86-64: Use per-cpu stack canary if supported
 by compiler
Message-ID: <20230505030956.GA103506@k08j02272.eu95sqa>
References: <cover.1682673542.git.houwenlong.hwl@antgroup.com>
 <7cee0c83225ffd8cf8fd0065bea9348f6db3b12a.1682673543.git.houwenlong.hwl@antgroup.com>
 <edd4b974-08de-0769-0dba-f945ed06f222@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edd4b974-08de-0769-0dba-f945ed06f222@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Thu, May 04, 2023 at 12:31:59PM +0200, Juergen Gross wrote:
> On 28.04.23 11:50, Hou Wenlong wrote:
> >From: Brian Gerst <brgerst@gmail.com>
> >
> >From: Brian Gerst <brgerst@gmail.com>
> >
> >If the compiler supports it, use a standard per-cpu variable for the
> >stack protector instead of the old fixed location.  Keep the fixed
> >location code for compatibility with older compilers.
> >
> >[Hou Wenlong: Disable it on Clang, adapt new code change and adapt
> >missing GS set up path in pvh_start_xen()]
> >
> >Signed-off-by: Brian Gerst <brgerst@gmail.com>
> >Co-developed-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
> >Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
> >Cc: Thomas Garnier <thgarnie@chromium.org>
> >Cc: Lai Jiangshan <jiangshan.ljs@antgroup.com>
> >Cc: Kees Cook <keescook@chromium.org>
> >---
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
> 
> ...
> 
> >diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
> >index 643d02900fbb..09eaf59e8066 100644
> >--- a/arch/x86/xen/xen-head.S
> >+++ b/arch/x86/xen/xen-head.S
> >@@ -51,15 +51,19 @@ SYM_CODE_START(startup_xen)
> >  	leaq	(__end_init_task - PTREGS_SIZE)(%rip), %rsp
> >-	/* Set up %gs.
> >-	 *
> >-	 * The base of %gs always points to fixed_percpu_data.  If the
> >-	 * stack protector canary is enabled, it is located at %gs:40.
> >+	/*
> >+	 * Set up GS base.
> >  	 * Note that, on SMP, the boot cpu uses init data section until
> >  	 * the per cpu areas are set up.
> >  	 */
> >  	movl	$MSR_GS_BASE,%ecx
> >-	movq	$INIT_PER_CPU_VAR(fixed_percpu_data),%rax
> >+#if defined(CONFIG_STACKPROTECTOR_FIXED)
> >+	leaq	INIT_PER_CPU_VAR(fixed_percpu_data)(%rip), %rdx
> >+#elif defined(CONFIG_SMP)
> >+	movabs	$__per_cpu_load, %rdx
> 
> Shouldn't above 2 targets be %rax?
>
Ah yes, my mistake. I didn't test it on XEN guest, sorry,
I'll test XEN guest before the next submission.

Thanks.

> >+#else
> >+	xorl	%eax, %eax
> >+#endif
> >  	cdq
> >  	wrmsr
> 
> 
> Juergen

> pub  2048R/28BF132F 2014-06-02 Juergen Gross <jg@pfupf.net>
> uid                            Juergen Gross <jgross@suse.com>
> uid                            Juergen Gross <jgross@novell.com>
> uid                            Juergen Gross <jgross@suse.de>
> sub  2048R/16375B53 2014-06-02




