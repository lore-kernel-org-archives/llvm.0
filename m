Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9A2313260;
	Mon, 22 Sep 2025 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758560575; cv=none; b=Y3NMMDXbFQmnBp600ZXE9PG35x1yAyxM9ogeuySFJjRrIAJf0f7RzYLqXTuQizpG5lqppSR044gVpWfZ4dGB9Dkq5w99F9uBYDrUZZpp3GAK3Ttjq+On29Ycx7OE/xEIismXgHfpkGo8M/qIPo7l+ydbi4WvByEUo4pxAiH5RNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758560575; c=relaxed/simple;
	bh=699jOoGUj4e2SO9ha0YGJmmTdGtx/tX9EBbTrQt2has=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hetqKyyOUCaahxfHZTDOQo7ClOtLulCkHYPQZafTUphtYFisLowWvZYfjLlTESJs3Jo7Dn+gJOGkVTHuxr5Neke9nShnhfXecCzYJEbhBZYWwDzbXBp7ZnzgUfQAqj+lNkLdGbN+WZDWrFNKQLye8ZWSsoMT2vldv/zbKqKKGkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4WRkbgi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4WRkbgi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DAFC4CEF5;
	Mon, 22 Sep 2025 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758560574;
	bh=699jOoGUj4e2SO9ha0YGJmmTdGtx/tX9EBbTrQt2has=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A4WRkbgifRaxt0i4VYV4OdXqB5vGwinNKpDMAeXUI5JM9x2UX3/TbYhdtZce+/WaI
	 WkirGOpwShOVo1BauM6EGSlejvXFMgKGJyvLtb/sKhexL9xN+P8ehe29TLgICoHYWX
	 VjSD/btN7yu6SaLDmW407NT04LL6IVI75jx5Em0RzYf1lEGtuM2b5LEewHcQ5W66CG
	 vd0ZJfaoYuEzDZaIWT+hDgHiYwndyAiWpVr1tt379AnzDaNkcYFJ4L4XavksvUiDfP
	 bWcK8oumVfp57/gBQC/LjxWZFcdk3QsuirxibRDgeMaFiUwoa1EwGguww422L65yEh
	 IaODP/gBlFiBQ==
Date: Mon, 22 Sep 2025 10:02:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Qunqin Zhao <zhaoqunqin@loongson.cn>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [linux-next:master 4719/11136]
 drivers/char/tpm/tpm_loongson.c:48:10: error: incompatible function pointer
 types initializing 'int (*)(struct tpm_chip *, u8 *, size_t, size_t)' (aka
 'int (*)(struct tpm_chip *, unsigned char *, unsigned long, unsigned long)')
 with an expression of type ...
Message-ID: <20250922170250.GA243363@ax162>
References: <202509211250.mD8JS2nu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509211250.mD8JS2nu-lkp@intel.com>

On Sun, Sep 21, 2025 at 12:32:27PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   846bd2225ec3cfa8be046655e02b9457ed41973e
> commit: 5c83b07df9c5a6e063328c5b885de79f8e8f0263 [4719/11136] tpm: Add a driver for Loongson TPM device
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250921/202509211250.mD8JS2nu-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211250.mD8JS2nu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509211250.mD8JS2nu-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
...
> >> drivers/char/tpm/tpm_loongson.c:48:10: error: incompatible function pointer types initializing 'int (*)(struct tpm_chip *, u8 *, size_t, size_t)' (aka 'int (*)(struct tpm_chip *, unsigned char *, unsigned long, unsigned long)') with an expression of type 'int (struct tpm_chip *, u8 *, size_t)' (aka 'int (struct tpm_chip *, unsigned char *, unsigned long)') [-Wincompatible-function-pointer-types]
>       48 |         .send = tpm_loongson_send,
>          |                 ^~~~~~~~~~~~~~~~~
>    1 warning and 1 error generated.

Should be resolved with
https://lore.kernel.org/all/20250917-tpm-loongson-add-bufsiz-v1-1-972a75c0aab2@kernel.org/

Cheers,
Nathan
