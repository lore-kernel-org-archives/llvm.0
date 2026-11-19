Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107852;
	b=3QAUnhpG7Kfvp2K0piu9KxnSBoNT+5OnBlsFeudYTxe4gPK1rtCt8tw7W1B/iNTnOF64
	 7k1lJW729BEDLQfi7nxagAdsZpJ6mj6DtjoWXZzFIbeO+VcuSOrQG7Lv4tMO/YB71LmC7
	 7ntcdSUTJyyhykFWnpmUuEEQXnOZEkkjvdXXFAZ8vOOkE/b0mSzAHJXn+0mR5xYc35rLU
	 MkQU8fcLqmhVL4evnxchrvKyceXwFpCYdE2ZEQ8pvLGE0auxVs+wOID+37TeHor4XERsX
	 +neLgCuUTUYpRJd7AROTTEgv/k3lAmmQHUjoM6Gi65fDX7V6IVJbMYIUFWBVWQ+laLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WHGlKM/TYaoTSSlrFQblz+QKKasbM+5dQbEhB2u9x0w=;
	b=3h4fK/zcY/4b8RaCNW8H4aY0fMBGg8l9sKGiiOVrkX0nUEYotzy7El0YJy7S+mKeRYcw
	 qCXPAi23ZoTGNf+b2ZZA0CfxH1C69AEOkfMTsfpcuW3QQVEe3pY0btqBPbg38mW7vkVb8
	 zdFOtbfT5kHSBCsWf3h6guLcbbKaq7vGBVgJnRmj9+hLGok4ET2F4hNirX73lfwEhJFjS
	 jQfb1IKr7a5DyeyqkeST6cPE360EeFBxEprTpCm+lfv8is5onlZGzm4wJvYt6TI+IeJ3D
	 f5yZu7BZLBp232onqTXUHiqbr1PZbERWcW89VyUSf7t5L5uwrkQq2r6zv0dFmEpdkPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mcqN33OK;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3E6606A325
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F3E6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mcqN33OK
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e778acdbc6so20643b6e.3
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107850; x=1795712650; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHGlKM/TYaoTSSlrFQblz+QKKasbM+5dQbEhB2u9x0w=;
        b=mcqN33OKbTOi+lY9hUXjOgEscUd45/NiMt9P2WbT7fgOu0oFd1H6jMGZrCV/YsKlhI
         L9G+IOzswXn3SXePtDuYukJcpN9RboIwK08bPkqXM2Ia0IWODBzzyjeX9nB414+H2UA+
         QDljVHLeismplgHvQhDAHbRdkcJH/YCmVbJ6xn+x2fDC43wJYd8ClTfRQxpdHTxnQRhg
         u2XGOgWWp7aIcnzT+izzA04ojfQ3Z4Eo1crZ4xoKTfeGmGfrPpUhshNvHhAjUO4gaBu9
         aYvJ9TzqfZICoE6pRzsdL8H7OekRW+zqtE7PAPXom5yRapcg/RVJS1Whf+Mr+TdHBd11
         h13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107850; x=1795712650;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHGlKM/TYaoTSSlrFQblz+QKKasbM+5dQbEhB2u9x0w=;
        b=CN367VFT/xjQSPk3xCjtCOarV7MefC/ddTg4giUN7qoxU5VXiLHjd4q2zaCCxks0xi
         iBazW0wczLWs0F/6LABkVWWuDVr0dzFnUVPtJJl1qkdx1bT11ckb/A2Zt5NQ0Gqt1NuI
         ShAhy9SMgWQwPF/amc1ozg2TVVkQzFc1NPnxZUjOwRNpQRmDuJMxsc0lIap+xm41aACs
         EETwonMKIdzuDcVxFXGsrjJvUfoQaSnHnUvZUjzibm72UfBIDq8kXweumAi55WRCS/oD
         HtlcssuQAJZADRQqeOo0gRCPCyeGQVkmBcaB/K7uki+ry0UVm2Ai+oEO4Cggv/fK52dw
         dFZg==
X-Forwarded-Encrypted: i=1; AL+hErHzvwz/w9MMcDAxVDvlODgJfdRa0fAUz0Ery1EXAVRRKx9gJYsjNIkAlUCFYU8ZCBCu69P6@lists.linux.dev
X-Gm-Message-State: APuU4Z82InOZkmbA8lQsuOVcHqbFWRcG8OZ0h8aABWWbsjZxNJV0UkBM
	G6qP0X8P6+GmjrkyotBjb0WrUOlANYM5MA9pTm9tq8hP0ZQaiG/Obu+MVSwo7V0T1ug2+1EYCqN
	80/jWm3P9sQ==
X-Received: from ilbdx25-n2.prod.google.com ([2002:a05:6e02:4219:20b0:51a:af50:87cd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:23c2:b0:53c:8f0e:ee3e
 with SMTP id 5614622812f47-57a0b34690bmr545790b6e.36.1795107849735; Thu, 19
 Nov 2026 09:04:09 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:58 -0800
In-Reply-To: <cover.1795106937.git.irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106937.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <8b8db80fa775d701fc94bf9e4aa4b0cc577febf3.1795106937.git.irogers@google.com>
Subject: [PATCH 2/2] drm/nouveau/kms: Initialize primary_crc for RG CRC
 capture on GB20x
From: Ian Rogers <irogers@google.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In crcca7d_set_src(), selecting the "rg" CRC source passes
NV50_CRC_SOURCE_TYPE_RG, hitting the default case without initializing
primary_crc before packing it into HEAD_SET_CRC_CONTROL's PRIMARY_CRC
field.

Initialize primary_crc to NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_NONE
in the default branch, matching crcc37d_set_src() where RG CRC capture
leaves PRIMARY_CRC set to NONE.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/gpu/drm/nouveau/dispnv50/crcca7d.o
with LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on NVIDIA Blackwell (GB20x) hardware.

Fixes: 6cc6e08d4542 ("drm/nouveau/kms: add support for GB20x")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c b/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
index 912f59aebe87..02db81e5c8a3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
@@ -65,6 +65,7 @@ crcca7d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source
 		primary_crc = NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SF;
 		break;
 	default:
+		primary_crc = NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_NONE;
 		break;
 	}
 
-- 
2.56.1.708.g77570a6a1d-goog

