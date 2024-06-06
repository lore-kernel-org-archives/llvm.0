Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE12F13AD25;
	Thu,  6 Jun 2024 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717674382; cv=none; b=ItaYTDDvBEKYZNtbt2gVdgqbqkaInWR1XaWxirlV+JuMXphbC7HhtVl0h+sV+B44A4qXevgoS+f9260Z6mBdO2IGKvOWHFqM3ZeEojB0W7C9INsdUqsLG1NPpfCPbvIvuSH2tv087HkTKXIDbxX3o6LArAPmdKMRG984YYqqjK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717674382; c=relaxed/simple;
	bh=jOtODru83RJ0hVI4pUVtTJe8wHsjlt44vLvRL6OoYbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5CvS6bgw9NqTPnBOqM1VLuFrUciIMXqQsk3ezpsgepZrZfNih33C1/Fq1YcPyBHs6Vm6fYKageBLWjT+pSIji8hQ0xguCAbFT+wZbW9jTconbTYYgRKL6U8/rWYjEcErbI3qXNM+9mqRhX47e4t8tN0S6GxZb1G6ldDixsY80M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=pZTqo0vp; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="pZTqo0vp"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F2E31883AA;
	Thu,  6 Jun 2024 13:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1717674057;
	bh=IlT3g6XGXIzmpKbc93zHZa8rKvt6pDeBQyFCe+8pUN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pZTqo0vp+tKPByldBVT2DEoY+5hJGsD4p92B+Q5/kO3RBKRERq5mFX6Y7oEZtnDCh
	 sWPxJhRqtEtZbNe5gKuVqtpCx7RVYd7VQw6aZgUe6n2XqspWSd+LGFxX6Mmm8rTi6E
	 b2xaQ6hiqgxkiJSfe/ZwQVewtB4O85ny5lSB5mqqGyefk6mYXZcuA1J3Ag6Q8xbzWW
	 5czubYTF4NjWQVcHZGN9PMaSRPaYMQo3q826/QRHaVpUwBhhQl/84ShYUQlildDVnC
	 zzkQCD/TubfNLi9ZudnJBlTbyol+U88i2fULSfLOvkz5qxM2RNoBSvqy+db0pHI5iH
	 RwHUPc4qvLiBQ==
Message-ID: <3db9913c-d859-45fe-b6cc-45d60f92b9c8@denx.de>
Date: Thu, 6 Jun 2024 13:14:53 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [atorgue-stm32:stm32-next 15/15] make[4]: *** No rule to make
 target 'arch/arm/boot/dts/st/stm32mp135f-dhsom-dhsbc.dtb', needed by
 'arch/arm/boot/dts/st/'.
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <202406061507.G27lPzhn-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <202406061507.G27lPzhn-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/6/24 9:40 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
> head:   4732b1ffb466c1819ee6bc39da908ff2cd314294
> commit: 12ff8e1676419d357c19afc93d6327a136616673 [15/15] ARM: dts: stm32: Add support for STM32MP13xx DHCOR SoM and DHSBC board
> config: arm-randconfig-003-20240606 (https://download.01.org/0day-ci/archive/20240606/202406061507.G27lPzhn-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061507.G27lPzhn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406061507.G27lPzhn-lkp@intel.com/
> 
> Note: the atorgue-stm32/stm32-next HEAD 4732b1ffb466c1819ee6bc39da908ff2cd314294 builds fine.
>        It only hurts bisectability.
> 
> All errors (new ones prefixed by >>):
> 
>>> make[4]: *** No rule to make target 'arch/arm/boot/dts/st/stm32mp135f-dhsom-dhsbc.dtb', needed by 'arch/arm/boot/dts/st/'.
>     make[4]: Target 'arch/arm/boot/dts/st/' not remade because of errors.

Already fixed in

[PATCH] ARM: dts: stm32: Fix STM32MP13xx DHCOR DHSBC Makefile entry

Thanks
