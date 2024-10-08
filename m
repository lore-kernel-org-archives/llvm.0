Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982DEF9EC;
	Tue,  8 Oct 2024 02:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728354917; cv=none; b=YA1l7V5CJBAq7ePh3RIvGaCPJ7gDRhvuRAWlxPtN3tEA15hJfrizp/5kOhUPOOYF8GNSAUOqWjhsJlw7HvOvPe+9FHsNNatbDcE68tBjL8jt5Fvs9xaI/SyUHcTt1Nj//XfGKhZw2bkoT4X4PCZmNSdRTofEggWrFYowBkTYT3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728354917; c=relaxed/simple;
	bh=C/W3IWDD87ZTgEdJdyokhTKbCHO3oRTnOxRDfwyVUhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WfO7EXtW5eFnF3t9beTDhCN+h3RoTq/hbQOzQgn4S+lNY2Vdm5gWdE+brt7ToGLlzLeVcMNoQQqy99MUaj/FH6a7QGM/B27l3fiIfkOSxNHNlavVwqn/XoULRMLLJFYdcA1sJZZh7yEWykOouo/O+lMVbKFeP9UPLtVpW2NJjrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwBXSDOt; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwBXSDOt"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso3482966a12.0;
        Mon, 07 Oct 2024 19:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728354915; x=1728959715; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uaHHyDTZ0d5NaZSkzM6y1pMwvv24VCw6oN9ExhsOJRk=;
        b=FwBXSDOtA/eriKLs+ClOhMa9yW4L70x3Anu2UVSMmiWNmw6nBPHksViLAFeMzc9oy8
         tTRvAQYd7oHti9vnFsQIS8qnrwQu/KGZ4qUyaF5+1Dl68gAC+3FTdmh51RfT0tGZEKpJ
         zbXFNwRurefiWcHKPShFVe2bCvRB0b0y/zWSHQSTctPtvBaNbIal93oolEhU1WNcwpqX
         VDOUWuzmBXZ+y46/y7a+zXAvH8ry74WZVxZoBW44Xyd+gCLeP6CuH45E71tEOGryMJbw
         zvKXVJ/rfXZDHIaeVeTZvaa9KB42Y7veA1+ojUT/6Nlvk9EV3ancGsYIdQ5l8fFDnojp
         czXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728354915; x=1728959715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uaHHyDTZ0d5NaZSkzM6y1pMwvv24VCw6oN9ExhsOJRk=;
        b=vTy2jy2PFzEKKmHedw2XEXPR0VVEv87nVj9+rwEFMtMwsruNuFaLU7Jb1fDJ/wJlX0
         vevs7HF0VR6zUfL5lzlSL05Apfe2zzGXuZQs8eeS0iNyh3/FzVcCFrHmL8U3Lq3wGRqB
         QD8M5zrVonJzkTOFSTbq5POBEtssubH3ghkU2m0kKK28XPr+efpmF756YLAS2g0YOGav
         osehgz4VqYwlL+eYNDsumnoWUMGEUX38kuOz023MGLPXxQdNAkwauVn3ntK+t5ERE9BG
         y6Bl2k6OU1lH2vwqxoroY85zZDpkpwq+bk3BpsizroNcZT6UN5J6bMTO6v8rRjDVk24Q
         NoRA==
X-Forwarded-Encrypted: i=1; AJvYcCVbTfK2zJ3vxzWUMvx5hRFOgE1XMt5SyE4CbZUDVRB5WKExWGBuUnlkuotapKpXncYtuiSvtFaHcB5TH8Ed9Q==@lists.linux.dev, AJvYcCVtaRve0v31/eqiEJJ77UumEN+UhAIH78O7hY7aK8elQ8hoiqZOAaGBrHfXTa0qsFnHyqRV@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2p6bxaHSPu7tFkh2nUFmL9fkVNCvqrCcQ47TJe5Hinzmm/bz+
	ywnFYBWEikWX80mBv56GLwiOiofyJ/zSNK1XRJAGJVH+z2N6hBT8yfetAzYKi6qFw/ingwbFF0a
	up+HMRIPuf786hc9gNKaVWRZmV/g=
X-Google-Smtp-Source: AGHT+IHYfukP36V0z2gYLJ/HbclCrt+viHg8RbDpyTrHSLRtEnGGEoCgvDAnqCHfZt3TprR9DvFLF75m59yFen0wrTc=
X-Received: by 2002:a17:90a:640b:b0:2dd:5e86:8c2f with SMTP id
 98e67ed59e1d1-2e1e626c37emr15952226a91.21.1728354914800; Mon, 07 Oct 2024
 19:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241004142504.4379-1-aha310510@gmail.com> <202410071223.t0yF8vP8-lkp@intel.com>
 <20241007183052.9d87f42e19db5f9777dc8e77@linux-foundation.org>
In-Reply-To: <20241007183052.9d87f42e19db5f9777dc8e77@linux-foundation.org>
From: Jeongjun Park <aha310510@gmail.com>
Date: Tue, 8 Oct 2024 11:35:03 +0900
Message-ID: <CAO9qdTHUW+SRkLsxdO_PXKw7qGvXKCWfa1GtVYNrnyGWEUe0Mw@mail.gmail.com>
Subject: Re: [PATCH] mm: swap: prevent possible data-race in __try_to_reclaim_swap
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	kasong@tencent.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	syzbot+fa43f1b63e3aa6f66329@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Mon, 7 Oct 2024 13:06:49 +0800 kernel test robot <lkp@intel.com> wrote:
>
> > Hi Jeongjun,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on akpm-mm/mm-everything]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Jeongjun-Park/mm-swap-prevent-possible-data-race-in-__try_to_reclaim_swap/20241004-222733
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20241004142504.4379-1-aha310510%40gmail.com
> > patch subject: [PATCH] mm: swap: prevent possible data-race in __try_to_reclaim_swap
> > config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241007/202410071223.t0yF8vP8-lkp@intel.com/config)
> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410071223.t0yF8vP8-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410071223.t0yF8vP8-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> mm/swapfile.c:203:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
> >      203 |         if (!folio_trylock(folio))
> >          |             ^~~~~~~~~~~~~~~~~~~~~
> >    mm/swapfile.c:254:9: note: uninitialized use occurs here
> >      254 |         return ret;
>
> This warning can't be correct?

I think it's correct. Even if folio_trylock fails, the return value
should be -nr_pages. Not initializing ret like in the v1 patch
goes against the design purpose of the function.

So I think it's right to apply the v2 patch that I sent you.

Regards,
Jeongjun Park
