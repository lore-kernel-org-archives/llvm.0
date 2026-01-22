Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A43F3AA1A6;
	Thu, 22 Jan 2026 05:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769059046; cv=none; b=cqcxoLqKDINBmPrhZtSOaZmOyJnzg57xUohxkV3fP3MQpHbtz8RwCEZJuTZaXZRLCivnMJYvkMfjrc/tpC6FKnyPvLZZshRNeJ0TtpvexTQDL4HkoatIZOFhtnN7shOo9xXHPjKTDy/1B3F7vthLXJ1mL1VS2Qfeb9MDOxPH1EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769059046; c=relaxed/simple;
	bh=Yj4t2Q6YxyvZBfhgO0u+WhMltjsUtkqty0mK2Oqpesc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXKEovIbeH0JF7ViwsBvzVnhm8OHFz+2Ut/rHijwNDFwoGdWORJK4vGhGEYPD1lrOze/y18pvhHknv7+2nIlyE+R7X675BCEwr1/FC9P3FMi7kw1QTDgQSKlWxUrQaTwtyOSDBbtrrzagmqaVgDrCp34kLTW67+/p64d9YWQWxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFUNvh2W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFUNvh2W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11D7C116C6;
	Thu, 22 Jan 2026 05:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769059045;
	bh=Yj4t2Q6YxyvZBfhgO0u+WhMltjsUtkqty0mK2Oqpesc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFUNvh2WCDbCkCtPK8B442JHkqGheNCvQ3s0IJAPfzukTquPhHgwVQFPzGE+PLu2T
	 IO6Ao+LGn7cje83ijmG8IkSzXvMuqw7eCrChCAc4nKh70uCqjifrRGpCEjmw0VVd7z
	 8/Lz8xU9MyNgxodDwd7QNVfl10hUnKrSRnTiI7KShga1WsCvdYOfkYAX2FMkymGhtf
	 KQL2zC2eKXgAl5pjYZjMZzJDkSZBf+FUfw2O1i72t4Yma69DzsXgbI0gq6ktv++TEV
	 kNcubMpm1vpvunOt5nXOZLOkwjT3hr309D74QOtxSYGMJVu321cpWqiaWyUhHb8fN0
	 G7Ybmx1wQKykA==
Date: Wed, 21 Jan 2026 22:17:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [rppt:zero-page/v0 1/1] ERROR: modpost: vmlinux:
 'empty_zero_page' exported twice. Previous export was in vmlinux
Message-ID: <20260122051722.GC3770486@ax162>
References: <202601221150.JsPp145b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601221150.JsPp145b-lkp@intel.com>

On Thu, Jan 22, 2026 at 11:14:04AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git zero-page/v0
> head:   53d07913878ea27d6fe4224e8581729185291278
> commit: 53d07913878ea27d6fe4224e8581729185291278 [1/1] dev: arch, mm: consolidate empty_zero_page
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260122/202601221150.JsPp145b-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221150.JsPp145b-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601221150.JsPp145b-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: vmlinux: 'empty_zero_page' exported twice. Previous export was in vmlinux

Seems like the following should fix that?

diff --git a/arch/hexagon/kernel/hexagon_ksyms.c b/arch/hexagon/kernel/hexagon_ksyms.c
index 36a80e31d187..81bc6f81e200 100644
--- a/arch/hexagon/kernel/hexagon_ksyms.c
+++ b/arch/hexagon/kernel/hexagon_ksyms.c
@@ -17,7 +17,6 @@ EXPORT_SYMBOL(raw_copy_to_user);
 EXPORT_SYMBOL(__vmgetie);
 EXPORT_SYMBOL(__vmsetie);
 EXPORT_SYMBOL(__vmyield);
-EXPORT_SYMBOL(empty_zero_page);
 EXPORT_SYMBOL(memcpy);
 EXPORT_SYMBOL(memset);
 
