Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044F737BE7A
	for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 10:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035273; cv=none; b=o3XSqD6nubST2Sbgcb4edn1Nxc8c/5aKbZDoxHzzn3TUTDKQNbw8ZFlw4eXKO42zM9uGQKm1fUSQS9fmiNcJdsGl/etduPWomgDx9eveJmzrPHiyOm+ZgQEtmKBAAKLZuZX4X+w8eBV8+jmGkzESyfDEMj2SrIYnRd84JtI43lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035273; c=relaxed/simple;
	bh=Rw5xn6MDUzprJXALhd12R93b+y4cMokXqUcGPM/Ln7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r6a1lzFduM3x83ONugRWJa+YtWJ9FGO3U2zfsmfNZvhd9w65+fQMfhK5au4fAB/eDQWX+EbYEitNlS2dBNSBybOFC5sOfh2mL3vP9ijPuBXs9rcwsxCiTLYz1B1ISX0FTDLJ+pNj+vuye4k2nxMAjug62sFUuyazEsDpmfBfXrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c83364233eso1033397e0c.0
        for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 03:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035270; x=1789640070;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5pyFaModjtGkctdZvggQo6mIBpUFRdaaBsGlklIYms=;
        b=HDL+dAZdJrC7kpHw6EVZLLx0MCD4Smknme9ARsmA6fy6Z9TiWbeCixy/yvGB36W/cQ
         trRk2IkSFVrpg6kBFa0Mruwqyc2okL3QPM4GZ91BsDZwigYPI17wAtDja0uFG8orM+Mk
         Obg1QFWhTq9Q5RHTbKC0hQXtKk/Lu27+BLpF73jn+LpvEU/7N4LLXl+nMyDUgsujVLAj
         1ck730Y7Cwhs6YZQwYD1NIBxzOsnmCjWzShekvdWF7WOTQT+UMt9g7boimtx7y6lYPO1
         +b8yvV7amKIMrwqJD370f1s05/2Q1leanyQzbGWGdGYjNhiNgn6kvl9hOgU6MJNJDlNV
         XUZw==
X-Forwarded-Encrypted: i=1; AKwUvBwSTGqo6LPUTG97mfWnn42Ff3JRphyHKjtsIEV6DG1+kKthPZCcuro32eQlTqvky5oglF4r@lists.linux.dev
X-Gm-Message-State: AFuF++ktfHx8Ijw9kv2C8R6WvG9s7c35IKwM5JokC4gsizuJl6M9sM8E
	g2/eVGqAFbakyvqZuAkMkd50wiSY/fgKhg96xjW2U0IFrv8/oWPIdKx2rO2gCsZ+1Xs=
X-Gm-Gg: AYBFou1LBKxgkIJIl/qZfeN5JvuTmBMXbKmTlOsHkvl2mNhsFki9G5pTJEY9Q5rgKOV
	Sagrj2gSOwjsrgULgwoId6vfrMTJJi65hI95H3FeLJ3zf1FQk/c+EeMscivgS8fOL1wPcCpcLep
	zV+e9fUxC/t7t1S77o5qTBg5M7zHxU1PI5TiU9ZHcbbps0voRp+IXJpblBePMHFPHI6+FMEAL2R
	j+68RoUq1uM7p90QHBoPU1qXHETQHqd+Yq6saXZvBCrmQFJPPg7ogO1w7XhbnGj8C2VUrJq4Z26
	E0UIeKpkWVkdHm+nQKSD8U1oCH3kfUcT0XnRW24SgCTzIMQbFtQNmCyanHDNzpe+8SL/1JceHg6
	HUyqyyeg2cvUqUQ6EOZt5OWCwG8U4DgSGoeMmCKXU8dnUpFeCgqDLJiS0KhEb4pNU5OwUn+FYKx
	8aX3WDO1qSJrEAUMvzwXU+cWYpgjD+rb5HGlMJvyT6Cz827Khjvk0LhF36v5i/najZXmvPwCnt5
	bM+VZoW4e7+EYaRX0arXK7MdRDtxiHRtJKF
X-Received: by 2002:a05:6122:8b11:b0:5c7:a844:493 with SMTP id 71dfb90a1353d-5c7ed2f89e5mr26662422e0c.0.1789035269714;
        Thu, 10 Sep 2026 03:14:29 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b2cb1sm14555317e0c.16.2026.09.10.03.14.29
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:14:29 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-784a1696a21so4514191137.2
        for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 03:14:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhzDwTJa9dbVxvUBw1PsEKoUglHpdBs6ApIXukDyRbNmN/9xstFcaYpMBAd39Qu04rnuBF@lists.linux.dev
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id
 ada2fe7eead31-78a4a72eac3mr22223768137.3.1789035268749; Thu, 10 Sep 2026
 03:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609101334.xgbNoC4e-lkp@intel.com>
In-Reply-To: <202609101334.xgbNoC4e-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Sep 2026 12:14:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBFCKA5gjQeXuTrOYbaY_sZg-Gnz-fgOCSKhF3cV8jhg@mail.gmail.com>
X-Gm-Features: AcwNN1WahnoAKM5bWAzumRTegPpUxaUzjYyd7D5gHP2WgaVBSlpot3X8X8LLi68
Message-ID: <CAMuHMdVBFCKA5gjQeXuTrOYbaY_sZg-Gnz-fgOCSKhF3cV8jhg@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:renesas-clk-for-v7.4 16/16]
 drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared
 identifier '__free_kfree'; did you mean '__free_pages'?
To: kernel test robot <lkp@intel.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Kernel Test Robot,

On Thu, 10 Sept 2026 at 07:34, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v7.4
> head:   810b8b6c4e02c40991c29491cec09ebdaf5ec6d0
> commit: 810b8b6c4e02c40991c29491cec09ebdaf5ec6d0 [16/16] clk: renesas: r9a09g077: Register SYSC regmap
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260910/202609101334.xgbNoC4e-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c1872e7fd3307679a2da53f9d83de0ccf234b4ad)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101334.xgbNoC4e-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609101334.xgbNoC4e-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
>      966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
>          |                                          ^~~~~~~~~~~~~
>    include/linux/cleanup.h:213:33: note: expanded from macro '__free'
>      213 | #define __free(_name)   __cleanup(__free_##_name)
>          |                                   ^~~~~~~~~~~~~~
>    <scratch space>:3:1: note: expanded from here
>        3 | __free_kfree
>          | ^~~~~~~~~~~~
>    include/linux/gfp.h:342:13: note: '__free_pages' declared here
>      342 | extern void __free_pages(struct page *page, unsigned int order);
>          |             ^
> >> drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: 'cleanup' function '__free_pages' must take 1 parameter
>      966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
>          |                                          ^
>    include/linux/cleanup.h:213:33: note: expanded from macro '__free'
>      213 | #define __free(_name)   __cleanup(__free_##_name)
>          |                                   ^
>    <scratch space>:3:1: note: expanded from here
>        3 | __free_kfree
>          | ^
> >> drivers/clk/renesas/r9a09g077-cpg.c:966:51: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
>          |                                                          ^
> >> drivers/clk/renesas/r9a09g077-cpg.c:966:24: error: incompatible integer to pointer conversion initializing 'struct regmap_config *' with an expression of type 'int' [-Wint-conversion]
>      966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
>          |                               ^                          ~~~~~~~~~~~~~~~~~~~~~~~~
>    4 errors generated.

Thanks, will amend with:

+#include <linux/cleanup.h>
+#include <linux/slab.h>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
