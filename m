Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F36129E8C
	for <llvm@lists.linux.dev>; Thu,  4 Apr 2024 14:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712239958; cv=none; b=fBpJpQ75uneaPLBSjUGfthofKGp3tZDFHhhbS4cjd4aq3SnaKsETVKj7RYCr9xfh805dPjvvI4szQFc7tStZkBiyRP3B15wCsDrJiEIiyaRWIpKnelktnDG2bdyUVL9iGjrnqpGBsQHQfqW3mieUnpTNz/y7NXQEG4MJ6yl12rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712239958; c=relaxed/simple;
	bh=lORFwPl3NMSZOhW/0VatvvCkLT890zc2MdJM71SHOXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5bMsHaoxjW112U512nSBVkIUVGu7SfgYG1Ma25aylImzD/T9bLETjKZVV8d6xmafs1lOnHNGCzlBeZuiC71bEDvw5JDwXhNkLr/z8q58HvKbGn7ED9NHPsDsvxr42l4mYVTDTi3n4vuTDNmDM/up6nZez0ZmXplcH4xmTIF1ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2806FEC;
	Thu,  4 Apr 2024 07:13:05 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6B9633F64C;
	Thu,  4 Apr 2024 07:12:33 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nikunj Kela <quic_nkela@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] firmware: arm_scmi: Avoid non-constant printk format strings
Date: Thu,  4 Apr 2024 15:12:21 +0100
Message-ID: <171223989405.451881.1515372166025152395.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403111040.3924658-1-arnd@kernel.org>
References: <20240403111040.3924658-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 03 Apr 2024 13:10:24 +0200, Arnd Bergmann wrote:
> A recent rework changed the constant format strings to a local variable,
> which causes warnings from clang when -Wformat-security is enabled:
>
> drivers/firmware/arm_scmi/driver.c: In function 'scmi_probe':
> drivers/firmware/arm_scmi/driver.c:2936:25: error: format not a string literal and no format arguments [-Werror=format-security]
>  2936 |                         dev_err(dev, err_str);
>       |                         ^~~~~~~
> drivers/firmware/arm_scmi/driver.c:2993:9: error: format not a string literal and no format arguments [-Werror=format-security]
>  2993 |         return dev_err_probe(dev, ret, err_str);
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Avoid non-constant printk format strings
      https://git.kernel.org/sudeep.holla/c/495667d49c50
--
Regards,
Sudeep

