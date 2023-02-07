Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D337566E
	for <llvm@lists.linux.dev>; Tue,  7 Feb 2023 16:46:06 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so13605265wmb.4
        for <llvm@lists.linux.dev>; Tue, 07 Feb 2023 08:46:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=organization:user-agent:in-reply-to:content-disposition
         :mime-version:references:mail-followup-to:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFe7KbGPSeSiCrhFu3zhIymixh3OVejotXYjmmT4LpA=;
        b=s7x8TXi4V4ID51dl/frB6dThlYp2OkJNdKjp0SS8/yJGQp1QWomdHFF8hnOfGHQ9yx
         pz+7DB2ax0LCexrMS8v97pbJmJzjve/M11LE4drusejwBYljk1tNda4112BisX04p5Ly
         RqG7IbAnG6Yvd/4Mj/xGqLrE5viVtfyrcXoLDiznaSylmEa+bdYXsbUNpaIe1SyAr4LU
         J/nNvP/XsNwTOX+ZkHs567QSf24VIn0Z0I7xdBnAlH+aWxKTQpj664otf7MfYy0YMe10
         62+Sg3ymSLYCfYKxm797irw2OvMbvoF2taUyir9U1za+w/L0X6+qJLWF+r9+O8Ee+DoQ
         tbLw==
X-Gm-Message-State: AO0yUKVo8Ma+vO0qsv44wyT4k70np5/dEQL0lg2KR/VYNREAcsXKj72W
	OBcB9qZ7XJUyYxTyx5w/DfOpMQ==
X-Google-Smtp-Source: AK7set8IQRTQ5/BGaLtaTu+sYMcnNDZr8Z6VT4BBBa0DxPnIF8+SzZ7cxDlQ5DGsPVF0zKnkYP9LnQ==
X-Received: by 2002:a05:600c:4b1b:b0:3d9:f836:3728 with SMTP id i27-20020a05600c4b1b00b003d9f8363728mr3707950wmp.11.1675788364490;
        Tue, 07 Feb 2023 08:46:04 -0800 (PST)
Received: from fedora (p549440c4.dip0.t-ipconnect.de. [84.148.64.196])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600c198800b003dff870ce0esm9043123wmq.2.2023.02.07.08.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 08:46:04 -0800 (PST)
Date: Tue, 7 Feb 2023 17:45:59 +0100
From: Damian Tometzki <dtometzki@fedoraproject.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/vdso: Fake 32bit VDSO build on 64bit compile for
 vgetcpu.
Message-ID: <Y+KAR/Jxz4U30qST@fedora>
Reply-To: Damian Tometzki <dtometzki@fedoraproject.org>
Mail-Followup-To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
References: <202302071338.m7nBGR5i-lkp@intel.com>
 <Y+IsCWQdXEr8d9Vy@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+IsCWQdXEr8d9Vy@linutronix.de>
User-Agent: Mutt
Organization: Familie Tometzki

Hello Sebastian,
Linux Kernel build 6.2.0rc7 was successfully with clang-17.

Many Thanks
Damian Tometzki


On Tue, 07. Feb 11:46, Sebastian Andrzej Siewior wrote:
> The 64bit register constrains in __arch_hweight64() can not be
> fulfilled in a 32bit build. The function is only declared, not used
> within vclock_gettime.c and gcc does not care. LLVM complains and
> aborts.
> 
> Move the "fake a 32 bit kernel configuration" bits from vclock_gettime.c
> into a common header file. Use this from vclock_gettime.c and vgetcpu.c.
> 
> Fixes: 92d33063c081a ("x86/vdso: Provide getcpu for x86-32.")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/x86/entry/vdso/vdso32/fake_32bit_build.h | 25 +++++++++++++++++
>  arch/x86/entry/vdso/vdso32/vclock_gettime.c   | 27 +------------------
>  arch/x86/entry/vdso/vdso32/vgetcpu.c          |  1 +
>  3 files changed, 27 insertions(+), 26 deletions(-)
>  create mode 100644 arch/x86/entry/vdso/vdso32/fake_32bit_build.h
> 
> diff --git a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
> new file mode 100644
> index 0000000000000..db1b15f686e32
> --- /dev/null
> +++ b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifdef CONFIG_X86_64
> +
> +/*
> + * in case of a 32 bit VDSO for a 64 bit kernel fake a 32 bit kernel
> + * configuration
> + */
> +#undef CONFIG_64BIT
> +#undef CONFIG_X86_64
> +#undef CONFIG_COMPAT
> +#undef CONFIG_PGTABLE_LEVELS
> +#undef CONFIG_ILLEGAL_POINTER_VALUE
> +#undef CONFIG_SPARSEMEM_VMEMMAP
> +#undef CONFIG_NR_CPUS
> +#undef CONFIG_PARAVIRT_XXL
> +
> +#define CONFIG_X86_32 1
> +#define CONFIG_PGTABLE_LEVELS 2
> +#define CONFIG_PAGE_OFFSET 0
> +#define CONFIG_ILLEGAL_POINTER_VALUE 0
> +#define CONFIG_NR_CPUS 1
> +
> +#define BUILD_VDSO32_64
> +
> +#endif
> diff --git a/arch/x86/entry/vdso/vdso32/vclock_gettime.c b/arch/x86/entry/vdso/vdso32/vclock_gettime.c
> index 283ed9d004267..86981decfea83 100644
> --- a/arch/x86/entry/vdso/vdso32/vclock_gettime.c
> +++ b/arch/x86/entry/vdso/vdso32/vclock_gettime.c
> @@ -1,29 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #define BUILD_VDSO32
> -
> -#ifdef CONFIG_X86_64
> -
> -/*
> - * in case of a 32 bit VDSO for a 64 bit kernel fake a 32 bit kernel
> - * configuration
> - */
> -#undef CONFIG_64BIT
> -#undef CONFIG_X86_64
> -#undef CONFIG_COMPAT
> -#undef CONFIG_PGTABLE_LEVELS
> -#undef CONFIG_ILLEGAL_POINTER_VALUE
> -#undef CONFIG_SPARSEMEM_VMEMMAP
> -#undef CONFIG_NR_CPUS
> -#undef CONFIG_PARAVIRT_XXL
> -
> -#define CONFIG_X86_32 1
> -#define CONFIG_PGTABLE_LEVELS 2
> -#define CONFIG_PAGE_OFFSET 0
> -#define CONFIG_ILLEGAL_POINTER_VALUE 0
> -#define CONFIG_NR_CPUS 1
> -
> -#define BUILD_VDSO32_64
> -
> -#endif
> -
> +#include "fake_32bit_build.h"
>  #include "../vclock_gettime.c"
> diff --git a/arch/x86/entry/vdso/vdso32/vgetcpu.c b/arch/x86/entry/vdso/vdso32/vgetcpu.c
> index b777f84ffae9b..3a9791f5e9989 100644
> --- a/arch/x86/entry/vdso/vdso32/vgetcpu.c
> +++ b/arch/x86/entry/vdso/vdso32/vgetcpu.c
> @@ -1,2 +1,3 @@
>  // SPDX-License-Identifier: GPL-2.0
> +#include "fake_32bit_build.h"
>  #include "../vgetcpu.c"
> -- 
> 2.39.1
> 
