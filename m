Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793278364;
	b=UEFbLLocKIrCanxv/N0Y4t8xS16mxCOmFRrjv9p3cqrhl6pO4378Qbr/6EoF5ZsfJ5MY
	 Vn6KMhi0qVSaZEGVF1c2mCeMBPZyGCMcNdZMpOfmNqNR1XYy6rqTbH28ia2l6G7+SmfzN
	 XVDgB+Dey6hToqgkj4qiyxQbviHBUpdRLIabsZugfIAi37M/9U1I+4PkCmuHhXrMUZS4r
	 Ab9FfRfY4DvFw4ONvmcKEav2Dj+iqSZoevr8YfUX7nN9x91SbA638a+pjOqgy4K/gapCO
	 566f3EVuz8fRT5jGcnhCGCR2CEJlhAAl81qvrUkvabGS7QMvc9j0MuDfD1qHpP988lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zf2xViTkAeLxB49iEkeFNan7sx9Snfm1yj/XBegFK/Q=;
	b=VXhVzT21v63IfJGKGdjfFYMFcW3ZEXNTOZXUHg96mY2lQaxHe2b7qNeUSJsMoXLf9XRJ
	 MaXejozlIgM7ffgKPhA1kDLTU2JHnxQZlo4dKI66wMH0aNMiZjC1pyxhK9QeDcGpptxDU
	 ZU2ij9pzj17l8O3lc9CHUfHUkLcW/3X/mYa2toCIXkUCpqw0xzj5Hfg6hlSjIcCcMHC0m
	 RSnns4Ihmiy1gNm9UfAswN5UNENGl8AY6Z+nlmWzQwVKjevoQGiowuXNWSafhriDFDY3d
	 b9Xrm1EMqeQ2YLVQhH/xVo1mpmxmnjM2zguElhY77GbfzROocVFgqruUdGmGx0sbljw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AV1Hgm0i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F78606A31E
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 12:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F78606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AV1Hgm0i
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91c7b00a75fso23335516d6.2
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 05:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793278362; cv=none;
        d=google.com; s=arc-20260327;
        b=VSXHydPcc2FfgrkH8kcYd7LO+uV65qFutV8U17zLmLDpABtQRJBeOgzUjYlE/u/GPB
         tXuKIslHWHxkWYQkvdUXhj7706XOWxFCfKhlE7NZ+RWWOzA7VKWe49dFRTWqsS9BOzQL
         u0x8uFKmu/VWMsagstH9FJn9sDCG2+LiRKBqNLAcfVoSsR34suDzoNYJnq2qLvwCWKgF
         5dirnFuTeDd46WZ8AQbActAJIm9VwA2dyv61glgBhD7M8myDYM/cVptiEB8D1tb0QwFU
         nz0Kp9tVncrTHe7JgIPxhAGx41aJ91mgSiPaGFmB+rpjkDU55UdxVPuxrXDcqomNYiHF
         97xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=zf2xViTkAeLxB49iEkeFNan7sx9Snfm1yj/XBegFK/Q=;
        fh=ttFeWcNugsB7v2P2Xw9R+XGyRUfy0pDDJl1TLFAg22E=;
        b=UG17pupQ1Pz/4glfi6hTkWSASP47R7pDzm/wRKGdt8M2qhJah9X6LkD8NrqfiSrp9b
         J1VcwQMjLAXSRN0k6JcBNTh2uAgllJLlu1u/NxGVm7Ek4g+QYNPwZ3ZxGJZuih4pfEOy
         /dKC0Pbext5mo3RBOeGU8bC1Nz65DFfnOACeZ3DaHGwKsmvvTh0uJ8MacvD+dz1QZpqN
         Wj8GMWyQ4mczLzwdgwj/XxBmg3X+18ubY8w/9YIruIZXgBHXTWBne2xIzMZEiARgQKxL
         IYTtNzpIWN7Co7npErBymuVEp/xMeXHQOd680oyxzn3iD1RmFs9SOSNZXqsVYOpTER4m
         b0IA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793278362; x=1793883162; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zf2xViTkAeLxB49iEkeFNan7sx9Snfm1yj/XBegFK/Q=;
        b=AV1Hgm0iFHWzZGsDVHXCb2IYpeVv6EW98uFBcMPayNo5zowTitCRsaZEsM86QmXaj4
         hchpPqMY9PX1QQ2cPWm7vibDab93DeznX5yk7hBYy2fD7m6S9H37ihFFsJVywMnUn75w
         hojAZQ+/1QdS3oLsp7dKNIsW+idqKsMz69t3b7KPR4Qk9zpRsv1l4rI05Ii8mXd52ucw
         CK+xEBLrvAhnttPArV1xrrGrmOmUEPHf9svnbV+VbJXuZWsb0/+niZ1X5HYCsaKiAoKu
         r5d7BhOrxqSShvA728f9VawWElGawpqef14vxNHyh+lc2pkaviE7a8Qx3izPK2q/RAK7
         ajnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278362; x=1793883162;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zf2xViTkAeLxB49iEkeFNan7sx9Snfm1yj/XBegFK/Q=;
        b=ZTuB90C96NkQtHCMUqJV2bRDwPrdd4tvdNr+7fCf3Di4RkNMOKLZV0BWffQp2xd9yK
         LLS1yBYn5zfHQgqvtx9bdB6v/Bf6W8NYic7pCpyRwbZ/W2MFbtxQ58l3kMYcUU5Ngpba
         9XiIx4eFDv19Xe502zfrILcUftMu/faHUj9jVT0F5m6Ml+9LpbnCAwZUP/PSqN/iJJBi
         PXc3iphlYcbz16NDpCFx+RECu+ZD26zc4GQBviypyTHkVCpMdaBA3TZGNrETt5/erdgQ
         /Uz2tkRAGzu07NDVjgEcNj8ahdjNwPy7o8fQ4YxGWkTXO2h43qF2mAFFYIx6JXTlXjB5
         se3w==
X-Forwarded-Encrypted: i=1; AKwUvBzi2ji5tb80JVWh7du5kW8lfbyhNl7crbXzLx2YvauQIe+Jn4G3qYmcDLg5a92CVtFwO5HW@lists.linux.dev
X-Gm-Message-State: AFq9FYLizoLHJ3ISfxNsHZVMbtR+zNc2loWjhQ4xnYslCKFaUpemnpRo
	XutL8OKnNzPejFt3B7LxEl9voAJBMsBqrFqzU4d1jRug6U0eRHPPhFLqW6E/EXC0zVEUPkevReD
	q/dYvvlOohjhSKuRIfXE4p2GQABec8jxqK7gxA7AY
X-Gm-Gg: AYBFou1u22B/u61cqPqgOlbD3wBiosbtLVYA1UI1ShoOUCXchxIC9O8v7nP8SFH6Zk3
	59v/KNIfkKFKjETMZJWWCd+lAIL/axbHdWqDa2RbvcGI+820S7dlbutlPiI6Yy4gcUBH1gtNtNu
	wzYd23QeyT24BWsoCpJTWlxWOnfMp7SeeeS4EGfrg/wklwic/wdJpC6871jWHVU4ReK9Rn5MbYN
	VEIdXn8S5tc3nwSWHV1WCltgbluFHFtcuqBrCtOzAU1llD1To3/BYK5KElgZlDnnv2NucDjtgW9
	yS8nqMRp194Hmu46ZYJ7+ZkvbxMfb2hPR57lycRaIjfC/Lh/xOtea89p9TkdcG9blZDYlwBOs6m
	BFxHl8UB4Gh2Kpga+Bg+tOL7RyJ0FMyd9bfsx+zZXnTYbb7QlzPZr+Qplsrr/NfkGlA==
X-Received: by 2002:ad4:5747:0:b0:91b:9496:6a18 with SMTP id
 6a1803df08f44-91c7d1ae53bmr83041376d6.37.1793278361370; Thu, 29 Oct 2026
 05:52:41 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 05:52:40 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261027154649.91571-12-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com> <20261027154649.91571-12-griffoul@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 05:52:40 -0700
X-Gm-Features: AclHuK85LBuCmtDdaaOWg4OEyIMQUVa8mDtLyPY6JdCBNPTut6N07RXjZEiRQWQ
Message-ID: <CAEvNRgGn09qrCZjUM5sdqQohPWE62GN4c52iK7ZV_gi5wro_Ww@mail.gmail.com>
Subject: Re: [RFC PATCH 11/14] KVM: guest_memfd: Add kvm_gmem_restore() for
 PFN mode providers
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
> A device cannot fault, so when a PFN mode provider gives frames to pages
> that had none, or makes a read-only frame writable, a subsystem that
> maps the file must be told.

Totally makes sense that guest_memfd needs a way to actively map pages
into the IOMMU page tables, rather than passively like for userspace
page tables and stage 2 page tables.

When the memory is owned by guest_memfd, on a to-shared conversion,
guest_memfd would do the mapping for IOMMU, which can't handle faults
like Stage 2 or userspace page tables.

> kvm_gmem_revoke() does not fit: it would
> zap the guest's and the VMM's mappings and reclaim frames that a guest
> may already use.
>

I'd drop this paragraph from the commit message, kvm_gmem_revoke() is
the complete opposite and isn't a candidate at all for the goal, which
is to notify importers that a page is now available (and they can map it
in).

> Add kvm_gmem_restore(), the counterpart to kvm_gmem_revoke() that the
> sample provider leaves for users that cannot fault. It only updates the
> exports, under the shared invalidate lock.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
> ---
>  arch/x86/kvm/Makefile       |  1 +
>  include/linux/guest_memfd.h | 37 ++++++++++++++++++++++---------------
>  virt/kvm/guest_memfd.c      | 35 +++++++++++++++++++++++++++++++++--
>  3 files changed, 56 insertions(+), 17 deletions(-)
>
> diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
> index 25fb3d6e2032..3255280884b5 100644
> --- a/arch/x86/kvm/Makefile
> +++ b/arch/x86/kvm/Makefile
> @@ -63,6 +63,7 @@ exports_grep_trailer := --include='*.[ch]' -nrw $(srctree)/virt/kvm $(srctree)/a
>  				-e kvm_write_track_remove_gfn \
>  				-e kvm_file_to_kvm_fn \
>  				-e kvm_gmem_revoke \
> +				-e kvm_gmem_restore \

provider --1--> guest_memfd --2--> IOMMU

2 is definitely required, but why is 1 required?

Between the first .get_pfn() or .lookup_pfn_range() () and
.put_pfn_range() or kvm_gmem_revoke(), the provider should consider the
memory in-use by guest_memfd.

When it's in-use by guest_memfd, then guest_memfd should use --2--> to
map into IOMMU page tables as necessary.

When it's not in-use by guest_memfd, why would the provider force it
into guest_memfd?

If the guest VM knows that the page is now usable (some other
communication channel), it would touch the memory and do a .get_pfn(),
that would be successful this time. Perhaps that's when --2--> needs to
be performed?

>  				-e kvm_gmem_export
>
>  # Force grep to emit a goofy group separator that can in turn be replaced with
>
> [...snip...]
>
