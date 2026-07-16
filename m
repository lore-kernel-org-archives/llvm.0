Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ABE3ACF06;
	Thu, 16 Jul 2026 21:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784235726; cv=none; b=kBYQoBuBuB8/7r3DsVheJpL9cyY/VkCOOx1n2KA/4Y9GimsBihl84qGIGpwDDZvpRJSBAmP9XAPesStwXEBDtqvFBlg4G7LRlLSqXn1IUhpZBdCvKfPMYkwHr/Djl3l6TBLFvIJLa6Tg6JJ1Avu28RV8onA3ewMA6YbkyuRL2CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784235726; c=relaxed/simple;
	bh=UqPm/PVotSP/haNQpFOti/jErHhtT/6pz63R+oExdkI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B7hrLWGUkxP7dbZJGRqNhAy3G50ZbfZU9QuWIA9hc6wY8sqF1GXSmLKmUvmAocMXaKtvC/qu6YQxJntUua67Ftp+7jaTHQGCLyJg4Jg9wqnpNsCspBwW3xQcenVLANJvzbK1bQy9RGOLYQaaIeBgDoB7JBC0RsoowBoA5xR8lEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkQhk967; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkQhk967"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631881F000E9;
	Thu, 16 Jul 2026 21:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784235725;
	bh=y69DbtZHZC4lJ9oaV4upIY+bxqZ6mclG6GDPdRwOY7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KkQhk967IwiHUumRhu2fl+E8twRkQGBdvikeJ8f09fkWsoAcIh6m79a8B0hxltaKf
	 xJgmpFJpPkMaGwNPMAyqervX3xByXRjWXa3N9eMcdYYLTTgNBnyHOGliXrZeejdTT5
	 yuSLDrf088gDNNR/FZPpMPqLHlOqui4S84q7CrTvzU73eFtHbkukkiabFPJOuY7+vz
	 QMQ+5ecjCbUH+FbxLJESwbSqmLWC7zYfxmX/kOkLE5Yaf2Vo1YrQTPlAEkodpy1HJI
	 nV26krR6juxHDUASAtMlJ5Ui3zFvs5+IyHHI1KU25alR0oIUUuTBl0+iwvcBZ9vIIf
	 4qnLA9Ez70uDQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20260611125822.3386722-1-arnd@kernel.org>
References: <20260611125822.3386722-1-arnd@kernel.org>
Subject: Re: [PATCH] nvmem: airoha: add ARM64 dependency
Message-Id: <178423572317.377973.14404313845657914878.b4-ty@kernel.org>
Date: Thu, 16 Jul 2026 22:02:03 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 11 Jun 2026 14:58:00 +0200, Arnd Bergmann wrote:
> The driver already depends on HAVE_ARM_SMCCC and ARCH_AIROHA, but both
> are available for 32-bit and 64-bit targets. However, the smccc invocation
> fails on thumb2 builds with clang:
> 
> drivers/nvmem/airoha-smc-efuses.c:38:2: error: write to reserved register 'R7'
>    38 |         arm_smccc_1_1_invoke(AIROHA_SMC_EFUSE_FID,
>       |         ^
> note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
>   215 |         __inst_thumb32(thumb_opcode)
>       |         ^
> 
> [...]

Applied, thanks!

[1/1] nvmem: airoha: add ARM64 dependency
      commit: 29d8d70e55efed7c2edf3a458d2e60e9ca41bde6

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

