Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A80633E348
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083894; cv=none; b=WZYlv39e3f/D80VhvOF3DumcWTY7PjrfqMTBf0QPkrYYAscymf0ChZB4bEEYwan/PWjPWm2U0sTOBohpE44qdTgi3t1fuTDymEdvuWfCQp2kVoq67lhrGu8kcN0j/EoQhQjl2i8sGrm6ZwnrXKh/v8Xpd0XJCyiA68sb1777LMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083894; c=relaxed/simple;
	bh=7hrihdavUKSRBk1sLsO+Hg6KhwRPOnr3OMEgf2c2K3A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nE4TQmfWNmjB01MlX4JxrWUwzpuE2MLdnmfKJQyxQuvQkYTX70FdGarWEK57Y/FBAIzK4W+asoX7pmZiIikvqHBu55e4/gA8C73/GnL7V3oh/1tN/GjEMObaffZgAx8YM3AuImL10hv8Pes8P+vgTgxbHsi+8d4OGYypAFizKg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBeZ+1oe; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBeZ+1oe"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65813e3bdaaso616411a12.1
        for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 04:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769083891; x=1769688691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WniyRiiurCuuasCidSwYbmBfTajQvRsR2qN3REFSig=;
        b=TBeZ+1oe6SDZHxLU5t4jLIEpbyja6WPaqBW3TvasPDCc5+3UmcZecNN136tEG6ktOX
         dMMx4ZzdD6NkGGbiJlSVZBeUjrFovuCQ2hw21XGbWn4lkYXZx8I0BfcBQmkxsp18Kn2B
         ZhnNWzQHesAQy0DxLAied14jdBYcZLMElRD5vnfr/GNF1F1xFmxqH8bi7+3N0EbDhofJ
         QBvCcvIfjUK3KyovKGpB+FfColA4JeWEwAUzmpjo9WFb3NCWnAxD/J9F+5/KFtE+V+Ub
         nVGnEa3tiCHdDnb6JevGSw4rJ6gfUxcjE1tWC4yr9zejMm9yUbGbcNOKmDJwWTRbRoZo
         v4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769083891; x=1769688691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0WniyRiiurCuuasCidSwYbmBfTajQvRsR2qN3REFSig=;
        b=rhHrlcqxPf6bf6VceguoB07bXyq5WP1XOiVaNmbU+V5E6FT2b1zPr4wHq9WtH8gBdf
         EMoxtaNcQiTPfnQekIRGg521B1A0nBSKAz5aPp/w++YXoKHLr+H9tySyB/kTEf97QxDM
         x7hMWIo+DUufv3xNWb3x3TBIqZlXtsecTz2/8D80dg23SeJNKaP0ZK7gOAi6aPeB458u
         rxAWZeWEKEG1hRzw4NgjLSCw9Zt1U8r4Gf/OuHKEuCoigYeGbpbx4ZsFE6w9gkLGYFgD
         P08X79SkBKc90uBc/80iBelNuyC9MZQthmYj8nNhYpWl8RZllFcRcD77gZZiF0g0RGpZ
         371Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8HkQWL7i+VxMpEE4ptOQcBlMJYw6yTfHKHAibFk2VeftkiNMewVoRtOtMdcgMPveGZPVu@lists.linux.dev
X-Gm-Message-State: AOJu0YxBqQHU01MA+KXWp5/2CeJHU281r5XNbFxruCT/HfKByiiw1UPb
	s1QK+ArCzrkpR2kFyxuqwLqU8yRXvgpwp1VYDDEvHRvpz4PucDqe0P0ze2zegg==
X-Gm-Gg: AZuq6aIaWRefGxz7SPZRdaD92Ze3lbknkUi7/OmuMfqhI6cGtcRhjmFpjede7R/8N+9
	wB4SxMJIe7xBebuPIv7pnjV2DAcEsa4Z7XuHvtJqCao7STO28nls5sIvV3A3tXxljsMcJa0xz1p
	efG1k4+Q7TxhKxHrmC4KofMmAulbfwMc9/cesgH4VaaPGShwRrMIMrTQZMwcij+ElcdyIpp2jPg
	7mV90RgemJq0yOn45Pr+7gm2nqRbQs6E3Cnj4PO1/ZjK2zcKFCrGMseXLzN8AgAdaBCqtNILeK2
	iJdD7PQQe9PGudgJ33031Ztd4bi3zHrhQ8rI763F4jeEWea/uEhCgYxczWLuQlr8tg68FBiam6J
	IWpG0CrpMqTjLkBXxxugZ1Pn1UKg22sA4RueDv9k3VrIbQa3g0c9kKG6dB6HrBDxw2o5aXHna8i
	1FsQ1HISe3LUVVAfuHG8umPQHLqug73XXpmYSMz7aqyUMa7xtWi8l42gn542fwzlM=
X-Received: by 2002:a05:600c:2d92:b0:47d:87ac:73ef with SMTP id 5b1f17b1804b1-480470c7513mr21530765e9.13.1769077831210;
        Thu, 22 Jan 2026 02:30:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48048b49880sm44067865e9.11.2026.01.22.02.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:30:30 -0800 (PST)
Date: Thu, 22 Jan 2026 10:30:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Yury Norov
 <yury.norov@gmail.com>, Jani Nikula <jani.nikula@intel.com>, Vincent
 Mailhol <mailhol.vincent@wanadoo.fr>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [PATCH next 12/14] bits: move the defitions of BIT() and
 BIT_ULL() back to linux/bits.h
Message-ID: <20260122103029.255b3dd3@pumpkin>
In-Reply-To: <202601220951.7C4YG7hB-lkp@intel.com>
References: <20260121145731.3623-13-david.laight.linux@gmail.com>
	<202601220951.7C4YG7hB-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2026 09:23:16 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20260120]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/overflow-Reduce-expansion-of-__type_max/20260122-013456
> base:   next-20260120
> patch link:    https://lore.kernel.org/r/20260121145731.3623-13-david.laight.linux%40gmail.com
> patch subject: [PATCH next 12/14] bits: move the defitions of BIT() and BIT_ULL() back to linux/bits.h
> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260122/202601220951.7C4YG7hB-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220951.7C4YG7hB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601220951.7C4YG7hB-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from kernel/bounds.c:14:
>    In file included from include/linux/log2.h:12:
>    In file included from include/linux/bitops.h:28:
>    In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
>    In file included from arch/arm64/include/asm/barrier.h:14:
> >> arch/arm64/include/asm/alternative-macros.h:18:20: warning: 'unsigned' is not defined, evaluates to 0 [-Wundef]  
>       18 | #if ARM64_NCAPS >= ARM64_CB_BIT
...
> 
> 4c0bd995d73ed8 Mark Rutland 2022-09-12  17  
> 4c0bd995d73ed8 Mark Rutland 2022-09-12 @18  #if ARM64_NCAPS >= ARM64_CB_BIT
> 4c0bd995d73ed8 Mark Rutland 2022-09-12  19  #error "cpucaps have overflown ARM64_CB_BIT"
> 4c0bd995d73ed8 Mark Rutland 2022-09-12  20  #endif
> 7cda23da52ad79 Will Deacon  2020-06-30  21  

Unless I change BIT() back I'll change that to a static_assert().

	David

