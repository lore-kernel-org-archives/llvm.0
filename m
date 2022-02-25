Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0ED7C
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 15:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990C6C340F2;
	Fri, 25 Feb 2022 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645804230;
	bh=W5kTJHtuSAdeclyGcjAyKEzb2GWn6NO23yIDCLlIycQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sShPFKynozcZM8TmToRgyPdqEJVD7nYJsGKPxYqckrvhyxd4hyyA+qmvYr/OKBkxF
	 B7EcDXZIWRoaZD/QgZXyOPjwk25M0DGVwbLXvoQs1JTjaEmih85nu2gMDyBgIFqj9J
	 hVuDWk43sHZaZc5vfxqUNja2jReuMwoj0Opk8x1bftjooRTHyMYJIzbaM1k8EdkSvn
	 4XCVG6QY5aa89MNln/N0OlITa9W69eQJ0333wOS4Vk2GzaLGa5Y1bGAeaXxkAtnmYo
	 O+6BxrgdC2LH9EmuNywLib0KaqYAnktV7t+UzES/L2hUOFjHKA36vXJvMDc4gVD+9c
	 j3QbbBAgtWIOA==
From: Will Deacon <will@kernel.org>
To: Fangrui Song <maskray@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH] arm64 module: remove (NOLOAD)
Date: Fri, 25 Feb 2022 15:50:15 +0000
Message-Id: <164579795583.2003844.2115032608594321024.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220218081209.354383-1-maskray@google.com>
References: <20220218081209.354383-1-maskray@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 18 Feb 2022 00:12:09 -0800, Fangrui Song wrote:
> On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
> inappropriate for .plt and .text.* sections which are always
> SHT_PROGBITS.
> 
> In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
> and (NOLOAD) will be essentially ignored. In ld.lld, since
> https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
> customize the output section type"), ld.lld will report a `section type
> mismatch` error. Just remove (NOLOAD) to fix the error.
> 
> [...]

Applied to arm64 (for-next/linkage), thanks!

[1/1] arm64: module: remove (NOLOAD) from linker script
      https://git.kernel.org/arm64/c/4013e26670c5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
