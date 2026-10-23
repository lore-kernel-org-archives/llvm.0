Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738178;
	b=A0b5ZbLCw80xg4an3Vw327x37wM1jRAO9GjA8WLVui4j2wosIkC+Yl/GUlr8nk82rn7i
	 dvv1tcdo1aCl+k0B10EuKlljF3X8+u8T6C0uVTyMNQC9e1bSS/i48ddeFZshohuG3T0dT
	 8Ag/fPhxmpMr+gi+BxykhT2wCzbTbsKY6qQ3lsJ1J7nFl9+kFFi+vnzqzFLttFKie0Ml2
	 wQOdcAa2nVQQHxzDa/AHejFcMdgkcFNU/VTvea2F1Be+p7I4099AmB/B18HPl6z3/UjoS
	 LJGQNj70nrJoHeLDY0LJsTOcOtevRAKdFNn1nBe/swveD79AElXUA71DKX+sNrZ0a0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738178;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=d0gKi9bpiz5OB7/rDKl6lal/fHmcINerAfxrtrB7vus=;
	b=115QZePI/wJGCMVOTbcWP+IwIORndd0GxW5bKtaGe3upUth13IgMBIVAvaav5hrHrkRm
	 rG+epeZ5NnCXzTioR8cAjoOaowU1FpUS0xrzVOLiMQx6Qs9v7q+Cv5/q9yyC0qKRkgMAm
	 EOtQb6JEnHPEjH2Sq+aioykkX9iBOCkIUpyXDm4/hL6+BEueKd84zy4D78OMwXGBOBAar
	 8bJ0OcVRqw3+XH5T0I2KdOBD82N4Ln5nOtgvGmx/LaHqh3xgzH5CDJyDecVW01fWbSZcM
	 x9nHpMHlXKFZbQV+URf053UytEGbmBBNHqg8wMNTTByYm2I/LurWD+vWP0Xsvj203Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="RSSpEK/r";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEE060A260A
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 06:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFEE060A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RSSpEK/r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d0gKi9bpiz5OB7/rDKl6lal/fHmcINerAfxrtrB7vus=;
	b=RSSpEK/rOqBg9C6p0uOLwikEaYckRKWphjIYz1QAdN1IODVmzmogIil3IDkSpL0r8Lb5lt
	iGx6dUr9fJmcoKVq63mydhAQYTcs/sY2GJveuBFcNSVvNtq4V9RTNZn4KO6/XEmfFaTrje
	PnMOC3Fu9GRuKbpQHbYsSKT4m+V4oYQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-25-Qpiri9SrMVaNcnWCda3mbg-1; Fri,
 23 Oct 2026 02:49:35 -0400
X-MC-Unique: Qpiri9SrMVaNcnWCda3mbg-1
X-Mimecast-MFC-AGG-ID: Qpiri9SrMVaNcnWCda3mbg_1792738173
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6087C18005BC;
	Fri, 23 Oct 2026 06:49:32 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 00B081956095;
	Fri, 23 Oct 2026 06:49:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 03/13] ARM: PXA: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 23 Oct 2026 08:48:40 +0200
Message-ID: <20261023064908.66707-4-thuth@redhat.com>
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>
References: <20261023064908.66707-1-thuth@redhat.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 3jbHZOWRBOLPItTcJM85ABzUiS_hDkF_njnUmkFKF88_1792738173
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

While the GCC and Clang compilers already define __ASSEMBLER__ auto-
matically when compiling assembly code, __ASSEMBLY__ is a macro that
only gets defined by the Makefiles in the kernel. This can be very
confusing when switching between userspace and kernelspace coding, or
when dealing with uapi headers that rather should use __ASSEMBLER__
instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
this confusion.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arm/mach-pxa/irqs.h     | 2 +-
 arch/arm/mach-pxa/pxa-regs.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/irqs.h b/arch/arm/mach-pxa/irqs.h
index 22bf536a462d0..07d7aa3a65065 100644
--- a/arch/arm/mach-pxa/irqs.h
+++ b/arch/arm/mach-pxa/irqs.h
@@ -94,7 +94,7 @@
 
 #define PXA_NR_IRQS		(IRQ_BOARD_START)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 struct irq_data;
 struct pt_regs;
 
diff --git a/arch/arm/mach-pxa/pxa-regs.h b/arch/arm/mach-pxa/pxa-regs.h
index ba5120c06b8a5..b56c8899042c4 100644
--- a/arch/arm/mach-pxa/pxa-regs.h
+++ b/arch/arm/mach-pxa/pxa-regs.h
@@ -31,7 +31,7 @@
 #define io_v2p(x) (0x3c000000 + ((x) & 0x01ffffff) + (((x) & 0x0e000000) << 1))
 #define io_p2v(x) IOMEM(0xf2000000 + ((x) & 0x01ffffff) + (((x) & 0x1c000000) >> 1))
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 # define __REG(x)	(*((volatile u32 __iomem *)io_p2v(x)))
 
 /* With indexed regs we don't want to feed the index through io_p2v()
-- 
2.56.0

