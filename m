Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE983DDDB1
	for <llvm@lists.linux.dev>; Wed, 23 Sep 2026 05:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142805; cv=none; b=YJgxDj6yglRa+a/uMisj1V32De7mbNFF8ko+8h2ehfDNdhcjT6cKuMryxuUBGKmiMgLsrkjQR7fDMcL62b3lYcwB1WVvCg9bLO+o7i3lrSyVI1mQMhaPS8xVqCzbDVm81WO+vNRtiXfY4jGmi4hIktPjadQpLrNj5xGGUJpEKhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142805; c=relaxed/simple;
	bh=xX83Qv2GNCSFmPnn+MxtgCfH/8/LCmxa144mvyxtVdg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NOj+qnkz7FteEUS0Scj0tQUi88TyAoJV1UpcmgYWbWnkRFO9lHBjuhmwrgb8poDcnWpfdpAQEkbGLGPeaERAQMzDBtD8kJyx4feQgoWUObaVFjBxGwYuXNA3MHIz0EFDnX610ZUbcnw49mfhPGk5/UrLWZBqIc54+M42E2BKJZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=THCuufYz; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="THCuufYz"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9336581a2so8706075ad.3
        for <llvm@lists.linux.dev>; Tue, 22 Sep 2026 22:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790142803; x=1790747603; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GR47YdXkcI+qC2x+J3l7J/ws+MnB/O9JS80C2XvYteI=;
        b=THCuufYzEk+6zx1Pv9UBiqCiUApeG7MTp4m3CyzXSQyNSEWkyIa5uANOuZjRcuEGB7
         kOwHExQrchQxib2BTn4/3FZ+h+zpCBp5R/pnM5Lh+8AM1jesMWickPmJyaZVzu8gZV+v
         GT9bv844QpzCPs6nGMbF9Bb2kkJ9NZchtAW0b1vy26PDrK9E/x8EH8YdNtNCoUaFoOo/
         H3xxsEEI4hAhT6SoLSAolU3eyLNDqkMsh1zf7OWj/hNAKo+YmqncbjFzL1Fe/ts/EUhi
         mFMvFLC4zId5tuX2UX3HvB9wU+JPhyeQiMZeWZUZOnx246mpbLSEXTBrdcyz3H9zo4sj
         9Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142803; x=1790747603;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GR47YdXkcI+qC2x+J3l7J/ws+MnB/O9JS80C2XvYteI=;
        b=lm4YsIa3Jei46nutQtFZKedOjGDSjB3V5H2qStAFVI94LK8bzD6zobw/D8uDCSutoJ
         ZKd3HvsPRBBBJEJnf2+9ENzztK8gt2fw/l2LWH5wbJCM1ItABpOoTW/0nX7XYOOzZbzy
         q+tyQHhtmvFj58u8e03QjnzHj5iHnGkYrS0UHRO4WPD9ywRqtLe1lDFcInfxMxb6YG32
         /LO2SNTv285tgHfYWpLcSXVTHOGVcBqsFfBnJkDx+h/kxSZIBD6PSJJ+40qBMrv0Ptzt
         vnLoAeGX1KscKCPNhXn6SdRp44MTKUXpzm9MIc9uBDmD9H482qtqMG3bueBbwMaBgIgQ
         nKpw==
X-Forwarded-Encrypted: i=1; AKwUvBzcc3rZdUhfIsS2N2wt6ujy0kC3XV+tc3/tyqFESNHemmvrOy8YmuuqfNVzIQ2+O9KynFD3@lists.linux.dev
X-Gm-Message-State: AFuF++kXZB9xa0pYjgDO+RqNlKYtr7Oqyj6w4/y/SsTXuadnkTCT+Cp5
	qgdSx/8wgrdCVilqqDmoqmCgfKyTJ2N2kubmNtg9mKe34k8gsSj8jA2jKgaLVpw+5Kwy4ya6owG
	4
X-Received: from plmm2.prod.google.com ([2002:a17:902:c442:b0:2df:4477:df93])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:946:b0:2d5:e3ce:3988
 with SMTP id d9443c01a7336-2df69d3255cmr15603695ad.11.1790142802442; Tue, 22
 Sep 2026 22:53:22 -0700 (PDT)
Date: Wed, 23 Sep 2026 05:53:20 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923055320.2602534-1-morbo@google.com>
Subject: [PATCH] Drivers: hv: vmbus: annotate struct vmbus_gpadl with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

Add the "__counted_by_ptr" attribute to the buffer field of "struct
vmbus_gpadl". This allows compilers (GCC and Clang) to perform
compile-time and runtime bounds-checking when KASAN is enabled, preventing
potential out-of-bounds accesses to the GPADL buffer.

The fields "buffer" and "size" of "struct vmbus_gpadl" are assigned
exactly once, during GPADL establishment inside
"__vmbus_establish_gpadl()" in "drivers/hv/channel.c".

To ensure that the count field ("size") is initialized before the
pointer field ("buffer") is assigned, we reorder the assignments in
"__vmbus_establish_gpadl()" so that "gpadl->size" is written before
"gpadl->buffer".

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 drivers/hv/channel.c   | 2 +-
 include/linux/hyperv.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index 7e4cc6f55237..7042de2dd481 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -548,8 +548,8 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 
 	/* At this point, we received the gpadl created msg */
 	gpadl->gpadl_handle = gpadlmsg->gpadl;
-	gpadl->buffer = kbuffer;
 	gpadl->size = size;
+	gpadl->buffer = kbuffer;
 
 
 cleanup:
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 9e109d91aa14..408748a05440 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -780,7 +780,7 @@ struct vmbus_device {
 struct vmbus_gpadl {
 	u32 gpadl_handle;
 	u32 size;
-	void *buffer;
+	void *buffer __counted_by_ptr(size);
 	bool decrypted;
 };
 
-- 
2.55.0.1082.g2b9226bbc0-goog

