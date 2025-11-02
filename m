Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAFF1B423B
	for <llvm@lists.linux.dev>; Sun,  2 Nov 2025 10:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762079766; cv=none; b=KzaHRhjdXmG15VyMtMd77OlQXr/aSBW+V+Gg2AhAjTp2+nMUERJlaAfeDXDQZtR+X3SmV4xRYlhcfLYFyEcc+PVYJnnwwtnU/2oWem6tjLV9OTcfxv0yZedr8tmiUR/jB1ErkXUnHyOdJpul1awAAmSepvvDoH6cYwmJc/G5YcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762079766; c=relaxed/simple;
	bh=QDjFHAnNGxJtqq3B2eRN6crskPhgy/pT5GpK0XQSS00=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d+o8xrhcqyaHLM2DEujqZ4xOChQRO+fBAsTM+Jfwywnpc4WkSGfxFlBX4dNUSTLi7NFsl0/JzakJj0ITdGPi8LZ+/Ae2nTaagGlABiiJqTs44OsHQLawPryeqbVOgbWMrMxrI6eUEKOYC6LyM4cgf7vJSd+4ZsxYu6KFY7lSSzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/NIZ/3e; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/NIZ/3e"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-475d9de970eso23773305e9.1
        for <llvm@lists.linux.dev>; Sun, 02 Nov 2025 02:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762079763; x=1762684563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ovu4hk1QeQJCG4bKMFk7VDTxcv3q5N8PBdUxZwYYOd8=;
        b=N/NIZ/3e/bUXvEQTmnOmdOnYOaNy4XSQUf0nFalPmevZViwX4vb9SCiG8eb3hVnIsa
         PVIflGLteP1WzTmnPmJ/1CFxeqs/u+5WLfsJlYv968nTAszfAIxybtaBnbVWgTZlTaBj
         5bkfSiT+TCvsqnJ0kupjE2MwFKZF4vbnP8A1sRnLhul91XFgHaKwTlUlcggvUy+d456D
         M4GSJzs0szKdX7B17V7NJWnePy/IXrEdFIJuvVWnerivifr9Wq5bka4kKY6/sJXppb1f
         7UsjLtKxWlUbVlCqlKWn+KNgaquuXrQdhtIWwG+ETi+amCFMpNfoEklwHVDkLklFAwrt
         n4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762079763; x=1762684563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ovu4hk1QeQJCG4bKMFk7VDTxcv3q5N8PBdUxZwYYOd8=;
        b=EBM99zeHhxN+YXIkrPr2xxImyhWwFCXjXv0bcTJH0CQ8xsNmznuV+6Ec5zf8TIZaJk
         CokxofRV7+eKdG+5nwVSynb6BPL/6ggGL2EzE/wuGq33xNHFd9EbN/xNPDUziJNdUpvS
         uaBpuqn9lAc9vsi9iee680SJ+onroiII8iRooTfwSD+Aga26OS1DSZnOhCux2Z6Yftvt
         f2h+J4GFTUdxf7PLA4ZWZ86Rqa45iOp+QvFvMRzLnXBUXUvZRX1GO49TaGYxTXz+2tR/
         0KN2P1YSSBWViMo7okiUO1IBHD3wd7gHarsruJfRRjtRJXGcgFRsWBz+iDR+5b1C4hvn
         y9iw==
X-Forwarded-Encrypted: i=1; AJvYcCW2ej/Ej+NDJ9QyM7qvMgNkILeWuoz2pt37SY82yLz4lYw6INyImWoLjp6SGS/5nj60L1Hi@lists.linux.dev
X-Gm-Message-State: AOJu0YzuXre4aKTi5SPQW2h4nf2A4A9UqX6Gu5gWcItJARM5DoylWAi+
	59cbQUXdPvc6VWaXPK/2fVKRWsNOWRDHgrm/9WwrHnmoMmko1mPwmGmk
X-Gm-Gg: ASbGncstlXFXdUQaJ5FSlLTGhuMxxu/f31GBFQjELh0xnD7VdNjoBDginTfOhHI9u1f
	Ggcz+q4IGwv7ElsUgQYBMJk5JI+LYJQv40pOothIe4STXez7izrhGvd99fjw6GFup8UMekwztn4
	/0LIaWJmwx7Xm/MDY/b+5R8tCxo5lIcVGzu56MoyUm6OGv5hzodCAYnxnxhMs+HdBa3wZxl9eMy
	f79+cZK0EufQP4r+WvccwTRjuHpH1csBV8vuBCJXqLogRANlmdJ1GOEXqI+yTCH8qIIc6+QYFtD
	GNZtP+PeCacg9N15auplEho/9qBLG5B42LuVBCf4jKXfAXkeL6YbF3cevt2+pb/vmGvK8Ot4PRf
	mNqRT9CaIzBe7MtQlb/DBaekLhl08a/j24MYuj04EiyJuGu5PsNynytj9c9rIeXHZU8aVFJBwzg
	phzdivBabJLNOrZQ88rgBnm6QDTot4Ci+ujhrJr+NVx3EeKuSAQkYt
X-Google-Smtp-Source: AGHT+IHL30gVPu+1tpP35sbbUpZLKsl40U91AdkYUoDD4qFiMCXwuao1AO3rSfpQub8UcTTdTBgniA==
X-Received: by 2002:a05:600c:1c1d:b0:46d:cfc9:1d0f with SMTP id 5b1f17b1804b1-4773086e04fmr100701075e9.19.1762079762968;
        Sun, 02 Nov 2025 02:36:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fbeef62sm64496655e9.1.2025.11.02.02.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 02:36:02 -0800 (PST)
Date: Sun, 2 Nov 2025 10:36:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, u.kleine-koenig@baylibre.com, Nicolas
 Pitre <npitre@baylibre.com>, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Thomas
 Gleixner <tglx@linutronix.de>, Li RongQing <lirongqing@baidu.com>, Yu Kuai
 <yukuai3@huawei.com>, Khazhismel Kumykov <khazhy@chromium.org>, Jens Axboe
 <axboe@kernel.dk>, x86@kernel.org
Subject: Re: [PATCH v4 next 6/9] lib: test_mul_u64_u64_div_u64: Test both
 generic and arch versions
Message-ID: <20251102103600.65754bf2@pumpkin>
In-Reply-To: <202511020421.ZZPBAIIw-lkp@intel.com>
References: <20251029173828.3682-7-david.laight.linux@gmail.com>
	<202511020421.ZZPBAIIw-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 2 Nov 2025 04:59:10 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on next-20251029]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/lib-mul_u64_u64_div_u64-rename-parameter-c-to-d/20251030-025633
> base:   next-20251029
> patch link:    https://lore.kernel.org/r/20251029173828.3682-7-david.laight.linux%40gmail.com
> patch subject: [PATCH v4 next 6/9] lib: test_mul_u64_u64_div_u64: Test both generic and arch versions
> config: i386-buildonly-randconfig-004-20251102 (https://download.01.org/0day-ci/archive/20251102/202511020421.ZZPBAIIw-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020421.ZZPBAIIw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511020421.ZZPBAIIw-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> lib/math/test_mul_u64_u64_div_u64.c:142:9: warning: '__div64_32' macro redefined [-Wmacro-redefined]  
>      142 | #define __div64_32 __div64_32
>          |         ^
>    arch/x86/include/asm/div64.h:78:9: note: previous definition is here
>       78 | #define __div64_32

That is preceded by a comment that says it can't happen for x86-64.
I think it would be better as '#define __div64_32 @@@' so that you get a compile
error.
But that isn't part of this change,
>          |         ^
>    1 warning generated.
> 
> 
> vim +/__div64_32 +142 lib/math/test_mul_u64_u64_div_u64.c
> 
>    140	
>    141	/* Compile the generic mul_u64_add_u64_div_u64() code */
>  > 142	#define __div64_32 __div64_32  

It needs a preceding #undef
Although I'm not sure why a normal build doesn't show it.

Looks like I'll need to do a v5 :-(

	David

>    143	#define div_s64_rem div_s64_rem
>    144	#define div64_u64_rem div64_u64_rem
>    145	#define div64_u64 div64_u64
>    146	#define div64_s64 div64_s64
>    147	#define iter_div_u64_rem iter_div_u64_rem
>    148	
> 

