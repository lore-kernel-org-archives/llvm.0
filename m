Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB320F092
	for <llvm@lists.linux.dev>; Mon,  3 Mar 2025 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741003657; cv=none; b=H2KA3iRVNraSp6riAIfl6TQ8rqxggsvxGze20gMJ2+ikMyvLWdJrhshjF79w6+lK5kLn89/jUIm4qzqKlwvnQV3mzLDxu+AGZZWdc7vKAVsLz3vuH9KZuKM/Eq9B1hE3uI/Ougxl9wMyjUjsEcHo2nvgbZlRIr6FFlSH7sJLXm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741003657; c=relaxed/simple;
	bh=uju7sIH5BGh5W5JTJZHooDHmsXtbGtIZ2zwKahZ89tE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLH+IKM1DXNuEV+PyMhk/efcTza42ZJkPiAXW0TRkhDN5OE7tq2R8/VdvAxyI04Jo0ryc/mfpBwVQ0jzqVTTsj+GTUaZ+91MqwsWFLmkBZWh99kUtVczVcCvqDyi/v7x1PHeabgR0sAyx3jd1CAal4gL1aOuRXE2fTO9Q5luaJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TG+TXnjx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TG+TXnjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741003653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fw9/y9pO0Tgw7qMRxrC2z9OKO7bwRqJ7EcWxU9xvHxE=;
	b=TG+TXnjxzzHEMgjapmsDMzczAnkMiwQHXrv19XeO9TPe8yBZAL//M99STrP7zt2nqBNKXv
	FeVv9eF3PJu8bKegK4UGOlxrg8A21FNEXY0oFI7t+oKzC1gPk04bJoePYnmjWTKenaxCQl
	I1b11mPDThTLFuWPH5L+c1/rEmL31lg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-hlIEcDp1MySYvH9NHIB82g-1; Mon, 03 Mar 2025 07:07:32 -0500
X-MC-Unique: hlIEcDp1MySYvH9NHIB82g-1
X-Mimecast-MFC-AGG-ID: hlIEcDp1MySYvH9NHIB82g_1741003651
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-390eb06d920so3014496f8f.3
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 04:07:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741003651; x=1741608451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw9/y9pO0Tgw7qMRxrC2z9OKO7bwRqJ7EcWxU9xvHxE=;
        b=PQ4dtfseFTwipSgAbkWHCnUWfv+9wB/ozsmLYxXofn86FU/r5lTxHDT1fN943wwIzI
         vw8qAjUKqwvdnKje9mOJ/fPq6Dza8J+hLqxXrn/ALraujl0H/lzJYqeCFwM9VClLHirt
         qmlb/xj/qcaPmUYpsc/W8FJYjj0co9WSciUiNIyTcQb2WMRgAPtjt4gRWo4D2FWCgEzv
         4OdVbv8+BbWOI1zGT2ok3M4rCUFXysrZaVz6HF146btiAJ3GqLCwyBAAVm9sX0xklcYo
         NJG2MkN5z1JX8iEtfJdnCOq5MPASExm+ntSgvABg4eFIankETr6gULbEOOo1rH4IAWUC
         /deg==
X-Forwarded-Encrypted: i=1; AJvYcCX1t8ta11BTruR3Qq+TuhMlmO5phZJeFmIkLoDzoKn1rIBbdqh2sd2tcDhyO+IY+MtydImG@lists.linux.dev
X-Gm-Message-State: AOJu0YzlRYgwoDiOyW+5iJ4mN+R0SiuDsNNe1yNo2HGLc9BX+f1/l6Lp
	U5rbrD8OWp+b915utj8RE0cOh9DVHIiymrBez5kVKZ+sob/SMYxo8vOPALGiC2mFyJQiHI5Wcj1
	RlbJf/QKPqJrXQf61zmnivybb3peWX7d57r0r1R3STu4WBG99IViiOT+3dw4lHKDBpbiBZZKVOa
	336yl1VSE+09kUhBxPk06PMdZIww==
X-Gm-Gg: ASbGncsEsF4ZDbSKtSFyASTYn6Y2+DK9P0dxOhsvY0WlKhuYKhPo78uvxGCkfeo/GFP
	d/3Rht2l2Rn/5Tka3FUNiy1mMM/aBGCU9nVhKHaE1KEGUDo2XknzdAQBssfTOWjm1BltE41IM
X-Received: by 2002:a05:6000:1543:b0:390:ef45:1a37 with SMTP id ffacd0b85a97d-390ef451caemr10434828f8f.55.1741003650996;
        Mon, 03 Mar 2025 04:07:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQibAQBZKGLMDrS/FjVYTrJktgwlJ/8V2jDfRODdesJgHBiBswiP6BF/IeHZ/V6AALHag0O/R4QLX3SW+KpHI=
X-Received: by 2002:a05:6000:1543:b0:390:ef45:1a37 with SMTP id
 ffacd0b85a97d-390ef451caemr10434799f8f.55.1741003650538; Mon, 03 Mar 2025
 04:07:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202503021436.STomlZOE-lkp@intel.com>
In-Reply-To: <202503021436.STomlZOE-lkp@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 3 Mar 2025 13:07:18 +0100
X-Gm-Features: AQ5f1JoWiKKm2LeQHKrPeE63Zh1-iaGQM-Bm15TiuDzT9_6uJl3yL4GkD6PHv6U
Message-ID: <CABgObfYnELV3FjMgZRASi4p6Hmp67yBLJngyLWbbp23czhHFFA@mail.gmail.com>
Subject: Re: [kvm:kvm-coco-queue 20/127] ERROR: modpost: "enable_tdx"
 [arch/x86/kvm/kvm-intel.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org, 
	Farrah Chen <farrah.chen@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lUc9_tWVLGIHs6Q0kbHbGsi4tG7A0sWlJllIVHowgXE_1741003651
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 2, 2025 at 7:25=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm-coco-queue
> head:   9fe4541afcfad987d39790f0a40527af190bf0dd
> commit: a58e01fec9ad144302cd8dfc0b6524315cdb2883 [20/127] KVM: TDX: Add p=
laceholders for TDX VM/vCPU structures
> config: x86_64-randconfig-077-20250302 (https://download.01.org/0day-ci/a=
rchive/20250302/202503021436.STomlZOE-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd70=
8029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250302/202503021436.STomlZOE-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503021436.STomlZOE-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "enable_tdx" [arch/x86/kvm/kvm-intel.ko] undefined!
> ERROR: modpost: "tdx_cleanup" [arch/x86/kvm/kvm-intel.ko] undefined!
> ERROR: modpost: "tdx_bringup" [arch/x86/kvm/kvm-intel.ko] undefined!

All these failures are solved the same way, just

diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
index fc013c8816f1..e8a3657d716e 100644
--- a/arch/x86/kvm/vmx/tdx.h
+++ b/arch/x86/kvm/vmx/tdx.h
@@ -2,7 +2,7 @@
 #ifndef __KVM_X86_VMX_TDX_H
 #define __KVM_X86_VMX_TDX_H

-#ifdef CONFIG_INTEL_TDX_HOST
+#ifdef CONFIG_KVM_INTEL_TDX
 int tdx_bringup(void);
 void tdx_cleanup(void);

Will apply to kvm-coco-queue.

Paolo

