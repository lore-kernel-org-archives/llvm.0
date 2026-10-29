Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793279032;
	b=SAG6Ig/3Xj8c+EWwpkmHU2BZhPd1ZXXL7d1iNvklNuHAr+rKfYGsqWl2ENwdJQrJB5ii
	 RxMisedn/4dSIfu/6rrWMhm/DoAFWGCV0ZkccLYw+zXUY9EWJrS9cNv7DC7/audv+hmsK
	 abD5XJAPhrx5X2zCWFGTsUMj/ygSzUyaG09ARhTqdyKYawW9fs+HnJOk1PsPAsU/le4MC
	 3HGOUKi+EcOZAbGyaGypeqi/xAQvADTlLK5uhIHrqNiOLPLMi1yPGXkKG7lt0giuLFQMT
	 elgtUsIicYZl15WtF4xlyEcKFUZDxX2toR9gqn3HNmh9S+bzhy14MdKaHiXMpOHOVUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
	b=UUVmhY+A/YaGY49qMkfpT8IJhkfy2sZu5jEOKlSpn4KnzlugEFKzs03ubgIEZA1aLrvG
	 aHYuV4/raz9aypebLRQd1xUq01OLHcwQtdFGjBDqedGnQCe9kpnCUiL3VqColCEXls2fe
	 jSY4NZk/zv7dPAREJQtjRXllaZaMX+PYsO19RXsTybXTMYZu8AkO5cgwvw4/cTGetsjH1
	 RDsXBJAjaLOkR8lElJ3I5J5nnwhw1NHZR/ADGwm+0tIo1XMApLon4xjvKXuuepLGcgl0G
	 gYSHTTsXVcgswoExkiLknYliDL9eeRZGg+VbTTWwZVhsg6W8yP8nFq+DIVo3T8zJzHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CJ7okvH2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D04606A320
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 13:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99D04606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CJ7okvH2
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5365f9a04c5so31637811cf.1
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 06:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793279031; cv=none;
        d=google.com; s=arc-20260327;
        b=euxehunTL7VKX22hXuRcDXPJ+FsvGLSFFaAMwVXelYNJxZzC/WRfkAu0RA/oRPxFs1
         YQcVkb6Kwhtl444/I/c6C2BZf0hFN8ttAopwn2+WowoxRoj+QpO3vR7DuwcmaoKw8/SY
         0bE8j4TNFKQO1aqd2Q2o1hsx4V5C/YvpCjaRW5NG3pKE3yrPcc6shXoSGEnDfIklsfV2
         9QAAdHu20Qd9nIGsdQSO2wL51m+Ly3ehtf23lDzNWkCjGvFCB3AYe4QmATTVPAhoFKMe
         CVO23f2jF6Wmy84GXqMR9J8R8dM9J7mF4OXX3Ilj6sktwxfwZ2sPFRFQ5LcM0juyY8iF
         Ur/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
        fh=LKg3U5CF60AYDnpe13S9/goU38XNlhOtDkakSnhoykU=;
        b=Z4ML3NbQJWTE45HdTRNf9VwIQJ773ohLsFKbGDxOM9+ZcK6XTMQD2O9J7cJQpU0ne1
         BxYCBD633i5EozVHaAC+5YmKieqnsFyH3IROj3xrH/HSDfc+ZNqAv/nGsyqh1X+Zeccr
         e1g8G9JvPSYDi2mWQbu7utPZb2uxhGMvpp3W2sYTTWc4qqxW0gf1WHwtVv0YuUhziFuc
         TvTTvZZrcAer+eGZ/drSqf/5tKvlLjxFpgMqRNsL0ZqWKjyZNicXOgjxsaiflVMrG94K
         nJluFLtmHh9agVsagTeva6s/27/uCp435FFoZPKOiN+pXLywB3HWsVAwaKA+xlPbhgcT
         Pytw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793279030; x=1793883830; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
        b=CJ7okvH2KOmyou6LsTFV7UZ/bM35c/mXkHSaWH/tz/FN2UP4pxV2fMu3lbTmVJXgyj
         DTt+QW8pQ+2HO17+aqj2jHnjOUteE9Sg5tnXk0OSi2328kTsRUvhJqvEElruiDP7yDtW
         o2nrpH5FfJ8XVJhaLiqik52doHvEyjnc3Uigq1Fzty8oIZmFizdIBVOnSlDfx7eiybWN
         M/Ceq/7EjrdpWh1VtIDZs9AVzrLtAiHTs5jNWEIO9pXbdapqKWwMBst8NKC19FVqoM9T
         fWQTas/GOTh3m6EIx79hZhmO9KczA2sG498QeUaZxkhbYl97ipCaujNPDxzBlxH8jlST
         DOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279030; x=1793883830;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
        b=a/iuOiG01JoNVsbWH5o1BHY69nden6nNVyPh9S5A1vpM5cBRVLDuSbDqIzKf8OdAme
         TLubF7akaum3M9sb2ty2+SUGqME7qyJAjlumRPto3kb3wdOfjX0OKLF5rRbKtDiNNVRc
         obABieQCniKVORb4VkdYZBia7ArBN04AwTjlCtlA5uFO3H1KcgH32ZmDmfQb5bXvPtct
         ZZHy/SyXsycMazbZR9KsnoWahv1t/sqy22ux0gSv/OipJkjll4V8P7356BKM2ruHCCZ2
         TP6eWYo8xE0n1/UIawrSXYmiZpW9kHB6AvQ5tjzJ5Ww1MnjdFrzSDc2R7PjdJLuAGndS
         PHfA==
X-Forwarded-Encrypted: i=1; AKwUvByhzo8lpzLTa5rThgo+K1lNdeVWR14BfVEBBB97U1vM+cPyaBhsUQtWyHJp9xiCF/zTJvg8@lists.linux.dev
X-Gm-Message-State: AFq9FYLRTY/gvtDPWgidF1tpC6ajZ/PmDKOWTuTPCGzCxzPUtjIelxD0
	XpJxBdzSCvuUcm/GlO6STKzt9+CJJnpDREmSAw/PJ/4o6tDRFvEDPAxz/EDHLF2dILqQ0Lb/Blq
	3UyvUOEwAtpYmUpzy0ozm7dV3IgI79FgcDKCSXo+X
X-Gm-Gg: AYBFou3I6nK7R1qhS3cZ55yQsS/7WFYcI5hDVaPZTzrK9YIqx3v1M+6rgJH1eWitybC
	5Dm5rRlpONilfbWXLL4y3T7+A5LLbwoMwHbyiqlErMkHpyX39/Qg14roOwaiBSGKmf2mCQmMfGA
	xfCbtX74/pTr40jN/Ne1K1VKRoHyHqVadzpKRp4CSlijCiJMhuy5dDhkddcR7z0ggSNaa0whzgp
	Awk8rBvTyDRkldcdXFSCFMxldQcVKWGhHJ4LyMlkzmmbfAuJaZhSx+98ZnX9Q4MKzmq+iFH1f2E
	5tT3+9F2XawNL6jkt+1BtYQiXhXTtBD7L+6ATAnApkrbmCfg9HRDle4mUJXe1Z0apXh4BZUE08L
	+4ndZOQQ+JJ46qH2yDKNCMcQ8MJVs0sNv+kQ1Nmm7ZC0xaphU7Sw=
X-Received: by 2002:a05:622a:528f:b0:537:b9f5:e05 with SMTP id
 d75a77b69052e-53fcc7cc0camr87903901cf.69.1793279029444; Thu, 29 Oct 2026
 06:03:49 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 06:03:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261027154649.91571-14-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com> <20261027154649.91571-14-griffoul@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 06:03:47 -0700
X-Gm-Features: AclHuK_J4_B8WHMj3lc3Bqk_zMBRzyMWVypxyBk9aFiFYwwISWnD_-KRrJmOcto
Message-ID: <CAEvNRgFYecSKycFLkxwyK7gWZqKTXTPJVetSZm8YBbo0kg9tTA@mail.gmail.com>
Subject: Re: [RFC PATCH 13/14] samples/kvm: Back absent pages on demand in the
 sample provider
To: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.de>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Alexey Kardashevskiy <aik@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Ashish Kalra <ashish.kalra@amd.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baolu Lu <baolu.lu@linux.intel.com>, Bill Wendling <morbo@google.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Connor Williamson <connordw@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, David Hildenbrand <david@kernel.org>, 
	David Rientjes <rientjes@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Erdem Aktas <erdemaktas@google.com>, Frank van der Linden <fvdl@google.com>, 
	Gregory Price <gourry@gourry.net>, "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	James Houghton <jthoughton@google.com>, Jan Kara <jack@suse.cz>, Jianxiong Gao <jxgao@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Joey Gouly <joey.gouly@arm.com>, 
	John Starks <John.Starks@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Michael Roth <michael.roth@amd.com>, Mike Rapoport <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Oliver Upton <oupton@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <shuah@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tarun Sahu <tarunsahu@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Tycho Andersen <tycho@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, x86@kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Fuad Tabba <fuad.tabba@linux.dev>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fred Griffoul <griffoul@gmail.com> writes:

> From: Fred Griffoul <fgriffo@amazon.co.uk>
>
> The sample provider fails get_pfn() for an absent page and keeps its
> frames on a punch hole, so tests cannot exercise a provider that backs
> a hole when it is asked for a frame, one that backs more than the page
> asked for, or one that frees the frames that a punch hole gives back.
>
> Add MPS_NEW_FILE_FILL: get_pfn() then backs an absent page with the
> whole 2 MiB block around it, and put_pfn_range() makes the pages absent
> again.
>

Can what MPS_NEW_FILE_FILL is meant to illustrate be illustrated with
the ioctl that sets memory present?

> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
>
> [...snip...]
>
