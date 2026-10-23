Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777343;
	b=KVyrGJJX7HblBxCb25H1C2vyiiDlgVD41Bzbii38yEYkgxxEHLeESZ3PxxvsYsJ9Dftk
	 DY0tAPAIb9xey4uz/VggAQdw5sKpKqgs8hbpdYgT/edS9BkBw6vot9+Mc+ahhte5XA4tq
	 j1ZwXhDw+5F+etLb06evCBbQvsQIQjB1RfDW8clu8iUrxjT6eAZ8GI0yo+GTz1Hdzx3vm
	 S44bp1VgJg6I3KMkEOmp+W0RFdu1IegdnQT5B4ieFjYZN7kata4AtwAwSHDv8gK8cdzvr
	 SqwQkE4kZjizXlM8jAUCKoIMVDZ9rXblAxmBORKSCUsCEE8Kh076BaRtch2OwcbY+fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IArJW2D7DC4NrWDvM238weKBxrWboHP+GmGljUSheNA=;
	b=CU2LSzrB7yi8P4L5id5hlambVZ83sAJXsDCYW2+iXV1LdwlmWyDAIw6iE8NpaqQZxbn8
	 eazNc2aLOlszKrGa25Pre1Z1myen4KY/+vyAmvS4ppwY2d51KJULn6AimVoVxnLezWEDX
	 EV8HRT63e1trkU4rMwX0AGZ/tnTvgg/tdoRS5I7hext4gDGFrop6WlcJQVrmRNcmFzz2p
	 A7qbaFW0PSCXWom4ulg0ZQ+GEpUOKE5IU/TgKQP1TPXQXE4j8GiBm0yub+ts/8QojhkNJ
	 tUKSzeoKR1r458JpyfiwCmE+4pJIbfz8byZSSQZBbHIgOKubFpd7afxtuRZwG9tuGOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNIC0NLf;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF10606A31B
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 17:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF10606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNIC0NLf
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df4f540ebso674825f8f.3
        for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 10:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777341; x=1793382141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IArJW2D7DC4NrWDvM238weKBxrWboHP+GmGljUSheNA=;
        b=qNIC0NLfXvl5G2Cz8IbLj/voOkVHO2zU/rx4Mr6ZP4GgvrFmbRsdFe9rJHYad+hO9L
         OsGuaF+3Xl2TQBPth6x/w2MzcXQhlNBUPYIiaB/R4PNfFEyrDJZJ50cncW1PdFtHMfIM
         PBDKsH72l757lCpZXad49PaZ8T9yEBIUQPhs/oq8dwynRlCdaNGlDKLWhQGSYmVVSeTr
         i+AbYz/x5M5SHJn6XgVn/AS38+Uj46WZuRrh+ehFvVhIhZjaJKmDCvuhCj/Q3tGpuOq5
         kLeGRnBcKogqC5OYI0XnOUG2ZTYrCMx4yPbBRvhj7rH8/iB6AYWppCKA4E5//8ZG5O62
         MJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777341; x=1793382141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IArJW2D7DC4NrWDvM238weKBxrWboHP+GmGljUSheNA=;
        b=RO1ogZf8RSioig53BySo6LMPDc05o+/+RchMDc1NB3oKPKbZNiP7NB7VVANAj9Qphy
         2bBcSHpFOwUyKSHWbw1A0U8RXcMshiff78Il9lK9QVTuUR1HUQAwcEE7vZM0yNToODRY
         COYfRMeQSxwmN1WKYqNuwUhpWSpEDwEFgVGQ8fqzeS2vWa9CSXcyY51b65IXFy552uz7
         GsHI/teTLo2PqpNew+5aYMiiE6Q/sXBmRzFVHNLg1yafpX6jSi4k51uIMnJdErDpeQeI
         FFfEo7IHptk4ciHHoV48m3asLrv/E09J3qRLRYRcAno6Ej3ThfigRvkS+yC9oJAqKnxW
         kamw==
X-Forwarded-Encrypted: i=1; AKwUvBzsXgt4NdmbP7sB9mWAVNa6dX8uUor3XWKM+UOXBlE1Mv0hPUOH09uoCVJmMlznRlIzUosk@lists.linux.dev
X-Gm-Message-State: AFq9FYK7+p0EUJbq48B3R7Ri0xz/H9LIakd+ASzlhKFz6d36tPbtZ8X3
	sYlhTs3ik0G65KZlHaIfQQUPwQfvz3VdNkKc4R/oXsaGcfRXOeAAee2W
X-Gm-Gg: AYBFou3TJc+8M+mSiZTGAzyrNfn6nIfF5vC8uWbiZIxvSOt/SI9WocembcEgaVSmupb
	g/QEe+hPLDSR71LmJPZ4AFFdgJ2vmh+Mkipe1JiasenxLSZMSZxeumVj02NWpqSIw2O57etT+3N
	rR7lLhI2ADln5tTnzMpfOD4wJA50GPh5PZHV+i9SnycgGH+PXDCpMcMiEdgkC1gOTA5KdVXN6uu
	ryl8S1UTnrK7oyAdyS6Q7gTOoI6iMi9sp3Nq8cFFX6vSDpMP1aYdpo78dxpEI20CMwy5Du+dGrt
	QUAHcwhVq9Qdc2K9KNom3LBBondg+WIeGLJ4TkoJp6gICq211CzilFB+wU9lJ+Cz8JQfCvfnnK8
	1ORARVTQqMROKPgZR2Mf3eF8EkuLrCxHJYrX7dfWkC6cM0m7Up7VGbzYnUll4C2L9Du/s1KFjSH
	Z09W4FicZgCp1Cs7QqIhF3W3zw+nnAWXPQNwXl7GWYuLRlD+2oKIHl9al1dt+EcMTjBSX8V7XZB
	o5RLseHr49r8oIBnefW5ElS2PMaXrk+TcNhrYxDdB91Q34Hn/pUO74o4sP/x+xbt9j+ksE31HOq
	ciX0nWFXu+4szmIKMRnhpFaPxPI6+TRgfhFNJpHEbzkJs19O7gCdcjfKqe88kAoZ3J4g1O1J5zk
	0We04Aa+AsWmUxc/b
X-Received: by 2002:a05:6000:98e:b0:48d:ea67:79d4 with SMTP id ffacd0b85a97d-48e385af0d1mr4196895f8f.53.1792777340908;
        Fri, 23 Oct 2026 10:42:20 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d40c182sm1118217f8f.34.2026.10.23.10.42.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:42:20 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexander Graf <graf@amazon.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexey Kardashevskiy <aik@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Connor Williamson <connordw@amazon.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Erdem Aktas <erdemaktas@google.com>,
	Frank van der Linden <fvdl@google.com>,
	Gregory Price <gourry@gourry.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	James Houghton <jthoughton@google.com>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jianxiong Gao <jxgao@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Joey Gouly <joey.gouly@arm.com>,
	John Starks <John.Starks@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tycho Andersen <tycho@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	x86@kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH RFC v2 31/50] KVM: guest_memfd: Support getting PFNs for stage 2 from providers
Date: Fri, 23 Oct 2026 17:42:18 +0000
Message-ID: <20261023174218.54790-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com> <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> +	if (kvm_gmem_is_pfn_mode(gi)) {
> +		r = gmem_provider_get_pfn(gi, index, pfn, max_order);
> +		if (r)
> +			return ERR_PTR(r);
> +		return NULL;
> +	}

The order goes from the provider to the fault handler unchecked. MPS
reports 0, but a provider with contiguous memory won't, and then a
fault can map a block that the gfn and pfn aren't aligned to, one that
mixes shared and private pages, or one that covers a page being revoked
or converted at the same time: only that page's gfn is marked as being
invalidated, so the fault doesn't retry.

Clamping the order in kvm_gmem_get_pfn() to an aligned block of uniform
attributes, and widening invalidations to the surrounding blocks, would
cover it.

Fred
