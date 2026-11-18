Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026427;
	b=IFQcpqb/xUkKDtpeM84IWpnZZkCbHrW3fxF8GhL8/WgYeS66VhNBlyAsG0QjhtjJx4Jt
	 u+vpo3KeQAccC6tUjn43PuEs08p6gNrxCzMJMN/13qAVDeWT1Gf0u/MooT5MmDqlTBZxK
	 3dGgaqqSMHT9aWKy6RKOdkotkEAwOD+D3bWpuqa2ASgVuapHykIs/0Q3KFGpHwfhAGAqD
	 fROYLTuzWWZvOmikA+GuJFW50E+B/TWInuKA8qe5JhQ9DboSaFLOOV4D/foCOUCLGtJHx
	 TNJvquybCx/lQh35GVtYGAtPz69FqNNUwuKy7pf+Y1PGoko9FEp64y7Ho26t+79J8NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026427;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Z/lgf/GnvODHH2kSfd1ioOa/KiKtGaKkOea+zkHk+YI=;
	b=HWHQPnxgfQFTiSq+XlJIkGOWp+Rv3ExHikvuHG9Foht3UI1sOr9Gn2yH2YPljKyY6ubE
	 JcXEAX9Ii7HTLAD3UsMbvthbajSpVYL5ACQTkg5B+07DcYGaQ5YZK3B7D7eRQX1W4vJzo
	 FijzPgwcV/dAsQRYVayXnIoQJemggPBnIcI3iOKGb7rfQax8mIuil++q/I3c83+TahAyB
	 oz+L1P1XWlFvIFLsf2KFgbRMkEwCGL3sKOb8NGJCYsc1NE6MBrVr7cRTK9GELnu3gX3Fi
	 81dGlGhZCgaFiwf+rW8Loa+Cdnf4VkAfNKNhXG4tbhyOO3zvEMuGiV4h1u23D36AH4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OdFPmX7Z;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8E1606A332
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 18:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8E1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OdFPmX7Z
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E52071477;
	Wed, 18 Nov 2026 10:27:02 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BBFA3F673;
	Wed, 18 Nov 2026 10:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795026425; bh=KD00H1LZROLiORUw7YDn6v/wgRaKM9BnTfzpbzUCeVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OdFPmX7Z+SLEjJNH0jSOiiUGQ/J+Aol+4r8E/VTNF6DOQRuVpf4adrDYexah8mmF+
	 4jDcYK8Wk7NsokRYoqRZ5Qw1H/1WTK2rN/deYIZVtBYReCe+v+Dclr7yWoC3bHHqXq
	 xX5Rd+MsP0iG6Nw7Zw5AUKcb6i8eo2z7FBvm9dDE=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Ben Cressey <ben@cressey.dev>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	kexec@lists.infradead.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Jeson Gao <jeson.gao@unisoc.com>,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] arm64: use typed entries into copied code for kCFI
Date: Wed, 18 Nov 2026 18:26:38 +0000
Message-ID: <179502639864.2187887.8685436920018120058.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111-arm64-kexec-nocfi-v2-0-ddf0c4aa326f@cressey.dev>
References: <20261111-arm64-kexec-nocfi-v2-0-ddf0c4aa326f@cressey.dev>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 11 Nov 2026 15:26:03 -0800, Ben Cressey wrote:
> An arm64 kernel built with CONFIG_CFI=y oopses after "Bye!" on every
> kexec that relocates the image. v1 [1] marked machine_kexec() __nocfi.
> This version types the copied relocation code instead, as Kees Cook
> suggested [2], and does the same for hibernate, as Mark Rutland asked
> [3], so that swsusp_arch_resume() loses its __nocfi. Only kexec faults
> today, and its fix does not depend on the hibernate patch. x86 follows
> as a separate patch.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks! The second patch is for 7.5.

[1/2] arm64: kexec: use a typed entry to fix kCFI oops
      https://git.kernel.org/arm64/c/b059e957d07b
