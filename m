Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D645399
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 21:11:33 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso9215895ad.1
        for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 14:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693516293; x=1694121093; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u7dUKYliv44b3AsUkrxKZU9Dl2smVtemNsJiOsG2xZs=;
        b=Yw6AveIi2UrSm2jP0SY/5edL4vvE1Gt6T6AaEB0GMg7Y8/SILfj8GsO62mF8HSCA+A
         jpOI0OzV1Ee79SRvnj8uvMnNGMx/8tFuc7v7BjwtqAURTuY0aI3bU/0nv30sPeSi4sQX
         VTgLZC573VGrzrGZgg6zuj9Vw+CVwocVHCC2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693516293; x=1694121093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7dUKYliv44b3AsUkrxKZU9Dl2smVtemNsJiOsG2xZs=;
        b=Wk0YU6sH0QfLn7CrXr+mJlM0F9vmA/Bp2HlmCMBNs6pSoTFMD0dPxHc3teV3e/Ap+m
         p8vTmLzqnxr/DNJrHI3p+1WBstdUcSlXEP74qymytUK61BZ/VmIVH3FCpQsuWyOQVzdh
         at6q07z8A1mXuMZOSIUuzCUIC1tyOsBbeA3z+vEpJIbywbgvyMKNwRIbrHyloZeZ1CGB
         LqNQhdVI/fueAMcui5elIaGtI8NaOb887oRaeu83BqTjN+hg7ZJdL2uo4BwfHSz5v6NR
         D8ml0rAAOMacH2WIg20OTnVteYpUWGyUyr4qEEHgghoXk35uxj2tsqn+HbcTDLotyy3v
         Xd9A==
X-Gm-Message-State: AOJu0Yz/bw1qSzztkkE94C1mQIOOD3Q2RIYRRrzZ8ecsNyxbv1GdBPuH
	5SWEAxh6l9MF9cN+2h4EI5kZxw==
X-Google-Smtp-Source: AGHT+IGFhve9DdqY/FIGfRfdxXwMmLQMfU4H71C+b6tM33APIuAtiILWfwhdOy2FlXpJItVTQWPMTQ==
X-Received: by 2002:a17:903:446:b0:1c0:6dcd:4540 with SMTP id iw6-20020a170903044600b001c06dcd4540mr779696plb.32.1693516293522;
        Thu, 31 Aug 2023 14:11:33 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jg7-20020a17090326c700b001bbb1eec92esm1649265plb.281.2023.08.31.14.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 14:11:33 -0700 (PDT)
Date: Thu, 31 Aug 2023 14:11:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] x86/audit: fix -Wmissing-variable-declarations warning
 for ia32_xyz_class
Message-ID: <202308311409.F4EC8BC674@keescook>
References: <20230829-missingvardecl-audit-v1-1-34efeb7f3539@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829-missingvardecl-audit-v1-1-34efeb7f3539@google.com>

On Tue, Aug 29, 2023 at 10:33:16PM +0000, Justin Stitt wrote:
> When building x86 defconfig with Clang-18 I get the following warnings:
> | arch/x86/ia32/audit.c:6:10: warning: no previous extern declaration for non-static variable 'ia32_dir_class' [-Wmissing-variable-declarations]
> |     6 | unsigned ia32_dir_class[] = {
> | arch/x86/ia32/audit.c:11:10: warning: no previous extern declaration for non-static variable 'ia32_chattr_class' [-Wmissing-variable-declarations]
> |    11 | unsigned ia32_chattr_class[] = {
> | arch/x86/ia32/audit.c:16:10: warning: no previous extern declaration for non-static variable 'ia32_write_class' [-Wmissing-variable-declarations]
> |    16 | unsigned ia32_write_class[] = {
> | arch/x86/ia32/audit.c:21:10: warning: no previous extern declaration for non-static variable 'ia32_read_class' [-Wmissing-variable-declarations]
> |    21 | unsigned ia32_read_class[] = {
> | arch/x86/ia32/audit.c:26:10: warning: no previous extern declaration for non-static variable 'ia32_signal_class' [-Wmissing-variable-declarations]
> |    26 | unsigned ia32_signal_class[] = {
> 
> These warnings occur due to their respective extern declarations being
> scoped inside of audit_classes_init as well as only being enabled with
> `CONFIG_IA32_EMULATION=y`:
> | static int __init audit_classes_init(void)
> | {
> | #ifdef CONFIG_IA32_EMULATION
> | 	extern __u32 ia32_dir_class[];
> | 	extern __u32 ia32_write_class[];
> | 	extern __u32 ia32_read_class[];
> | 	extern __u32 ia32_chattr_class[];
> | 	audit_register_class(AUDIT_CLASS_WRITE_32, ia32_write_class);
> | 	audit_register_class(AUDIT_CLASS_READ_32, ia32_read_class);
> | 	audit_register_class(AUDIT_CLASS_DIR_WRITE_32, ia32_dir_class);
> | 	audit_register_class(AUDIT_CLASS_CHATTR_32, ia32_chattr_class);
> | #endif
> | 	audit_register_class(AUDIT_CLASS_WRITE, write_class);
> | 	audit_register_class(AUDIT_CLASS_READ, read_class);
> | 	audit_register_class(AUDIT_CLASS_DIR_WRITE, dir_class);
> | 	audit_register_class(AUDIT_CLASS_CHATTR, chattr_class);
> | 	return 0;
> | }
> 
> Lift the extern declarations to their own header and resolve scoping
> issues (and thus fix the warnings).
> 
> Moreover, change __u32 to unsigned so that we match the definitions:
> | unsigned ia32_dir_class[] = {
> | #include <asm-generic/audit_dir_write.h>
> | ~0U
> | };
> |
> | unsigned ia32_chattr_class[] = {
> | #include <asm-generic/audit_change_attr.h>
> | ~0U
> | };
> | ...

I would expect checkpatch to warn about bare "unsigned", which is frown
on these days. :) I think __u32 should be fine here...? (Why is it __u32
instead of u32, btw?)

But otherwise, yes, looks good.

-Kees

-- 
Kees Cook
