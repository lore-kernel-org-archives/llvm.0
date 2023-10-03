Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914AD3FC2
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 07:28:38 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9ad8a822508so95085366b.0
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 00:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696318117; x=1696922917; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ucqw6X61coCqcSfzC4WcVSLrJYNxmNxx1TxpbToBncM=;
        b=bRt+9y6KIttkAm9qyPiFi3SZ/r3+vvZeLsRga8I2mSdfISeTEKGl0PBrZajd4oCSML
         pPNdd0jJG5H+lTprKrdsOV/XkjgNaa5vnORBqRLl0VPe5FMtdH0lSVZukQVRJr/812KK
         xCskOE83oM0E8wU5sVOI8BMdWgfWulB9RdzslgZKVSc25ZCQW5Czfp2NaRX6G/pwj6Iz
         j/nvdZc4/N2KL5uoJcOrZc5D9iMUKeVQGuJvZB4yD037wGqncAKYpebgkZtG5Vfck+gk
         0vHYv4ckNx/syyFH2xVRpaaBlZNQLmzWyyD6CuQv4sbg7o3uBunZwHBmIUhi7DKMQcXM
         AIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696318117; x=1696922917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ucqw6X61coCqcSfzC4WcVSLrJYNxmNxx1TxpbToBncM=;
        b=vU5CeDWShNsmQ9Xz25uvmaLkUuZ3r67a9rV/WuM1ifgRXyvTwtEElgKz/q2MAUSJJP
         IjPgR+s3TVPusesK5Uo3GrgqXpi/bxneThYjhJeIty21FfH3I/EnHEfvV69qmSMjJTss
         dsa5mba5qI8WBdS7lrRVOna5GBXbcOOZ30qJemzShbwVmcGkY23kfIE5/s8PpV6vmrSH
         jPLQNrqn8fOhaxybIRtfb/bgD7P1KRVFPaYZMNpzWP3ZF/Q8OvXpFbtyt5d2dDtAIpox
         xWjmc216+MbxBY7V3yQdRUXpeGSWNN3xIfP1cSeKpi8zfdhjLnAhbc2Eq7w8ikKWYkuR
         TOrQ==
X-Gm-Message-State: AOJu0YwA8ONETKp0u1Vj9DydbOXNgy8OAc1Wo+tvj0m0hm0wS4mTV0Px
	aDXZeUuwo1FzbNlVb4tKtr0=
X-Google-Smtp-Source: AGHT+IHZ1kAC1A1CZY/3XYlSuV9n6RlS+Vy/Q121wiJg0bkW6CqSl5x3L0h4EbFAyb+Kk5WhUPf4vg==
X-Received: by 2002:a17:906:20ce:b0:9a1:e233:e627 with SMTP id c14-20020a17090620ce00b009a1e233e627mr13839558ejc.42.1696318116414;
        Tue, 03 Oct 2023 00:28:36 -0700 (PDT)
Received: from gmail.com (1F2EF530.nat.pool.telekom.hu. [31.46.245.48])
        by smtp.gmail.com with ESMTPSA id r27-20020a17090638db00b0099cf9bf4c98sm567225ejd.8.2023.10.03.00.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 00:28:35 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Tue, 3 Oct 2023 09:28:33 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, acdunlap@google.com, ashok.raj@intel.com,
	bp@alien8.de, david@redhat.com, dionnaglaze@google.com,
	hpa@zytor.com, jacobhxu@google.com, jgross@suse.com,
	jroedel@suse.de, khalid.elmously@canonical.com,
	kim.phillips@amd.com, kirill.shutemov@linux.intel.com,
	llvm@lists.linux.dev, luto@kernel.org, mingo@redhat.com,
	nikunj@amd.com, peterz@infradead.org, pgonda@google.com,
	rientjes@google.com, rppt@kernel.org, seanjc@google.com,
	tglx@linutronix.de, thomas.lendacky@amd.com
Subject: Re: [PATCH] x86/boot: Move x86_cache_alignment initialization to
 correct spot
Message-ID: <ZRvCoc8miXAjSenM@gmail.com>
References: <20231002200426.GA4127272@dev-arch.thelio-3990X>
 <20231002220045.1014760-1-dave.hansen@linux.intel.com>
 <20231002222402.GA486933@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002222402.GA486933@dev-arch.thelio-3990X>


* Nathan Chancellor <nathan@kernel.org> wrote:

> On Mon, Oct 02, 2023 at 03:00:45PM -0700, Dave Hansen wrote:
> > c->x86_cache_alignment is initialized from c->x86_clflush_size.
> > However, commit fbf6449f84bf moved c->x86_clflush_size initialization
> > to later in boot without moving the c->x86_cache_alignment assignment.
> > 
> > This presumably left c->x86_cache_alignment set to zero for longer
> > than it should be.
> > 
> > The result was an oops on 32-bit kernels while accessing a pointer
> > at 0x20.  The 0x20 came from accessing a structure member at offset
> > 0x10 (buffer->cpumask) from a ZERO_SIZE_PTR=0x10.  kmalloc() can
> > evidently return ZERO_SIZE_PTR when it's given 0 as its alignment
> > requirement.
> > 
> > Move the c->x86_cache_alignment initialization to be after
> > c->x86_clflush_size has an actual value.
> > 
> > Fixes: fbf6449f84bf ("x86/sev-es: Set x86_virt_bits to the correct value straight away, instead of a two-phase approach")
> > Cc: Adam Dunlap <acdunlap@google.com>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Jacob Xu <jacobhxu@google.com>
> > Link: https://lore.kernel.org/all/20231002200426.GA4127272@dev-arch.thelio-3990X/
> 
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks for the quick fix!

Thanks for the quick testing - I've applied this fix on top
of fbf6449f84bf in tip:x86/mm.

Dave, I've added your SOB - let me know if that's not OK:

  Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>

Thanks,

	Ingo
