Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281789;
	b=pQtscRqDGQY5oDY3YZMakr7gku/jqeAo2x5THRchZZmgl+wpkuDRh4TKvKgcSvlWNbYM
	 3YDHSQ1LGV7bQ8br2KzgirfWMGWuWqLztlDYj1izhp+Lo34pPy+UMQu4igEvfjhbZF+39
	 S/O98gGxAJ44bG0T37R1jlW9ji9yZyAHRp5CTEli6kJ86jXDD2q206q+7XflCzif6d0Im
	 V3P/CwMxd9X+MFHskk5DmxbVGbErvfBge8KLPtUZVo/rnI14/aWRSXOCL0fLlHfQdeg8L
	 WcSo15lxLf+ju3Lqdgm1UTEQNAVuUF7oQed3zXvW9PTZ61kpXx6MVm+lW1MxOqyCHPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jdEzrVvS7er6a3IlsJnCTgJPsgC3VSLy9Xk054XJvXM=;
	b=dd+Ry+Yus6TFvAsU/HAlojFXdIPECufZMsE1u4xTlbdfkAXPeHCmbleIVs9rTLntfG39
	 RX60kz1xddUlS9qwu/8J8UIFW5H6N7mDP/CGdgXHVVl+BB3iXSqjDqHmgyfgIXpEjagV2
	 VLtpAh7VW3QsVhobzPQf7M0e0dtV7qL8n2LqOqTHptzf8iKqfwN5ingArp99UxSqodvyT
	 O8yG2Z535ycsAQWUXZqqosC8H44TNFjM60djZMg0umRjCx0jZsrfV02uWRG+x36NTKnMm
	 YMxaVUvAgO/BitcnTTKyGtWhbI1Sbr8ngnZ1bVWnj1Y8p7q5EPR0GKpkfBZ3U5IYm4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iRUmJav4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E28606A31A
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 13:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E28606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iRUmJav4
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53644ab1f7bso21356721cf.3
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 06:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793281788; cv=none;
        d=google.com; s=arc-20260327;
        b=N+GYrcVT2EO/Wg4+4uUo9oPwWBeipT+z7ozBIZnjlMQgGEtqujN08EF3Nkqcj34ywv
         uQKXs4RlFOAprLmc9kzW6OQ9lBHTJ3TtOHmA+VvjnoztARmdd0Ep0o8eDGKiF+aH6An6
         +jenoC8GoSpe2GS1grz/shMvej8qdcdmKhXhbdsH7Ny/nYFvmQMepYalf0GGxzo0tbu+
         YXDRvdS5f+RE2hQjeTT3daG+bardAE4Ue5982m+muZPoBja1A3nvm6AZ041dluxVj9wB
         lKx6ldYKSf4uYasJMyq6HWIk/njwdSW679qvJk5cHS+9MokY/81uk41SMDW3LbA4fU2m
         X8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=jdEzrVvS7er6a3IlsJnCTgJPsgC3VSLy9Xk054XJvXM=;
        fh=4h9DgpvCdpsckona7i7KW9Zi4SEWSC9k0XA8A7/+/5c=;
        b=r/nfyBH3gCVW+dhC8NjDtkHo/c6eTnwHeiObyy0DXUo5bdTx/NdusYEsEGdyNTz/LE
         sBkPXpjuq7HxtdX1L6P8fldTMnFTNeBW7VcTuzbY+smLPgaTbUU4lElgl/8tVoij7peG
         0yK5Q2A1laZefk8RRD9y5Je8Q+3d6dw77qfUp6dLBvHG8OdNFf4LXIsrbD6IPo1tMgOx
         wdo/dMoqhnxwrDsnkCBSoARQ3lqp21XWtEbpS4gCT20G286a3KO4p3nL3JXYoNA8rMWE
         34yTuVxk1em0N6ujzIKOPF4+946dS5E4W1OIn+ssttaAbiRi3bl59vtZliorI4Ni1q8w
         UX7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793281788; x=1793886588; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdEzrVvS7er6a3IlsJnCTgJPsgC3VSLy9Xk054XJvXM=;
        b=iRUmJav4imPeaDLg4Ho5sPg7k94pb2pKA9pz18BECoTcWfiQORFkoe2gVTIIzvgDzk
         mXKjNVU/nmqwhyfZu6rszxgcbWERAWgJ8uKrbnmWSL7qIzTafxM9+5wU6iXL94h6CFJy
         k8d5TtUUl0TdZY/Wlovo1jtkVyHRWQSaadxjo5W9qdvvMLLBgVdUJ+FkZUXHsJk+NMmS
         TFauL4t8E/F+tnF6nMsNH0qNh0zw3xylEv3zQ7ZZ0UDpjYKLbVrhlj85Lc4E696KDBzj
         WeKvOaw7aE/1ma+dR01HoywsWv1NCG0WwrDAqk04gd76XDvwXxHtGXrMtpL37vPV4AW8
         eD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281788; x=1793886588;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdEzrVvS7er6a3IlsJnCTgJPsgC3VSLy9Xk054XJvXM=;
        b=nTL/yCV+roLd4snYagOv2XSIdbpdGGeVtpimsrFsSrdW+RdHhYmTfih76itNOdjnZa
         qVca1ApEVDAiXwn7l1kJGDFdYwwG8jm1y7GD0BAxmQopeQt0lL1yH3j38o+kf7UY0RjD
         BG5iLEl4y9Bd3qv+5j+opv88mT6UXtAuE7Ies2ULWs3xDOCP+2cPCSKtjAcIJFA/tCtl
         0s6+jCprxR7w7hozBSuMzUshAIJwjL7hqJKAVjvF9JdfVe1xHZdXP2Sk27BJeBNLChEO
         lR+GWzA09Kgzjl73wc7+aXD2bA+/1xbMVWvCTEnOeYstCOAlFCRwpUarCGSCsG45TcZe
         gopQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuAIfn/SjCEU7+byMnNBPEHMVoGS3fx2QuoGaFIRWDFVE5M0ka4RaqH06uITy2Z/lflSjE@lists.linux.dev
X-Gm-Message-State: AFq9FYILkvoVaE8f89mDWEeARty4FvlT1xwjvtR+Ni0tTXk7uIjEmIyb
	RIqXiDKrPVkVydDiCksceWGGCk+0kJhFHE+lC7MC5lrlvADcncPfEwd3Dwz3J88+FR9P4xnVlnF
	9V5ZG+58xhcqltL9TTxW80EznZ3tS+nxGyPYmL2y4
X-Gm-Gg: AYBFou1qhigRLE85tjlbKodJYM7PnAx2xnfHUEAai8PSBLDOcj0XuCFtkhEWDFnlCNX
	1VlVX/sEwxUsJXCJ2E71cBKrb8EkP9b0y9rH9nohpfO+JZk12/ug8Nu9cGkcR1PC+C162UrqCKE
	39TV3EQpiF4H1asrVu/brW3uRr77l9XrDUzLSZNcJyfxCo7iRFhJHNeMcMKXyvQyv9L8qavaMWd
	Vr07YxmVygOzIUzM2L0K847OZQ888AT5qOZBNCxsJsKXfUjlA8GndKMnumB1QjEp4Z72ZRA7KuB
	Z8qhaoayLKRx5cYKvg+cx8gAkz1jqHcF1REqPjNsq25GybEVv2t8PJJduAKoDsv6Q0upXYg6b7e
	Kd50eiLWqkZHvqcFFhP9cnRS/s0jb8Rv8Gz7m9D2I/AiFzPy19QNAHEabcbH49lrUiw==
X-Received: by 2002:a05:622a:394:b0:536:702c:f8e4 with SMTP id
 d75a77b69052e-53fcc9c38e1mr83446311cf.49.1793281786016; Thu, 29 Oct 2026
 06:49:46 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 06:49:45 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261023172347.88443-1-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com> <20261023172347.88443-1-griffoul@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 06:49:44 -0700
X-Gm-Features: AclHuK98-PJmC38q62LJKPyoT2Xn1t02jBqXVrJ0iSGV7iV-HBBvt2AVL4ugH5Y
Message-ID: <CAEvNRgEsGrhrRk2DcbrMNY3zWko_eXP3-FA1dGRSGYphQtBpXQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 31/50] KVM: guest_memfd: Support getting PFNs for
 stage 2 from providers
To: Fred Griffoul <griffoul@gmail.com>
Cc: Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.de>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Alexey Kardashevskiy <aik@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Ashish Kalra <ashish.kalra@amd.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baolu Lu <baolu.lu@linux.intel.com>, Bill Wendling <morbo@google.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Connor Williamson <connordw@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, David Hildenbrand <david@kernel.org>, 
	David Rientjes <rientjes@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Erdem Aktas <erdemaktas@google.com>, Frank van der Linden <fvdl@google.com>, 
	Gregory Price <gourry@gourry.net>, "H. Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	James Houghton <jthoughton@google.com>, Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jianxiong Gao <jxgao@google.com>, Joerg Roedel <joro@8bytes.org>, Joey Gouly <joey.gouly@arm.com>, 
	John Starks <John.Starks@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, Michael Roth <michael.roth@amd.com>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Steffen Eiden <seiden@linux.ibm.com>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tarun Sahu <tarunsahu@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Tycho Andersen <tycho@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Zenghui Yu <yuzenghui@huawei.com>, x86@kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Fuad Tabba <fuad.tabba@linux.dev>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fred Griffoul <griffoul@gmail.com> writes:

>> +	int (*get_pfn)(void *provider, pgoff_t index, unsigned long *pfn,
>> +		       int *max_order);
>
> Should get_pfn() also return attributes of the frame? Only the provider
> knows them, and every mapping of the frame has to follow them. Two
> examples:
>

I agree with you on this, we need to let the provider tell guest_memfd
(and IOMMU) more about the PFN being returned.

> - Read only. A provider may lend a page that the guest can read but not
>   write. I know you dropped this from the sample to keep things simple,
>   but without it guest_memfd maps every frame writable, and there is no
>   other way to make a guest_memfd page read only.
>

I guess read-only would be the equivalent of !VM_WRITE in the VMA world,
yes I think that should be supported.

Other than read-only VFIO would need something like "cacheable" so KVM
knows to map MMIO as uncacheable.

> - Aliased. The frame is also reachable somewhere else, e.g. a ring
>   shared with a device. Such a frame must not become private; see my
>   reply to 34/50.
>

Are we defining "aliased" as something that will never change once
the provider considers the memory in-use by guest_memfd?

Actually, I guess the question applies to read-only-ness as well.

I hope we can say these attributes will never change once the memory is
considered in-use by guest_memfd. Otherwise, I think we'd need

+ Some equivalent for folio_lock() to at least hold these attributes
  constant until the mapping happens
+ Perhaps some other callback like .can_convert_private() for the
  provider to dynamically query.

I'd rather aliased be something along the lines of
"cannot_convert_private" (a concept closer to how guest_memfd should
handle the information).


Glad that we're converging, thank you for doing the rebase!

> A u32 of flags, with 0 for today's behaviour, would cover both and
> leave room for more later.
>
> Fred
