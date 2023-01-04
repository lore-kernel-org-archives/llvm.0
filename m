Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73429373
	for <llvm@lists.linux.dev>; Wed,  4 Jan 2023 01:09:40 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id 17so34496884pll.0
        for <llvm@lists.linux.dev>; Tue, 03 Jan 2023 17:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2VT5QZhcZZeDbsiEz/fllfSXONvy51XdiSS8QokpwQg=;
        b=Q4DEfeoNUsJnujmG5WDcxlCAMaEfhBmMWAS7aUzEC2GW3ofbkRwZ22ZYFjITsxmo6K
         bb0vjmVJXZL0G/l4TGKr3KMTIDcdwQUeKoeFnx6I8MLcodY9TVH6AGEpkz9x9GWI5hwx
         k7R0UjHzbUt2Ai1wJRy2IFQHhF6DWYLx8cxQAFMWDWI6Xgrug2FARlR3RiNRVi4rCbo9
         AP/OLiZNnuV7UvZFm8qEsAphMEm93ULbKnV9d+A7rgWdhM6aiDUP6a5tWQx2bF/ggq6A
         f7JPgRzWEeYZPXHV5Lm4ZgFljKv8WtzXvID2mUUKGwqdRm31BuBbvKfhkRXpKAhdOylW
         Zj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VT5QZhcZZeDbsiEz/fllfSXONvy51XdiSS8QokpwQg=;
        b=kwRN5AyBWTuCgRi7p0m33bKx8RzJBTfahCKA0hpHsznDwvOBdZk4IfO5unr/C1RWgm
         seThdgvX5NWa/DBI1hNB8HEHnB1REkJxNhi0GKwaFlkcOmNfjFrihR+bwtv3pPXO4FsV
         YramwcWm/qcgaGhX579eK0ijU4M+PsEDRb/W54ygmzUQTBx5m+k8DHvzO6azzjAO+9k7
         ymzkL1DTOIFieuTq7himzFoP8fGvqX3bsVTtL/Ime3pnA+oaj/b4rDlaRluxYB0Y5y0I
         erO1gLwDpnV4WZWfz2nXBvXLWZaRXu62kxL9eKXneTxCXcXl7ybdgg9j9cRHYScG7FCZ
         w9dQ==
X-Gm-Message-State: AFqh2koh/jcBpRjKZgap9/4mfWLhN0EssuA4wElnn+xlRSPudyDwyHlH
	aTGBRmpypIB6VDuz2mVTw1xkYg==
X-Google-Smtp-Source: AMrXdXt4xHOajqscKlKaEpBiTyEw5HpxcS2+BmkjFSTy1AWvaTA2O2HtoOh9s0+BdQR2dE8QR1delA==
X-Received: by 2002:a17:90a:9912:b0:219:f970:5119 with SMTP id b18-20020a17090a991200b00219f9705119mr3677621pjp.1.1672794579775;
        Tue, 03 Jan 2023 17:09:39 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id dw6-20020a17090b094600b00223f495dc28sm19707506pjb.14.2023.01.03.17.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 17:09:39 -0800 (PST)
Date: Wed, 4 Jan 2023 01:09:35 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Subject: Re: [PATCH 12/14] KVM: selftests: Use wildcards to find library
 source files
Message-ID: <Y7TRz1AY95SlKOHv@google.com>
References: <20221213001653.3852042-1-seanjc@google.com>
 <20221213001653.3852042-13-seanjc@google.com>
 <363f4713-6105-82d1-351e-423d07470cdf@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <363f4713-6105-82d1-351e-423d07470cdf@redhat.com>

On Sat, Dec 24, 2022, Paolo Bonzini wrote:
> On 12/13/22 01:16, Sean Christopherson wrote:
> > Use $(wildcard ...) to find the library source files instead of manually
> > defining the inputs, which is a maintenance burden and error prone.
> 
> No, please don't.  This leads to weird errors, for example when "git
> checkout" is interrupted with ^C.

Well, don't do that ;-)

Are there concerns beyond having an incomplete and/or modified git working tree?
E.g. could we do something crazy like fail the build by default if the working
tree isn't pristine?  The library files aren't terrible, but the number of tests
is getting unwieldy, to say the least.
