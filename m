Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C4E280CD5
	for <llvm@lists.linux.dev>; Wed, 23 Sep 2026 04:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139158; cv=none; b=Mqty8K6Hh5TND8HMixXPhBSURxcoZemZoZG2nFW7F+wonEFHQV6McfjVUX6xfsGE9lOv1Nyw+8lHog+90v7ZeY8BkHVZsF+5Wt1Folz5rhKncR5XNbo8ZzNGeWlu3DGJikhYmNJuzLGJ5j+spku28W+NtOXFh5mQ73Pb1zmCBjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139158; c=relaxed/simple;
	bh=7y7GXnhSDovHIpVLBgt1Fd+3FmTisgFDfMLhG7uux9Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=vGPq5AEu6NzkzTW2Wqj/9+OPmYmYzMSuJeSH/kBAjjuSpSY6WuSzYnqQDKazGW1sAPnXV4+VwuweyZL1d8eBQ+2B5YckO+tuKyIcLMN4/sE0mONxU5XTEw/JakGqJezxXRIW+L/+rRR8sSpYoMOeBpn7/a5vudNG4qZQcYXHP6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l1y34U0v; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l1y34U0v"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fed0652bso4984935ad.2
        for <llvm@lists.linux.dev>; Tue, 22 Sep 2026 21:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790139156; x=1790743956; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0WespfEuphhz3CCLrHdjFoExifMJMtXw8rgeMcCZTM=;
        b=l1y34U0vVZ1XqUSWzGnxJBbQPWUu+CF4UDV+KoboCrXbannrLBy3m3pNkPBl8UGlIp
         1qq+/a4L7u0qDQCRzfmnZ/thpoT9xI9nDDxHn4sLY618sjzWH52sOcIlvLCfXR9sfHFD
         irMwwffr+3faTksr8XjFZ6a6TCdVXm3kE9NAB9d2PjMLJz8rJZ/96quGIWTsJTBX0rkm
         r5+6DwiFzrTUlV7b9rm9ocOiMl+BpP/Hkfr7gy+8xGGB5YzR62qu67Mta9257kOLRBHM
         lvamIBrSvQGCIadhtxx8BVxOqWrs5XOQdPqPl4ao/DD1/dLsq+qywx8zY6skNe3D+N4F
         6Nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139156; x=1790743956;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0WespfEuphhz3CCLrHdjFoExifMJMtXw8rgeMcCZTM=;
        b=nemACh11mzMslSLD2vSEktsfFS36cKx0Zy8riOO1wvVNOoUbveQRwy3+LP1KC5+ou9
         b9c5YCTo1igmSVUweyIpr5XiAqzuwsMZkh5v0Uugn1Tc3gWBgqhkd4GGdNSf7lUmLNJh
         981bNZ2McTTRn2dDZeUpRlMrndeNga0td/7Aobb5Yvit8nm1HMNlMa5h4ef5Gyk3zSCG
         pymK/q84Xck7G0XQV8yuyiBqZqtjWGo5X9zTcbiohTCvFtloULUm4hAelzIJti46EXbd
         PLe5pIcMGELu0ua4eusNd0CH2BZoqdCASe3J0CcHA2aQ2gFZqfqQzYLPGIldcCyFarxH
         KPhw==
X-Forwarded-Encrypted: i=1; AKwUvByEF4yrSC3PZ4cj1ZmTjmuuqbzJgjKfAflpiCTF/oaW1W+rCdvUbWc/QdXoOys8LU2NLM7J@lists.linux.dev
X-Gm-Message-State: AFuF++km9FnQshikI28WwAtkIL00CRn0r1+MuvHW7y5+vZDCECEVRbq/
	dxOTrE1TzL1SzK+a38jT0NIZnUg+3/C1s5uWv+8/lhjK/kSysmLEWXvFZz7g7zHUhfEkKtIV0oA
	H
X-Received: from pldv21.prod.google.com ([2002:a17:902:ca95:b0:2df:6d4f:f536])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:144f:b0:2dd:c100:80c0
 with SMTP id d9443c01a7336-2df69e1f9bfmr13350505ad.59.1790139156378; Tue, 22
 Sep 2026 21:52:36 -0700 (PDT)
Date: Wed, 23 Sep 2026 04:52:33 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923045233.2579591-1-morbo@google.com>
Subject: [PATCH] wifi: ieee80211: annotate struct s1g_tim_enc_block with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Bryam Vargas <hexlabsecurity@proton.me>, Lachlan Hodges <lachlan.hodges@morsemicro.com>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

The GCC and Clang compilers support the "__counted_by_ptr" attribute on
pointer fields to associate them with an element count in the same
struct. This enables KASAN and UBSan bounds checking to detect
out-of-bounds accesses to the pointer.

In "include/linux/ieee80211-s1g.h", "struct s1g_tim_enc_block" has a
pointer member "ptr" of type "const u8 *" whose size is described by the
"len" member, which is correctly populated with the size of the buffer
before any pointer dereferences.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/ieee80211-s1g.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/ieee80211-s1g.h b/include/linux/ieee80211-s1g.h
index 3f9626ad3d97..8f6107782c38 100644
--- a/include/linux/ieee80211-s1g.h
+++ b/include/linux/ieee80211-s1g.h
@@ -349,7 +349,7 @@ struct s1g_tim_aid {
 struct s1g_tim_enc_block {
 	u8 enc_mode;
 	bool inverse;
-	const u8 *ptr;
+	const u8 *ptr __counted_by_ptr(len);
 	u8 len;
 
 	/*
-- 
2.55.0.1082.g2b9226bbc0-goog

