Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146AE3BFE5B
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 17:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781630995; cv=none; b=GEI+cT62RNupcTw/X3OzC3itJIohS7lZec3CW6TFYW5HovsPIcKKONgCsfAPJz9L0m1qhn2GEXeS010h5zKYhIfOq9SOtPbEWBqKTEHa0Ixul5mMGn8WT7aXmTt5NbvXL0un3EqPDPmoh7DGtRZrW6r4jGDaCo5KZgNcEUX3/uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781630995; c=relaxed/simple;
	bh=OdjXOZZyT2VAdu6qwL+QKQQPgXFKYSD9pzmhQxMrg8M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f439NYbWKI4EzNF7spIzJjLYY5lCrqt5P0+oBaKMnV0sFROE3PWPvKXVh+kCmHGvfne0eEz/azPN1B+bYUYW/ozcZJHKKiFcJ5rf1MPIE9n5+yqi69iX3t4BpR0pBi5EDMinsCl5PHtcydbMlkDvZxJOUP8gU5jYRxswumjBA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nV7zto/J; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nV7zto/J"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8423efdbe6fso3108143b3a.0
        for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781630993; x=1782235793; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5url6GgdQAe3Rj1rbX0oE/WHqyGvLSj5nPFWzeaFngI=;
        b=nV7zto/Jv9zAXZdapeQYOJaR/Osy/JZwFgFBXMjl1dACCM7/QB2xK+eBhP78+veutB
         Z/sd2B4TD5fJtt0ju2bsNm0Q8hknX1e/w4jL/xlNSloKdXGKMgw404KOQmALrlUKpY2i
         7YyoQmaIfgDBVKEZ193O+I3ikp4sPxjaJREE3M2pTx/Nk8uvK8tkoDXsM/4N8b754Wm0
         MXcvf8b7Sf8hBNeCKgk1vTBjGTfHEp6/yC4vbNwtDhe+24lNN2O/xvjdOwsxw2eg58bC
         xyJFLao579NgwWnEmOGSw7ZDytZkJR2aYSFNoqlySU2hnyNeh5WVD+oibXNT8Wn/atII
         4p+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781630993; x=1782235793;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5url6GgdQAe3Rj1rbX0oE/WHqyGvLSj5nPFWzeaFngI=;
        b=Vy9QeUaIg0chbNcL5+q16bLL2qlfPkNIjRiFsX4uTYcJcrKxU6Zmfy7umfanhbzwX+
         zOdzDTx7LmBj2hVzLjUufIQuTXPgUAySNt6XGuVupUzUJs84uOVyW8TxckL+ws4bcsHh
         A8gv2nbdWCbvOTWTld9rgKsoWuXIn6YUkg9a6sy2AMzVanN+bil/u09UCufBrUEM4mXX
         AzbNGj9VkRx8U49VUuR80PMjDMuvpZnL+HNLTpZ/rWdE8xUTne/UaJ4fATiSYZvQ3288
         rCKpGYLT2rJzpSa2YHKIcYLRk4mUgTZEgeQsOBB6kgHPRHg6C+OKNHKpDw25ZcosUSYB
         4ICg==
X-Forwarded-Encrypted: i=1; AFNElJ8wkuY/L1MrRGGbH7T1E7/fo0JAuUwOPU99qRl4xKenYAscUexjLAS8AozEGiaHvWH3xzTW@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1HHteoJyKwQFDRfVKGGb0ZpMhEGz7G9fLY3fRAbx8VIWdQ+Bb
	vM0SGTqOZNZo7+GD/3pSUIDpQymxH0+UGjDPnijRO+erbp2C8wp/znraYw2nBve6cRbaPt9V1yB
	xRn2JDw==
X-Received: from pfdf25.prod.google.com ([2002:aa7:8b19:0:b0:842:8af7:db0d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:340c:b0:841:58b0:82c8
 with SMTP id d2e1a72fcca58-84524447251mr127999b3a.13.1781630992854; Tue, 16
 Jun 2026 10:29:52 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:29:52 -0700
In-Reply-To: <CAO9r8zNdGav1sSS1oYxMOvatGg6mmXv=8-952E5HjB1+YT-HcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202606161302.xMRLP5W1-lkp@intel.com> <CAO9r8zNdGav1sSS1oYxMOvatGg6mmXv=8-952E5HjB1+YT-HcA@mail.gmail.com>
Message-ID: <ajGIEGG508I8iwBL@google.com>
Subject: Re: ERROR: modpost: "kvm_free_tlb_tag" [arch/x86/kvm/kvm-intel.ko] undefined!
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026, Yosry Ahmed wrote:
> On Tue, Jun 16, 2026 at 4:21=E2=80=AFAM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > Hi Yosry,
> >
> > FYI, the error/warning was bisected to this commit, please ignore it if=
 it's irrelevant.
> >
> > tree:   https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/KVM-=
nSVM-Flush-the-TLB-after-forcefully-leaving-nested/20260616-104539
> > head:   8ffd2ccdf3cac4abc0d2fd686f0ec3c7a453a24a
> > commit: c431a77735b3877be989d51a32b73ef4e80902ca KVM: VMX: Generalize V=
PID allocation to be vendor-neutral
> > date:   9 hours ago
> > config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260616/=
202606161302.xMRLP5W1-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project=
 f43d6834093b19baf79beda8c0337ab020ac5f17)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260616/202606161302.xMRLP5W1-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202606161302.xMRLP5W1-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> ERROR: modpost: "kvm_free_tlb_tag" [arch/x86/kvm/kvm-intel.ko] undef=
ined!
> > >> ERROR: modpost: "kvm_alloc_tlb_tag" [arch/x86/kvm/kvm-intel.ko] unde=
fined!
> > >> ERROR: modpost: "kvm_destroy_tlb_tags" [arch/x86/kvm/kvm-intel.ko] u=
ndefined!
> > >> ERROR: modpost: "kvm_init_tlb_tags" [arch/x86/kvm/kvm-intel.ko] unde=
fined!
>=20
> Hmm I used EXPORT_SYMBOL_FOR_KVM_INTERNAL() for all these symbols. Is
> this not the right way to do this?

You put them inside an CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES #ifdef.
