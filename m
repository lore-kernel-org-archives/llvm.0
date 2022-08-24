Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7387E
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 15:32:12 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id q63so1100171pga.9
        for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=UZnSHBhLdMOKtTsvoHUMcnhpm7mRfzt47Yx1rwe6TYo=;
        b=ZLLZ1sQgjDCQZCR6iPbiV+dqJNVFlqF98MJZe+fMBspnKcQ1UNH5o3QOOx9DF7zBKA
         4NTZQU8BcU6LZoqrr74W5W2rChziUMwFRSTTGrC513hiwIJ39DS6AjzTbmueQdO2STE0
         t09KkGjDmYbiMqWw8kicU5n4mAAvwqsvfR4L8kRTE4YxLV1mXG0u1f2lpXeh4xy6gdFe
         Wv/tpw2JwZvjKVZthEj5z4x1vSTS+evVhLMdntp8ICLZ2wM3nwRTCYJP9MatbCfSirsX
         fcVMxPNOyrjAZQmeXvPefg+H+k8Jj7MzekfI//odudIng7UsH3Qp7cbIUqf69180zIUj
         AbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=UZnSHBhLdMOKtTsvoHUMcnhpm7mRfzt47Yx1rwe6TYo=;
        b=iqKo+Ukn8YSVLs5qjspaxOQhjGFnFGkZ886S8Z+YkicX7KLCwLggK3lU+TxQupUzby
         scAbozteQmvfoMBQxIBBAJmjHoYtAbkRca263vXow0Qe0nbIbUvE1bu2g7JGH3Ax5hjX
         UJIhgH3q4xEtb6qz9z09SwxU7MA6MPlumpiOGxuLQ6nDmjWpHtVq0mfxKudrIW6miryH
         t0EqI0zRJO+GJrvX9x3iJ+2MsP70RO7dh8qNYFCoo/UBTkEqmnQmwPrP4o60NFEj/rFD
         /rxt9WUG39xq10vQq08Axf6qtaIaZ88ue9KIn2cxGhb+ogOzg6Qr8cb+txq6NZnNWYM0
         LFIg==
X-Gm-Message-State: ACgBeo3mnG8qlFEXfa7J+rteTr+T/7NqqsFVJtpY/dcEQmJ3Pgr8NUhM
	t8/HOeJFrAy8fCQT7AStj7r1wQ==
X-Google-Smtp-Source: AA6agR5QWDXsHQ6VWlCNVAAXtH2sA1tM24WXPqXY0c9+lwwnmRBfulv0M4b7+RjikXl1y2MhtN3W7Q==
X-Received: by 2002:a63:8343:0:b0:42b:3b1a:89f6 with SMTP id h64-20020a638343000000b0042b3b1a89f6mr859171pge.26.1661355131607;
        Wed, 24 Aug 2022 08:32:11 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090ad3c500b001f53705ee92sm1567101pjw.6.2022.08.24.08.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 08:32:11 -0700 (PDT)
Date: Wed, 24 Aug 2022 15:32:07 +0000
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>,
	Peter Gonda <pgonda@google.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: Re: [PATCH v4 5/6] KVM: selftests: Make arm64's MMIO ucall multi-VM
 friendly
Message-ID: <YwZEdzHtWEfCpr7B@google.com>
References: <20220824032115.3563686-1-seanjc@google.com>
 <20220824032115.3563686-6-seanjc@google.com>
 <YwY9BYDUeiT87/Vs@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwY9BYDUeiT87/Vs@google.com>

On Wed, Aug 24, 2022, Oliver Upton wrote:
> Hi Sean,
> 
> On Wed, Aug 24, 2022 at 03:21:14AM +0000, Sean Christopherson wrote:
> > +/*
> > + * Sync a global pointer to the guest that has a per-VM value, in which case
> > + * writes to the host copy of the "global" must be serialized (in case a test
> > + * is being truly crazy and spawning multiple VMs concurrently).
> > + */
> 
> Do we even care about writes to the host's copy of the global pointer?
> I don't see how the host pointer is used beyond serializing writes into
> a guest.
> 
> IOW, it looks as though we could skip the whole global illusion
> altogether and write straight into guest memory.

*sigh*

This exact thought crossed my mind when I first looked at this code, but somehow
I couldn't come up with the obvious solution of using a temporary on-stack variable
to hold the desired value.

Something like this should work.

#define write_guest_global(vm, g, val) ({			\
	typeof(g) *_p = addr_gva2hva(vm, (vm_vaddr_t)&(g));	\
	typeof(g) _val = val;					\
								\
	memcpy(_p, &(_val), sizeof(g));				\
})
