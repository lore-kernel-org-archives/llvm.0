Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776231;
	b=zicbx1X2o+zQ4FgzCAeEgW7WrTur/Ro7sgYQR7csW80V0eZjkD42tl8L+1CDRRGqU9HH
	 8Fr6IIUs66Tlx0XwYSZ+VBYr+dD9APrC2Guf3pQtbSTVpuODCcjdShfcu851ddVPr0+7x
	 U0FMn60wB3kAtrewq49PYCtCILiGDqWdg7DDvINo83r01QLld9vO2llMyI4dEqXymo7Ya
	 WSAHAx4f/jY6C9liwlz4jP03Kyi8DyxQ9eA7Qj1GhaC97i6/v62CLZhJ2vv73Zi1VbpCz
	 WUyS6I8EbKVMr+N7vF5lbkMESgt5mHK3YxDAB6tEtCZb4s4rUW2DQ6N0BlTJfPsFT9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b9U8BJjnSyQLu8vlmMN8CV+h3S1yPSnSBNwOLGcNxzs=;
	b=h4+47IcfXlWYffmoJKA3zIh/CqrZWdyz3XL8IQ8AUsEaAiAhL9rnsHmimYC1luYUcZXk
	 nf7S3ZtmxDCcHiP1CrRuUWQZGCWRtHSm4c++L4WCXfBKLixPHhf9SRsbT6JNZ2xMdU412
	 099KeEwjdwZHW8MQSZmknMwhvCUw42NQGkSCLY55+SeuV93PW+6de5IHmIAR2/veJkci5
	 aPdtn07K9CpwIWplPEcONR+6pVjz9ZoW+/ctXA4H3bF9EYjfWK9ILi19zAF902zr19sSJ
	 f3PRxbneD/j2fKgZQtlfT3YLcwY8HN5uCiHgOh+h0IjA5cPvZfKa8HPRWoiMIgxlbQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TaVVvIPO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE83606A31F
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 17:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE83606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TaVVvIPO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a218b13c4bso5045925e9.0
        for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776230; x=1793381030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9U8BJjnSyQLu8vlmMN8CV+h3S1yPSnSBNwOLGcNxzs=;
        b=TaVVvIPOZOHtQhhNXshzVO8PTpjQyiGJHLA0NYVIjJv7iE6xxETIQ/D5iHUsh4lQBj
         /d5IMwB5xYT2bO3FiKSdUcB9g/Dqgk5MGoLoNoVg6TTZZNRnR80BnV5tzpgkOpyP5mCL
         G7BfqRZnhO4aDAAl5PxV25fF5LgxcWk7G4Y1prDQKfNfZ4k7JbanKC76prHTk6K6+h3g
         8KOAdKTF2580yiKuL+5nUNJdCatEAAKMdtP5l7VMG1ZW4LsYQRTT+ObAZABjp3rqSMx6
         MNnI6PtlpPaMe5rD4nzSAh2ZEk2rn5kCvJ591gw+H/SiX+5nu6gcCTEN62F8nBTYG5MA
         vZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776230; x=1793381030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9U8BJjnSyQLu8vlmMN8CV+h3S1yPSnSBNwOLGcNxzs=;
        b=Hn30J032QWPwGahU2B4kBhesYCHGey8BVkDrufazD3eaR1C0DNBSzCJp4EE1V2amyH
         4jKOc6lEJkOf0qfJfhF21FtntM4V2h4g0DdKOPXlQNuv5BmbbnccU9tipNgGRz9yjstO
         pHEnC9Uaq+mEaWw8GC/WaANYFBeIBppPEQB2xdEzs6OgzDUx3nvu0zj4hckFbKXHAni7
         jB3iOxFzTsM1Y7hrrjnGYe7fvCByrBOMg5ID5+F0dVuzTUG94qla80vgxZ9WNI8Lhtsb
         XCnyvVZgiQvDX5PDUNt4QFWuMCI/bWTuySQXzYeMJDK4XE6rm0ON0+6N0O2w4mZ5ePp4
         tLbg==
X-Forwarded-Encrypted: i=1; AKwUvBzI/IUjtoK/EMAOunXtMHOrCmCn8NiciSyx1zd8QttwGJRK6WvSl7Qlxb1ffCjGTaAy686q@lists.linux.dev
X-Gm-Message-State: AFq9FYKT9mz65BNjQL6DtXD0OcP3TnRLVPVHlifbXU0GaD8krMlLM1iS
	SIM/wv4w90Ko9DMKcTFffILNDn/gnyGoJ8Q+rspi5LJxMcNYOn/+TGf7
X-Gm-Gg: AYBFou0+vh8eq2OO5+cxhQsVZjP/9ooZda92eppEzy7GdDPH51nFQNAvCtoEXfCZmp5
	Qt1t+GQ9nJtJt3Nkf4F+HswYfVfPAtkHm9TokBRRmr1MP7CTWMSk7ACDRQpS6tUpfex9az0A2Sg
	OLaj9weARlkuXkhTvQyGC7PdLo10Z2d3pbHND/9AvoJ1u/s04/OQkDTQYYb5SN/HbO0boCw45Wo
	NNElyfafOA5gxB6OoefCF244CEmPBs0HTUymqtBuQ51HwA7zv67DGyGSwG9Mg2+RmUhhT+zWcAT
	oIFECcVcaL4bmVP2bcAKBCuiO/YfmD7zrZlrw4pesGB5BXi72dHF4si9x2aJjZgI8IAZk88oLnU
	uj+2wRBM8wZvJuuPRDY5JSZgfrSKRJfJwEjXJJrJGZqNvZhYiK2S+7iczsWntNGGvgAZ0TQeLkT
	ufjKAl/uAQxkK3ItvmfEtneS5Zr5SWkJthMnZbM25FbnrZ8FhkeRihmAvjZBcG3QRiGy1q9tIqo
	sR0ctSTfwP6TMR8hCSzq1hubUJS3p6riCnf6+05dXPkSnuaeQESOwiUJBIKHdoIQsrwFk+HEAn8
	q3yPMz8wH58/IGaltbxM6grMhnnImOvle05hSfTcI/nxm3NYDUwgdGHUBfyaclce6+TpcD6aE0R
	Z5abZDVeTUnnwd4p+
X-Received: by 2002:a05:600c:354c:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4a211cb23f3mr50233895e9.19.1792776229374;
        Fri, 23 Oct 2026 10:23:49 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a30764e9e7sm17932475e9.2.2026.10.23.10.23.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:23:48 -0700 (PDT)
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
Date: Fri, 23 Oct 2026 17:23:47 +0000
Message-ID: <20261023172347.88443-1-griffoul@gmail.com>
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

> +	int (*get_pfn)(void *provider, pgoff_t index, unsigned long *pfn,
> +		       int *max_order);

Should get_pfn() also return attributes of the frame? Only the provider
knows them, and every mapping of the frame has to follow them. Two
examples:

- Read only. A provider may lend a page that the guest can read but not
  write. I know you dropped this from the sample to keep things simple,
  but without it guest_memfd maps every frame writable, and there is no
  other way to make a guest_memfd page read only.

- Aliased. The frame is also reachable somewhere else, e.g. a ring
  shared with a device. Such a frame must not become private; see my
  reply to 34/50.

A u32 of flags, with 0 for today's behaviour, would cover both and
leave room for more later.

Fred
