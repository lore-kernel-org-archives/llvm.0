Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703343D9541
	for <llvm@lists.linux.dev>; Fri,  3 Jul 2026 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783087029; cv=pass; b=LdP/T9TeJjEWZTEmDU8gBARWMc1+dJStRw4R089vNjpeAAW0Rr9beyQL95h9ajsirpQCWkahMT6qJkz9gQiKyf2twqKYPF4aGXxr/6re0lA2IUfT7+yKOoEfwv11h6JXfAz9uCrMfo1+v+UrScAOhawjbuea3agEvCC9VIpRcQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783087029; c=relaxed/simple;
	bh=hVvP+u6yM5Mqcyx98ZiEMoPB/tESb1RKnQit6hmGlqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+IVr4Le/yFJS7EwcnJzLReUPuuT/z0lBn4YP1SCSN9/J3+n1Ixa6nJtaIHWzJ++1r/3r1kClrXIayo250RYCyBq4TGnzBjLje6vjoLNg4IqCAf4hsb4QikMvnQ+v9Sh8ZQzJ9L6IyxhEpwZu3ggu46mb4U9vmgjkTKhijXNLnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scRLmCfB; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scRLmCfB"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e6b5737bb2so460447a34.1
        for <llvm@lists.linux.dev>; Fri, 03 Jul 2026 06:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783087026; cv=none;
        d=google.com; s=arc-20260327;
        b=nH/trnrV5/mh23ArcKrwvmLspql0ynwvs6N64wX2YBv7eh3mJr2hSrHxyoJBcIrfW3
         LAoB8tb8c1R3RJxZwfoNpdXQhqOsl2w5jZ2awFAjU/oh92rrOnaO0HggfFzurs8sw4Yb
         3vxqDPYmhwCJasJRxu9Ef4/58HSs5/irQOg1W2Ad1706fXEA22tM746oxtnM4vTYzNXj
         fwPmJ+q3bKeycqQ8BoSWGaalod5igIdZoCzYndHAqzoR8A2EcbbjZSOBTGzPJoOYdFpX
         4s7GwOd7rHEky85S1Bi07SZz5xpZ8CzHJTQFI2mhbI4zIC4u5zonl1ciWEOoVbYGN3FP
         tlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nASBmgGmFajYNDw+sfEzifcL6cg7Q3JMObUhW3cut4I=;
        fh=Wweel56kqpzlso+So7wRTHieSVdfl0nFuIxoWrlG5Lo=;
        b=lPDFRvl884cru0pspMGhGPslvCJM8zZp77kQkmgcrAwoVyFcM3Qu7hWFDeOlj34feF
         DKJO5ZaohZ6D5Xd2z8uQu2nE7yJXBvO9kUysUDYGnu9TeyzbvB7ZmzrozhGu9EQv3xET
         JNnmKOYJVA36WiG+pdUr2dvsOX9aGEhITCbtCYKldrm2G12CvgrrLo5yPa6RVRYON53j
         gzwEV/k25oiwzeL3ifnDqFxw1DZ8srxlzXw1VPRZiXOW2hHPZCChXCFSbi56E9QTqrJs
         rd6dNsrt95x+rET7+cgDi0PZ2VUGOXf+JuHAlFE8w4rWIcE8BWOppveXHSHpT6V+Mg52
         ca2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783087026; x=1783691826; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nASBmgGmFajYNDw+sfEzifcL6cg7Q3JMObUhW3cut4I=;
        b=scRLmCfBDB0M/0vnqcrKEuGc0KLgb/ZjwBvCoTeuuoAZnuP9ESMb/r9wD0jdm1lcT4
         aPNQ3JKEuogt5tmTu5uANZgI4EDEVOrvKCIsBcW//X66S3av+mpvQk2SQ5vAr+EhrPQQ
         rycI6z611QHIZ/sbXj2IGaGxUBGsypcFidUs+8ZmTM2FqwAVsolelpU91pRQb5uXF7B0
         uR5vdXbdmRLTHjOM85CZjVIoEDXoo4OZyVfu8Rfx7nDC+PHi4NcusBSmjq8Utb+cZ+By
         erFPT5bXf1PiX8tZRvKLyAIJQ5KHLGkLBiiuRGnk1ZxUbchx+pIyGO1CFWtd2sBmzRcH
         RBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783087026; x=1783691826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nASBmgGmFajYNDw+sfEzifcL6cg7Q3JMObUhW3cut4I=;
        b=bFo3BsEKzXbPFDKb686JwQeO8PKZQ89e0HLCWltFTD2yo6V8xd9xLRIvd9jmWTBiO5
         dQgSAYRKITdLXDMKAVrC3GlWplfZt9hduk+UiBrUkoGdWxizOB1OoJDxj73uyhS0XksP
         TaMaDl1C4MDqklrnoaOpPx9rsoUAXHrfMuYc7MdsW2uMRqcRkZfwwiRezAPDNnyIWEPW
         7ncwAKeQ6bONNgJDzqkcU4w8ZCRmCBB44TzUwLE5qIfDPY3EhRbM83S2JqbiDPjs2pBu
         DoheZ9lqgKa0rmIocKhhFV06CfkjggtfMwjJtDine2hRG9FR4AIugGonu8s/2AdIbJE5
         /5wA==
X-Gm-Message-State: AOJu0YxWZdy2MugkzytsZhwhDcUPixgJVim1yl7rUiVLqdfM9kGExdUJ
	nfwK+Xms3pN+tRVVebwm2wciPC+aTrkdYSkLqSPbQEDzn1kPAHOfrbPENAglZC5BDKFcFd4pKfV
	c6ISiB7+gHPUk84VsStna/VrPpAkLvh/fqjxWNMnEncfK
X-Gm-Gg: AfdE7clxz04zd8Jgb6dSedPbK2pyPV9VvyUmC/+yXVenvPs7roqykhVBoMcouXwJABD
	fuQqHadpq4pAv+JQrVDtKbZuy6+NfAabTIHymC3OZ6Q5bF1VOro/4WhfHYj07iNZGlngwEChTNQ
	eHTL+wAf1exYOpqz1vFKQ09/NJxauBStE2L7bxJLlsQBf9CkDS7SdNBzlljVUOrELsr8z4w9D5d
	VAA13Ue4S5mx3WtFtaPKd/W/8ScFUi6MFTVW8S6jjz+yw8zOjJmAXNzsD/fZ4pTrAnEbyzpJM0=
X-Received: by 2002:a05:6830:6f45:b0:7e9:b4d0:df75 with SMTP id
 46e09a7af769-7eb4cc56976mr7034576a34.29.1783087026315; Fri, 03 Jul 2026
 06:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607031837.HSmBj8pr-lkp@intel.com>
In-Reply-To: <202607031837.HSmBj8pr-lkp@intel.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 3 Jul 2026 18:56:54 +0500
X-Gm-Features: AVVi8CdHQupey23YWEsUas1M0EpNc9-M0aUb-pflQdFjPWNzAQA9rXMMh6ms9WY
Message-ID: <CABXGCsNFxBF6BJBBOK6Wzm9ELA4_o=yjkkCr7rSbmUQBK24e4w@mail.gmail.com>
Subject: Re: drivers/gpu/drm/amd/amdgpu/amdgpu.o: error: objtool:
 amdgpu_vm_handle_fault+0x16b: sibling call from callable instruction with
 modified stack frame
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 3:17=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   d2c9a99135da931377240942d44f3dea104cedb8
> commit: 7152b248dc3c8d5fa8629e99ed5655dd41b51562 drm/amdgpu: fix recursiv=
e ww_mutex acquire in amdgpu_devcoredump_format
> date:   2 weeks ago
> config: x86_64-randconfig-004 (https://download.01.org/0day-ci/archive/20=
260703/202607031837.HSmBj8pr-lkp@intel.com/config)
> compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e984=
6648fd6183ee6d8cbdb4502213fcf902a211)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260703/202607031837.HSmBj8pr-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: 7152b248dc3c ("drm/amdgpu: fix recursive ww_mutex acquire in amd=
gpu_devcoredump_format")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607031837.HSmBj8pr-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/gpu/drm/amd/amdgpu/amdgpu.o: error: objtool: amdgpu_vm_handle_=
fault+0x16b: sibling call from callable instruction with modified stack fra=
me
>

Same drm_exec computed-goto issue as the other two reports, now on
Linus' master. +0x16b is the drm_exec_retry_on_contention() computed
goto in amdgpu_vm_handle_fault() lowered to an indirect jmp (jmp *reg
to an in-function label loaded via an R_X86_64_32S relocation), which
objtool can't resolve to an intra-function jump and so treats as an
indirect sibling call. Same mechanism analyzed here for clang and gcc:

  https://lore.kernel.org/oe-kbuild-all/20260624092806.GX48970@noisy.progra=
mming.kicks-ass.net/
  https://github.com/llvm/llvm-project/issues/205544

Note the bisect: this instance is attributed to 7152b248dc3c
("drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_
format"), but that commit only touches amdgpu_dev_coredump.c and does
not change amdgpu_vm_handle_fault(). The drm_exec conversion that
introduced the pattern is 9920249a5288 ("drm/amdgpu: convert
amdgpu_vm_lock_by_pasid() to drm_exec"). The randconfig-004 attribution
here is a bisect artifact, so the suggested Fixes: tag points at the
wrong commit.

The drm_exec macros are being reworked to drop the computed goto, which
will fix this on both compilers. Not respinning the series; happy to
test the drm_exec.h change once it lands.

--=20
Best Regards,
Mike Gavrilov.
