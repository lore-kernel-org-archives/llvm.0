Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4C41AF0B0
	for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728998116; cv=none; b=sOQ/dFtqPlXxtmkr+IBy/lvIVvKeLSMC6KlCimLOtZQoe1FoIhHtrif/Ys9ASV2G/Pz3kZoLf1/GC+lUuXE+ve0GF1oqjZFejnbaZlhqsWtE1xwVT8nCCO9JubGhP1AR3LjBvXXPkt6tj3iSfTJ1EYHfcECN/VJNgPnELBzMhaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728998116; c=relaxed/simple;
	bh=m6H164m1q3pOtv+CZpHZglbzobwhvVqzW768djvjF6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1rca4fYlA4iDvtgCU2rgoymJ0f6EepPccHb1p38blump/eBqV94ko6SC4B/13KuCwaWHQJWtnvDfZbgFK3vAulOqEg2zBwxXmwiSf+D1JkI0C0aqKuAFtQhWMBRpwV59/WpEszWK7YVDhw1FoQev/298eQYC5pj+5UOA5f60y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67B49FEC;
	Tue, 15 Oct 2024 06:15:44 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 454873F51B;
	Tue, 15 Oct 2024 06:15:13 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: cristian.marussi@arm.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	Su Hui <suhui@nfschina.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: fix the double free in scmi_debugfs_common_setup()
Date: Tue, 15 Oct 2024 14:15:03 +0100
Message-Id: <172899805803.948158.17513489982194163246.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011104001.1546476-1-suhui@nfschina.com>
References: <20241011104001.1546476-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 11 Oct 2024 18:40:02 +0800, Su Hui wrote:
> Clang static checker(scan-build) warning：
> drivers/firmware/arm_scmi/driver.c:line 2915, column 2
> Attempt to free released memory.
> 
> When devm_add_action_or_reset() failed , scmi_debugfs_common_cleanup()
> will run twice which caused double free of 'dbg->name'.
> Remove the redundant scmi_debugfs_common_cleanup() to fix this problem.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: fix the double free in scmi_debugfs_common_setup()
      https://git.kernel.org/sudeep.holla/c/39b13dce1a91
--
Regards,
Sudeep

