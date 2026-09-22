Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8712D48BD42
	for <llvm@lists.linux.dev>; Tue, 22 Sep 2026 22:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116554; cv=none; b=IktZJTs7c6XqWbedaTmn726VYESwC64fQn9trnpIbHYMUqtDG2zEA1275f35zeMdOIDAOYbQn+RRDPV3L49SK/ANNhGCDkYMsnWB0OOuBjINJoqaJlfcmyBpNZhKLb3gwriSmDkI0KfGOFq4eJZnJJfA8ItPTqWhNQ7AIRp/Ml0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116554; c=relaxed/simple;
	bh=ftsPX/fDZ63mdRI0VYix5XzvXzGHoQOQqLssy3pY5d8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YRcyxbXB50eiD/BqwPJo5LQGXz0CVsC8UB2iIzVDsvW/Q8Gu6MLWF0vDRQ9nx2/nhMb5rLrhllMft7vA30tG6k1zFiBy8eXZIOln14XyNwjLSaZktJanxhMcq/9wfMyiLxU90TviqreBEK/xeIcuDsooRd75GhnE/1MbAH4S154=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l9CvYna2; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l9CvYna2"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd7d0751efso2664915ad.0
        for <llvm@lists.linux.dev>; Tue, 22 Sep 2026 15:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790116542; x=1790721342; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GRxp3EYFeG4RHE5TRXwDLoJws/VabvUKmMB/dI5TDY=;
        b=l9CvYna2TLnddgk/NS3o+Een6nZ2uqCNXO+6Fb+RseSGLpHiXm51YhhDefAlhjpKri
         PzVoDX8Og/pUxhIMBKb76tlR98m7Ebp686M1iX9KyoG04HmKuJsvj/oL3xwMXy3DkQmC
         iMMbjZ5wekq0yljKp5RR8av5WPhB0ABV4YwpQhnHkH9ciom+lj/EuBNclEYFoj0Z9DHU
         7kmrvul9rDNmu5x/dhUZ+w2AuhAMf1BEuP5kzFmissTk0dwfEnP26Puwbs6eUg0GPoCt
         9xMvI1tEkjxMOkZ2xhb4y+76fpe7NIDRgsgpUmEQJVF7MXPEgpYT/VFscj50lJIZVfuY
         01nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116542; x=1790721342;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8GRxp3EYFeG4RHE5TRXwDLoJws/VabvUKmMB/dI5TDY=;
        b=NM6zoJB22Y9/4SbCRh+cje4EUXxwwJqWLqLv+43vUU2NiwAWK69twQYt3mDr7Y67HW
         B53diFGhvkyPThHJcjCOfmlw2luZ/YewKb7OCv4epGANoGsu0ZhpG268O6BiLUWhdwc0
         zvjM5QR5jwDP0BwX2I5KbeqvDp7zyKnGJFs3SBNmDJPtaS+/evSYKT3Qumh3Xp2ZqWlH
         Kg1DuAw7zenu9x4w6j6d39ozq8nGXeBn0GJQM8rZ4cy74mXwV35mv1qri8qNjqhiDjd7
         hXYwJrJ+yBy3yuY1sfW43G1q3xLkbZ/ZeCBrcOLOQelazU5HcDc2RtZqxwSBRgVCxLAT
         hf6g==
X-Forwarded-Encrypted: i=1; AKwUvBzDtf2iAqyX77knPXhzmu/q59u8dt6IIi5xNiVH/OiExM1XPduZa92Idk8o31V4B+gLp931@lists.linux.dev
X-Gm-Message-State: AFuF++ndJ6alxvAlVXrBiSc99di7cu/RmUhqTzFKk/UqPyToEr4MNN4q
	VUOJuJMkzM5la3IqCfHQNXCDDSDyz+YOWVwLHTqcRD5zl2TcnGF7m9asQNh4ke7VusWl3lQyfVW
	a
X-Received: from ploc2.prod.google.com ([2002:a17:902:8482:b0:2dd:53b8:ff02])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2ec3:b0:2df:69d4:86bf
 with SMTP id d9443c01a7336-2df69d4884cmr5081645ad.11.1790116541866; Tue, 22
 Sep 2026 15:35:41 -0700 (PDT)
Date: Tue, 22 Sep 2026 22:35:38 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922223538.2287676-1-morbo@google.com>
Subject: [PATCH] bus: fsl-mc: Annotate fsl_mc_io.portal_virt_addr with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

The GCC and Clang compilers provide the __counted_by_ptr attribute,
which is used by KASAN and compiler bounds-checking to detect
out-of-bounds accesses to pointer fields.

In "struct fsl_mc_io", the "portal_virt_addr" pointer points to the MC
command portal virtual address. The size of this allocated portal in
bytes is tracked by the "portal_size" field within the same structure.

Annotate the "portal_virt_addr" pointer field with
"__counted_by_ptr(portal_size)" to enable compiler bounds-checking and
harden against potential out-of-bounds accesses.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/fsl/mc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index c25f0f7e6dd4..0b2c0eb9b605 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -336,7 +336,7 @@ struct fsl_mc_io {
 	u16 flags;
 	u32 portal_size;
 	phys_addr_t portal_phys_addr;
-	void __iomem *portal_virt_addr;
+	void __iomem *portal_virt_addr __counted_by_ptr(portal_size);
 	struct fsl_mc_device *dpmcp_dev;
 	union {
 		/*
-- 
2.55.0.1082.g2b9226bbc0-goog

