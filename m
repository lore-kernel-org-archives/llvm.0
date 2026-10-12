Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABD44B0E32
	for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823411; cv=none; b=SPr7PjhU/x2tXoCliYUZXuSGKK/6VKmPdaluUUrjtHF9y0ln3EGLiyZgaPxzyOqO2ESVqMqCxPLifzMuY+e/NAmkWP84avS21b4FNtalFjxm3tqjc49lo46RG73aNS5A8Ha1f3a5/8H6U0FC85UGVEmodrDfd6GGFz+42xsluJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823411; c=relaxed/simple;
	bh=YwbP5Ioi7QwUqGx5taKPNQkBBbrznqq1ofQNaKTuS/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uiyUo1FJxh8JwuKJb3mI6k9NqLOwX3xZ8AyfN09/mvBApC1NwSIq2gLwIoIG2jaIChdjh5BSJ8YvZ5saN0ESiAQwwDeM9uXriR4dd/8uklFSmRMGxE+BmCUzsF7QNIW2gt6bVxMVKAN53zRchdufn0d9ncsLNj+NvXDS4DuWwtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Rio1seCH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Rio1seCH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0459169E;
	Mon, 12 Oct 2026 09:43:25 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 079303F673;
	Mon, 12 Oct 2026 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791823409; bh=YwbP5Ioi7QwUqGx5taKPNQkBBbrznqq1ofQNaKTuS/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rio1seCHQBt4Te7t4RhbcNCHJ3d+n/oUIqVJElm8wqt2Vu7MiE+o9C4rVwFuckg+D
	 BhxZfbmrGe8wWr/Kb7BqThw/hD3gmUijMMWXIvmLshUbS1gkBYkXb40rlvFMlU7d7C
	 EZswfpLt+Gm7//g8HwbvUncdkQBNVLef5HioVugQ=
From: Catalin Marinas <catalin.marinas@arm.com>
To: ben.horgan@arm.com,
	Sasha Levin <sashal@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	andre.przywara@arm.com,
	bot@kernelci.org,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	reinette.chatre@intel.com
Subject: Re: [PATCH v2] arm_mpam: make the mon_sel guard conditional only
Date: Mon, 12 Oct 2026 17:43:19 +0100
Message-ID: <179182339913.870867.13095111660955040727.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009163235.3-1-sashal@kernel.org>
References: <20261009163235.3-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 09 Oct 2026 12:32:35 -0400, Sasha Levin wrote:
> Building arm64 allmodconfig with clang fails:
> 
>   drivers/resctrl/mpam_internal.h:207:7: error: ignoring return value
>   of function declared with 'warn_unused_result' attribute
>   [-Werror,-Wunused-result]
>     207 |              mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
> 
> [...]

Applied to arm64 (for-next/mpam), thanks!

[1/1] arm_mpam: make the mon_sel guard conditional only
      https://git.kernel.org/arm64/c/8ea457f746d9
