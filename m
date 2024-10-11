Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006802185B0
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728656733; cv=none; b=aHcP6d8/boE2n+bDvnK2rIuSQAVX7thx4DiBeKrBTSjuUZSv6mDuDvB9LHxSE6kawA08h+C2NGYZSjqjUnD6cAJZJulwCUS7nU8pzE7SWYZjYFRnKKvuKjl2xiLHR9YG/MMIgxbJJi43+NCrt+9I0BTbE8vDiD0JTaEPd6mNeMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728656733; c=relaxed/simple;
	bh=Kg5c6UvEtUhEc5DMSJea3v9/rsk6G1aNDbZ0lXvgIlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPKUP0Yt7RRRgOmQoVP4tip7tO1IWiXJnf4vfw31iIaNRMEyUqyyIspqXQbb/YyQuyvUZnhSy+snulkqqxF2d/ifhENmQojX44Onh0kO5yFDIZUJol6FP196dtTchl7ZI4lAVQYQ9UZgXWGHCT0Hu3+WtJxpfTOWOCD6hzDV76k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1524ADA7;
	Fri, 11 Oct 2024 07:26:00 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C6A83F5A1;
	Fri, 11 Oct 2024 07:25:28 -0700 (PDT)
Date: Fri, 11 Oct 2024 15:25:25 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Su Hui <suhui@nfschina.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: fix the double free in
 scmi_debugfs_common_setup()
Message-ID: <Zwk1VUXi5BBeU9n9@pluto>
References: <20241011104001.1546476-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241011104001.1546476-1-suhui@nfschina.com>

On Fri, Oct 11, 2024 at 06:40:02PM +0800, Su Hui wrote:
> Clang static checker(scan-build) warning：
> drivers/firmware/arm_scmi/driver.c:line 2915, column 2
> Attempt to free released memory.
> 
> When devm_add_action_or_reset() failed , scmi_debugfs_common_cleanup()
> will run twice which caused double free of 'dbg->name'.
> Remove the redundant scmi_debugfs_common_cleanup() to fix this problem.
> 

Oh Yes...my bad, Good Catch !

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
