Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8630836A
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 04:27:09 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id n8-20020a17090a73c800b001fd832b54f6so8013988pjk.0
        for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 21:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=tveQCNdrcl8zzZ90FYJSAQp/xoPHwNHO3f5B145IGDY=;
        b=jz5ryMUneNPtN7GgAbdob+y42sDrVxRuBlqA3QA9oeD1pieZtFXjP021CLo/r+B8bv
         MYbJ7ecSXA82j8N0LGSRSWGBEUhc3gl753fZP/eq9G6cgLilZiGUBe9U0WkOOEPuzjZF
         1K3HPtO4P5guX5tEHivGDwt+5tsoSrBpSv2YMAohOLencXK9GT5KAEjxZPzgLhtXs8hu
         gQg912iU7/NlDTQXrg/CEmP/aR5c+40JbNsB0FzAY+4nR+pg565IYviyzm5c/PrLrHLt
         42P316IO38WW173exoDa9F/uBYTC0uVc+zDhMVmIYiRyS2CFUFzmi4Iwz9ul83sq02Yi
         qJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=tveQCNdrcl8zzZ90FYJSAQp/xoPHwNHO3f5B145IGDY=;
        b=IgSt3F6wF1SAoTn3C73Qi+W5PESkTzAPpuqTxGtlJNciiUijrFrbE2sY9PeHFryY6S
         QN7Fpsl75rAlKb4/asIr/zOxFJDEKx/N+tdz1f/kjXqZGVNGltLD+va4jkjYjQwwlIHY
         0ZKk+jBTIDqNevKbFWunFfDk7F4IUEYIF7toWrmX9fXfUJyXC/LPzWdXLnurRKsZwBJF
         AbX5eMrbEzraqdB3XOUtv03jfAtlyCCyEEHNOy+9PBCUFD83W92uX5ZfwuED4NDJ0vQw
         rAafdUyYxuJmsE9MHn0w23E7MDP1a077voV7SXAcDEcEYVWjUdRDmLoG6nFjWygapJvE
         hAtQ==
X-Gm-Message-State: ACgBeo0n/xYveYYJs4h5/f1FoTt5IL8ez8Db8zOXJ7YVutcHBs5QIsgO
	XYl15l7FW5rDhMHv5i+JRRSZyg==
X-Google-Smtp-Source: AA6agR6j3CrMGk4TPMCPwBvaE51o8QHOWIUKsxAkxuonGlXOsZKabqIh/v6aYfhgn/tTEr+AwX2Jlw==
X-Received: by 2002:a17:902:efca:b0:174:c901:aa8d with SMTP id ja10-20020a170902efca00b00174c901aa8dmr7736459plb.164.1661833628777;
        Mon, 29 Aug 2022 21:27:08 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id nm21-20020a17090b19d500b001eee8998f2esm7541792pjb.17.2022.08.29.21.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 21:27:08 -0700 (PDT)
Date: Tue, 30 Aug 2022 04:27:04 +0000
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>
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
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>,
	Peter Gonda <pgonda@google.com>
Subject: Re: [PATCH v5 7/7] KVM: selftests: Add ucall pool based
 implementation
Message-ID: <Yw2RmCujuaOczFTY@google.com>
References: <20220825232522.3997340-1-seanjc@google.com>
 <20220825232522.3997340-8-seanjc@google.com>
 <20220829163627.qbafyl4qz5cxxue5@kamzik>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829163627.qbafyl4qz5cxxue5@kamzik>

On Mon, Aug 29, 2022, Andrew Jones wrote:
> On Thu, Aug 25, 2022 at 11:25:22PM +0000, Sean Christopherson wrote:
> > +static struct ucall *ucall_alloc(void)
> > +{
> > +	struct ucall *uc;
> > +	int i;
> > +
> > +	GUEST_ASSERT(ucall_pool && ucall_pool->in_use);
> 
> ucall_pool->in_use will never be null.
> 
> > +
> > +	for (i = 0; i < KVM_MAX_VCPUS; ++i) {
> > +		if (!atomic_test_and_set_bit(i, ucall_pool->in_use)) {
> > +			uc = &ucall_pool->ucalls[i];
> > +			memset(uc->args, 0, sizeof(uc->args));
> > +			return uc;
> > +		}
> > +	}
> 
> nit: blank line

Got 'em.  Thanks for the reviews, much appreciated!
