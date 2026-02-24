Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EC833C1BE
	for <llvm@lists.linux.dev>; Tue, 24 Feb 2026 21:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771967714; cv=pass; b=Ee0GIXVK+b8gtldjdbrmJtbVXeS1S3jx4EDYf6QjTnbIitT1dE3xgeWoH3B3+426ZDoYJE3GjNeQW1vJQiUfGUk1avrmkPP+pzYfS+Rxx+5ENWi6iXZu0ITGXMqpxaBOkQDuHw2K0Z5YLOn8tij8ucBbU31s6nJt5zDKJql41TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771967714; c=relaxed/simple;
	bh=eV1IYc9F8dk0DjERYXn1zCrf1jS4ysp8t+9Yjbb1pTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6ap+/LrA/tLDcE+LN2EaPO3jbH27HtE/E7rAzsWMpdVX7n0cFu0CheXL1AnxKRIjYD+Ro/HCcC/PNg0CT3n8LK+XIgG/+k4XlMV4uKClCQQl5miWZR4Ke4tZX1uQyuBlyciPmUt3+1PA8wN6MLn3N89+CaM/uqLgd3h2YbkYLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LwAVKuCZ; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LwAVKuCZ"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-505d3baf1a7so35071cf.1
        for <llvm@lists.linux.dev>; Tue, 24 Feb 2026 13:15:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771967712; cv=none;
        d=google.com; s=arc-20240605;
        b=OH/LlZX2+j0k8AKih366gEwNt7XJadrL4U8rNPo72IBrKaPC8wznNC66esCUdUAehi
         qlvRakNi4XvbCUHuYyEtDZEIt8wYdw+0P+8ewKkhMg6FDxsNPmO6WrySVpOXnlj/Mdqh
         KMkwFFvqKvCJiizqx7gzccR2rBZRRFZDlCO4w53F5TnGwl7lC8MWK1deMJzW+dKWhHiC
         9wKVp+LUWLUn+ic+NQGZf/T94Bq6mA3QCZmMOwVf/q5mNHo60TdAC4V1R33zsb5FHv/0
         C7Ix2YvOxzTm2LpMMPr3mXPUobQS1eMUNigUySmifp7HzObMxDEdSUdMdL9NZ/0zjvWt
         q1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6p/EscjPc4RwdFKAEV1F/Hcd5UZ99lvhttD+tVMi300=;
        fh=I2lFzkE45jA3393ZTKi8NPVpDsnM+TZb/yFdzGvqeN8=;
        b=GFmBc7h2vTYyKnRUSjUkiXXeDcDASUxXsFSdFF9ziUSGZAtDAVG6mpLjKDOKDuVQ92
         DIUj6i+M6XaOHkvwJ8cg1LPvztWKjOUyqNl28ExiU69J4ilLyAt5EnwBJGqKPp1DXmL0
         acnMdTk2rSr8aa5IYtiGgM+w6jLM0IshBBd83Ydam5bxf4AwPNk6igpZkFoxZr1EZf5z
         MSlsgtH0OBHRw3eipRFPk3xdEdjSYnuA0sxpUQpFaYsT3DtMn+2BBUEo6TIpGCuZ+0bf
         HE/m9hUOvLFg+m+s54WXLh30yS8AFx0AOdygIF+dm407NxqYDLZccziNmm8NxK1qOyfv
         DNpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771967712; x=1772572512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p/EscjPc4RwdFKAEV1F/Hcd5UZ99lvhttD+tVMi300=;
        b=LwAVKuCZ1C4HPfPUF4ZF0x2IqVYRdvSUyWWEzn4lYawgQnKJoUvQg0SWSaorInlCQu
         pZjoR2sLUz/R7Ke+orkDT7u/w5pH6f07JE7NvuCyR9x/jo6mpKb2MYjTzLAin4LBADoM
         iYw0FLMIX93ALZ72TwdIROUE1YiRAAOUeoUzGQSDNUxd8NkcX1vkDZ6FAN3SQWNWi5+8
         rTTcUqbeJYpKYGi42N+nWVvB3pvX3FOfMBuO9VkLCO2xp9jGjMIO+CKPYxDr+t3iGSK2
         wuuFGcJD6q0dMg5PB1AAycL6ChKMUb206jiSHZ8FbqcfAcwoACWTJSLZBc1al7ZRZZo3
         IPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771967712; x=1772572512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6p/EscjPc4RwdFKAEV1F/Hcd5UZ99lvhttD+tVMi300=;
        b=eufle6P9jKWXiF6IuZWXudk2woIxbxnz1oYzQ0Y3bag5sJ+HD0sXrUAywBPIi7gIc5
         81lJroOQLt5vd06fSzWEzS6WxOe7Da+56niq9S1mKpK36OAsUHVIN3fHjgQSu/8eEZ2e
         0XawYv9K/rBLZBMSCObFjXQ3adGux4mYuZeJ3bqKrvt6CEk0ZZL8zQOqe2ZRDkrpwnLn
         8Af7VPmACeJJ03cYo6UxZCMWsAbRLwF1n51plfpzcuoV2BRC5MpcCOR+mNCk0yDqc7OC
         tL7NHFj7j/YvPzlOJY3I4QOKFLgvGDnGwh5kkSz/gVD6s7VSHewuShdCCBtyGOkrcak/
         kcJg==
X-Forwarded-Encrypted: i=1; AJvYcCVQwNp4E5ksPGD21XUbuqPkCuzdgoX8zo89fZXfkAUJp7Hls3pFeEyxLMhOnRlnhMLNKG0x@lists.linux.dev
X-Gm-Message-State: AOJu0YxDsuO01OdiC97aDB8BGxYmMmMLT5aRQ12gSSXOCBTB81Xjgy03
	pTOi5z348yWIt50UlqSi6oStvjoxAt/Ck8jR8O7n0vlHcwT/RiNOnWrxjlcZFjhVZiUGDdk1BZy
	JoICW0YRlEl3Z+0MXtguKCv75OUHPnYwrjaUfXgpl
X-Gm-Gg: AZuq6aIDnPbuNTmot7cjtfCHDztXbJ5tGISJmKkbOav/ASDZ8uFZ/L5NQvw+2G2vgJH
	rJDrFfglJ7LNYhREjt4eKZuTTZnlsq8DkNJ3NsSwlM1R7x7aTaR17ptmxYA5tiYxIfMdsuvoCXa
	suP3DWeA+UNfFytPStQQrtqnztg/rR49QpLcFk9Aepo8LDZiFHbVkP+iwKX5FdU50Snu6qXfSbQ
	IcFFcc9VE/FnnbjtaBUv21gaeJFH8t5LkXB6QxOEd5/XDhAqMo7qcW9/GdRCrOAmOprxBTesDfE
	F6pI242G3G55t4m4mdWzPbXwTXuXCgAjyYb4lTmoR+zztFuj
X-Received: by 2002:ac8:7d41:0:b0:4ff:bf96:db86 with SMTP id
 d75a77b69052e-50739028793mr2962101cf.16.1771967711072; Tue, 24 Feb 2026
 13:15:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260224165250.1322946-1-surenb@google.com> <202602250250.n38q74JK-lkp@intel.com>
In-Reply-To: <202602250250.n38q74JK-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 24 Feb 2026 13:14:59 -0800
X-Gm-Features: AaiRm51WuymRTNAhPkBO-yVwq4mhRHWTiS7MnS75L9UZH8fj6ktQ_w2NQi6eNiI
Message-ID: <CAJuCfpGcA7YmxzmJuEzjJyLAQrV-uGS1LH=B1eX50MSh09z21w@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/slab: mark alloc tags empty for sheafs allocated
 with __GFP_NO_OBJ_EXT
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, vbabka@suse.cz, harry.yoo@oracle.com, 
	00107082@163.com, cl@gentwo.org, rientjes@google.com, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 10:54=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Suren,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 7dff99b354601dd01829e1511711846e04340a69]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/mm-slab-mark-alloc-tags-empty-for-sheafs-allocated-with-__GFP_NO_OBJ_EXT/2=
0260225-005422
> base:   7dff99b354601dd01829e1511711846e04340a69
> patch link:    https://lore.kernel.org/r/20260224165250.1322946-1-surenb%=
40google.com
> patch subject: [PATCH 1/1] mm/slab: mark alloc tags empty for sheafs allo=
cated with __GFP_NO_OBJ_EXT
> config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260=
225/202602250250.n38q74JK-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260225/202602250250.n38q74JK-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602250250.n38q74JK-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/slub.c:2787:3: error: call to undeclared function 'mark_objexts_emp=
ty'; ISO C99 and later do not support implicit function declarations [-Wimp=
licit-function-declaration]
>     2787 |                 mark_objexts_empty(sheaf);
>          |                 ^
>    1 error generated.

Thanks! In a hurry to post the fix I forgot to update the
mark_objexts_empty() definition for !CONFIG_MEM_ALLOC_PROFILING_DEBUG.
I'll post a fixed version shortly.

>
>
> vim +/mark_objexts_empty +2787 mm/slub.c
>
>   2783
>   2784  static void free_empty_sheaf(struct kmem_cache *s, struct slab_sh=
eaf *sheaf)
>   2785  {
>   2786          if (s->flags & SLAB_KMALLOC)
> > 2787                  mark_objexts_empty(sheaf);
>   2788
>   2789          kfree(sheaf);
>   2790
>   2791          stat(s, SHEAF_FREE);
>   2792  }
>   2793
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
