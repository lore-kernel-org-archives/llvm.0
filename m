Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284080;
	b=o9B2ijN7mallKltbgZlG25m4+GAlCbC/RfYSmv0FrQsoywCxyhz7TqVUt56OtubXcIMC
	 4U3knYv1PIH4KjPh6frCnkyvpCnOLZkXRyppC7YnrJYDZmncYrcs9GMLow6K4jM3peNzY
	 l8nspfdqU8PszcNEsgzmH5Q48agh2UQ3R0qcnS0fn0iEkVaToTGfy4I0zpu5m+bNvFuuZ
	 DU/3O9x5yrNjpJlOFXMGQsHwT4WGZV9f6xetHXd9PCJU4ayQDMziPm/CPzx38WehPxUN0
	 /eJHH11aan4Xx8bD88DEfGQeruOrUhf0xdIx3zNomy29ZWv74OYx+wTIUemtVZWzFzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gO96Ic3QVCctvLn6OTuZFYeIzqeAoDK7wy79tyihoyk=;
	b=dqe9oDRIslI/mTbRZG1nDuG1mLUXXUw6AVWAbVYhHp7FaEN6nbCKOGoRdfgu1uZnAgnr
	 kwAFLCtfMRQqsqKiO2a3fj4kebF3MpPCyNYVJLrEnjHriR/CsLwsHT/1+orlyt91a9MhM
	 AspXI8HwNqD4TaRd+ePJm/mFHnNOD6SVTQ4Fu+gVx4Orb6n+vLJPYfgZc7zIquVbI+7Wb
	 +5c5jJD/5U4MAC0Z/chqdhoc8+E+TBB/4zFezclVtK8X+Sthgk5bpCKD/4fVQM8kk+3KV
	 eJ9dX+Zss+W/SxS7IaSGeKmdLUxmOH4pjnVSdBqaoJv8yW5f9EiH2tQlTx7Sgd7+1mA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fcnXFa9V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771CA606A323
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 14:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 771CA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fcnXFa9V
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so1091723a12.0
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 07:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284079; cv=none;
        d=google.com; s=arc-20260327;
        b=GkFJ6QfDZ2xWGU/nY1uzD5XgdtBr9Tk8xfhW5AUR8fmnhJ73ifbmeZmqRMhQvd09My
         tybXG/XyXw+Ja/Eslta1MOJDKjjDzBV3KXTV6HWGQFOlElwd9vS2JUzVkpuoinb+Fnjj
         mk6t8js5lRPmpAaw9t0pus63avznPEkgzCkHPL1P0QZhx5Q4wkecR4AWQvOy22z8gBjY
         grWF5JaTLVHWCzcd4p9GyNxKj2/X1lFo62/pLdKryB0HKywlUDskuHdJoiR6hWhTp8uQ
         hlpC4/9NZxOJGdkL5a1bZ4V9S3f04arHsb5Z61HVcoUf+w6uHZgFgWhR5IjmOXoyGcP1
         x/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gO96Ic3QVCctvLn6OTuZFYeIzqeAoDK7wy79tyihoyk=;
        fh=1rKC2rPSENQRTkhPW5mBIYKCbJgOgsAqq1EK3fgvHDs=;
        b=Zg5Xg5UegKhoriO5ZlgsEsC4dLtxB8OqSCnNq2z1yvVyvfPXM7iRi2eAqzgiOL0QJB
         MqsIN/ED3nuRQ2L4s46OMwR4eiNOaylG+Ri+TG58cBSXGtkr33NzZFcUKLN/dlDOA6o1
         CLDVC/9b/1ioRCFXfkLglYVS0ImDbsyaatzzAM3Pa99V+l5OEbL461t1d5tkpcKGJfkf
         cRDVUZfj7Sy67csI9GkH3svzqJMOdiFVamlqifm6hrsmJuT198DzfGzBxn5q2fZj+vbo
         ggyKUS08GHD/lbP85vrN3IRMGzLOCAdPJF/j2R1OCohUawUTlIAABqmATj5Sep1SDvtF
         qCwA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284079; x=1793888879; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gO96Ic3QVCctvLn6OTuZFYeIzqeAoDK7wy79tyihoyk=;
        b=fcnXFa9Vjh9xwDqXCIn8UNLmlqUQITR4PtVSoAndC/wHr+lGNNfsLT0rGU65TyloCf
         +QNLBr/zN2v2HeZubeHUrTUS+g/uZ9qeQCvxf+UBsIOXQ1F7sO3yWNpiIvmnOzIeR3DM
         ZUnVdHjvFIWuZIDPdKfGsZua4wlzQ7gsjUjTb8GuF2XX6zeMU3ayvxJvjIDn45IA94kG
         k2+Os/MMlfmtRZ/gD0i5ZyL7JkYvm2vHkdIXuxtrndjOhMmel1SDi5BYkHQCqhj+8NIP
         v7aSsReo5LBtpxFFrWEE3mttTFjzHAUAG2HmVgk0i7N6+Rd6e7cPmgEoWNH3pWNEJimO
         z7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284079; x=1793888879;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gO96Ic3QVCctvLn6OTuZFYeIzqeAoDK7wy79tyihoyk=;
        b=fWPv0YPUNc95hjyCtK/wBUBZdeFX4dXzy4wI6dImHAg/9332G6fsYizzDHCaMLaqzR
         H5drijKLKfAErFaUJchANzHB2tyaNd3T/2LUR1yHMKaYAcOXgzMx4nzisk34qyVpg7xe
         nPJ4+i3Zg1aB2ueOKLCyxrSdMdJbwy8p98Ws4/RjeZmIZhgNsnKfhKsu4S3YCPYeypKU
         0oJYzExbmcPG8gPgXX0Y8DRyOrv/jLplPsg/WyTMJjcv+ykemQCmadsicjcOOnqkK+bx
         HBnUyXXNNJ+fLdS1/gH38euM9Ay/ChCOhzIvsnohU78Lu2InO76fhlqysLyBZmm7/I9w
         lbnA==
X-Forwarded-Encrypted: i=1; AKwUvBzw8CqoRf8MqHwTJttOapC7cfWB9KvMLed+2pMKVfff7Nq5bCHVAHmC1YEiuvv3tYF3SSYX@lists.linux.dev
X-Gm-Message-State: AFq9FYKq+rNYn1mY6/H9mD+T5jP5EcBQHEm6gGK3AhAremR7pYB369LS
	LRoDhlPxINOcYAMIalYB0dGXyclRU9lpBUM1YDbzQkf+UOG81Q/nqHf9Xlwp44t6ZeHmVD4OwOm
	+EfYCHvn+Qpw1RnhiCmop8u4zMEgaUxE=
X-Gm-Gg: AYBFou0MLMPJ4/0hZFTg5aQl21wANzrWyUPoUPrhE+n0PD4Y3EBU80EqxYzaH6jVEJv
	hHMmjiVf2P0zrCv4Xu6nz/vlhfoEJ00XERc5orMlgj57CVe+zmfpRbvN8I1iWRgUZ55nsiz94/b
	KLnNrzHiQvGZr51hXHx1pHhoOe33N49R8C4iJs+VdazeG1qNsy5IJitOIuipOruPBaHqDZY9VQh
	aslx2Zr587e5Vrzo+sCXO0xZ9oKlV3VX2x1jOzTiwfdFGI86uZs5jVdtbKgo+9GK8dNDj6MsyRs
	/yy+SnWwjFsQ+SbCushT6myqUFkpm+daeaiJMoFLkRfqXFnRCxz8MWMbAO49J15ldMFTugnlS7b
	UPPBqv+joispoMZehnVRozB46sFvdaPOIumZU5g7le0t1WWbcPUVIutNCZo7ZQFUvKOhnqQ==
X-Received: by 2002:a05:6402:4508:b0:6b1:bb19:de98 with SMTP id
 4fb4d7f45d1cf-6b4b0b09dcemr2163933a12.1.1793284076799; Thu, 29 Oct 2026
 07:27:56 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com> <20261027154649.91571-12-griffoul@gmail.com>
 <CAEvNRgGn09qrCZjUM5sdqQohPWE62GN4c52iK7ZV_gi5wro_Ww@mail.gmail.com>
In-Reply-To: <CAEvNRgGn09qrCZjUM5sdqQohPWE62GN4c52iK7ZV_gi5wro_Ww@mail.gmail.com>
From: Frederic Griffoul <griffoul@gmail.com>
Date: Thu, 29 Oct 2026 14:27:45 +0000
X-Gm-Features: AclHuK_kIg9XZ2cFnZL0tpsqSJGFt3xKJOd_xbKB2NrNWZ3oy-bCAgu9pf3hZSM
Message-ID: <CAF2vKzOTd=0rmMXvtAE_SzbbZ3C9n9jTcjM+Rj=ovFoYBsXCKA@mail.gmail.com>
Subject: Re: [RFC PATCH 11/14] KVM: guest_memfd: Add kvm_gmem_restore() for
 PFN mode providers
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, 
	Alexander Graf <graf@amazon.de>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Alexey Kardashevskiy <aik@amd.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Ashish Kalra <ashish.kalra@amd.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Baolu Lu <baolu.lu@linux.intel.com>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Brauner <brauner@kernel.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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

On Thu, Oct 29, 2026 at 05:52:40AM -0700, Ackerley Tng wrote:
> Fred Griffoul <griffoul@gmail.com> writes:
>
> > kvm_gmem_revoke() does not fit: it would
> > zap the guest's and the VMM's mappings and reclaim frames that a guest
> > may already use.
> >
>
> I'd drop this paragraph from the commit message, kvm_gmem_revoke() is
> the complete opposite and isn't a candidate at all for the goal, which
> is to notify importers that a page is now available (and they can map it
> in).

Sure, I'll drop it.

> provider --1--> guest_memfd --2--> IOMMU
>
> 2 is definitely required, but why is 1 required?
>
> Between the first .get_pfn() or .lookup_pfn_range() () and
> .put_pfn_range() or kvm_gmem_revoke(), the provider should consider the
> memory in-use by guest_memfd.
>
> When it's in-use by guest_memfd, then guest_memfd should use --2--> to
> map into IOMMU page tables as necessary.
>
> When it's not in-use by guest_memfd, why would the provider force it
> into guest_memfd?
>
> If the guest VM knows that the page is now usable (some other
> communication channel), it would touch the memory and do a .get_pfn(),
> that would be successful this time. Perhaps that's when --2--> needs to
> be performed?

The IOMMU never asks, and the CPU may not touch the page before a
device does. A few cases where only the provider knows:

- The provider gives frames back with no guest involved: a page that
  arrives during post-copy, a range moved back to the VM, memory given
  to an overcommitted VM.

- The guest already gave that IOVA to a device as a DMA buffer. The
  device writes it without any CPU access, so there is no .get_pfn()
  from a stage-2 fault, and most devices cannot fault.

- A read-only frame becomes writable. KVM finds out on the next write
  fault, but a device write to a read-only IOPTE just fails.

kvm_gmem_restore() doesn't push the memory into guest_memfd: guest_memfd
only passes it on to its exports. Stage-2 and userspace mappings stay
lazy, and iommufd looks the range up again and maps it.

I'll make that clear in the kernel-doc and the commit message. Would
that work for you?

Fred
