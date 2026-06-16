Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2A6478E55
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 17:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781630656; cv=none; b=qAPcCVuwsqKtQIpglOQ+Wamt10n6UlaWgaIgA+otaCNOPUOpZLX48ZV/C4K/MULNpQusiL2evJegqmo/8WgOsD+LFpSb9mpkfkOqpKJn3RfBqwpAExJJAqLgF9HwAyY3TF9YmgpF7Lis1ZM/swWRblDZIvU2UmZ+t324k4A2WWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781630656; c=relaxed/simple;
	bh=4NREgcFMc6ojmqheupdomFGpBTVUQQ4JzA54i/T+z+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbA7MxeVqjG9BcJygHXDHC4E7qpC7XEiUo4nctegQ/jGZb2ORhBmv8iWSYmqAJs3OyPJnorHp08OVF2UgPeJZMv0NKE3Y3TtQtm/Bf3nlPUgrR7+KSZNyPC/d8buJoytHfsmPKi1hwd/x9GnJ1QvqPK5kiAVZ/GCPLmIxECC3qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ptl90/kV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ptl90/kV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557A41F00A3F
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 17:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781630655;
	bh=dT/CDAvYpCQ9uA6d1U98AfeHYUCrBdDJ9qF+woOKYw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ptl90/kVP3sdnF9rkTTgD1QRNqwj2SYv7nbNwgcNd3XuxCgQWng7j70gVfVWWtvBn
	 +Gh3ZkMNe+DEcSAEsswvLMw5/hi3dlq+cQH05OIOdFSvZ34lywD6aJChFAET6E05s+
	 lUFQZmSrH301fAFeSI0/B0MoaPXmXsxrasVla8lH2yvb0nTUSitauQzIfQK7EXXPV2
	 kdEPE72C79ZnXRcWAkNnP9L1izdS1pVa9Znq3WbwSMc0f8kzLWuJwQi2H/EJLQmLIL
	 1zNNiKOUuxNGm6Wiv2s6yQ7AKMLOFDTGzckVjswdzRKz4dJQwngfpdL5PHNsZNvG3u
	 snoYtBmzQmk/w==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bf0170c80f7so823238166b.3
        for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 10:24:15 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy9ZuZoP/WFNNIk+YOMRy92JXRMMY8WLE7lnt3Qc1AuBvoEBwEO
	NEpWG8dTGdvj+vMdGpgNBoWsBcTakfWxXBBKlAZkgpx2Wq4ecK5yB+Xt+908qRpZyQ00LmHbtJO
	/ZD06pNyaqMgEy5Nm4b4K/PqLukOEPh4=
X-Received: by 2002:a17:907:1c08:b0:bd3:1a18:cc64 with SMTP id
 a640c23a62f3a-c05a6bd919amr42517366b.31.1781630654221; Tue, 16 Jun 2026
 10:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606161302.xMRLP5W1-lkp@intel.com>
In-Reply-To: <202606161302.xMRLP5W1-lkp@intel.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 16 Jun 2026 10:24:02 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNdGav1sSS1oYxMOvatGg6mmXv=8-952E5HjB1+YT-HcA@mail.gmail.com>
X-Gm-Features: AVVi8CcMTkf7FZNZhl4yNjPdvHyUkwpKQlE3Im1H3fDyaj-UokbN3Fp6xJg3oMY
Message-ID: <CAO9r8zNdGav1sSS1oYxMOvatGg6mmXv=8-952E5HjB1+YT-HcA@mail.gmail.com>
Subject: Re: ERROR: modpost: "kvm_free_tlb_tag" [arch/x86/kvm/kvm-intel.ko] undefined!
To: kernel test robot <lkp@intel.com>, Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 4:21=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yosry,
>
> FYI, the error/warning was bisected to this commit, please ignore it if i=
t's irrelevant.
>
> tree:   https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/KVM-nS=
VM-Flush-the-TLB-after-forcefully-leaving-nested/20260616-104539
> head:   8ffd2ccdf3cac4abc0d2fd686f0ec3c7a453a24a
> commit: c431a77735b3877be989d51a32b73ef4e80902ca KVM: VMX: Generalize VPI=
D allocation to be vendor-neutral
> date:   9 hours ago
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260616/20=
2606161302.xMRLP5W1-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f=
43d6834093b19baf79beda8c0337ab020ac5f17)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260616/202606161302.xMRLP5W1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606161302.xMRLP5W1-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "kvm_free_tlb_tag" [arch/x86/kvm/kvm-intel.ko] undefin=
ed!
> >> ERROR: modpost: "kvm_alloc_tlb_tag" [arch/x86/kvm/kvm-intel.ko] undefi=
ned!
> >> ERROR: modpost: "kvm_destroy_tlb_tags" [arch/x86/kvm/kvm-intel.ko] und=
efined!
> >> ERROR: modpost: "kvm_init_tlb_tags" [arch/x86/kvm/kvm-intel.ko] undefi=
ned!

Hmm I used EXPORT_SYMBOL_FOR_KVM_INTERNAL() for all these symbols. Is
this not the right way to do this?
