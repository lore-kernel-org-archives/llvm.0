Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F47965C
	for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 01:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711070766; cv=none; b=ad9zJAsONhbwYSqoaZsO1rgOncP+bvcsNSA58AKSNh0946eDTdrzkKKMqBlJjS2qfarziAylHQbMP2jSvJzPD/e0iC7/Ysk+Kd4nh4gIeKATmQX/vY8RCPGlr8ZzWpXEj/5FyoBP+WpRHFgbvIvZlpuMdWD80NLXor/dh72Bgk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711070766; c=relaxed/simple;
	bh=sUVutNDgGpGxD172o8zGQS5BMUM10LcVdWVgTqQZdQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRN8QGdmUe74W1HRvAXCJRs7TUGc9iGWQVFp7WEXUVoonuwA76WvtOhYKYa3d2tHYpSRnOur4w8OBEbAQAbCQoBrStBZpP0hccDm3Znd/yi89aB+6AubKYGlpw4fRKLW1bOjB3OfLSmI3FmKiRru08htg6scrJdvLSQndkEeLdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuzWCave; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuzWCave"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7e043f577c5so887288241.1
        for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 18:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711070764; x=1711675564; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnrA7VCP2UghSQHIHzERUpi2aY63j1gM5buPqEdAsC0=;
        b=UuzWCaveW57HMv+MsPkOnvwv/QvnyElgTd4I/e7y04k19b+cOxFtsyYk0W/uhKHhHQ
         UzkQlnka+p+vafpFr80jHb3+qw7P3L3NP7ZZcrdEBk6OHap+2WrISEijkv6gAFZaoAjg
         DgWGvg9roCnZVoaTYy8dcJFSsV+1CjzEteMGaXsr2WRj9ZSUukqCOdsCzH3q4lKo6GmS
         RlXoairMQwKuJmS5+sTroN5pnuxTueEgNgL9WEgRG9eY3kFP0AN33v/HRPZjCwJMoIjT
         mL1X58eJwJinktZoM3b7udK6Txh1ACdpgfKcxybouneo+kvpMudycrizRZ9beEJsB6V9
         SVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711070764; x=1711675564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnrA7VCP2UghSQHIHzERUpi2aY63j1gM5buPqEdAsC0=;
        b=uGB7SOFWNEHC/N63s4oduGfN9B7lHeXofEYxQGWxQrn9Wn34tjkmLC7kB+uIqskTii
         MMfIKTI7Fy/p/JVs2Lt0C+jv5tWyrXfn4Vt/WcXJuTu686fOSeEdxORjNEPw/E+srhW9
         b5nThzmJVhHyIn0uumUwgV7+/BD4gozp1taGffrxQV/FQQZvEFoSS4WNckMjMcAPui2D
         9B5U/3b9efBRXRnLkC50vIkLdIN9S+O/tw0N3b73rDLe4A9puVJ4Bkm1p0IyRMJBrzMy
         WJH3gpS9ymczJ+SfBGZeRkO0I+1KsdiWYqtxAQLg02jZzR1AiwI/H9Nzjxbg3ztSGpjQ
         61mg==
X-Forwarded-Encrypted: i=1; AJvYcCU2yqIswMIvDjOux373kalNbKLVbdh50UIsQeUY1lqEyxJJJaYK/d0yDFPWL8I1zw2a1hUt4FneOhYGKQKrFlTG9HM/OQ==
X-Gm-Message-State: AOJu0Yxd8nNx09Wv8MQmwwM+jGOqhedSOZda2irlmJ3T4xo5KbfFjmvP
	pukdWhUd2PL9ex3QujFbC5GI/K50hXoAjJkem80wMcvm8jTBIL2CAFrkHxnVL3MswbI0XcUfQki
	E2ZG807kOxz9XWxdMLpbW3Nt4ZAE=
X-Google-Smtp-Source: AGHT+IEX3LGVYC4fhTEF6otGyeJAhOWJOQ4fPtLG/kizcg2xXDVzlPfBIxephr3HBjwl6XPh7D3ehuvyP21vvXMlokI=
X-Received: by 2002:a05:6102:2c6:b0:476:70e3:98ba with SMTP id
 h6-20020a05610202c600b0047670e398bamr383936vsh.9.1711070764109; Thu, 21 Mar
 2024 18:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240314141516.31747-1-liuhailong@oppo.com> <20240315081803.2223-1-liuhailong@oppo.com>
 <ZflTCY-Oaxm0U70u@tiehlicka> <CAGsJ_4w0EHuAwvSFuqUsMO-bLjJwCmN_qjL6NuA043-4rgfgsQ@mail.gmail.com>
 <fdc90410-5698-4cda-a7c2-952480c7e7e6@oppo.com>
In-Reply-To: <fdc90410-5698-4cda-a7c2-952480c7e7e6@oppo.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 22 Mar 2024 14:25:52 +1300
Message-ID: <CAGsJ_4xDTS9_NPzKnqZ1vJk2egLVCSSvCbub3oRX8k9MHQFXLg@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "mm: skip CMA pages when they are not available"
To: =?UTF-8?B?5YiY5rW36b6ZKExhb0xpdSk=?= <liuhailong@oppo.com>
Cc: Michal Hocko <mhocko@suse.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "nathan@kernel.org" <nathan@kernel.org>, 
	"ndesaulniers@google.com" <ndesaulniers@google.com>, "trix@redhat.com" <trix@redhat.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "surenb@google.com" <surenb@google.com>, 
	"zhaoyang.huang@unisoc.com" <zhaoyang.huang@unisoc.com>, 
	"quic_charante@quicinc.com" <quic_charante@quicinc.com>, "yuzhao@google.com" <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 1:27=E2=80=AFAM =E5=88=98=E6=B5=B7=E9=BE=99(LaoLiu)=
 <liuhailong@oppo.com> wrote:
>
> On 2024/3/19 19:09, Barry Song wrote:
> > On Tue, Mar 19, 2024 at 4:56=E2=80=AFPM Michal Hocko <mhocko@suse.com> =
wrote:
> >>
> >> On Fri 15-03-24 16:18:03, liuhailong@oppo.com wrote:
> >>> From: "Hailong.Liu" <liuhailong@oppo.com>
> >>>
> >>> This reverts
> >>> commit b7108d66318a ("Multi-gen LRU: skip CMA pages when they are not=
 eligible")
> >>> commit 5da226dbfce3 ("mm: skip CMA pages when they are not available"=
)
> >>>
> >>> skip_cma may cause system not responding. if cma pages is large in lr=
u_list
> >>> and system is in lowmemory, many tasks would direct reclaim and waste
> >>> cpu time to isolate_lru_pages and return.
> >>>
> >>> Test this patch on android-5.15 8G device
> >>> reproducer:
> >>> - cma_declare_contiguous 3G pages
> >>> - set /proc/sys/vm/swappiness 0 to enable direct_reclaim reclaim file
> >>>   only.
> >>> - run a memleak process in userspace
> >>
> >> Does this represent a sane configuration? CMA memory is unusable for
> >> kernel allocations and memleak process is also hard to reclaim due to
> >> swap suppression. Isn't such a system doomed to struggle to reclaim an=
y
> >> memory?
> Yes, All processes in the system are also hard to reclaim. and all proces=
ses
> enter direct reclaim. with this patch, much of process which should skip_=
cma
> would retry, scan, skipped in the process of isolsate_lru_pages. and syst=
em
> process will have high priority, some normal processes (like kswapd) are
> preempted.
>
>
> Btw. how does the same setup behave with the regular LRU
> >> implementation? My guess would be that it would struggle as well.
> >
> > I assume the regular LRU implementation you are talking about is the LR=
U
> > without skip_cma()?
> >
> > I remember Hailong mentioned something like " it also trigger memory ps=
i
> > event to allow admin do something to release memory" and " without
> > patch the devices would kill camera process".  So it seems the differen=
ce
> > is if a killing will occur.
> >
> > Hailong, would you like to provide more detail?
>
> psi_event triggered after psi_memstall_leave. much system processes
> perform_reclaim scan and skipped and leave without reclaim any pages.
> the process is fast, so lmkd (userspace lowmemory killer) could not work
> as before.

Can you provide more details?

Does PSI still give accurate reports when processes are stuck in an idle lo=
op
because most pages in the LRU list are in CMA? Also, in such a case, will
the LMKD not receive CPU resources to execute?

>
> >
> >> --
> >> Michal Hocko
> >> SUSE Labs
> >>
>
