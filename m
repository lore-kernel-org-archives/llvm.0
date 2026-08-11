Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A5243B6D2
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450730; cv=pass; b=DhpzMRd737IZkAXQFZHwG1oEA8xjfCkkpZFysF7vz0UWpmtSBncy7yGxQCpp90jxqjgyxGXAfbkk8isIY9FSkGfwvqUi7fKvDGj+daE3EP5aGmc/Ga++7ODp3ymTLJ4s1ZW6SJgpjoom/CRdmsfXR4D2spMNVB123TDfwro+T+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450730; c=relaxed/simple;
	bh=otOwUfRtr8fuySYLKyp89W2pZkkLwyvGhG8YpNXMUf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXVnAzR7ysIv5P3Zj2FEQtesyjsrFplXm/WWaA//iRNmclFOUySRFklFxhQFxcFHeifyrR08fpTE9rI0V5QIyplaAsdpsgZB5TSyATATWolZdWcyrL/lsuMmIeP1JY0csua24cti+PWnBBjgbim7+zDlzFBGz5+AsokHZS3loow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJmXA1dG; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJmXA1dG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d027b7c8easo7426875ad.3
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 05:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786450727; cv=none;
        d=google.com; s=arc-20260327;
        b=Rjhjj3K08kDuI9TF/aBHk5Hw7dSnXD6mh5P4uAPDsXfH+q1KceWWUO6d6CubeSWbry
         tFtSzFGxmeq0q5RQX3KFHWipeNmUJmLmh0iywG9SWS0xf7zovyldUeTmG2ORFIyf+LqV
         94JABh/7uljbXEV2dIdA8GQ5oLR1DBN+QcSBhJVoeynp2AB2yfzf10YLTZF/HctN0eRA
         NQ8gcY/wBjV1knpq8ZHOV6skEoR2e3m/XJoO6ujNoXH0izmp+ScW+mcPf0TqKNKZp9QT
         V4H/JlL7Y1wFj0IkwZP59uKpGJ7VieZv/lSSSaD9KSaiL1jL2f5JSsE7iouguyRDEVJH
         GInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/RC1A2PguOF1hAQQY37c6brOTFPnjNMMKjohruTM4f4=;
        fh=enNnlYnn08Mvl5ciOU0O2LyEEiNpinYIClKDPSbCzlA=;
        b=YdHm0GS/9gEMFBSshoA5kjlb/l/IWz/NJnWuV31TMKBgLSmsz/MBVCRh1UgSJWH94i
         O2hcKhQRBmBgVwvFHTzsNm8Mk6+nxr0pr/wdbvO8Gq8NaaYI0X4471WQafzFbq/oYL7H
         P1yHm7DXtFTrp+2D4/vC6J9YQlqkjIxQ8oioyU0YI83B3W0WuNFaMG0D2RX2HQ0D99/7
         OrDASPMjd5bJHZDjwNDfbuax9zEEGbMD4x7pbSvt4OLfmzrIgH/rYGpnr813d7yCznjt
         e/bnwH4qIbv2wFbLeHiK6pSlY4uwBZgNR4LRDGbTQcvZ919qYCFmemgXAm7kbXdQC7uJ
         ZVyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786450727; x=1787055527; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/RC1A2PguOF1hAQQY37c6brOTFPnjNMMKjohruTM4f4=;
        b=PJmXA1dGi9HdlNY0I55O6GGku+FxTu6zNcn7qN5db3JbVmyqFzrCaIRKnjtA7+icDm
         UCMRuS31Zk49r9VlO5KG9Blg7aUUDTlbVwXMiGPEj2upRB9GJfUGm3MVNvie2I5yut1F
         uHqLNg7f0PV5RsaomZXNgPTnl27G6XuEDEoXyZuBm0s2B5fstW41MukucknDE7Z/aBWb
         pvpdT+T6zy0vbTLrZOIYfLKW6uixfxNIcwZHYjUjcXlViMvZQ/Uj4/uBhQQq9VLYF/oY
         FeaKW0J90jAOBk2mwrry7zG/25US1+HbCKU2ciphxQq+9LRMmPDGFIELISVze9dCu3sN
         RDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450727; x=1787055527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RC1A2PguOF1hAQQY37c6brOTFPnjNMMKjohruTM4f4=;
        b=nnku1HsAVFGkU6g+0+5gOica/1n3cFCDDN8YukJ+/5QwXgetZ2tlEpzSEfqphqZdj/
         LUYC8CnB7luDjx9lvR18P+NGLfRdbhKTV5eWLssPqv9NryjLnL62fStH4sHCmnG/u0Zd
         l9NZmnM+IQoJO+yu77tb+NH4Gj4OLzBoPojFbh2OT7Lz7SSe+Q+DjEaageRG1BF8Qi/g
         uknYv/lT/37yKPJr5BtFA4sXwUMT+0kI1gRXP3+CVtC7powgqob3eQVzMdykReo6w8An
         Iul6FyqqVI5Zpzo5mE0GPtDtWOD3q0ufaBXXpQC7jqoLp3o9fIr6fqXgn3/KayI2cUVF
         RAMA==
X-Forwarded-Encrypted: i=1; AHgh+RoMxN54SVEjT5YRyC/Muq6Km3y8OVT9tNGEKcbeUZfy4SnD++SkrjEtUaIgNGe7LhQ8qqCe@lists.linux.dev
X-Gm-Message-State: AOJu0YwH+mvzKQSNtTleJi0ACkMcwPivSCLr4VqCgIl6DBzYdU//dJFM
	kr+V2c7jneTFLuBIcJrgUjTM8it0viCEespVg33JH7EmOxZDFtMFh+1BaVhcR/zbNQqkbHW8jmb
	sbhIcFj0hQ4GUpXOrunYx9rSZRHJekAk=
X-Gm-Gg: AR+sD12kW1oPa5QuvIUm8XDGkrhD8wqMvvg4bClXnhgf+4M+Qa+e7fdnocoV81NciNR
	iJ24TZ7qS4Bqxmf8NhbQOb8OKmj7PAwFJsZwUyQQBUQg5MD8vCnT2TKAaJv07tbub1/gl1V0hcW
	MlyaYGtyV0QjZ+9gkdkBs4+YndZXC91elsW1ioKG7tvnmxTYzHtS7yGkTi/GZmbo+Eibi0CpVWi
	NSXHA/lvW4RZHL8Dut9f94j5m+FZGmBzvjoLYAEmUAOT1JA5gGlEAR/c21UaQie79pSfu1DfmN3
	DDqnRhfQz9bV156TOCVfI/xH9AHF4DvXmHMFOU36ynZRcki0sp4fTuHY/jnrEUcipkyMfxriuS8
	VvHnDEOs+FNHFz7Zquwzm8oNgTEa3vdxemI2+xa38sbR7oq3HC24/AuLRmx9I
X-Received: by 2002:a17:903:4583:b0:2cb:2b50:d9da with SMTP id
 d9443c01a7336-2d31791fa70mr26298785ad.3.1786450727089; Tue, 11 Aug 2026
 05:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811063345.685884-1-mkchauras@gmail.com>
In-Reply-To: <20260811063345.685884-1-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:18:34 +0200
X-Gm-Features: AUfX_myED_ed26Nu7gx_kle1gVGJiVIo0YquA2caUOf2Oc9Uqm0rk5SAR4nUG5k
Message-ID: <CANiq72kVXHSKO2xEp9m3thexiXc8z0kg+hc8RUM2ZS=xfO2wuA@mail.gmail.com>
Subject: Re: [PATCH V2] rust: uapi: replace direct asm-generic/ioctl.h include
 with linux/ioctl.h
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, cmllamas@google.com, 
	gregkh@linuxfoundation.org, paul@paul-moore.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 8:34=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> rust/uapi/uapi_helper.h was directly including <uapi/asm-generic/ioctl.h>
> instead of the proper <uapi/linux/ioctl.h>.
>
> On powerpc, <uapi/linux/ioctl.h> pulls in <uapi/asm/ioctl.h> first, which
> defines _IOC_SIZEBITS, _IOC_DIRBITS, _IOC_NONE, and _IOC_WRITE with the
> arch-specific values, before falling through to <asm-generic/ioctl.h>.
> By bypassing that chain and including <asm-generic/ioctl.h> directly,
> the arch-specific overrides never ran first, so when other headers in
> the compilation later brought in the full arch-aware chain, Clang saw
> those four macros being defined a second time and emitted:
>
> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZ=
EBITS' macro redefined [-Wmacro-redefined]
> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIR=
BITS' macro redefined [-Wmacro-redefined]
> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NON=
E' macro redefined [-Wmacro-redefined]
> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WR=
ITE' macro redefined [-Wmacro-redefined]
>
> Fix this by replacing the direct include of <uapi/asm-generic/ioctl.h>
> with <uapi/linux/ioctl.h>, which is the correct arch-aware entry point
> and already maintains the intended include order.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608050618.9dekfjtF-lkp@i=
ntel.com/
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Applied to `rust-next` -- thanks!

    Fixes: 4e1746656839 ("rust: uapi: Add UAPI crate")

We could, in principle, backport it if you think there may be
downstream users that may backport powerpc -- I wanted to at least
have the Fixes: tag even if not the Cc: stable@ so that they could
find this commit if needed.

Cheers,
Miguel
