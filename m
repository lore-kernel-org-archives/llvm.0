Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2871C82891
	for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 17:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713201246; cv=none; b=QjF+5oEM0zM+wRhEkVHAAxumKrhUIqn7mAgHIz7u/DFbH9Zhyp/pSUTOuovqzwbe998trpxGBx6Tu1YJ1mnebgpy/OjYxc2I338fwlGhG3ykqzUP8xII3YqJKiLUb3uBUT75h4EbeG0bMUA5ESWfz8m4lOzOghA8wGo17Vs45iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713201246; c=relaxed/simple;
	bh=XcuUAmh5zJlhMzspZkNQEeYA/TjKS7buoHnMTlPwaPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJb+7jFXGKkmiRg4YK+W4BaANtLaVt5ru/Z0Bujs/YtuxZ4cAsTbVWDDxlcNcapyRPpMScd3NWo/XvRRu48l/hfbFF5qy4enIFweziMRvVNKIVrvCVvTdq7xlFEK3M6qUKzKQc/kgz6g7bNw2D8hB+vhxYXgyZ/50eHOljnKdKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GtHTpXua; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GtHTpXua"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ecf05fd12fso3356996b3a.2
        for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 10:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713201244; x=1713806044; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qectELHxULGP8f3N10tQDQeblgf58cUTMxAcWlcdZeM=;
        b=GtHTpXuanLxR0oIhbtBVgf/a2ZoIa9MiHdm3Cy0OX6CSbkT/NzRlsNZipXH3qspREe
         3lHYglj+mmcxtUVEzrU2cHDjSlfU+0d2NVPW7fW2aR+XbO6ctxT+BOWAaCZiibrY156o
         qaDU8dIB2bLGWdskg3VA5NBVDF0tDfiaEGNjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713201244; x=1713806044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qectELHxULGP8f3N10tQDQeblgf58cUTMxAcWlcdZeM=;
        b=UHJvOxqh8SN9ikVZ5jSKJuMa6aCNHduyDVMxXERAH7khxMNJHjuFiL5m1yom9o+dBD
         tcIopqT0V+astpRwrMqynbcR76o1A4V7nzi3GGw+WjlXn0lJekpi3oNRVmJM7wMMcQqK
         fppNSexI4XkaZdppR0QnVsTFIF1mApiqEMuA6xSJARgdo3oamCGgnBTJn3oOr/NF1C2M
         QMDrd8ToGtOh/DSMuEChL5ADycxzh5VLcV0BJQ2xgXg/sbYR8xWRL5nV4W2DP2uhr8HG
         qZljqMZUGvOKB3x91JaY3C08Op5GkR6NcOoJ5b8tfiW4fqr2GTilIvG9B4EvyQDJcacz
         2Nlg==
X-Forwarded-Encrypted: i=1; AJvYcCWNa5e3vfFBNxHECcjGwr+ThfudOABKraLy+kXsXl/9FwuX4n+S/pzyNmX7b0oSoQxxqf9T6vDmvxaUzHQbgXxYiGcBxQ==
X-Gm-Message-State: AOJu0Yx1u8ilBWg10C6XIf7dr4LNJk+HR8+e5LjqlRbTRCcSWH+Fckvg
	0/MUGoXsF5ITB3+Ika6NYQ5jWA1vWZ6uww7YPT4r7ljDlrHy9LGAH0yNFKAh6w==
X-Google-Smtp-Source: AGHT+IFX3lKRFmR1Eb35Honu4cAQuoMyVRDRqy8xmGu11fvvOl8LSiCv122sTz0qgd90NbbzmuNvoA==
X-Received: by 2002:a05:6a00:4f94:b0:6e6:8df5:f77a with SMTP id ld20-20020a056a004f9400b006e68df5f77amr12937175pfb.31.1713201244424;
        Mon, 15 Apr 2024 10:14:04 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c9-20020a056a000ac900b006e647716b6esm7720644pfl.149.2024.04.15.10.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:14:03 -0700 (PDT)
Date: Mon, 15 Apr 2024 10:14:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 __apply_fineibt+0x566 (section: .text) -> poison_endbr (section: .init.text)
Message-ID: <202404151010.75DC9B8@keescook>
References: <202404151042.vATlNGmU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404151042.vATlNGmU-lkp@intel.com>

On Mon, Apr 15, 2024 at 10:15:48AM +0800, kernel test robot wrote:
> Hi Peter,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0bbac3facb5d6cc0171c45c9873a2dc96bea9680
> commit: 04505bbbbb15da950ea0239e328a76a3ad2376e0 x86/fineibt: Poison ENDBR at +0
> date:   9 months ago
> config: x86_64-buildonly-randconfig-001-20240415 (https://download.01.org/0day-ci/archive/20240415/202404151042.vATlNGmU-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404151042.vATlNGmU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404151042.vATlNGmU-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x12e (section: .text) -> text_poke_early (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x1f2 (section: .text) -> text_poke_early (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x2e6 (section: .text) -> text_poke_early (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x381 (section: .text) -> text_poke_early (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x3a4 (section: .text) -> text_poke_early (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x44d (section: .text) -> text_poke_early (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x50d (section: .text) -> text_poke_early (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x532 (section: .text) -> text_poke_early (section: .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x566 (section: .text) -> poison_endbr (section: .init.text)

test_poke_early() already marked __init_or_module, so shouldn't these
warnings not happen? (I assume the same is for true poison_endbr)

-- 
Kees Cook
