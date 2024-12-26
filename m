Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286E2140E50
	for <llvm@lists.linux.dev>; Thu, 26 Dec 2024 20:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735243500; cv=none; b=WtTi6/CfOQMgfaIXXh+q5mQeOpIjAP385VM+Yr5iL5SLmRRYEO7aTVQpqmYeOVa5iEWFC+f/YJQeLqsIRzZ8fJnWip29HelC0K589CCu4+HEaefGTVPAMCJCE/KGAyqRJtBKMmg/t/dvheo20H5/0Gb4Q6OCAear3IJr9P2mCUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735243500; c=relaxed/simple;
	bh=gAJ9KX0yOwCrlBK50aBg0D5j1kVkVh7Cys4hnUZdGLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uc4BCGXRKzuOMmeDnHcL+vgKvcIzf1Pv8G/bwH6FiTJZVgOlrzi2gL79GPhmS1qk5cvdXBn7OXoiuQpfmoaj6ZeF8Gh0FYIsBHzcE5t4avU3XDIu8vgn2ZyYKK4n4K2ddVjUejg7qczZme+A6GBVgUYIkdivmpQf9FJLez4nGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GkTW+FEy; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GkTW+FEy"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4678c9310afso1678861cf.1
        for <llvm@lists.linux.dev>; Thu, 26 Dec 2024 12:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735243498; x=1735848298; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcCzdPW75WnrJDzKtaujwtAvKRlpIaM8Qi4qrNeyaKQ=;
        b=GkTW+FEyzZUZJPW4lQWxu+L/Lb4ZPSeIZ47G4dh+HwzEN43qYfaXbNH0+q3GkPwTOC
         +TpY0QiHycRR64eDZe2izRSP76gFkqqbsWbnNUgOhaAIFCKbeIxM0H/mN35ieCXxGzz1
         ml5Kr2S3+R1EV+M72ZybsBvrvn4TQQyx8k8T1uHH6syVUwLCdFAdc2r7aEwCVewZ0M3R
         B+Hg7IQwalF14ksqKsWypDPRPKZphvaK0n6POsixmI65kYUNTxQEBSxX2CbyCpUG6NLN
         +D5gBEiwNPxOlGOoFDc54HGifeB+kuiaE+ZUssCy10A09w94rKwgxVASAeVmGnqHWDhz
         u7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735243498; x=1735848298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcCzdPW75WnrJDzKtaujwtAvKRlpIaM8Qi4qrNeyaKQ=;
        b=gtYsAII7Aq6U6uo3nwujfTQ5c5x9QzjoqZuX9gYaA+8j0hIdUtTq1lvPZ/SRvJbwHC
         nU06G56bDNMO73H4/CiDK1K2G/htEWdNVBS5BlbolSHD6rY/qfC9JGA8kgcstzu0tN5a
         3jAiT17cH7NVuAvBFqdqxsvCyUa64f93BrY0DBaGKFhq7a68dygbXP1V/ZvsvEjMJWhQ
         n0AmcnuwRDH9iTLNml+Zm8KFZA0+lLcb9N44BGSWI65RnuhgsP2V3oiXA1GU0mG5+bA7
         5oG27DRsVfWlfMgIT4j/T3n8HRFVJ6mcY5OkEwrxUNMLh/w4C6ztbDb6w5DQGt3cOVhB
         wviA==
X-Forwarded-Encrypted: i=1; AJvYcCVG9Y4Z2viTbkqmeWhVU5Vz9f+9rVZ2Ui6SvpWaN2q5HG/YE4+7wTitP7IT83i1DNZIbpwr@lists.linux.dev
X-Gm-Message-State: AOJu0YwO58KCjvqt6hsNEO+f3tyzKcHMmuOc5kgtvGH1IdMtiqgTUp/q
	L8/dQdgwZrnn/9FwxXb2sWTEqBmMJeP8NP5113zywJ5oXXglxp6KpW06Yi88X3drL1dUxE4YTvC
	K2bpv9y+gFGyaffFXi3suKlYe1DQI/3/z70uP
X-Gm-Gg: ASbGncv4A+6hFTSXZ53OXtu82n19ZvHM/5neMQxmweJZhUFcy19Zi22UD/OmfhnFPRm
	13G/TSan3M4UjU/fNT4P272566Nw971Y+gtBfrA==
X-Google-Smtp-Source: AGHT+IGRUPCQy8JC3Gf/rUg4JHywFHnQqLCxbR1geMemLFuKqxoMwCCUzGy6mj6IatufpeCjHyG9Fy/24VBrtjAU+HI=
X-Received: by 2002:a05:622a:391:b0:466:8c7c:3663 with SMTP id
 d75a77b69052e-46a4bfc68bcmr17761951cf.5.1735243497722; Thu, 26 Dec 2024
 12:04:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241226170710.1159679-14-surenb@google.com> <202412270328.HiJX1mRt-lkp@intel.com>
 <CAJuCfpHb23mRT6bS8LNd79Zm0XU9eq9hB671G21UnkU992j82Q@mail.gmail.com> <CAJuCfpFc8+q96axtTLEP0=-nwF-9Wunim9O6A6HXN9t-ztJQuw@mail.gmail.com>
In-Reply-To: <CAJuCfpFc8+q96axtTLEP0=-nwF-9Wunim9O6A6HXN9t-ztJQuw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Dec 2024 12:04:46 -0800
Message-ID: <CAJuCfpHyOP0EyWChrGFnTbBYn9=aDbkF71gk2p+4AMhW8J1nSg@mail.gmail.com>
Subject: Re: [PATCH v7 13/17] mm/debug: print vm_refcnt state when dumping the vma
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 11:54=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Thu, Dec 26, 2024 at 11:51=E2=80=AFAM Suren Baghdasaryan <surenb@googl=
e.com> wrote:
> >
> > On Thu, Dec 26, 2024 at 11:41=E2=80=AFAM kernel test robot <lkp@intel.c=
om> wrote:
> > >
> > > Hi Suren,
> > >
> > > kernel test robot noticed the following build errors:
> > >
> > > [auto build test ERROR on 431614f1580a03c1a653340c55ea76bd12a9403f]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasa=
ryan/mm-introduce-vma_start_read_locked-_nested-helpers/20241227-010925
> > > base:   431614f1580a03c1a653340c55ea76bd12a9403f
> > > patch link:    https://lore.kernel.org/r/20241226170710.1159679-14-su=
renb%40google.com
> > > patch subject: [PATCH v7 13/17] mm/debug: print vm_refcnt state when =
dumping the vma
> > > config: hexagon-randconfig-002-20241227 (https://download.01.org/0day=
-ci/archive/20241227/202412270328.HiJX1mRt-lkp@intel.com/config)
> > > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project =
6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20241227/202412270328.HiJX1mRt-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202412270328.HiJX1mRt=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> mm/debug.c:189:54: error: no member named 'vm_refcnt' in 'struct v=
m_area_struct'
> >
> > Ugh, ok. On architectures with ARCH_SUPPORTS_PER_VMA_LOCK=3Dn this will
> > happen. Preparing a fix.
>
> This error actually also requires CONFIG_DEBUG_VM=3Dy.

Fixup posted at
https://lore.kernel.org/all/20241226200335.1250078-1-surenb@google.com/

>
> >
> > >      189 |                 vma->vm_flags, &vma->vm_flags, refcount_re=
ad(&vma->vm_refcnt));
> > >          |                                                           =
    ~~~  ^
> > >    include/linux/printk.h:514:35: note: expanded from macro 'pr_emerg=
'
> > >      514 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
> > >          |                                          ^~~~~~~~~~~
> > >    include/linux/printk.h:501:60: note: expanded from macro 'printk'
> > >      501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, #=
#__VA_ARGS__)
> > >          |                                                           =
 ^~~~~~~~~~~
> > >    include/linux/printk.h:473:19: note: expanded from macro 'printk_i=
ndex_wrap'
> > >      473 |                 _p_func(_fmt, ##__VA_ARGS__);             =
              \
> > >          |                                 ^~~~~~~~~~~
> > >    1 error generated.
> > >
> > >
> > > vim +189 mm/debug.c
> > >
> > >    178
> > >    179  void dump_vma(const struct vm_area_struct *vma)
> > >    180  {
> > >    181          pr_emerg("vma %px start %px end %px mm %px\n"
> > >    182                  "prot %lx anon_vma %px vm_ops %px\n"
> > >    183                  "pgoff %lx file %px private_data %px\n"
> > >    184                  "flags: %#lx(%pGv) refcnt %x\n",
> > >    185                  vma, (void *)vma->vm_start, (void *)vma->vm_e=
nd, vma->vm_mm,
> > >    186                  (unsigned long)pgprot_val(vma->vm_page_prot),
> > >    187                  vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> > >    188                  vma->vm_file, vma->vm_private_data,
> > >  > 189                  vma->vm_flags, &vma->vm_flags, refcount_read(=
&vma->vm_refcnt));
> > >    190  }
> > >    191  EXPORT_SYMBOL(dump_vma);
> > >    192
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
