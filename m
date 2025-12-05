Received: from mail-oi1-f202.google.com (mail-oi1-f202.google.com [209.85.167.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4AE3D3B3
	for <llvm@lists.linux.dev>; Fri,  5 Dec 2025 22:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764975106; cv=none; b=mzvRPPNI7aIfvZssC/EYpI6RneJsOqr5/fiCgN4X+NXUwP1kDb8SIsli/kjeNRaSsuVmOWNGXnJeJns7OAZQ2T57z48W2EgF5z35JPFFRLSt3FgNqN2+VyQGE+2VgWW8b10VoIFgGdGW+MvQbN+XareevfEb9Jh4EpmFEEr2maA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764975106; c=relaxed/simple;
	bh=Ok8jTmdXZxogtxskwYzvmB15+ePBZ1aBYdxuQVq8go4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=g5PG+fpne3dBebLyGLo4fCp//VBNN8jB8QvjAdmjXPKzvZ6mvFAhYfaYEacANaVLbriO2Ut72yVtASH9sinRlSvBVCcEEk6HZ82rk+n1FqSGS0FzKVGSllt7jwwRZuRrkE8ltsnVBOK5OaZg788WB9Rz3jGdvBGS5sxHaVe3n60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D0FzrQIo; arc=none smtp.client-ip=209.85.167.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D0FzrQIo"
Received: by mail-oi1-f202.google.com with SMTP id 5614622812f47-45066f4a4ecso3404779b6e.2
        for <llvm@lists.linux.dev>; Fri, 05 Dec 2025 14:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764975104; x=1765579904; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KZ6t7ECEa6TXHskG0snKO3BunyXOALdoY4sWT/SldB4=;
        b=D0FzrQIoIrH30Lo/+IbjlihDpUkH3RbNb8A1t53g+cL8dZgDMjjvbwGshkqoO5c8zR
         TP+k7icyq+EY1yi00DHiPAPZyfrFC/hac4QYuqdNAOYaXjXaqckfcRBgX7yQxasJOfJs
         IBPjDysaSlGM5RbShX7tMSeFarVVuV+ztpWnJAWVEqR3bWPiehv68xbmDD3sEEufJoYc
         yN4wuSpKk3OVQ5hfzBXE2FbHS22aT0WcWcNyAnBNp/dG1KrlR8HSeiiw2waPI4o+bu6W
         sZ3v0CACgZTuqv8nSxkFp7VC42f3cZ57wOL1eCHtmWLG20CxCSlX8EjgIgfkY71VAPSF
         0GiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764975104; x=1765579904;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZ6t7ECEa6TXHskG0snKO3BunyXOALdoY4sWT/SldB4=;
        b=QIvPwx+SVxxsH5pt03Lz7cL9jhTVvil5CfLCey8f7Tsbqf07D8GyTcBVfmwaB6fHhh
         9Ie+tA29je83WXryDoCx9fd/bUBz1FpIgFyt/+ckLaW8MBSHDsEOd9lpWVh8XVpPOEkf
         FAwkerj+mmF0XTjByxo0eflGyxL4Cgc9vtjYj62wUP/ZfGQyNa9rrpPcugKz/QgKrxe/
         aE88wbvPIhEVy1wR53YSoCanLzoDpxS3psvGPLlDGc4BgNTkuntpDm8JLGw0XfwShlqu
         WHatDWjwdsunBk14MaJrx4wUyM9Us5u0ut5oKwbu6Ra4xClDUhYpDchOK5rMPeW2dXIv
         0kLw==
X-Forwarded-Encrypted: i=1; AJvYcCUvs4NMTc6aBlB+ud3bF8vXFXcUsmMa5QeXr8DXRlzqyXrUDSoCauWIr7d59qO6350p/G/H@lists.linux.dev
X-Gm-Message-State: AOJu0YxzjJQukwhj67DfKswxGpL2d4zO7Lsl0RtNSH9O92N4YXPPwl+3
	xZuflGt6mlFc5nTQ5eF5CoUo4rKEM06Fc75kh+JVfxhZoc2iVX5S2NRLHhUEBCdvMAlhXMe8qHo
	oSrrmcibXzCjM8tNLFnTHdp6qnA==
X-Google-Smtp-Source: AGHT+IGtsCfXiK6Ca9aoNBk4FCPOxvVSHwXC29bCUXc+AJsis0zprJjFy5EwP7iFzoRRKCHwHGUL9V6/X/OhgFQ8rg==
X-Received: from ilbbk5.prod.google.com ([2002:a05:6e02:3285:b0:433:7ad9:4c25])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:178a:b0:659:9a49:9017 with SMTP id 006d021491bc7-6599a986298mr335711eaf.68.1764975104215;
 Fri, 05 Dec 2025 14:51:44 -0800 (PST)
Date: Fri, 05 Dec 2025 14:51:41 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPxhM2kC/42NvQ6CMBSFX8Xc2RJaUyxODrI66GgY+LnATbAlb
 UUJ4d2tfQKn85OT76zg0BI6OO1WsDiTI6NDEPsdNEOle2TUhgwiFTI9CsWcr+oRWUsu6kuTZ5O
 37F1ZzYTiHaIS8pA3EBCTxY4+Ef+ALOHJ8mtvxb24XqAMdiDnjV3i/czj7L+nmTPOcqlqzOssk yI998b0IyaNeUK5bdsXVem9KdoAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764975103; l=2094;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=Ok8jTmdXZxogtxskwYzvmB15+ePBZ1aBYdxuQVq8go4=; b=+5fF9xjzd/gKfdwP8eCwDRuFOJpnnxJkpqF1OjNQdwbauu1LndafYJx35q8YJ0TDFXjqD60mE
 Rf4IC5n1OVHDQPc5ol2vyveK/sd6BcjvbO3xh/WRL1rUq+soDPpFDXv
X-Mailer: b4 0.12.3
Message-ID: <20251205-stable-disable-unit-ptr-warn-v2-1-cec53a8f736b@google.com>
Subject: [PATCH 6.1.y RESEND v2] KVM: arm64: sys_regs: disable
 -Wuninitialized-const-pointer warning
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
doesn't really care since it casts away the const-ness anyways -- it is
a false positive.

This patch isn't needed for anything past 6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration") which incidentally removed the aforementioned warning.
Since there is no upstream equivalent, this patch just needs to be
applied to 6.1.

Disable this warning for sys_regs.o instead of backporting the patches
from 6.2+ that modified this code area.

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- disable warning for TU instead of initialising the struct
- update commit message
- Link to v1: https://lore.kernel.org/all/20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com/
- Link to v1 resend (sent wrong diff, thanks Nathan): https://lore.kernel.org/all/20251204-b4-clidr-unint-const-ptr-v1-1-95161315ad92@google.com/
---
 arch/arm64/kvm/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 5e33c2d4645a..5fdb5331bfad 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -24,6 +24,9 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 
+# Work around a false positive Clang 22 -Wuninitialized-const-pointer warning
+CFLAGS_sys_regs.o := $(call cc-disable-warning, uninitialized-const-pointer)
+
 always-y := hyp_constants.h hyp-constants.s
 
 define rule_gen_hyp_constants

---
base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
change-id: 20250728-stable-disable-unit-ptr-warn-281fee82539c

Best regards,
--
Justin Stitt <justinstitt@google.com>

