Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D43C450FA
	for <llvm@lists.linux.dev>; Thu, 11 Jul 2024 17:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720717767; cv=none; b=RxI13+yHe8IGQFx46Niu8NPfYrxUs/V3xUqdw+vXJbKuDkH/o5xqFmdSFtNhDRTJsrP8rwdASwBPiA4ME36+a+r7m2go1RzzzAZzmC+VNNpCjJyTBpAQpVzHmrvnjE8PrqsL/fCNCUtbJKy4JRx+m0ZdADif4Nspvi7ygtSvZRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720717767; c=relaxed/simple;
	bh=C3F9jB3kZe372d/2FqZSOc9k/pEeRRtlSpwAdrHy+RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfjeKjn959Bpz0DoYMjFeFX1afwp1MUy251+RMC1+wzddUwqPif/2AvcFGDqJBlLlq95GUQwb+Ukpej45eqxaYXP84jzG+VczrRYSb5ihJ00F/yvyVlBjVjShRFOSINk3iAH5/OThPlb1g7Sn6qpzSwirIxeOx042aedzzuQOMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lnPZVFLp; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lnPZVFLp"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e057bdc936fso1074860276.1
        for <llvm@lists.linux.dev>; Thu, 11 Jul 2024 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720717764; x=1721322564; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BT4Q0fDnQo1b1rbWAFdQTaPbqeR+6myjThNugn0g5s4=;
        b=lnPZVFLpa3awowufJjdgxrpGg9wLVUFSwIc6WVyzM5IdDNtxpWWu6zUpVDPyvA0See
         K34vMjvd/RsUloDW/+yzYkkQFP81KTl1Be35+N7tqaE/AQF6/NyrwNUwIOFCvHVv2je/
         3YrnjZyQy5QdH44/qD+UF5pxNycn9I6jWoRFh4BvVwBG1gcpTIvDioFbNONkpBFFknnG
         ls1qN8r8GqZxeRTMJwmMCfuvoVqnk/8gvMY9o3Qii+eALAhGNKvgpJkU+GUXQnzRJ3hL
         xg9IMLHzdAWvktgDh8yFm3/TPXoCDbS1kdkUKMyhEdyPJXA1gfuDJYIx5iVZGgqKwJws
         6PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720717764; x=1721322564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BT4Q0fDnQo1b1rbWAFdQTaPbqeR+6myjThNugn0g5s4=;
        b=DPxTpvP1XWd2hcDAcemu9nQ0ViszbfG3IDQw0KrFYZvJvmsQ4FoGU1rlcEWYgRKvDs
         sS0F8F2PYqcYZn02UlBTi1bjs+yu+uont6BqJMFiTsYsKqvPb1FzRbMEm1x6YWvQEFIs
         wENL1QL7iSlbBwKPQlOZYflsGqgVuilXg5UWfsKOXrMi7SMpvr+R0K5caYUlZPKSmblQ
         rQQ90KN2SIhNzJhFegYsUYAdB1MD4Fxz8tmlyiOqXeXaK20+bRqPXtqP3mKm71EjKytC
         VK46WP4X0ihAVMUelra87IQ2sRT7rY6hVC/yDew4r/Z0wiRze5IGA6hWgyIhediOtPNb
         H7Lg==
X-Gm-Message-State: AOJu0YzajDN1qkYC2x5HQGd5F26MOoIA8+8LLEljIeR9e22dz/U1qpzn
	e7Wo5Za1Kxobbrs257196fQjR35Vq3mj7rEuiFGQMBLrDNmR161m5Tsh8unfcbTyJnjJuRwskzq
	CisrPiF2T4GKAnitevhaycWaKqDJO2ETTokuF
X-Google-Smtp-Source: AGHT+IFhB7a+a8BufuhlkTWktjp2U5ed8yphy1GsV9RSCnMPrnocZGbTiFQNSoEMqZd7f6XE4G2m/LQxA5D5a5Q+8sc=
X-Received: by 2002:a5b:b0b:0:b0:e03:ae1c:8d0f with SMTP id
 3f1490d57ef6-e041b17328fmr10346582276.59.1720717764206; Thu, 11 Jul 2024
 10:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407050845.zNONqauD-lkp@intel.com>
In-Reply-To: <202407050845.zNONqauD-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 11 Jul 2024 10:09:13 -0700
Message-ID: <CAJuCfpEwNE5tsm+iZTzZc-hdR5sBXAKd57tOGum67_fAu2Gi3A@mail.gmail.com>
Subject: Re: mm/slub.c:2077:1: error: unused function 'prepare_slab_obj_exts_hook'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 5:35=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   661e504db04c6b7278737ee3a9116738536b4ed4
> commit: b4601d096aac8ed26afa88ef8b249975b0530ca1 mm/slab: fix 'variable o=
bj_exts set but not used' warning
> date:   10 days ago
> config: x86_64-sof-customedconfig-amd-defconfig (https://download.01.org/=
0day-ci/archive/20240705/202407050845.zNONqauD-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a=
15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240705/202407050845.zNONqauD-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407050845.zNONqauD-lkp=
@intel.com/

Fix is posted at
https://lore.kernel.org/all/20240711170216.1149695-1-surenb@google.com/
over slab/for-next baseline because that branch contains another code
refactoring [1] which would cause merge conflicts.

[1] https://lore.kernel.org/all/20240704135941.1145038-1-surenb@google.com/

>
> All errors (new ones prefixed by >>):
>
> >> mm/slub.c:2077:1: error: unused function 'prepare_slab_obj_exts_hook' =
[-Werror,-Wunused-function]
>     2077 | prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, =
void *p)
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.
>
>
> vim +/prepare_slab_obj_exts_hook +2077 mm/slub.c
>
> 0bedcc66d2a43a Vlastimil Babka    2023-10-03  2075
> 4b8736964640fe Suren Baghdasaryan 2024-03-21  2076  static inline struct =
slabobj_ext *
> 4b8736964640fe Suren Baghdasaryan 2024-03-21 @2077  prepare_slab_obj_exts=
_hook(struct kmem_cache *s, gfp_t flags, void *p)
> 3450a0e5a6fc4c Vlastimil Babka    2023-11-13  2078  {
> 4b8736964640fe Suren Baghdasaryan 2024-03-21  2079      return NULL;
> 4b8736964640fe Suren Baghdasaryan 2024-03-21  2080  }
> 3450a0e5a6fc4c Vlastimil Babka    2023-11-13  2081
>
> :::::: The code at line 2077 was first introduced by commit
> :::::: 4b8736964640fe160724e7135dc62883bddcdace mm/slab: add allocation a=
ccounting into slab allocation and free paths
>
> :::::: TO: Suren Baghdasaryan <surenb@google.com>
> :::::: CC: Andrew Morton <akpm@linux-foundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
