Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB741A23A4
	for <llvm@lists.linux.dev>; Tue, 24 Feb 2026 22:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771971383; cv=pass; b=MQVGlqH6RiYyo8osEeZSmtwgzd/zMRVrZsiELRapXplsByYmil8jbuExtB7RC1R2DQgpCy7JwqANVvEUHVAVsThLq3+Y3agGKcTQou7gABmInbdEjXm8PzEHeXArL6WryHXhXQeJUnEcz8mN7w1jG37F787R0j3nwDQM+GPN/dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771971383; c=relaxed/simple;
	bh=avUAB1b+3yIFF9msEyBE0V5JXSDfaJrLcszTJK/JZ1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVndwV6IffoTwGQnO6vrN4cZK/1S4YTyOjnNWKNLM9MVrEm9+8JdG25v3/Ns1aXmAUiilqDG9/mNvsRrECLJH426oHumQz1U87CItFWkmBWakK/xounwNneHrqieWzl6wZ7YEVxXWTCfHw6wuQMx++fFNpTRYoG9cTByYboVhWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ccbERDpA; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ccbERDpA"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5069a785ed2so90781cf.1
        for <llvm@lists.linux.dev>; Tue, 24 Feb 2026 14:16:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771971381; cv=none;
        d=google.com; s=arc-20240605;
        b=lvTEqDPhO1U7Lemip005xLOz1aqcVrwvi0ZMR1BQEEBbQIVKnN2qzxGbqEYps8SCgZ
         i+iPQu4/0VotwYSwbb2HzMIzh7LwXdvw3/t5sb/WdAzaEGsdyl1VoBH3/ECQ6vWSw/MR
         oIfvzlPie078aRQYa0MZlx90VIjUFg8IcTePAWT0iERrfxJMw42GdOeWCPk/F5NzCiju
         4DG2q4N/rAxlPNe9JnElkvPjB6iLzfm/+ZBihfyZMbf9/u/N5SPXSo2WgB7dVNq94LFy
         iTkS9KdYGBUPOQTwA4oWm1lwbWiy9QCwoJOZRXrzZJjLI0p5rVFiw+H+GvbD8bWr3+Wn
         9gTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=48FXZFJTw+6x79fJ7a6Jy6tjuNMBhw39wfTzGL1KEH0=;
        fh=PW/JhRBImlYN3B5O0uCTKJEyksu9MfCP3ZOwJsPiODo=;
        b=Qk8qP7/2z70BPiz44lTRE6K7s5VUc5FbjE49lpQvktKJBPNycRUq8vFEBB/tkaGKWW
         +6DAmq7f66R56/VNoaIzNY/OMcXffehBIij3mfdh+gYnpv+0gFFDuEM/5DyiO7bmIZVe
         cq500bA3YZo63KYHivRpi2jBc0T4JqFmOyJiJdFMTnUP25/QE2H9mb6+6tEkyA5jJeK7
         lgQSPkub9MaW4B8rCTL4yWyi3foKiUdMhZHP3gzpYbQHQXhDzp/vUZtT5kL1wf2dM4Sg
         epN+E2I1f+Yhp0qIY+DdQ276JyG3CFNoMLXacG523tKHMLO6B6yxVhQ/Am+FmIiUWxfl
         WRgA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771971381; x=1772576181; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48FXZFJTw+6x79fJ7a6Jy6tjuNMBhw39wfTzGL1KEH0=;
        b=ccbERDpAjtQdMV1n7iyq5YIzGYrxA1oDvWzxbdWObwRkoQXoh8othsVktbH9XhwCU9
         To3YY3Lljhm8iOobhicNNVTqF2c/pozwgxjLS3SkpEycHucc/rf8tHj/a8Ea6q7R/x2y
         4Nna0dGBQvHuF/nQOZMibeX4De+6w3s2YZv8/4rQDmqbIih99OIWDBEiWaMzjLKGYfhY
         CTi89woCzY9nE7oprXN2aJ7gwh3AudRN20DMy1GnDSWGpFKzl/AcqQK/j9jjbSbzXM5i
         1AnYpKuKKTkS+fyF39I9nudJEN1hJPYFMr+lzR5toJUxDDjZH9UcYhlg9U5CN9loaNEr
         Z+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771971381; x=1772576181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=48FXZFJTw+6x79fJ7a6Jy6tjuNMBhw39wfTzGL1KEH0=;
        b=XRpaP8nu9JE/KIE+oTm/U/GE01vPpOyFUYUtWdt1gnK+XbBxgLwbg3SncbqfDQiveJ
         NLEH2BAyKbxxYpjauUwceR3A0BLgoR+lNEgK0FS1bPHrSLQLcRShn8LfKzaonFVUVspz
         uJPH9ObJvy2pQbQjqe9DJm1YV44WY+3+mvPYQgrOQLGOgJ+Bp6vN66b7QnclMZIiDfDX
         OklAZYbs82fYtd1kPFSTn/cnF8w+8rBzfLE0gyULO34VA1SBCdhFAnIEGL5mG2miFtbG
         0kM6aoHD/15Sl/1sBo7CvMVmOYswNuLjEux/g0hnlHS0lTlzNJzpheiXwr1hUPoySr01
         Sulw==
X-Forwarded-Encrypted: i=1; AJvYcCVh8b4haOwcne9F27ewLgrOsitHe2JEwSnY3bNlWAcKvMw+jlp5n7R5cdHCNICxBYgvIno5@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz8esR4eTiaFR2gIIURmWPNPVNUexiAvY74eoEEsXFiB+LsV8k
	rbLRFfuqbjrw7MLmyBBOvOwQ6FQ6Ne7ZDcEJWDGvokdVb9swwgatW92SixomEYeALg3qpOHJS5A
	CIU52oGUvaszxL4ESExAzNiuir3WD66MuClZsXZsf
X-Gm-Gg: ATEYQzx36hTMzloPqOG2IETj1WQE49UvSM0iUBrPI9jUTJ9dfVibZufGQzzNtGkQjmn
	1Ns0x7rSMiTbZk52xd+170vJ0ZmGnFwcIZlhukQBCr76SQtYLUe1BbF31UygiSb8O/Gph7hcRce
	Mklg9K+SG1y0PVrs9uSzVY7z+TDhaH3RwfFrwOHJYuofSwSyVRYNIBYDh/xLtYLLw69jlkC3tAT
	oeHoY1YOvWxaPweMKawJ+MrIc4eLQIdo5DT75P/fIMQJ79ZhJTiFmMko7S7SIv5IUY+T7EdbDTU
	N3qv3Qn/k70qcLf5JP06P+8NJKl7jSIlhFEZ0w==
X-Received: by 2002:ac8:5903:0:b0:505:e719:3b49 with SMTP id
 d75a77b69052e-5073a331544mr1246501cf.11.1771971380858; Tue, 24 Feb 2026
 14:16:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260224165250.1322946-1-surenb@google.com> <202602250250.n38q74JK-lkp@intel.com>
 <CAJuCfpGcA7YmxzmJuEzjJyLAQrV-uGS1LH=B1eX50MSh09z21w@mail.gmail.com>
In-Reply-To: <CAJuCfpGcA7YmxzmJuEzjJyLAQrV-uGS1LH=B1eX50MSh09z21w@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 24 Feb 2026 14:16:09 -0800
X-Gm-Features: AaiRm533kGl5au_lU-qDQs1zUoFTWbklJ0-4014AJth8cYkZ1yJ6e5gdW0m9ejI
Message-ID: <CAJuCfpFKS7urCogZu5bAzmOaLUmAXTp9ftuxfLwy+7G01HSr5A@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/slab: mark alloc tags empty for sheafs allocated
 with __GFP_NO_OBJ_EXT
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, vbabka@suse.cz, harry.yoo@oracle.com, 
	00107082@163.com, cl@gentwo.org, rientjes@google.com, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 1:14=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, Feb 24, 2026 at 10:54=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
> >
> > Hi Suren,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on 7dff99b354601dd01829e1511711846e04340a69]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasary=
an/mm-slab-mark-alloc-tags-empty-for-sheafs-allocated-with-__GFP_NO_OBJ_EXT=
/20260225-005422
> > base:   7dff99b354601dd01829e1511711846e04340a69
> > patch link:    https://lore.kernel.org/r/20260224165250.1322946-1-suren=
b%40google.com
> > patch subject: [PATCH 1/1] mm/slab: mark alloc tags empty for sheafs al=
located with __GFP_NO_OBJ_EXT
> > config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/202=
60225/202602250250.n38q74JK-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260225/202602250250.n38q74JK-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202602250250.n38q74JK-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> mm/slub.c:2787:3: error: call to undeclared function 'mark_objexts_e=
mpty'; ISO C99 and later do not support implicit function declarations [-Wi=
mplicit-function-declaration]
> >     2787 |                 mark_objexts_empty(sheaf);
> >          |                 ^
> >    1 error generated.
>
> Thanks! In a hurry to post the fix I forgot to update the
> mark_objexts_empty() definition for !CONFIG_MEM_ALLOC_PROFILING_DEBUG.
> I'll post a fixed version shortly.

Fixed version is posted at
https://lore.kernel.org/all/20260224221132.1702713-1-surenb@google.com/

>
> >
> >
> > vim +/mark_objexts_empty +2787 mm/slub.c
> >
> >   2783
> >   2784  static void free_empty_sheaf(struct kmem_cache *s, struct slab_=
sheaf *sheaf)
> >   2785  {
> >   2786          if (s->flags & SLAB_KMALLOC)
> > > 2787                  mark_objexts_empty(sheaf);
> >   2788
> >   2789          kfree(sheaf);
> >   2790
> >   2791          stat(s, SHEAF_FREE);
> >   2792  }
> >   2793
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
