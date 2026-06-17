Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D390D42EEBB
	for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702805; cv=none; b=Q+3EzeL67rWAdZTm2awG/lJszGVOEbNXU69dud19CY2elGVDx3gpoFtc0AwUa4VDugJlYkD2cyPLktjs49Q2QTKwIErabu2D2pnl7OjwEXtCMEx3O/ndoP4kmOPUnFpbnn6l5nJbB9z9Z/t9P4E+cEx6nkW7mTepZiMD10P11CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702805; c=relaxed/simple;
	bh=2empQF2J/OcdElnIEv2j+jOQoEM6gxuILIKRvoUJ4XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxdVxe+FRNRd7zxaKOGoM3F4jCAnK+VLkfdNUvjizP93+tEbaly89FOG3dxs2imfi1coWQu+Mgm9WneujHeGwnbOmkt2dKu/uMegPjBPG1TtjlIuPQcbcUO9QOfx63PW4URoNuVUiiLztDYwR85guGdbi7fL2c6EjnZCo6lsaoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NlHUSrXB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NlHUSrXB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so40250735e9.1
        for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 06:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781702802; x=1782307602; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5zxb6GFRrhCgQ7TLt0ipxO76kANUtNRaysZidmTt9y8=;
        b=NlHUSrXBoCKdYM01RReZ8eq1oePa1bx3qgo2x3O7XLbPJdVOAA6rC0YrcTT0yTD91P
         pBcuPEjjFDmfm/nH1keU9eRG6WaMcvRzO3mV+NeAUf4cg2KGSldfdDx+O8ztXfTXD7fM
         CDd5AK7ZQFG7O16+rAKoqcPv/3svaFjpiyPqs1b3oP1AI6xI0Jxz9UGpPqM4XS3HKVCu
         H23nLtor2+ydX3EAOIB92YDkPeowBJtYEiVAZAhabrXCPMqCFz7xK1O6fx+/5MFCWpv5
         z/5Bz2eCAoL7dCjv03htVqEpL3QapQo7LKt6bKTJQz+p88st1uWpqRQU65GTLxzPVRrD
         Q8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702802; x=1782307602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zxb6GFRrhCgQ7TLt0ipxO76kANUtNRaysZidmTt9y8=;
        b=jb86znqcg13zMimQIopOS/iYZYrnMPkpSF3Qn2tNwWu5FP0ua8fPvv9+2z3EI0WBTI
         qsgG5c3sviKl0tC69MXq6r9gYeCTYxHqB+DmsHaJOqthrM1bpetNRXcuLgMVvHq7GxVT
         iUCwAMCp+MB/HJAU7KUXkzguSPAHEY0bSmFsDA4s1K9S2euJbrC1J8sxuey0IRx6BGzC
         cdb+mqATxWqDOQcWqLbPhqR1xZ8cAWkrCpSYW+Cq+IqN9DZEj3h/DSucewkBImmYsOVh
         p+4im3+lhYcE/Rr5BlbACsEsIQAOc/ooVDjEl4tqz8Gh4NL8RGukxQAWGATKhifwRD0Z
         GCKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/godZbUOrgQ6nu/2P6vKa7s1CcGnrIDKZt8cMQtpgdlI5WiipOQfD8DEuYqbXpffXBTtMG@lists.linux.dev
X-Gm-Message-State: AOJu0YyHKrLQLCJE0AVmZe3nJ/PeCcvn6iPYVK7bTI0gKDcFFz319Z83
	03ZhOI0IlJqmlHflqf2LAheLLo9d4jKcQphes+PRxZCD5CzJLFYO4LNihB47rOFUww==
X-Gm-Gg: Acq92OHI5lWZr0QAQBN7Y1AKlPZ95ck9KZcjwFBLIlmeB4WWmwGnO0p+qvLPLD6GoNz
	U6+Ok+6MX8P8HSXAVZOnExkXtYunrS+P5iVeHeuCaXwLdZRIVdMaI/3mnmtQRJMpO9P+9rL76uA
	luWL84oWaQC/l7hRzBjipjvCL6oPD7eZwnJGUan6nEQLS4qSncjelmMj99Vmey5PWylu5K9cnMB
	GpU9YGPX6Fxb0i2wRVoFP2TSgP6Kj81xFO30NWrnj9BaNgjsTRPmts5bCJLU77kuxrHRGBScbzP
	9LnWcINmOq/3KUgM5yI1q09Y5pbCb22Pxjiih/PYTHiAHnOXax565GcKqfWzykW024ICaekB15c
	Fm7WIGbGvN53ZnZGnKlZe40DsP14n7bgdbTGCDm3q1CCcTvnsaYmcdKxPipa5ryojrfh/m2I5TC
	ABrMkimsEwiWRVE5vFU8tF66KKYIOGcRKyTSeRj8cOvJ025qkWT8vYqNyy
X-Received: by 2002:a05:600c:628b:b0:490:d354:bcef with SMTP id 5b1f17b1804b1-492333df0c7mr63112735e9.33.1781702801641;
        Wed, 17 Jun 2026 06:26:41 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923757b8a5sm5686655e9.2.2026.06.17.06.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:26:40 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:26:36 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] tracing: ring-buffer: allowlist clang-generated symbols
Message-ID: <ajKgjNuHUlteSziZ@google.com>
References: <20260616164211.3733326-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616164211.3733326-1-arnd@kernel.org>

On Tue, Jun 16, 2026 at 06:42:03PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> In randconfig build testing using clang-22, I came across two
> sets of extra symbols in the ring buffer code that may get
> inserted by the compiler:
> 
> Unexpected symbols in kernel/trace/simple_ring_buffer.o:
>          U memset
> 
> Unexpected symbols in kernel/trace/simple_ring_buffer.o:
>                  U llvm_gcda_emit_arcs
>                  U llvm_gcda_emit_function
>                  U llvm_gcda_end_file
>                  U llvm_gcda_start_file
>                  U llvm_gcda_summary_info
>                  U llvm_gcov_init
> 
> Add all of these to the allowlist.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  kernel/trace/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> index f934ff586bd4..aa8564fb8ff4 100644
> --- a/kernel/trace/Makefile
> +++ b/kernel/trace/Makefile
> @@ -146,6 +146,7 @@ KASAN_SANITIZE_undefsyms_base.o := y

Would "GCOV_PROFILE_undefsyms_base.o := y" work?

>  
>  UNDEFINED_ALLOWLIST = __asan __gcov __kasan __kcsan __hwasan __sancov __sanitizer __tsan __ubsan __msan \
>  		      __aeabi_unwind_cpp __s390_indirect_jump __x86_indirect_thunk simple_ring_buffer \
> +		      memset llvm_gcda llvm_gcov \
>  		      $(shell $(NM) -u $(obj)/undefsyms_base.o 2>/dev/null | awk '{print $$2}')
>  
>  quiet_cmd_check_undefined = NM      $<
> -- 
> 2.39.5
> 
