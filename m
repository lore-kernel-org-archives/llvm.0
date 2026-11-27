Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789440;
	b=u9aU/xFg9lgX8+m4U4eTUvjiDkHgA2XGfFU5pZC/HdxqlboZ0GTSGMKtod4rgQAI+vXS
	 +EruT40N+wkF/6uuAFz8eKJoAtUx14bsUNgFVItjqQBJEkovCiAlDhfOZY9Z0FxBXaa5r
	 WNSTfr5cMDbfqL+g7U8qtL3b3sIR1n9GrSD5ji1dTVVszrNjRSd3ezU5mi+RRM+M0DHP2
	 K8j8PXOQbNcsZmjF0QhcxelIS1VgMvFCZ4kKhi2kVaHnLapnIxbxKNEpF3By5BHDd/hqv
	 uuJVhmTT0jeMeO9tZd0s8jo9SYlUt/aR9IAPm2V9KqzVqOqcyu/nsUp6UR63nW+4AQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=BdKojhj85deF+DiTdqmOR1hUlobCXqVK8A69INTPgBs=;
	b=wL6YPBbwdORLX5mGhAdhOfIn8PmeDViWtcnQeapr8rIb85veKWDEnf4ZahDbZTB84tUd
	 QIdwetHeMnZSaFRsLA2RkpARqf15iRDj945RA1PPxtAZ+aq1KPAAKow5gEh28RyxY+EMG
	 SIu8hL7tw8fZZVRmGqiklegUHNGxvs7TfbABUX2gcrAOFMYdLxIEknhfuVvS9cgLRwFCp
	 Kc/P+SOq+DDqiTcG/Jn6GhhXhNBtOYzhxirCHEhYoQa1BoLybsjh4IkhzAMvzznzWF9Oh
	 VopDZX4yftDSvN5RDYX11JaswgNn9BefKMY2VZS5X+SQ2OTJZrPD6cziRM1In1IQjug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P4Ntzcft;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F115A606A31C
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 14:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F115A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P4Ntzcft
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb680f0ac4so57701275e9.0
        for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 06:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795789438; x=1796394238; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdKojhj85deF+DiTdqmOR1hUlobCXqVK8A69INTPgBs=;
        b=P4NtzcftphgIzL8Ye/Kwwm3KzgiFcVeLuKK5dWi2taL/ztvSIi5HmYg62oAmokPOi3
         7/5TxiHbaZC0qzT47JK+R0Fgk1/OsCecvKygEYmWi1RiX9Ufrp7OjG4V5l44eGW/Nw/Q
         xtV+OnQv0OSy1Nr7ENZPUBcmBSKYgRk7U2hgAdFNzopyz7Xic9gfSEi2YkAeF5xf3CyO
         OUdN/kbwF+vqgNaKJ+IGJYziMPYzT/AJ2yMkD1ArCKvYnVWkrjaTZ11/BV/k3VjShgKJ
         DpheTkoVf5aeN9l2uFFi2x13qJYvUiaarJ3yVGVQj2/dWuD5quuBORcCP3AYjkb4HHvR
         DhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789438; x=1796394238;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdKojhj85deF+DiTdqmOR1hUlobCXqVK8A69INTPgBs=;
        b=H6MDN+ek7LtlfsSDj615MQHL3xHB5GBI/zA1ib9Ner7c6NMRKnqoSk4qTgbvzxHj9u
         r/wePgf3fd9/YM6gbId0Ikd/rD9SQMALq+jwHNY6H7oNMMlegQpe8e8lA3AVjKT/8Etx
         2Kg9w9M1t5axRznkW0WnmckFhBr3DX8ex5+35HqjRxV153ksKQMWTlqJr3x1PAMYct8h
         5yNMMch6UG3Ij7frzDdkUGWec/qFLnoRprFKFJRXZdeMYTRBL5eDE2HdEYqWQZW5ZVXO
         Ie4aElR0EIIP7SsfELq+C+vTUvuYv4bxXZiOoOWq3SCRy1XW/5m2BWmAIV+/SZ5w74Fi
         i2cQ==
X-Forwarded-Encrypted: i=1; AL+hErFoltOP53ME8iXNPbQ3nYyPTqSFjQ69oPxPNmX3y5RiworKc4NswPS8LmRYRIjN+xQqL7Wf@lists.linux.dev
X-Gm-Message-State: APuU4Z+nnPWrmzjToJ9IU946rbpdZrb8SgMdr/ERBwIbdsRnVmS+A88g
	V/KzqV6L3/1OYzd6SdvX1Pr3Gpelpyzz4Ui6gz7i9GAxn6dqDikfyhTPivWSMaTc1C6eq4YdjQ=
	=
X-Received: from wmfq11.prod.google.com ([2002:a05:600c:2e4b:b0:4a3:5dec:ff72])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e0d:b0:4bb:5f07:10d7
 with SMTP id 5b1f17b1804b1-4bb8882445cmr469912475e9.26.1795789438263; Fri, 27
 Nov 2026 06:23:58 -0800 (PST)
Date: Fri, 27 Nov 2026 15:23:48 +0100
In-Reply-To: <20261127142346.788995-4-ardb+git@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261127142346.788995-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=ardb@kernel.org;
 h=from:subject; bh=OJzMxfx2jiqeNlHC1ElzD1f83x8S2SEWn2OcD6xIDJI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZtzUkm7lVN48vmHFyOfXza45Fd29l/hZCabtoIJEzOlV
 Vs7NOZ1lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgInc+snwT71bpPaq+eMndyYc
 lWnhj3P8KWd/jlvs7q7nC1tlBTbM4mf4Z5X8T+SLpIXLXy6JZ157J7+o39/aVbf0yoegyytqjQU 9OQE=
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127142346.788995-5-ardb+git@google.com>
Subject: [PATCH 1/2] compiler.h: Use the symbol's own pointer type in __ADDRESSABLE()
From: Ard Biesheuvel <ardb+git@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Casting the address of a variable in a named address space to void * is
rejected by GCC, which is why it is currently cast via uintptr_t. Clang
folds that into an addrspacecast, which it cannot emit in a static
initializer, preventing such variables from being exported.

Use a pointer of the symbol's own type instead, which needs no cast at
all.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/compiler.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 0ea7150dba7b..9983f8eed085 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -286,8 +286,8 @@ static inline void *offset_to_ptr(const int *off)
  * visible to the compiler.
  */
 #define ___ADDRESSABLE(sym, __attrs)						\
-	static void * __used __attrs						\
-	__UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
+	static typeof(&sym) __used __attrs					\
+	__UNIQUE_ID(__PASTE(addressable_, sym)) = &sym;
 
 #define __ADDRESSABLE(sym) \
 	___ADDRESSABLE(sym, __section(".discard.addressable"))
-- 
2.56.1.839.g22a8290db9-goog

