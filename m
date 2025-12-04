Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5FB31C597
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 20:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764881421; cv=none; b=IUnSyIBr7WcIgag3miVg97GMMoscDWffIK0fTkz7Zey6YQ04cQ346ns7kPyDdS3qurQ7dghfuUzELxbklATa2GB+/+nesJPrv/ONutUW3CwJ+FkR6+PjfK+wntuVfl8cSjbXSo8SZV6rho9DxmECG31nk3gDuD0E6u68rhRlM7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764881421; c=relaxed/simple;
	bh=QdxSdzVzK5xrxxMWmz/dhJgRurzJ2W+fjhM9MUROI4E=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NI74MJNdbJUmv6gXws0VI+ImCpkDza3X8BSmQrZdcjj1i6OHdZY+fbghDbbG5WDBNo/7ivcPO73oXuiJYsiQNtvLRCx0+g0sNkirRSJ+u2kV5gF366N+j+KL3C2H24J3Bt5Dn5NJlLAXYTBLZ0DisGXQdCljWXF0pFx0E897ZC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kE0AhA3O; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kE0AhA3O"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-7c70268301aso1176354a34.3
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 12:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764881415; x=1765486215; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jfhXtjVpMYWte58x/PC24J5XI6+isvfw/8Zcbl9+DZA=;
        b=kE0AhA3OMrbtxkyPoM68XwhaKe0Lzz1j0YruqXEy65gqQ0BhW8RPE7WT/dgNt6+O0r
         FITuuoRhsTPupkV1oTLioSEkEbQ3B0RWcOpuZ+93BqEY1NNjxA0mr6Hu4E058GzCsbp2
         2dgUdSTUPXgC1/5ClYNL2XyYHQr4ux25HUt6320wLFhs2COd5VQ55z6ANYn4+HpHR/bk
         MgQSTAGfwo9EiIPrsGp12b3NGleTF293mBdwAR0/rh7K7fleQbjqOOfuouMqqIjKlunP
         Jjr7qbzg1+dnTsiN1DBrwfa4LQWCqdGodzeuYWqSLz51xqgGfUY/9A5cOyCS2Yuafeyj
         6swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764881415; x=1765486215;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfhXtjVpMYWte58x/PC24J5XI6+isvfw/8Zcbl9+DZA=;
        b=qhkDDwaD3f5bGC4gACjVimfJDFEgT42Oc/ssOmDLUlL2det8UPZewGHHU15fErKAWz
         2C9vZXYLvkhYyG/OF1Ln6vKO8yMBUPKBdqORiST7WX55lbGAuwzpQ/P30ZLNjhZzFtb8
         iz35BNxDByHKHoDD972KXeoVvK8FqhT01Rd7I3IlaoUC5njikpQcm6txiwqSl6neapGW
         nr4u56FpTm8yW9GGbKG9gj2WJZeIm1T9vofBp8QdQoFpsWRUfLOracGDk2NXnXByqdx1
         CuipG2IazTEj3ZsI4i0qMmJLbLKrWsr4GVA4AbFoDHpkPtlt3dHJVXJqV9Es/VUfy+bZ
         HGKg==
X-Forwarded-Encrypted: i=1; AJvYcCWjwJjRIY6pU3JZ38oG+Rei5cO1UHijU5HTsqlDVmNu2XWI353bz14gIR5uBWEItQ2Z0Vcx@lists.linux.dev
X-Gm-Message-State: AOJu0YyK7r5cGn7Kqy8jba47S3lSgGSbi68v3fHfp15AIFxMIJGbnhAY
	LfrIpIPqzdp+pSuPnkp/p9bXVYww3zfdWF+x0am8jR9aUGfPE3CaU10bixbzBIXOh6cjUbAxjVH
	o5G13TH2PNjJwh7epzWITd/eq1w==
X-Google-Smtp-Source: AGHT+IHKRkFsm1qvW8FHQgUBY9rowKQV8LQD4wg/pfFAOzqqCDtedAh9KEfVk/fSu+irJi0QEI5yC6OCMXP8ByDcyQ==
X-Received: from ilbbb7.prod.google.com ([2002:a05:6e02:7:b0:433:56ba:b9cb])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1184:b0:450:c0c4:3728 with SMTP id 5614622812f47-4536e428247mr3791671b6e.30.1764881415297;
 Thu, 04 Dec 2025 12:50:15 -0800 (PST)
Date: Thu, 04 Dec 2025 12:50:11 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAP0MWkC/42NQQ7CIBBFr9LM2jGAlUZXvYfpQmBsJ6nQADaah
 ruLPYHL95L//gaJIlOCa7NBpJUTB19BHhqw092PhOwqgxLqLDrVomnRzuwivjz7jDb4lHHJETt
 y5qKFsSfjoM6XSA9+7+nbUHnilEP87E+r/Nk/oqtEibqzrdNKGG10P4YwznS04QlDKeULzWUJn sEAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764881414; l=1644;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=QdxSdzVzK5xrxxMWmz/dhJgRurzJ2W+fjhM9MUROI4E=; b=xsVQAx0YLXTKT8wTYbzwnSITaZIYSGNlnwQWqZJic5nR3ojchC2UaEVQCaQ7cnY5/r5sGShFg
 e7G0a5kMKZmDg9asmBU5U2THu+tB9937IvPJlrFBxjct0SSPaHwhSq/
X-Mailer: b4 0.12.3
Message-ID: <20251204-b4-clidr-unint-const-ptr-v1-1-95161315ad92@google.com>
Subject: [PATCH 6.1.y RESEND] KVM: arm64: silence -Wuninitialized-const-pointer
 warning
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

A new warning in Clang 22 [1] complains that @clidr passed to
get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
doesn't really care since it casts away the const-ness anyways.

Silence the warning by initializing the struct.

This patch won't apply to anything past v6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration"). There is no upstream equivalent so this patch only
needs to be applied (stable only) to 6.1.

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Resending this with Nathan's RB tag, an updated commit log and better
recipients from checkpatch.pl.

I've also sent a similar patch resend for 5.15
---
 arch/arm64/kvm/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index f4a7c5abcbca..d7ebd7387221 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2948,7 +2948,7 @@ int kvm_sys_reg_table_init(void)
 {
 	bool valid = true;
 	unsigned int i;
-	struct sys_reg_desc clidr;
+	struct sys_reg_desc clidr = {0};
 
 	/* Make sure tables are unique and in order. */
 	valid &= check_sysreg_table(sys_reg_descs, ARRAY_SIZE(sys_reg_descs), false);

---
base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
change-id: 20250724-b4-clidr-unint-const-ptr-7edb960bc3bd

Best regards,
--
Justin Stitt <justinstitt@google.com>

