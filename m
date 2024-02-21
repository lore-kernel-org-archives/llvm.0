Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6782481A8
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708515342; cv=none; b=WDIax1GmwUO6H6kSxcYXUTN0WjCVMYIMRksJdCj6/GZ6mtQvTebJf8/uSr0at7YQSggvO94DYDmWd04Cy8ZMxO5qu4fIdu57qKgGuGyTLw2Tl+m2CqlQlTPHsnuTKNNTfcIKLG9cn+Mkn71dePhJh57OHt7Mq6DeAoMzguPnxqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708515342; c=relaxed/simple;
	bh=/B1OP6vbuA5phGZhjfg4uQ2vHMJ2nJmV3L2eYZwfJcM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T+YILn2zkPvEeng6U89PlhnP3x0JR2LKa2oEHtgKPZjk5/IR4fECChnuk0KoFVLC5MIt4BjDCwZhGF7uKmdX6AzdBKBwoUeZZIZzJ+IaQFPJ8dyqLumHWcTqD1K/f7/lSv8vqBm6D/AGAAvl72A6aBpLy2W8owY22WARQzBYhkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HGlwc3rZ; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HGlwc3rZ"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-33cf68241c8so2340692f8f.1
        for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708515339; x=1709120139; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gwOWSXeXshx2pDY4YsRb8c4OJtdf4hRb8S0itmSW07o=;
        b=HGlwc3rZCKJ8eTxWNHWmW5boweURakL11i/8KPxH4vkYest1J3aErTI4gHEAzQj26h
         57wy8LZPtOlK45n6kM5OaqXxw1UOroIBu3kTiQnTS9Q5n6wUJejWyPZpg2e6Q8A4pwCr
         +4Lcqve1ZuJ/IY7OZkL5gN9taNlQ768ccOP3soysKoqPLMOvZOR3ApEtjpcj/LHLHH2N
         6saaYOUW9YH8OarauUXX12CCE5iFAGv5xwBy4rkMvqj6ZL5PK4v7Nq7kjcrle5CCDWeH
         7YD5LY1KhbADnv730sxaYXCtOMwUdIYmAXQmVQ5TeHjyzs/APoOREbBFuvDDb/KlBsKp
         OpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708515339; x=1709120139;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwOWSXeXshx2pDY4YsRb8c4OJtdf4hRb8S0itmSW07o=;
        b=NXWS2kDJtRZEmj3zue3gucC42mTdp2cBiFqQ9/tA0dBVOOyRkhjdT1VT1JgSQyMYgT
         RpSwX/Hjsi0LvGT2I5vbSHoIG57SZgk6rUva4/qRX5U3H8n+X5ivcjGS+13ZpmtsozAB
         IbmPJl70ZMERw+zcep5lo5Qq0T7v3a6Qtc3YvdbvpwHSzZ+m8OPJBA6/e0TJ3gDEVVBu
         PbGA7azH2BOrEHoGdbhQnP72hqRy4O4WdFRf99BPuWK1G5Af+WeAbPrelDPHBljSbjWi
         hqLjoWZ4Zb6c//6yR/dym6qnaOyoEse2/k3DnrWxvzhExg8GMO1A+L1jLdpva6q889Bn
         /HiA==
X-Forwarded-Encrypted: i=1; AJvYcCUMWl2gMVKuBZidPgoSAMbMK5wWFFnoIkWr4smNzp4k5vyXx0J/P7JlBm9sYadYMBbnZ+OqhSDEznbJYYOGTeTVR/eleg==
X-Gm-Message-State: AOJu0YxbM6TWwA1ChTVoBE7skquG8hUZGj+vCnQ8D0N1PD4CBCYSwfs4
	xGxRH21O7XvHat+vOWcEK2pVOFtb6DQxcHbutp5c1wofNXOTq+z3tt3k/Ck/yqnueVWPHg==
X-Google-Smtp-Source: AGHT+IHY0yDlZceW9DCshrucq0GT/cSofAVrcM+fPLiEfYoqdkQbvMcAdRHU8ZT9iCvMSz0OftA424pR
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:6000:1c03:b0:33d:804f:7bb3 with SMTP id
 ba3-20020a0560001c0300b0033d804f7bb3mr2030wrb.7.1708515339021; Wed, 21 Feb
 2024 03:35:39 -0800 (PST)
Date: Wed, 21 Feb 2024 12:35:09 +0100
In-Reply-To: <20240221113506.2565718-18-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240221113506.2565718-18-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=ardb@kernel.org;
 h=from:subject; bh=HV5cVzg2bsj7zm/lufPEjuRMFtl5r6GlxXU96Wc4Zjs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIfXq/TfS/Ie8Tyfs4TiZ2dY8/eqXuOJb6hbTC/44bpZM/
 NZ6Myeko5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk2llGhlXHMqck8tmt/CX0
 Ov6+atSy9U7+7FpOJUqvY+44crG28jH8D31+U3aHolG6bniHk2Phz7Pu3be/MxQ4L/q8NmmSX3w YDwA=
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221113506.2565718-20-ardb+git@google.com>
Subject: [PATCH v5 02/16] x86/startup_64: Use RIP_REL_REF() to assign phys_base
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

phys_base is assigned from code that executes from a 1:1 mapping so it
cannot use a plain access from C. Replace the use of fixup_pointer()
with RIP_REL_REF(), which is better and simpler.

While at it, move the assignment to before the addition of the SME mask
so there is no need to subtract it again, and drop the unnecessary
addition (phys_base is statically initialized to 0x0)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head64.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 1d6865eafe6a..f98f5b6a06b5 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -192,6 +192,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	 * and the address I am actually running at.
 	 */
 	load_delta = physaddr - (unsigned long)(_text - __START_KERNEL_map);
+	RIP_REL_REF(phys_base) = load_delta;
 
 	/* Is the address not 2M aligned? */
 	if (load_delta & ~PMD_MASK)
@@ -301,12 +302,6 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	for (; i < PTRS_PER_PMD; i++)
 		pmd[i] &= ~_PAGE_PRESENT;
 
-	/*
-	 * Fixup phys_base - remove the memory encryption mask to obtain
-	 * the true physical address.
-	 */
-	*fixup_long(&phys_base, physaddr) += load_delta - sme_get_me_mask();
-
 	return sme_postprocess_startup(bp, pmd);
 }
 
-- 
2.44.0.rc0.258.g7320e95886-goog

