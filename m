Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AEE224B14
	for <llvm@lists.linux.dev>; Tue,  4 Feb 2025 19:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698681; cv=none; b=VRfQGH5I0fIeFMrn66B2oIEQxhgeUF5RawpmnV3XtzOiqcdh4jFXa0XL+ZarS3xZDQUQeu641HvXvIxFmqUQcpCbr93Wa05D3oNYxlb0Ws0ojZ0X5JxLYUePdKSBwjbw0bCrlM/95dxx5z2sxIjo6ieziR5HAEXBI7HH5qXxKns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698681; c=relaxed/simple;
	bh=L7hZ7sYPCCjt4cWuKdRqkFzNU2NINe/kZtlYF3GX+To=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XahMSUOXvsiIr5ntPY1PCOF41Dwdblk7HtLBLREbybbtwR82H1M8ofEiz468LS7Ptor5PZmi8/m8o8eKWK5dNsou0xaFtR+McS9n0GLRNuE0lqGKDl8+YHoV4JXuk4swZciJUm/5bbQ7mzEf2aErz4VlmVhBEEjfNJX/WL6jgjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=jyGtOg/i; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="jyGtOg/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1738695503;
	bh=L7hZ7sYPCCjt4cWuKdRqkFzNU2NINe/kZtlYF3GX+To=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jyGtOg/iCyiwjp/g1mTcKme1MwefVaOX7wySyrZcham7FrqcugOECEhMIB5bHuVxw
	 jxBiJ9xi5y9Ou8aDKij09mJEeZ7EVO+B4CuJIYNSPaLeZ0McyYcgp8ncn+IliZWl8N
	 HZraV3iO1ZSruE8vDNlj7sXOI+AYMSwijILKB/nU=
Received: by gentwo.org (Postfix, from userid 1003)
	id EC29D401EB; Tue,  4 Feb 2025 10:58:23 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id E915A401E9;
	Tue,  4 Feb 2025 10:58:23 -0800 (PST)
Date: Tue, 4 Feb 2025 10:58:23 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
    palmer@dabbelt.com, tj@kernel.org, andreyknvl@gmail.com, brgerst@gmail.com, 
    ardb@kernel.org, dave.hansen@linux.intel.com, jgross@suse.com, 
    will@kernel.org, akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, 
    dvyukov@google.com, richard.weiyang@gmail.com, ytcoode@gmail.com, 
    tglx@linutronix.de, hpa@zytor.com, seanjc@google.com, 
    paul.walmsley@sifive.com, aou@eecs.berkeley.edu, justinstitt@google.com, 
    jason.andryuk@amd.com, glider@google.com, ubizjak@gmail.com, 
    jannh@google.com, bhe@redhat.com, vincenzo.frascino@arm.com, 
    rafael.j.wysocki@intel.com, ndesaulniers@google.com, mingo@redhat.com, 
    catalin.marinas@arm.com, junichi.nomura@nec.com, nathan@kernel.org, 
    ryabinin.a.a@gmail.com, dennis@kernel.org, bp@alien8.de, 
    kevinloughlin@google.com, morbo@google.com, dan.j.williams@intel.com, 
    julian.stecklina@cyberus-technology.de, peterz@infradead.org, 
    kees@kernel.org, kasan-dev@googlegroups.com, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode
 for x86
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
Message-ID: <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

ARM64 supports MTE which is hardware support for tagging 16 byte granules
and verification of tags in pointers all in hardware and on some platforms
with *no* performance penalty since the tag is stored in the ECC areas of
DRAM and verified at the same time as the ECC.

Could we get support for that? This would allow us to enable tag checking
in production systems without performance penalty and no memory overhead.

