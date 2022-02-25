Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE7410EF
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 00:35:53 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 75so3186167pgb.4
        for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 16:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t9WDGudgTxtENWYDPYTPFz27xdCIdzpF9PzSXLCu+HE=;
        b=nSdm1jF9UdfebBvADyqxpuC4Jir5BHroQmt0KoeK0N4eBfTFJPgN8sIu0y5MLvLMVL
         TXKslUxZATYNHDr8g2iO63sCb1WQ0ZSzkWcQQX7j0nm3NtaWT65aF/iWLwtrl2Xi6OZa
         94XZqUC4HyZarX0oc8WH5ZJBC7aG27LxapJ2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t9WDGudgTxtENWYDPYTPFz27xdCIdzpF9PzSXLCu+HE=;
        b=6mi+AsbVhIuDJ3+YUrh/nNVv/3MoaqD8Dh2PV2VAkixJMBajBjUNUy+som/XFjBKeD
         XCUORKXjGEwU9TieVFCXKbPHMQMWGS1kEURuUK47kknXTxewmPMGm9oTYH3JSTCZhFWY
         n5VcJWEKFbiXjPnEwkPPX+inawpKBpbDjkC4pjMr1PYUk+6CaGuVx2SNEM4pjoSrAEUy
         KzxQ3l9IXPv5QlGpVDgg8bX7s0Vs+Ynp1sG9JxJ4TKMv6uj5mMN8705MhHD+jhYIb0kb
         cHNL56Xd27xXEj8Gh1kMGzWiukkV7i5k/21HeOjOupxpSj3m6Y2G9egKaLjrn7i9uqul
         +PeQ==
X-Gm-Message-State: AOAM530WRPqJrVtKaEp8w4RbHNmHeSZLoI/GuqcM3TlRIBujc0TzMMr6
	1S+s1OmhBWlfYgs/7o6CTrr6yw==
X-Google-Smtp-Source: ABdhPJzXjEWUx16LXa9vXAwYPTcx43KbIK8MVynbRR4B/TS5XnP5S84RYYzkGq04XuMpnFhct0w0kQ==
X-Received: by 2002:a63:dd17:0:b0:36c:33aa:6d5f with SMTP id t23-20020a63dd17000000b0036c33aa6d5fmr4136992pgg.300.1645749353010;
        Thu, 24 Feb 2022 16:35:53 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a15-20020a637f0f000000b00372e075b2efsm622127pgd.30.2022.02.24.16.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 16:35:52 -0800 (PST)
Date: Thu, 24 Feb 2022 16:35:51 -0800
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, joao@overdrivepizza.com, hjl.tools@gmail.com,
	jpoimboe@redhat.com, andrew.cooper3@citrix.com,
	linux-kernel@vger.kernel.org, ndesaulniers@google.com,
	samitolvanen@google.com, mark.rutland@arm.com,
	alyssa.milburn@intel.com, mbenes@suse.cz, rostedt@goodmis.org,
	mhiramat@kernel.org, alexei.starovoitov@gmail.com,
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v2 05/39] x86: Base IBT bits
Message-ID: <202202241627.EEF3D5D2@keescook>
References: <20220224145138.952963315@infradead.org>
 <20220224151322.307406918@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224151322.307406918@infradead.org>

On Thu, Feb 24, 2022 at 03:51:43PM +0100, Peter Zijlstra wrote:
> Add Kconfig, Makefile and basic instruction support for x86 IBT.
> 
> XXX clang is not playing ball, probably lld being 'funny', I'm having
> problems with .plt entries appearing all over after linking.

I'll try to look into this; I know you've been chatting with Nathan
about it. Is there an open bug for it? (And any kind of reproducer
smaller than a 39 patch series we can show the linker folks?) :)

> [...]
> +config X86_KERNEL_IBT
> +	prompt "Indirect Branch Tracking"
> +	bool
> +	depends on X86_64 && CC_HAS_IBT
> +	help
> +	  Build the kernel with support for Indirect Branch Tracking, a
> +	  hardware supported CFI scheme. Any indirect call must land on

	  hardware support course-grain forward-edge Control Flow Integrity
	  protection. It enforces that all indirect calls must land on

> +	  an ENDBR instruction, as such, the compiler will litter the
> +	  code with them to make this happen.

"litter the code" -> "instrument the machine code".


> +
>  config X86_INTEL_MEMORY_PROTECTION_KEYS
>  	prompt "Memory Protection Keys"
>  	def_bool y
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -36,7 +36,7 @@ endif
>  
>  # How to compile the 16-bit code.  Note we always compile for -march=i386;
>  # that way we can complain to the user if the CPU is insufficient.
> -REALMODE_CFLAGS	:= -m16 -g -Os -DDISABLE_BRANCH_PROFILING \
> +REALMODE_CFLAGS	:= -m16 -g -Os -DDISABLE_BRANCH_PROFILING -D__DISABLE_EXPORTS \
>  		   -Wall -Wstrict-prototypes -march=i386 -mregparm=3 \
>  		   -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
>  		   -mno-mmx -mno-sse $(call cc-option,-fcf-protection=none)

This change seems important separately from this patch, yes? (Or at
least a specific call-out in the commit log.)

Otherwise, looks good.

-- 
Kees Cook
