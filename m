Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078FA24293C
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911937; cv=pass; b=CDsGBPirjQrIHZc8xIKFw94ftfRmYdgBM0DB4roYSA2qS/xgI859G+J8b0aCLd7hmlGz/JtcZfdceUrxPTOWWozCVAR30Qbd0GRrof+2pc+gMzjugFf6tOSVRw4VDkx+OvJcnmjiUC5K2C5Puv4t7h96cMQVwJQk8Vf5Mw+ISk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911937; c=relaxed/simple;
	bh=M/QtTrkQZWFVMPp2jygHKbOuydCKlZtqRp5QfJ7zvXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnmZ7yE6HUOQvxB4YbihQBy4kT8J0klKR8NOWUpj1ZpcwGFBiIyVmq6nuBGD7SZCBCNE36zQRmJTMEex6wz1OW8J8r8Zgem8lJzLRxCPjtNcj9uh/z9HBCjZmJ5DIdgfOChhZ9kV3QUUTqAdSstqsqZ/lojue31qXIg6qdQJv90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RLUnJYwV; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RLUnJYwV"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69857dc1d5eso972290a12.3
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 06:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782911933; cv=none;
        d=google.com; s=arc-20260327;
        b=KFYNxe5YemTYQCKYdCjrP6+Gk3JSI0ZkdQuWDMomMgTkzAOOWHxNNbkYu8hKNmmVPR
         gIEQAxojxa9cEk9DkloLLsVBhPxSxKk9qqYzhSjPFC+rMYZ+MoWF3e3a6DesyWR78ok+
         vFYYC8Akc+2SO0yvvaXmOHPIkOc1QGJr0vxHICo3qyrcPGpdKCpR6hfl4NL1jFPMnayb
         uZYSlkrgqaX+KteQyK80Du8+1j8JlnxziUO9b8ytkq2gk3AOJhBsHVkxZkfUeNbwgPgr
         p15m4QXyMKG8DEuGiXmzb1TP9DRNmAA+O5zyOlpQX1F7OT/KSsNNoNDOKSR47KNcLoCU
         JdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XXVVWGSHO5OhBUPNJsRgu+ydLv5yZynk2j7cpgZvDzI=;
        fh=vU3u1RVwCgkBk+QqPF6S7WQa4aHmvy0SkRRArTz0Ru4=;
        b=hFqdMxdTtHSm7RRBLGSVkPaSQxPvRkpo2+F75fyinsGHPBNBM6SzKtxaMKpF99I25o
         zn9P0Pt9YC5v1ZCf+3bjGcakhn55MfSKatxEIfyhDhQ4HuXqa7n9oZ1iFgXLwZTK0sb+
         w2pAH3p9y1KxPOswRk9FzEMTTO+04AOCvrSaFniJn3zCagAFH+Q5eapr8GZuKGmC5uvJ
         kRzMy3OzMDOaMwP3qNPjcA/J2EBWBfy8tZUNL9lq6/zpbcnPJBzLgtuwqmUrFGG3kxcy
         m+WxCEzLX8qNefBqV+UD065wM9f+A2tiZMop2uhQZEXvra8jOFvnA7/PITCUvBgGmCXI
         Chkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782911933; x=1783516733; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XXVVWGSHO5OhBUPNJsRgu+ydLv5yZynk2j7cpgZvDzI=;
        b=RLUnJYwV+pvjLh9VINSbfGbtth8iuEGQo4RQcR0geaVdoPHvz9YqGLBLti7eP5kUH0
         z8jT1NEuvJVlpGZMPSFbmb6RSTP4Fsk1AZuSw77WV3AJjyXo3fd5fMsFpadTfgqmOkLs
         IWkcmWO/h25Yqy7Zgognh6IhIx0ax62ug71ENWiw2dE4l4awZxIQqIu2/WJgwkwVBC54
         QHrvdKmsLi9WdCNcmsszPS80UqR4cdWXIzXN1DoHQ2oVl7QpAMkDTQIow2VDuWNBigw1
         1mu+fgFQNCovUq/hzE5tJWR/qCdkRhZYgIirP5DvFs5K1C0RMLXgLvAUeI/z0FeY7Y/8
         53Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782911933; x=1783516733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXVVWGSHO5OhBUPNJsRgu+ydLv5yZynk2j7cpgZvDzI=;
        b=qk3dhWM5r9D0r8Rt85zW3H7P3Dccw2PEPQNfdbLoZanqK0Vfc3GAdhSIuOU81/9ZIs
         O8FbGy0f6lCF1ztNOmTmigyGzO3QkxhlFFxtCb6qxjyajKD9J4tMxHz22BhgDk6gGsUc
         60vwg/wyr7J4LxxFITTFRX11pa/Fw0eBO15Z0ZLBsR0MvPBp4CK7vLYPSMDnAAkITruI
         ZkobCp8a+4AuFBkDCp/E4gpZI9KzhYS/N/MdADG2+B1mVFNdXPxgiK4JzjLj5c3qAeKK
         WUCBiPoauBRQet7X6Pxu+l2wy9ihbbjFNSDZ3BWW/9lSAf8nUiEuLDC/uiRk6d+ndJum
         9IoA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0zpqdil6NSmuv1fjpRb5SoN2pSmC0duy5hwSVc0lwy/bkH1YTYd3JRQpJ+P3MKvrty/ZX@lists.linux.dev
X-Gm-Message-State: AOJu0YynEtDqIiBGUmm+S66b3cYs7aotZk0doTY783SFWtVyxwBjyoSs
	xee24tOOMATYIBOjqkvzgP8S3ftIB1zqsqBYqzBpefAlMa+P7G3QoUvJKgix8UmrT5EY0BNDyv2
	EES8KVXV6jXRvJuPgA6/kRi/o/2uz8p2oyNPt8xAT
X-Gm-Gg: AfdE7cmPG1U50BVRhUintnRApMk5FIHhuJMANfrePd99naTuXIGIN8opASyH+XmYaTU
	QT2KSY45ZFk1AKF7pT6y3guEP+7RL4eZjhxE+qrL1LeHzwL6opO8ueRpnaWG0ffNoIS7NaD73Qy
	sR9RvaFrWl5AtzFRVJdQTAOKwrX5+y0hdlQAu8e8JlmEmlQmfxe+kEuI8a7EEW2uM4taM8KJJTU
	gJPFKwwGuZcmN0YWMoONA+IN01yRI566g7xwRJMuFtxuRjO2TjYOC4zdgEW51Q5l3xSfGbfq8qy
	lsFVwb5xISspfOiDjJhYeyS4BQ==
X-Received: by 2002:a05:6402:5249:b0:698:3db4:c1c9 with SMTP id
 4fb4d7f45d1cf-698a2c6016fmr294670a12.2.1782911932721; Wed, 01 Jul 2026
 06:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701125151.352632-1-voytikd@gmail.com>
In-Reply-To: <20260701125151.352632-1-voytikd@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 1 Jul 2026 15:18:14 +0200
X-Gm-Features: AVVi8Cci07_Hc_RXn7ep4JAklNT_D0hDLIzqq9nbNmQVRqW_kyBosTemfoXw2dk
Message-ID: <CAG_fn=Wor0586c077D+0D+NYh+bkhqPhVVzoAANsaLGxbjLpTQ@mail.gmail.com>
Subject: Re: [PATCH] x86/mm: fix objtool failure with KMSAN enabled
To: Dmitry Voytik <voytikd@gmail.com>, Thomas Gleixner <tglx@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankur Arora <ankur.a.arora@oracle.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 2:51=E2=80=AFPM Dmitry Voytik <voytikd@gmail.com> wr=
ote:
>
> This patch fixes broken builds with defconfig + CONFIG_KMSAN +
> CONFIG_DEBUG_INFO_*.
>
> To reproduce the issue before the fix:
>   make mrproper
>   make LLVM=3D1 defconfig
>   ./scripts/config -e CONFIG_KMSAN \
>     -e CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>   make LLVM=3D1 olddefconfig
>   make LLVM=3D1 -j(nproc) vmlinux
>   ...
>     LD      vmlinux.o
>   vmlinux.o: warning: objtool: folio_zero_user+0x801: undefined stack sta=
te
>   vmlinux.o: error: objtool: folio_zero_user+0x801: unknown CFA base reg =
-1
>   make[2]: *** [scripts/Makefile.vmlinux_o:76: vmlinux.o] Error 255
>
> objtool in verbose mode shows how the frame pointer is omitted:
>   make LLVM=3D1 OBJTOOL_VERBOSE=3D1 -j(nproc) vmlinux
>   ...
>   b15a2c:  folio_zero_user+0x7fc      xor    %eax,%eax
>   b15a2e:  folio_zero_user+0x7fe      mov    %rcx,%rsp
>   b15a31:  folio_zero_user+0x801      mov    %r14,%rdi
>   b15a34:  folio_zero_user+0x804      mov    %rbx,%rcx
>   b15a37:  folio_zero_user+0x807      call   0xb15a3c <__clear_pages_unro=
l
>
> After the fix, the frame pointer is back:
>   b15a37: 31 c0                       xor    %eax,%eax
>   b15a39: 48 89 ec                    mov    %rbp,%rsp
>   b15a3c: 4c 89 f7                    mov    %r14,%rdi
>   b15a3f: 48 89 d9                    mov    %rbx,%rcx
>   b15a42: e8 00 00 00 00              call   b15a47 <folio_zero_user+0x81=
7>
>
> It seems the issue was introduced by
> commit 54a6b89a3db2 ("x86/mm: simplify clear_page_*")
>
> The actual fix is to revert the change how ASM_CALL_CONSTRAINT is
> positioned.
> Additionally, reintroduce asm_inline to prevent potential compiler
> rejection of inlining.
>
> Link: https://lore.kernel.org/CAAX90H2_RPnZL_dFYN7cQF6yt-wAweKKSx2=3D6e2a=
Z0kv+Pm+NQ@mail.gmail.com
> Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
Have you tried running KMSAN with this fix?

I tried running with the config that Thomas posted at
https://lore.kernel.org/all/87tsqjq3i3.ffs@fw13/
(https://tglx.de/~tglx/config.fail), and it still hangs for me.
