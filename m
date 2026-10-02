Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6CC35DA64
	for <llvm@lists.linux.dev>; Fri,  2 Oct 2026 19:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969240; cv=none; b=XpD7kffeagUKo6A1fMc3xVBEukVhsBdZMNGG4T3KpHIdbTlzG0/D9vsSmzOPNCCoT7oM4lpkTMyy+wwAzdZO12Rh+PM4wN8m2WD7RF3KZCIyXcL3VOD2UBlS6lj8R0G6XXXjY9HQrszqlLLqTuYWbUVmAZtrJMnxq3zL7oKpyOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969240; c=relaxed/simple;
	bh=bu+VqBxA6nqZV6JK7oBUZFdnjDL9VBnPUZknJyXfTEA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EsRgDdVi7Jn5TtY+gIm/M4j2z8b+IVt231Clm1Ehk+Z0tgPirxGatbtqE1pYGw2KKup25t18uWtEqajNoRD74Eo2GVDhCetU8jW0J2iepQUwawbaUItDAI13iSMzX72MLmyFc5KmcpPGPnA33djdrQCBg4+4vppk91vtkspviAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IwDmePPK; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IwDmePPK"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f2040e10d8so240369b6e.3
        for <llvm@lists.linux.dev>; Fri, 02 Oct 2026 12:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790969238; x=1791574038; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncPdKQ8yTurzGsf8xW/nALnmFn+Mq36jdGYCCaGLUmk=;
        b=IwDmePPKQ1s09rw2wpmOfnd0ZGDAjpT6PQXcm7u8e4wkP1ny9V3fyGUiO1XbDH9suL
         wg42U9b+YkkqMD0qHMtjot/LDXd2ZScTdbCI2H4TW0nYm+ja4hOt4eXazPF/uz9TtgRw
         NDRTbkkVlff7x8RjPDGhzrduF6Hvh6aNik3IwIB1/WVeDPTHZHbr2vP2veMsYrB4hrRI
         XFGsMBO+9yAxy5xNWotSa0+EXRy1I+jBdeP+CKVZMhIMhxlljx+kqZZau5dxCZ6dj24K
         Q4e/bKi1xskjXY/ul2AlkfO4UcqRr7WeqBK/WOpQ6DzDcmUnUl/lvUFC58+u8STF6AcL
         Gv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790969238; x=1791574038;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncPdKQ8yTurzGsf8xW/nALnmFn+Mq36jdGYCCaGLUmk=;
        b=r1gQtKs/RISgsuHa3Qi9ZKeploddP4cYJJDSmynRk/MloUpqMBHuCjOLOXx8UkqcxR
         FFdRnAPMA/j8tOxDm+2Li1igb1nmknh72LgrkP+C14l+rvCvNugoV1S7roJb9L+cCnId
         cDHIIFwb0YP2EkXu4TU6Qb4GmBLzm3MNy6Ar2xyIBjTQ8vUDFNjvTPiBb9aJuh2hs0BU
         o8zP7YeJBkaM7Bpm923WagBie4TxAUN9ihsFY5lHmTyOCV1+BnMfE/dvw/qz5f/xWPoz
         jWhrva574zeNtecryQAq2VR5TP9TPYBKCYSdhtU8imffZLKL0/kg96zLuegQKZN8v9gL
         ZsGg==
X-Forwarded-Encrypted: i=1; AKwUvBxfSfTbhG8aG6cXhCKq8iovKINqmkDyTeZzV/6EeIGqkm7BnvEKKiZ3wLpO0WtN94JfVWEH@lists.linux.dev
X-Gm-Message-State: AFuF++nT/XE1a3yFyvs6RFs36fewZeNd/l47eoEKtt4xkTpr5Yi4JfRh
	0Ia7SZdCvcTSiDKxluJNNHFv1FWpgw2Se/UHHd1m+tfzmtcvoyHrSCtRPx8zKeGeSfmOwcsF5yW
	n5z4of+0i0kw3vtNWliU/nYBsgA==
X-Received: from ilgw6.prod.google.com ([2002:a92:d2c6:0:b0:506:ef1b:4df4])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:e8b:b0:4d6:92b3:5c84 with SMTP id 5614622812f47-4f52b3b318amr2241563b6e.65.1790969237696;
 Fri, 02 Oct 2026 12:27:17 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:27:17 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMBCE4Vche6ZJWdSDr0I4rHXQ1VBItxgTw
 rtb5DCH7zD/SoakMLpWKyV81HSKBU1dUXhKfMDpvZjY86Xxnt0oGnMZkjnLEt4aNTtuvQzg9oS zUPnOCYN+/92uP2zL7YWQ9xht2w+AUQhweQAAAA==
X-Change-Id: 20261002-maintainers-stackinit-230afe234e5a
X-Developer-Key: i=justinstitt@google.com; a=openpgp; fpr=E8700888482CBCD3779E67F32D8CB922E382C412
X-Developer-Signature: v=1; a=openpgp-sha256; l=1342; i=justinstitt@google.com;
 h=from:subject:message-id; bh=em/u6WKwpECTiM0kW20l7ZVcgcWotbdCG2m2BRLAdig=;
 b=owEBbQKS/ZANAwAKAS2MuSLjgsQSAcsmYgBqwATpg6HcQDcbs0Sc7kv6X/jG0rp0jhy5uUBYB
 YN0AKFI7JyJAjMEAAEKAB0WIQTocAiISCy803eeZ/MtjLki44LEEgUCasAE6QAKCRAtjLki44LE
 Epf+D/9H9Mr7Tz4O3pj/Zf3dGy7MvN27BQBqAPaocE4hE/wz8EkCbN8zr4lnLNJL+nhskzaEN2l
 v+VFL0djqVbIJrqHG3i1iElOnCcTDUBJ+dEK5aqtGfm1BojJknO906b7f5LSBz3SsvQb3QKRrf7
 0DccU4AjmlxSb4XNJotp9AjC+Tu+KRC1eq85qZQxpzCVwDYZ9HPamgsV8XtzjvKXsBDHMk1ifNR
 ejua2rrLlN9gtiOu2RDBVHAkp6k4aYBKxLUA8eX8/spSGXuVX1QCYns1hJknnDg+xNw9uTE/4k+
 JudGy3edRZPXZ03I50Yt0sbRnnBzwXJYKpj6GCPN0JpqogrniDMK0Wagaib+j3xODlt0iKJVqyo
 U2vxO3fGFL5/nVOXg4YOirZOkTqibVhobA57wTpE/cLMeNt+J4y4qrAQ79jEinCl48sD6pwYZ9k
 fWfa4WAFEnk014Oyqifvj3ggKsxjaxOYDExrji7yMOYhyBPDYz1NqHJvgz/g5y3uc7w6JXs+BrB
 1zvEPEOlzHjpweQQox/UillbAujy1KhSagD81rR475PjjwxD4nXvNk+APhQgyZqr5q3M5m5Q2pc
 EZNeQK7jjwbNPSo0x4sVK+a99PDrMSMU1BGA+Cy7o16TlQ+hD+Qd4tLOxhYROHqxiev7KvSYp9E ipSsmSPRvJLKBoA==
X-Mailer: b4 0.15.2
Message-ID: <20261002-maintainers-stackinit-v1-1-27112a221527@google.com>
Subject: [PATCH] MAINTAINERS: Add stackinit KUnit test to HARDENING
From: Justin Stitt <justinstitt@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="us-ascii"

From: Justin Stitt <justinstitt@google.com>

Noticed while preparing a patch to lib/tests/stackinit_kunit.c: the file
is not listed in MAINTAINERS, so get_maintainer.pl does not suggest Kees
or linux-hardening for changes to it, only the catch-all list.

before:
  $ ./scripts/get_maintainer.pl -f lib/tests/stackinit_kunit.c
  linux-kernel@vger.kernel.org (open list)

after:
  $ ./scripts/get_maintainer.pl -f lib/tests/stackinit_kunit.c
  Kees Cook <kees@kernel.org> (maintainer:KERNEL HARDENING
  "Gustavo A. R. Silva" <gustavoars@kernel.org> (reviewer:KERNEL HARDENING
  linux-hardening@vger.kernel.org (open list:KERNEL HARDENING
  linux-kernel@vger.kernel.org (open list)

Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f72b4ac27ee..019f443af051 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14164,6 +14164,7 @@ F:	include/linux/ucopysize.h
 F:	kernel/configs/hardening.config
 F:	kernel/kstack_erase.c
 F:	lib/tests/randstruct_kunit.c
+F:	lib/tests/stackinit_kunit.c
 F:	lib/tests/usercopy_kunit.c
 F:	mm/usercopy.c
 F:	scripts/Makefile.kstack_erase

---
base-commit: 5e0f8396d4805a3e7f753fa58c8c55f1f3cc2160
change-id: 20261002-maintainers-stackinit-230afe234e5a

Best regards,
--  
Justin Stitt <justinstitt@google.com>

