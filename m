Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776556;
	b=GSVbpn7adCn1s5AEaANjWkXyHDhNuu7DHu2k4EeOhcYPFJfAjo2vHgKqFJCdmSDXDFet
	 sxvLrPdWJXk8I3o7KTcHiAYeEbWANoh4vO831HMI663VCJubRQsp3bFeyOc625ZOccRK4
	 ckNeJX/FlH1gAMCJuD3fURDVsss+Pn3qpsLWo4pRyWK0LgesstUZV1DeJvB835isGf4zK
	 aFzAceRF3dJU4Pcw8Vj1cEGXqKQ63efV8JRhcdLKbGImmFKnDFnL//OnYRPUTpbT9cgzY
	 eB5e39/wH/AzzdtqXw5qM4tJb1vVvhK1UVyogPDs78Gj2GbcSmjtVQ0qtur6L6HmPwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3Qj0y3/sB7EeSLYwSP8RPCK8AZrmLUoRtMMcxttoCbM=;
	b=WyaeyZcdQVwN0hX+v2mdbmXnwXuZghjKoyy1lwHnPyP/DXu18U76LE85h12qYpjqqHQI
	 yKI/3w/ix/zak9mvQnoj0s2gAina5CSSYiluNjA02iqOQnIo0Ey4i7+tKPYx6avMB4CJO
	 PQEXtXHajbNJ34BAkkEADoi6xp8frfUaacPNV/NgvXhqKZO4IblYb5ObYdvp9n7FcpI7e
	 bZ1XLunI+45Lujag8HBQS1vYYKteQk2bt2YiVnAjJFeCScz5L0G0yGFQtb+Cckfq0JFKG
	 +/jx/ZHfS1UstFBU4V8A1ixAnEwJqPkP/MdN8OnscjFgy7L9yVncuY/ohI5UgPReAbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dHT738KT;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CD5606A31D
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 17:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CD5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dHT738KT
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so698192f8f.3
        for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776554; x=1793381354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Qj0y3/sB7EeSLYwSP8RPCK8AZrmLUoRtMMcxttoCbM=;
        b=dHT738KTUzTu4zhCB2JKp4NiLSptKyRTFJGIMNG9FEHHe3V5MBPK2pP9v0xBwjYuw5
         kVBOhgI9WFq+TJU8yEmRlFXlnEjuDhHUf1eXssjPyjLdVd/sJrYQv97a7jy8xPy59htg
         52S1xkpXhTcqwyyCJWXd8aNpoYEBnPDh3688tSCLu8CTLb1vDFuWXoIhGHts7u/ut04j
         FLrGjZxsWZgE7VR0iZnP56z8uPQ3eflbJPS+KoTC5C2Fe7EByITBPScD585ObUA+3KB9
         zYGodCJpEYC+GW2Q2UEBSIzzp7de3pGMtdEps3DhuGsMzIE8jU9mglBXlJIeHJKWp78W
         QOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776554; x=1793381354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Qj0y3/sB7EeSLYwSP8RPCK8AZrmLUoRtMMcxttoCbM=;
        b=Fpoz3qsbM27ujWv8EZkw+H3ZhLOpriLt/ibOk4O3LYbe914OuzuKjhgjhcrBpJ9FvA
         Z4VoiZJpSf0XaeaMGBghTz6UhnOk4CpnX7+JdYJDBUZHJUJ0y8joERw4nvOBZHD/WDb0
         vmiMn3IsIEF2tyHaVfSPOdMnjBR+0ROpgjJciRfEM8oQOnWxst6k/6rJQOTOZrUT9cMJ
         Fbmcg/HlPoG3h4CdplGSSKyF7Mhf3qS7arnOd2QA+DX4ptNwgkF6k70FkRYS9YfSmNlQ
         mh+kuPxVu2XXEjS1XhXjI5MwKeZ243l2EI7UXhNUqD6qgC9Xpz7LXhIyKwf73IrMdXal
         wssw==
X-Forwarded-Encrypted: i=1; AKwUvBzaMVA7R9rYvPPpMeQqYOkiM2mxEmUw6HE+C/tDdmhsyWRtT8in2GFPYrmw+cxNr3ONQyTB@lists.linux.dev
X-Gm-Message-State: AFq9FYK7DwF1b6xThL6h13QM3os922BfShxZaqodEgwAZ2fVnPPRsLOI
	QrM8sD/uH7IulyGIekKaPShXVsPKwPngPX+PyG3SSOv5lYHMpfaqfxGT
X-Gm-Gg: AYBFou0qi9mbH6wCXnDDHV645p1r12P/YXuu9wbZJG0Z2v177POOZ91Khsak8qewaTD
	mI0JNkrQOEvSGKFgUexJKQqGYtI93bbDA4eUZdovRuKPcwtoyKefyYjrLOOvbt8YiNc52XnTXWK
	QmgLx2tckfmmQy2roLza30/Qb24DZvpQ3Yfs7rkJJlqYLQXAJIpWjzAOsOpY9Q6M5eTR/XIrWfM
	+eXv3rPrL0Zyqvn5X0Uj6z3TpZaI0390riPHNFl+7xPc+oO1drNkoHsew8C5Qy4ehP6afoLJReJ
	xI2mDXdb+gNhMHOtoJvVz8bnKLWj5oEVY+FpbB0UXxBgxXhVMrixk2t+34SCtUh1PSEXSf1Jl/T
	Rr1Xug3heIqttcq6q2SSqlLDslK6qY58MKrmsOt4v+KSjlmE15actRtPunhT8hHk+mfOvVz0+sG
	I1XW3viKvZPSwz/f7TZOlEEMZh+e0lLjndZ9pn7ovlvZogQyGoBCceQQQZ4muFga/NGpxtx2SiZ
	VWB9dS0r5sfZnfwyu4990vZi2G6aZNKnhq4bZPnyLfuTqwim/U1etL6g8L4mmiy/4ClNglb5WT1
	mARJ1k8+0xk5l/AD0d8jjYdivhSdYbiAf8I/BWEhWLaPnQGsDMNwlFjUorAOKFb9p3eUZIWrPLl
	WaFFPPIH3IULCgSbl
X-Received: by 2002:a05:6000:2004:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48e387d65ddmr4932292f8f.41.1792776554351;
        Fri, 23 Oct 2026 10:29:14 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4144f8sm1120262f8f.41.2026.10.23.10.29.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:29:13 -0700 (PDT)
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
Subject: Re: [PATCH RFC v2 34/50] KVM: guest_memfd: Skip checking outstanding references in PFN mode
Date: Fri, 23 Oct 2026 17:29:11 +0000
Message-ID: <20261023172911.17557-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-gmem-alternative-providers-v2-34-5dd1dc6c660a@google.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com> <20261022-gmem-alternative-providers-v2-34-5dd1dc6c660a@google.com>
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

> +		if (!kvm_gmem_is_pfn_mode(gi) &&
> +		    kvm_gmem_has_outstanding_references(inode, start, nr_pages,
> 							err_index)) {

In folio mode this check is also what guarantees that a private page
belongs to the guest alone. In PFN mode there is nothing like it: if
the provider also exposes the frame somewhere else, say a ring shared
with a device, the VMM can still make it private.

And it is not only this guest that suffers then. Whoever else uses the
frame breaks: an RMP fault on SEV-SNP, a poisoned page or a machine
check on TDX, a granule protection fault on CCA, or, with
SW_PROTECTED, silent access to "private" memory.

Only the provider knows about such frames. With an attributes output
from get_pfn() (see my reply to 31/50), it could flag them as aliased,
and guest_memfd would keep them shared: refuse the conversion, treat a
private fault as a hole, and refuse populate.

Fred
