Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B372EE979
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 15:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753457639; cv=none; b=Npql4f95ZGWS5zExd4KQTgnTN3lYThD1602S2ZM/qURv0DC2lkwpbDYz4KGPz0KJkQMU8tl/cM8IbE23Ztt4oCpg+NEMgdDAUgSoZ2PI7KOzYI59xyTcywtRC3RUuy2xPIgE3h6DqhnHtnMhoKqehWgEKD+sYYLFt08ak/KUZV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753457639; c=relaxed/simple;
	bh=Y2VJHC8bAOkQEc3/BtZmdpAb3Sl0KXF+OY9Z87x54dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxiG88rRgHHk3QMDx/eogiVeNBRXGJG5YZWKnG5HvpGPG9nI5aw1EcehFlk0ULaIVA5gpmlTChclGxyM551HcG85frLNimaD+7XeU1PLVMD0XYBM+RdRc1h1or05EiPH5BZorICf3Ax+LZlLx2vv4pON84YalNsYEpQ5h+c2ydA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C+Iw74LH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C+Iw74LH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-237f18108d2so205675ad.0
        for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 08:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753457637; x=1754062437; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IMrTLQB9tEMEJbnJ/xHH9mm9yGwT1IOyIE5qrsMa5ek=;
        b=C+Iw74LHmG6qBvg6p/TXHuG4UacOCJA4kzyBzGqtmF9huEu0TwNRLx7qiE79Zji4X6
         aVcVMvGTZfEg4NaeyY3lrP3glLL0MLqhvHSJxNJnDgOAcrMwLyZBFC3j2ik3u0QFEV4I
         VRCCF/BtDd63l4S17FPmbTg/g0MkbAxNn43hDJYb4ls6n5Y6Yd0DETc/dNfm8FBfxFgZ
         qnuJHMApj4nHS38snijrfbUmHV1sFCLY3ehAua9mw3bF+gVlDEw6mJcjAgH8B1R+2AYH
         gXl9uq7/tgWHXljjwLttG9NQCoh5NVOnMaFUnlSCapBpIQJOKdU+EYG8nEEqRgcq+NeD
         QZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753457637; x=1754062437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMrTLQB9tEMEJbnJ/xHH9mm9yGwT1IOyIE5qrsMa5ek=;
        b=nNs1yfjyjBU51PVAFYitpkMBKCIladZGJics2zmLrHUnr4yVUD0VovS+zuKdm6su1k
         8H+dJZtzCkPCVEWozlrRpNiulksZavMy7NBCgULySFv9ys5IQedvW4VEMIa449aGqIcJ
         7ylCzqXxR4+6tCaEH8n0OywQ5lPjgiMjYdPZH3tzgdkW4sMGS6hKd10Uv7jXJ+puaHl8
         skEGJGDD1VwYidQVEZ/SQdv6M9KjasqIcdw3WMpYhz9I8Zq4qPZa0tirgpRjb3hhaVLz
         hVOV6mlcv6sBrwKoNhDjzOqx6KZexoohJji4n+3bkjlmg1J7CIeSjJNoMpp9+g1jjpGm
         uvdA==
X-Forwarded-Encrypted: i=1; AJvYcCWdv+wfGP0YeOzif0XjdNJOwGOnMRubeat7AjuvHxHcU7o7O+LP16kIsrlVQeJRLZrVBPWQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzKvAPieAtlbAIl6g+976g2st1MMPiSymVKkff1Xz+WbGRk3buG
	hDjFBIg7364V92JtoXjMjSwWKpVcDQ8gDzifPnfo1ztSz4oDCOaHibFR4AYUUb7lVw==
X-Gm-Gg: ASbGncuqmiF+PmDdcmFKdCm4qw+yAMS2qdKaVziSeFesS6dVuRQnNb8dtC0bkb6xFyG
	wC2628YEJYg/E4HvCZn3VQtzsaPPXFeCcWXoKQnX4dOjTXx1OkBujB/CALeH94wvW93hBqX/9GS
	jUTuYUoXMGyy7wnBq/U/Ujci1mnXv4Iw6KpCARRqUA9al0QLVvqe3a+eLl2jW6pt2W6MocaCXbc
	TFW9byIthwTWr66Jx1zudsjLZxrUnXDvoGDL7qv/HVrnIeFQuuwU/LVzgFJ1/DOssxsoBGPDV62
	J2WS0asOUQhjgV9MFo1AXSeknlypLaTI0OU3BDe7cUg7046TLayh35Eh1+m8urJ6mqC5yG37gxP
	XidyOdeqwAiDi18ghj2b0YOvXB0oZee8qXOAbzrLrLHcCZjrEcevTjA7BkMrvoL2TOg==
X-Google-Smtp-Source: AGHT+IGqwy+SyKapfsDhV0SCrakv4CqrxfO6vBXV3nKCxXlckVrSgte7qwyPNubIbBY6dQEWJppRvg==
X-Received: by 2002:a17:903:2d1:b0:223:fd7e:84ab with SMTP id d9443c01a7336-23fadb22253mr3447835ad.24.1753457636899;
        Fri, 25 Jul 2025 08:33:56 -0700 (PDT)
Received: from google.com (106.81.125.34.bc.googleusercontent.com. [34.125.81.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe4fd692sm86545ad.91.2025.07.25.08.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:33:56 -0700 (PDT)
Date: Fri, 25 Jul 2025 15:33:51 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 02/11] riscv: update asm call site in `call_on_irq_stack`
 to setup correct label
Message-ID: <20250725153351.GB1724026@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>

On Thu, Jul 24, 2025 at 04:36:55PM -0700, Deepak Gupta wrote:
> Call sites written in asm performing indirect call, they need to setup
> label register (t2/x7) with correct label.
> 
> Currently first kernel was compiled with `-save-temps` option and
> normalized function signature string is captured and then placed at the
> asm callsite.
> 
> TODO: to write a macro wrapper with toolchain support.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/kernel/entry.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 2660faf52232..598e17e800ae 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -389,6 +389,7 @@ SYM_FUNC_START(call_on_irq_stack)
>  	load_per_cpu t0, irq_stack_ptr, t1
>  	li	t1, IRQ_STACK_SIZE
>  	add	sp, t0, t1
> +	lui t2, %lpad_hash("FvP7pt_regsE")

Ah, I see. The plan is to hardcode the signatures in assembly code and
keep them manually in sync with C code. When we implemented KCFI, we
thought this would become extremely tedious to maintain after a while.
Do you have any plans to add KCFI-style __kcfi_typeid_<function> symbols
that would allow labels to be determined from C type signatures instead?

Sami
