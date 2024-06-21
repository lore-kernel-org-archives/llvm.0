Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A759012CDA8;
	Fri, 21 Jun 2024 04:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718943940; cv=none; b=mqaD/iSZqhYS3i+R2vpBMrP68GqNjyWu5aM8Y9piCeUJ5iQEpE5lWgF40X1Jpbo7ok0O1QCO9rW86PkygGmQutQbt+Xf85m5t7QiYWRhtldalGkDLI05YJ84T7EF5kOThOAw6kRAD9SlpOcONmb9qEpvIRXXEFtJATJrHvSAClA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718943940; c=relaxed/simple;
	bh=0kHL6I+i+rEWMz6wMavPhoPEpIJxtG46vFoRIyCaf/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8IGdP6bpt6A4Zhn3tVL6zdck2oz9saFbLfl+JBHcLbn2wOqN9TtKsLkILQs91/Q1fR3SdNvVbiV0jfs57m0nuZS4J2HEkcVSrLbFDsieECuARgoVetg16hn8dTcSzFntucSns7yTv3IqJII9SGvbf4tRHrXO2X5nX3N9YZZBYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNaRht9C; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNaRht9C"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4ef12e5658bso503277e0c.2;
        Thu, 20 Jun 2024 21:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718943937; x=1719548737; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YqZ3Ua17oxBzQaxZiLQZKE8zOImd1INklnV7GqHAAxs=;
        b=SNaRht9C28Uf2AI7UF8lc0GrUlibGsn021oKxCwbVStDoZfLWOcKmG8XFdghVztiO9
         QuuI4DQfTKZVfMWW/23PGsJn10/YnpPuBfK4BjFFqxcq4mNnORVd+nNo6npttAu6z1vQ
         37PWW7TLQNGcn76fO30rEFCWu1mvm4oA0K51TxGfXzy48wdB5aKLxK9h8ebYJR4++Jaz
         /jgcml43HjKxbaFCIaEzdGl9O6eGl+2gtMQAZsLENGPIvYkpGcBtCauuBHNTK3A8+d8l
         NXKjWQYqlGZniVytwR4gG7cLDJKJkHfebJ4jUT9wzMDzyZTYvG3hDQpO+IZx/W2WTgag
         HHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718943937; x=1719548737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqZ3Ua17oxBzQaxZiLQZKE8zOImd1INklnV7GqHAAxs=;
        b=pC6/bEBWnHkXD9g+m9Hb+GJBuS5JOkHFpW32qOaDe7p4X7Tqm+R7ziaXsP7cnvnumT
         K+hkhGS6l7e+CsmTRwaN/ntZy5iKNo4G+QvHN1evkomheCmvtgKIq+g7r0QE6G2ypzG5
         5jhMAez5nfpXekvyZudNmxaGSIIJOD6MHCGvBeLUGdjNc5ThminC5neTsXt5YJWOlV9F
         0q8UepW3PRd/6DXv77CxY9Ry2spllEnAsY65WZlJgq6Agdj3DUpYrwbbLQZsfBrYr2Io
         LcA6kmrjo9t7DsvyVx3+q/QnftBA1BAZSSw/wWBXNWW4i1UvlEOMkDaUBGpwiDeAQbt6
         aqvg==
X-Forwarded-Encrypted: i=1; AJvYcCUcI/xojPhRWk6MBNXmYrQ13AVYBPQst582JXc+PufoM2TLYWF74+ftln6RbGasmHcr+JsJ+XsDJ4n5y1b4k0roSWkotADd+D03zYsCXw==
X-Gm-Message-State: AOJu0Yzg/HeqsHJGNXZE/rFXzCsuIIX2x/UF0rt7sawCDe2OO3ibah51
	rEQP+ukPoRZI7KTwb/tqkerhcnOPR96AHSz/rQhvv+Y59kFZg5o0UQMAG9IWZdIdRYoP2ZSTDld
	NLtyRzNIge8ToPBk1cJwHz5DLZSY=
X-Google-Smtp-Source: AGHT+IG5uz9w/wRrPr+fS/FhekIImaOCKZX2uIVPfp6VRlWX8eoGqOfZOF7O1EOjMAMPGfadsFUljQqzAcBdaJf/dKg=
X-Received: by 2002:a05:6122:169e:b0:4ec:fe12:4559 with SMTP id
 71dfb90a1353d-4ef27813b20mr8139479e0c.13.1718943937402; Thu, 20 Jun 2024
 21:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406211041.tUZSSJI3-lkp@intel.com>
In-Reply-To: <202406211041.tUZSSJI3-lkp@intel.com>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 20 Jun 2024 21:25:26 -0700
Message-ID: <CAOMdWSKM+iGdtr_vtEXqSuy6dUgzK_hSZRh6nwB2aDSuMAJGbA@mail.gmail.com>
Subject: Re: [ulfh-mmc:next 13/14] drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:50:
 error: no member named 'dma_complete' in 'struct tmio_mmc_host'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Christian Loehle <christian.loehle@arm.com>
Content-Type: text/plain; charset="UTF-8"

>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
> head:   602a73f6dd02fc2501694c8e08b7a1e267b7c14c
> commit: 74a3fe7c3784c8cae2e3e14c0078f33c1468fefc [13/14] mmc: Convert from tasklet to BH workqueue
> config: i386-buildonly-randconfig-001-20240621 (https://download.01.org/0day-ci/archive/20240621/202406211041.tUZSSJI3-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211041.tUZSSJI3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406211041.tUZSSJI3-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:50: error: no member named 'dma_complete' in 'struct tmio_mmc_host'
>      489 |         struct tmio_mmc_host *host = from_work(host, t, dma_complete);
>          |                                      ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
>    include/linux/workqueue.h:535:44: note: expanded from macro 'from_work'
>      535 |         container_of(callback_work, typeof(*var), work_fieldname)
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
>    include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
>       20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
>       21 |                       __same_type(*(ptr), void),                        \
>          |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       22 |                       "pointer type mismatch in container_of()");       \
>          |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler_types.h:428:74: note: expanded from macro '__same_type'
>      428 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>          |                                                                          ^
>    include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>       77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>          |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>       78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>          |                                                        ^~~~
> >> drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:31: error: no member named 'dma_complete' in 'tmio_mmc_host'
>      489 |         struct tmio_mmc_host *host = from_work(host, t, dma_complete);
>          |                                      ^                  ~~~~~~~~~~~~
>    include/linux/workqueue.h:535:2: note: expanded from macro 'from_work'
>      535 |         container_of(callback_work, typeof(*var), work_fieldname)
>          |         ^                                         ~~~~~~~~~~~~~~
>    include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
>       23 |         ((type *)(__mptr - offsetof(type, member))); })
>          |                            ^              ~~~~~~
>    include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
>       16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
>          |                                 ^                        ~~~~~~
> >> drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:24: error: initializing 'struct tmio_mmc_host *' with an expression of incompatible type 'void'
>      489 |         struct tmio_mmc_host *host = from_work(host, t, dma_complete);
>          |                               ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    3 errors generated.
>
>
> vim +489 drivers/mmc/host/renesas_sdhi_internal_dmac.c
>
>    486
>    487  static void renesas_sdhi_internal_dmac_complete_work_fn(struct work_struct *t)
>    488  {
>  > 489          struct tmio_mmc_host *host = from_work(host, t, dma_complete);
>    490
>    491          spin_lock_irq(&host->lock);
>    492          if (!renesas_sdhi_internal_dmac_complete(host))
>    493                  goto out;
>    494
>    495          tmio_mmc_do_data_irq(host);
>    496  out:
>    497          spin_unlock_irq(&host->lock);
>    498  }
>    499

  Thank you for reporting this issue. My compile test did not catch this.

This is a bit tricky, as struct tmio_mmc_host does not have a link to
either struct renesas_sdhi or way back either. I was thinking of using
host_to_priv(), but am not entirely sure. I am really not familiar with this
code.

@Ulf Hansson Any thoughts on how best to fix this?

Thanks.

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
