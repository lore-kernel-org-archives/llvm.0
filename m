Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996672D8364
	for <llvm@lists.linux.dev>; Tue, 26 May 2026 18:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820178; cv=none; b=kkwVrT+WSkB8idVOZ4xQoC3601ESoS9ot8o8u5+DpYjWBbDn/WLgzvpvRL53sjWV3Q6Uolgcy0Z1w1JCV66O+hJFwZX+ajweGNfgXVGNcY3/GwLpibxFw9bYRljC53J26MzeW5jn6oYdrzkRo+xTostTw1hreYxXD2qyeM8+ZZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820178; c=relaxed/simple;
	bh=KpUppVZ8QZSoZsraIQoIJK5QdakJlsWa/Qre1zpsV2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKIw8gU3kLEZ/ewnv9PSJXF1Dk8oLTbXJ9axBMMouZnA6PqXRDiOB3n9MjzDzEd5xHFDKRjapK/NZZa3iDlgUrc6VpDvEGazm2v5MJ1yXPcBmFJKNnfWk9jVeQhtBrqY+ooU0EsZbqU84FqsMd1/r1bnwB9bCdJ0ZZahN7cngNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=N4EdRD/0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N4EdRD/0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EE702936;
	Tue, 26 May 2026 11:29:30 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB51C3F7B4;
	Tue, 26 May 2026 11:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779820175; bh=KpUppVZ8QZSoZsraIQoIJK5QdakJlsWa/Qre1zpsV2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4EdRD/0ShkZ57IyNX70SdcB/Q5k0LEXw52dLQVujI+Vwslvq6V1hDq1tpeG1/aaX
	 BAZ3BhKUpKgUUaSLG9f2Swj9DLuk3/9X8+1V4sGBWT+MZ8xj7+w4G+uyn9TryisCLu
	 ucEf7pUjmBDQD08PtnyFBfYqcdTlbaDowEHWfCLU=
Date: Tue, 26 May 2026 19:29:24 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v12 01/15] kasan: sw_tags: Use arithmetic shift for
 shadow computation
Message-ID: <ahXmhNvFbIq-mvfP@arm.com>
References: <cover.1774872838.git.m.wieczorretman@pm.me>
 <c36fe46e1dde1a759e8ffdd0fe9439bdf2c66dd8.1774872838.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c36fe46e1dde1a759e8ffdd0fe9439bdf2c66dd8.1774872838.git.m.wieczorretman@pm.me>

On Mon, Mar 30, 2026 at 02:33:05PM +0000, Maciej Wieczor-Retman wrote:
> diff --git a/Documentation/arch/arm64/kasan-offsets.sh b/Documentation/arch/arm64/kasan-offsets.sh
> index 2dc5f9e18039..ce777c7c7804 100644
> --- a/Documentation/arch/arm64/kasan-offsets.sh
> +++ b/Documentation/arch/arm64/kasan-offsets.sh
> @@ -5,8 +5,12 @@
>  
>  print_kasan_offset () {
>  	printf "%02d\t" $1
> -	printf "0x%08x00000000\n" $(( (0xffffffff & (-1 << ($1 - 1 - 32))) \
> -			- (1 << (64 - 32 - $2)) ))
> +	if [[ $2 -ne 4 ]] then

Nitpick: does this need a semicolon before 'then'?

I can see Sashiko raised it here:

https://sashiko.dev/#/patchset/cover.1774872838.git.m.wieczorretman@pm.me

> +		printf "0x%08x00000000\n" $(( (0xffffffff & (-1 << ($1 - 1 - 32))) \
> +				- (1 << (64 - 32 - $2)) ))
> +	else
> +		printf "0x%08x00000000\n" $(( (0xffffffff & (-1 << ($1 - 1 - 32))) ))
> +	fi
>  }
>  
>  echo KASAN_SHADOW_SCALE_SHIFT = 3
[...]
> diff --git a/scripts/gdb/linux/kasan.py b/scripts/gdb/linux/kasan.py
> index 56730b3fde0b..4b86202b155f 100644
> --- a/scripts/gdb/linux/kasan.py
> +++ b/scripts/gdb/linux/kasan.py
> @@ -7,7 +7,8 @@
>  #
>  
>  import gdb
> -from linux import constants, mm
> +from linux import constants, utils, mm
> +from ctypes import c_int64 as s64
>  
>  def help():
>      t = """Usage: lx-kasan_mem_to_shadow [Hex memory addr]
> @@ -39,6 +40,8 @@ class KasanMemToShadow(gdb.Command):
>          else:
>              help()
>      def kasan_mem_to_shadow(self, addr):
> +        if constants.CONFIG_KASAN_SW_TAGS and not utils.is_target_arch('x86'):

Does this need to be constants.LX_CONFIG_KASAN_SW_TAGS? I don't claim I
fully understand this script but the other constants.* use LX_*.

> +            addr = s64(addr)
>          return (addr >> self.p_ops.KASAN_SHADOW_SCALE_SHIFT) + self.p_ops.KASAN_SHADOW_OFFSET

And, again, Sashiko mentions that the bitwise right shift here will fail
after the cast to c_int64. I just tried this in python:

>>> from ctypes import c_int64 as s64
>>> s64(0xffff000008eca008) >> 4
Traceback (most recent call last):
  File "<python-input-1>", line 1, in <module>
    s64(0xffff000008eca008) >> 4
    ~~~~~~~~~~~~~~~~~~~~~~~~^^~~
TypeError: unsupported operand type(s) for >>: 'c_long' and 'int'

I guess it's hidden by the wrong check on
constants.CONFIG_KASAN_SW_TAGS.

Otherwise I think the changes are fine. If you fix the above, feel free
to add:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
