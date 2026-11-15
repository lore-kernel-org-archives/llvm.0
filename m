Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794718908;
	b=3hTRyA0tBon+kl12is9iceT7VAa4SBJYVIViDuPoJBjsZ1EBi5ES11tnVYCE6z7b/0iC
	 MpUAmGJ7kuwcLEUIsz8aYXxjlZeZl+SCCEe7ZBqK1xZILtgX2j5HQ/DRFZJomga37O6Ok
	 7xhRVyAMkhu0EyywRuWVwSgtPo+//GmTFTDnqiy+6PJquJO0vEiNc4PLqte7d2CaIraPo
	 WVxWjSLur82PScxKDj0Z/zRG4DJ/IcvQt+LIBWCaLlJNsSbNAkHzINoETCjXDAi1UlkYt
	 Hy63in3Yg6A33wxViMuufmlQTzVbXAcoCHt8kFIGEaa/VVWCYy5T7Y3uQyDKYLYFWqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794718908;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Q5Y4EGcEbwCpGEouSqydpRVCUuNFu9xHjxA3h8F8yRo=;
	b=mTQnHI9bY80xxKHR490tj0SCOAlUaaKgpgsFwurjfF11ZeADZHrjCZTjOgmPodvtYUc/
	 heHz6zFYnu5dTuKD6mAgE340qCgBNnOukX9x5Nf0nNmn0zd/zpX3c2ZJwIDzasBS4pzPx
	 B2+TYj6BiR+zQJAsCUw1wcDYZ8z8aM5PpcI/6J8CTdVE+YWYdoefhphF6VGkIN8Y0xtu+
	 4EyCIBVSzzLq3YxFViYVdllobvhRYMk8UkG1srQkAog7UsywJ0j39Eia/TvvczSXNQb2s
	 cuWzagqHeHk46CA7jrjNaH6EKZjmzitJzx4k6jv56oCnjSahHnJ5QzLQZvYehexdcGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N1QIZrsl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3542F606A329;
	Sun, 15 Nov 2026 05:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N1QIZrsl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6E21F000C4;
	Sun, 15 Nov 2026 05:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794718907;
	bh=Q5Y4EGcEbwCpGEouSqydpRVCUuNFu9xHjxA3h8F8yRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N1QIZrslimBijwhJa0iI9wNCWaq0NzHVavSesSsYwS03JSnva+dJEcn+PPBVpRE3i
	 0fLsf+hzJpVCpL4SHHCWqeoezilqo7M0zzH5yAoKlC198rPGBMJkuG/GmBXADE7ty5
	 XgfIZg45rT1z4+1zuTFdWdyxIP1UC5B3m8sX+pcoAaCTsaqffOU8KTHpNySOBrenwX
	 vGNpcVHrc4Y+36sk0GcpQlRd4s9lFx2gmWLBrnMlvsmkWJHHGucIMcMM/JZU/OkSkV
	 BhqjsCT6dUX+gb238zRFuNNEPX4kPbR1jpZOm+Xx/6jsqpIXaIkqy8xbWFKqWgSq7m
	 sm7BdqicIwuAg==
Date: Sat, 14 Nov 2026 22:01:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Kees Cook <kees@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/misc/lkdtm/bugs.c:492:31: warning: unsequenced accesses
 to volatile qualified 'element_count'
Message-ID: <20261115050144.GA600738@ax162>
References: <202611140405.wMowxoPE-lkp@intel.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202611140405.wMowxoPE-lkp@intel.com>

On Sat, Nov 14, 2026 at 04:47:52AM +0100, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   97d73c8251226cf27cc6656b4c542869bb8c69fa
> commit: a120a832e3ebca48474d7183ddeadf4138472535 lkdtm/bugs: Add __counted_by_ptr() test PTR_BOUNDS
> date:   10 months ago
> config: mips-randconfig-2000-20261114 (https://download.01.org/0day-ci/archive/20261114/202611140405.wMowxoPE-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140405.wMowxoPE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: a120a832e3eb ("lkdtm/bugs: Add __counted_by_ptr() test PTR_BOUNDS")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611140405.wMowxoPE-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/misc/lkdtm/bugs.c:492:31: warning: unsequenced accesses to volatile qualified 'element_count' [-Wunsequenced]
>      492 |         inst->array[element_count] = element_count;
>          |                     ~~~~~~~~~~~~~    ^
>    1 warning generated.

https://lore.kernel.org/20261114-lkdtm-bugs-wunsequenced-v1-1-b24f15ce1328@kernel.org/

-- 
Cheers,
Nathan
