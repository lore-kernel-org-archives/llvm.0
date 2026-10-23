Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738190;
	b=SgpQtP+wXbH/r5s1ce79JzLztsOp5/z4qjQqQH8reANDeTRej48Ku19qPuYUe8Y3O4c1
	 d39rHCKV3KerVm9EL2msjutI+ptcrmB5S6yEtfL7mqk3oc1Xp2jfGflDgakifKpK7cNQF
	 R63SjElRrLYfmRYuD52q+/f9J7Fx3BtO5mE7VbduCfS0l0fe+No0otBN0+KRfnhbuHjPD
	 4I/GHeR643TKrkY/eS5OlD+5/pnkpaQtScqMJBYTg6TKo1ZFWy2qqJCZ3tBgrKpeDY8pO
	 6/V+gRX6GQsnRXzuXTU1f/LfUEOINA/T+PnfLERiP7otLbYI+g19Ic50BGaP9BZmzOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738190;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=5KBAP8s/gvZ5T5E5z3STKabsBKCenIox3Dw1zgP8Y70=;
	b=jbCyWrHloGw1d0TtFhL0Ge6RZ6Bipjlcy6RMBX+qEPOrAdT9SVBIrmgFEia4LsMKdAjK
	 zNHWyQtOt9yelNDAkVgt+vFyW19PwvZCrR7TCSiYtFmWcgpVp82aGyhC7+k+opHY/FXXH
	 1qkI7QrtFBf5I4aEn1OrcYsk/AqcUzvLjKMWIq61Bn/1SRQQb/5F1hO6jbV+mF7WIk5ra
	 deTtF4LwkArCjvd4wqpfb9GYvHRUAmZkNgfDQ+yEe/hsCswE4lteAijCp7OvH0VxV/XNn
	 Oh4HYb++SYll2sr8ZcXhbwMGhYlF43kGB7shTVOv/nTlQvedaEkVjIBX0rJd1epeZag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hDLTbpW3;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F128A606A339
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 06:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F128A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hDLTbpW3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KBAP8s/gvZ5T5E5z3STKabsBKCenIox3Dw1zgP8Y70=;
	b=hDLTbpW3Blq2rfGv+2LFjPOCtY5Jt1iFjlJxscfG9IcO6nGbXTOYlRTWHokXvPo5fwWXt4
	DkHLNpuHjoZ+zJ5Bo0lVJ8vP+3wYL8M29kiCsK3QIj7DYjtChxjFR93mWGBd9VD73S6MoI
	TC3by1fjbKLMQI+JsfTv4koo0qup6aw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-SuGaaj_gP5aM0W7KkKCVMg-1; Fri,
 23 Oct 2026 02:49:40 -0400
X-MC-Unique: SuGaaj_gP5aM0W7KkKCVMg-1
X-Mimecast-MFC-AGG-ID: SuGaaj_gP5aM0W7KkKCVMg_1792738178
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CEFC818005BA;
	Fri, 23 Oct 2026 06:49:37 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2707819540C2;
	Fri, 23 Oct 2026 06:49:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Russell King <linux@armlinux.org.uk>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 04/13] ARM: BCM7XXX: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 23 Oct 2026 08:48:41 +0200
Message-ID: <20261023064908.66707-5-thuth@redhat.com>
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
X-Mimecast-MFC-PROC-ID: SCOeYEE_Sv7NlYTq1u5zPUUCD_eR0O1QrDpa5mpjzSc_1792738178
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

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arm/include/asm/hardware/cache-b15-rac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/hardware/cache-b15-rac.h b/arch/arm/include/asm/hardware/cache-b15-rac.h
index 3d43ec06fd359..b96365bfb2a87 100644
--- a/arch/arm/include/asm/hardware/cache-b15-rac.h
+++ b/arch/arm/include/asm/hardware/cache-b15-rac.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_ARM_HARDWARE_CACHE_B15_RAC_H
 #define __ASM_ARM_HARDWARE_CACHE_B15_RAC_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 void b15_flush_kern_cache_all(void);
 
-- 
2.56.0

