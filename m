Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855823A3E78
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 17:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781631336; cv=none; b=L8uuszcW7K83X7gsxqM4bIKhzlBFQZCwrcq2I5hCQUMhuQn4ZiHm+PVBYzrbxFtWVol69b1c7S/mQ/tqcmY5v+pXcQIQubn9LPXyfJeAic7ZC2fYz6uCbUfZD5eUk0XuNOwxa6YDLyjYapabBjDw7P79uwoPU4ipEOBiFCCNQfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781631336; c=relaxed/simple;
	bh=uLuDuYWgER/xBhtNb5KvjM3BrA7z/N6TMBpTWGjtl6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jocp9Z510GMScM0ysxgbumnqJANwDlb8qhhUjXxiEQuT5juWLp0iikL0XsVedmqdNM+H3x3FvihHmZ7KXWfDkeIhHwnjx3Ib+tG4ikhj32y8AIhvy1SX+wqJ9gt0mbB9AblXVvGJ9mas30jcRuqR/QlAlNZpYyedkXQkfMK2Vqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZrWituF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZrWituF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A9D1F000E9
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 17:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781631335;
	bh=AaOHVgL3Aic8MtYVUQYfobd15nbhsDim4J9MK0adHro=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KZrWituF5pv3hOPbRbmkBps5nVe1ahbk796pJ7TyPu9CpPYAeUtq0cVtqZ22KdLiL
	 Aw3J2l2VxMmeC4DYOXi45jIGTm1sMP9XrFAJ2UlbnVq4wCb6g98rBN7HXqAHm+zBeq
	 hwdwknqzLPBpleL9yo2XoWv0tbQOjayha73eIVJY1JGVReNruRHssu+claXjFsYmtT
	 LXyNxU4FCd5VEk6+31Oxig2CuZietf10RDEiAQeNsCfwvTxFhv3pQHUzsw93zPOivK
	 Z6kiDZb2D/T1R8wlznQZDeZbIpqveuaT4AsoUZdvfMLgcdMf5rA5rri1S1v/B952US
	 QwlLg0wwMQicg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68f36e1663cso8398222a12.3
        for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 10:35:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+JpTjbWRkIRDmDq3RV1qxoZIShaj/QRG3Oh8xY6jEm0mXoRKVLRzT28E8ICunXd/svh1w9@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+hXRIj3H22yfjX6E8z1CL/3PDTswAht1JgZ6b+I95rrR450SP
	J1gVblvW1vOGFXWAV66UruPfzh8K/LvpRRm8iMLTNmdzqSmzASSEjJV4EITZDgjUHkxvwvL78j+
	VSUeHXQNJSrO0qFw0BBW5Kd8kWOp1GYQ=
X-Received: by 2002:a17:907:8e95:b0:bed:afd6:9e07 with SMTP id
 a640c23a62f3a-c05a2748ac5mr46789766b.14.1781631334280; Tue, 16 Jun 2026
 10:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606161302.xMRLP5W1-lkp@intel.com> <CAO9r8zNdGav1sSS1oYxMOvatGg6mmXv=8-952E5HjB1+YT-HcA@mail.gmail.com>
 <ajGIEGG508I8iwBL@google.com>
In-Reply-To: <ajGIEGG508I8iwBL@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 16 Jun 2026 10:35:22 -0700
X-Gmail-Original-Message-ID: <CAO9r8zN4Vr-NRBhkAZrure+xBi=4Y1iHaLiLiP3m-zk94mM+8A@mail.gmail.com>
X-Gm-Features: AVVi8Cc_lCKjoabLvm5gvwWTIm00w7XkZa81YM2YjA4GmAMQqtZ4McJEf9Y5WvQ
Message-ID: <CAO9r8zN4Vr-NRBhkAZrure+xBi=4Y1iHaLiLiP3m-zk94mM+8A@mail.gmail.com>
Subject: Re: ERROR: modpost: "kvm_free_tlb_tag" [arch/x86/kvm/kvm-intel.ko] undefined!
To: Sean Christopherson <seanjc@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 10:29=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Tue, Jun 16, 2026, Yosry Ahmed wrote:
> > On Tue, Jun 16, 2026 at 4:21=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> > >
> > > Hi Yosry,
> > >
> > > FYI, the error/warning was bisected to this commit, please ignore it =
if it's irrelevant.
> > >
> > > tree:   https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/KV=
M-nSVM-Flush-the-TLB-after-forcefully-leaving-nested/20260616-104539
> > > head:   8ffd2ccdf3cac4abc0d2fd686f0ec3c7a453a24a
> > > commit: c431a77735b3877be989d51a32b73ef4e80902ca KVM: VMX: Generalize=
 VPID allocation to be vendor-neutral
> > > date:   9 hours ago
> > > config: x86_64-kexec (https://download.01.org/0day-ci/archive/2026061=
6/202606161302.xMRLP5W1-lkp@intel.com/config)
> > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-proje=
ct f43d6834093b19baf79beda8c0337ab020ac5f17)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20260616/202606161302.xMRLP5W1-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202606161302.xMRLP5W1=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > >
> > > >> ERROR: modpost: "kvm_free_tlb_tag" [arch/x86/kvm/kvm-intel.ko] und=
efined!
> > > >> ERROR: modpost: "kvm_alloc_tlb_tag" [arch/x86/kvm/kvm-intel.ko] un=
defined!
> > > >> ERROR: modpost: "kvm_destroy_tlb_tags" [arch/x86/kvm/kvm-intel.ko]=
 undefined!
> > > >> ERROR: modpost: "kvm_init_tlb_tags" [arch/x86/kvm/kvm-intel.ko] un=
defined!
> >
> > Hmm I used EXPORT_SYMBOL_FOR_KVM_INTERNAL() for all these symbols. Is
> > this not the right way to do this?
>
> You put them inside an CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES #ifdef.

I guess it's a good thing this email wasn't sent out to the kvm mailing lis=
t :')
