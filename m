Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD91C4A18
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 19:23:59 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id v10-20020a17090a634a00b00205e48cf845so1272606pjs.4
        for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 12:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Bys+g6AU0hW4pKg0x/ecVxR/rYZ0Qg+jTvtx/DxcQwE=;
        b=KnoGxcgKb0VeWxeXkDIYTarKak1vYNSDO7qW5/R04eljpGIg/0e8HjBIbg7FNDIKx2
         FRZthD0ou89mxOMItkYaYta0w9DjGI6LsKaVx7i7pHQ1DkDO/LnuyzffLYiZg56S9CiE
         msmmC8h3oOhfbjnulnroI1vY6CniOtCxwpcJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Bys+g6AU0hW4pKg0x/ecVxR/rYZ0Qg+jTvtx/DxcQwE=;
        b=lcH2c99pgJnVZlzGnma07tFKrg7J3NbPDLM2cBqxjQDKFc2uqcVnpxyBEy+Hz37y5t
         wL5DrpiUmIrWgbaJ66QqS8xBecfGFsLMp70tMoT6tQ54EUL1aAnWWYIR/WbemDWDhbid
         dhZsE5vnk8VOYwdD0b/uq4NkinDXr111NJJHW5852Djno80FPrTq2hoeumxldYwRmgFc
         1K3myr6py1f8sawDsj+zZvcE6YCyea9de6qtV/BrNKGV7dcOpcE9w9GHZVrmqU4Y/2xo
         eMz0eXWMz1Qe5TOsx1Ics/AiiHW2Eum39wWz/gBVpZbCRJc8HlV5/qTissq5pBbRzEV6
         k77w==
X-Gm-Message-State: ACrzQf1gZ0r3miHcNr87IkqoIHLKVVajSqFDfFf8EZEA+Zm7+2vdLbQl
	GREyEV7WE956FtJOYsAD+D4iOA==
X-Google-Smtp-Source: AMsMyM48SUc01nsTvTfZe/V6mOSf+RhShyC4BKrqoxRditRR7MK3A+ALMZ+Nz9C2YnpLtacseLIJIw==
X-Received: by 2002:a17:90a:fe90:b0:202:a345:b7a6 with SMTP id co16-20020a17090afe9000b00202a345b7a6mr6103501pjb.14.1664306639240;
        Tue, 27 Sep 2022 12:23:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b001754fa42065sm2009217plh.143.2022.09.27.12.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 12:23:58 -0700 (PDT)
Date: Tue, 27 Sep 2022 12:23:57 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	llvm@lists.linux.dev, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2] x86, mem: move memmove to out of line assembler
Message-ID: <202209271143.7B7D15D@keescook>
References: <CAKwvOd=a+0VNP-d=mHnbM4ujdtPrujru4dxHtfDo+EEM+b6deg@mail.gmail.com>
 <20220927172839.3708280-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927172839.3708280-1-ndesaulniers@google.com>

On Tue, Sep 27, 2022 at 10:28:39AM -0700, Nick Desaulniers wrote:
> In addition to having complex constraints that can't always be resolved,
> the clobber list seems to be missing %bx and %dx, and possibly %cl. By
> using numbered operands rather than symbolic operands, the constraints
> are quite obnoxious to refactor.
> [...]
> -		/*
> -		 * Move data from 2 bytes to 3 bytes.
> -		 */
> -		".p2align 4\n\t"
> -		"9:\n\t"
> -		"cmp $2, %0\n\t"
> -		"jb 10f\n\t"
> -		"movw 0*2(%1), %%dx\n\t"
> -		"movw -1*2(%1, %0), %%bx\n\t"
> -		"movw %%dx, 0*2(%2)\n\t"
> -		"movw %%bx, -1*2(%2, %0)\n\t"
> -		"jmp 11f\n\t"
> [...]
> +.set tmp0, %edi
> [...]
> +	/*
> +	 * Move data from 2 bytes to 3 bytes.
> +	 */
> +.p2align 4
> +.L4_byteswap:
> +	cmpl	$2, n
> +	jb	.Lbyteswap
> +	movw	0*2(src), %di
> +	movw	-1*2(src, n), %bx
> +	movw	%dx, 0*2(dest)
> +	movw	%bx, -1*2(dest, n)
> +	jmp	.Ldone

Found it (need to use %di instead of %dx). With this changed, the kunit
test passes again:

diff --git a/arch/x86/lib/memmove_32.S b/arch/x86/lib/memmove_32.S
index 73314a391a72..9e33c9a1c595 100644
--- a/arch/x86/lib/memmove_32.S
+++ b/arch/x86/lib/memmove_32.S
@@ -179,7 +179,7 @@ SYM_FUNC_START(memmove)
 	jb	.Lbyteswap
 	movw	0*2(src), %di
 	movw	-1*2(src, n), %bx
-	movw	%dx, 0*2(dest)
+	movw	%di, 0*2(dest)
 	movw	%bx, -1*2(dest, n)
 	jmp	.Ldone

-Kees

-- 
Kees Cook
