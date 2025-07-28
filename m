Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6601E2673B9
	for <llvm@lists.linux.dev>; Mon, 28 Jul 2025 16:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753720661; cv=none; b=ZjgwpyQQic2imKbKdyBMPq+kG0OfRCeOwxiG+wQEjVA5HxE0N36sBn8FOZGrgcrP3UVGzSbczPiYxj6PnIWLprvR9fDtDALACxzDHcHROwfb39dTmNKnllrbRTLgNYJIwGKlIiNnAfkLlj2Wh6KxojzIwhXZMcBPhU76Dv+Iuks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753720661; c=relaxed/simple;
	bh=2SCBpxMSnr0Udt96N/nYsntgpWGEdtVpMjRq+5bF/Io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcFFUtgm5tO1JgoekyZavvP3oQdglvSVQEMdJTO4V22GUmm5xIsSNeD8F/v9d+uhQ+ktUzbEsA40n5khnA/tcQgY8Wya+gRPx4h6086VY0jmOPO5XPHZ9hG2b9LhQtyY+GPiSHCjyngKQ1iEDXCAth0dI28OiHe3gQg2z+yriQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Idmvjd+b; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Idmvjd+b"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23636167b30so43744485ad.1
        for <llvm@lists.linux.dev>; Mon, 28 Jul 2025 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753720658; x=1754325458; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5q5M+CpT+5kwmRPJ46tyAoXGVagM73LO6ZWHv96bYmU=;
        b=Idmvjd+bVr9TKXLjMW9//s0//hKwSDGLRJJUcJk0itopOlAb5ciU9gd1vX9m0u/kzo
         AkrKwMjQEsYuRP3sIUeHrzEUg32t9KE3JY3P1WDCQgHDVs/kj/yt2lR00SEncS+l5ZiM
         T2IvADYJk5JxysI9MpD/TO3crpDBulQ4NNJMGgnZzlRYt7UxFuKqRig0h6G5NL467MBy
         gHphvEv0KqXHhsCEpDi39kynchslfRV9E2PAarbzPgiBjy4xpJqifXDgEkuizlNCu6pJ
         2LyCzFiEncBXyHgKLledbtgEPaGg+UEuHNCKuAnpk1jA8lEhg14jL1MngJWvn7er5fI7
         nB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753720659; x=1754325459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q5M+CpT+5kwmRPJ46tyAoXGVagM73LO6ZWHv96bYmU=;
        b=LZI9PLVkM7IeYC8BUfmgyvW89z1V0IeLuFN/DyRziWNggGrcsHP3K1LKK0F6ANFRPA
         aoEvlMk+nLNONuEPq5YKEqdFFsELHnzkkZAO1sk0H2hQxC0eHLVmip93ss/7I/jJfeKL
         v9OKkzMVQO8xtDAzEtSCe9N1Mkw+DyVzu1TVymoQoDYyIYbzbmJJ1DfAktOyKLcd2iYI
         Ghvss1DNRtEWpzWLrK4cqYZWKebeYf54mYBS2rAkyFJ1Q7vII/4FB286uJeQCMDrciVt
         Ifi/mQeiWlRwIxohPJtPrAsmnuhnDE79FBMyFxMuks/53oGn1yy7cHvQ/mg60+9ov2cw
         iKDA==
X-Forwarded-Encrypted: i=1; AJvYcCXOwhNtcJM+Uc1F8gEhcUdTBbyXORTCOIE90mCaWXGT/JADJ56sFpigkvAuRqmLQ418jaPv@lists.linux.dev
X-Gm-Message-State: AOJu0YxRLhR5ODpEAzfmkmrAPDtNO/+Jw68rgnIDNBBm7R0dY+behvMo
	3k2K2qexUCI2eyRUzuxZsoXs6Dh6N+jnCZIWiNQyOhYX2t6Fz6iUFZ4HqBfob9NF0vo=
X-Gm-Gg: ASbGncsOPtrn5j/zwwdvdTuM1YSNPqfnDAVDzihsHwH0oRJS1XIUVKEWc5fkZz59qQ4
	RhXRBPQkOrMO8Rbi4fVKqsm6PyyPAn4FNiMcjrQx2JBCXMbS27OXjxCj0+HCOpKdIXrZjkAA5jE
	mp2edCOtBF9w/is4bRpphuS82jB/MGYk7X6fjVfX2A2nb30gUQ+aXPtGtNDmIQTKiMwI61kmiCd
	rfKk4SxP1uTOYpIcvkWtTuQW4P4zafmiG5kMyFRdzr4YnUUAkXxexjPxAiW7OOLf2zW4buY4pRl
	uMDY/G7JBCFYfxGFptq+jPlRhjPzXO2YxcWlZaXSlzo6yKJ4aLf6/kW2S+stChjzOYdoKSlQvs7
	M0kh4cokZ6wa5QCbbJoPyitgKr53bPABO
X-Google-Smtp-Source: AGHT+IG8PkXREALt2B41+CkCZk4vD0+tX/pzcMfIzczJ6dwSMXqtKdHnRzA6w8eQHSP6Yq5Aix/U2Q==
X-Received: by 2002:a17:903:1111:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-23fb30cd1f9mr182480625ad.35.1753720658505;
        Mon, 28 Jul 2025 09:37:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ff3ea7547sm40412335ad.149.2025.07.28.09.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 09:37:37 -0700 (PDT)
Date: Mon, 28 Jul 2025 09:37:34 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Will Deacon <will@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
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
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <aIenTs_D4l414isp@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <20250725161327.GC1724026@google.com>
 <aIdxUpSc-Co8wLYE@willie-the-truck>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aIdxUpSc-Co8wLYE@willie-the-truck>

On Mon, Jul 28, 2025 at 01:47:14PM +0100, Will Deacon wrote:
>On Fri, Jul 25, 2025 at 04:13:27PM +0000, Sami Tolvanen wrote:
>> On Thu, Jul 24, 2025 at 04:37:03PM -0700, Deepak Gupta wrote:
>> > diff --git a/include/linux/scs.h b/include/linux/scs.h
>> > index 4ab5bdc898cf..6ceee07c2d1a 100644
>> > --- a/include/linux/scs.h
>> > +++ b/include/linux/scs.h
>> > @@ -12,6 +12,7 @@
>> >  #include <linux/poison.h>
>> >  #include <linux/sched.h>
>> >  #include <linux/sizes.h>
>> > +#include <asm/scs.h>
>> >
>> >  #ifdef CONFIG_SHADOW_CALL_STACK
>> >
>> > @@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
>> >  	 * Reset the shadow stack to the base address in case the task
>> >  	 * is reused.
>> >  	 */
>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > +	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
>> > +#else
>> >  	task_scs_sp(tsk) = task_scs(tsk);
>> > +#endif
>> >  }
>> >
>> >  static inline unsigned long *__scs_magic(void *s)
>> >  {
>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > +	return (unsigned long *)(s);
>> > +#else
>> >  	return (unsigned long *)(s + SCS_SIZE) - 1;
>> > +#endif
>> >  }
>> >
>> >  static inline bool task_scs_end_corrupted(struct task_struct *tsk)
>> >  {
>> >  	unsigned long *magic = __scs_magic(task_scs(tsk));
>> > -	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
>> > +	unsigned long sz;
>> > +
>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > +	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
>> > +#else
>> > +	sz = task_scs_sp(tsk) - task_scs(tsk);
>> > +#endif
>> >
>> >  	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
>> >  }
>> >
>> > +static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
>> > +{
>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > +	arch_scs_store(s, magic_val);
>> > +#else
>> > +	*__scs_magic(s) = magic_val;
>> > +#endif
>> > +}
>> > +
>>
>> I'm not a huge fan of all the ifdefs. We could clean this up by
>> allowing architectures to simply override some these functions, or at
>> least use if (IS_ENABLED(CONFIG...)) instead. Will, any thoughts about
>> this?
>
>Yeah, I agree that allowing architectures to provide overrides makes
>sense, however I also suspect that some of this needs to be a runtime
>decision because not all CPUs will support the hardware-accelerated
>feature and will presumably want to fall back on the software
>implementation.

Hmm runtime fallback is an important point. Thanks. I'll munch on it a
bit.

>
>Will
