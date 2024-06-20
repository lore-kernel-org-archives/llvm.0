Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F57376E4
	for <llvm@lists.linux.dev>; Thu, 20 Jun 2024 18:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718907461; cv=none; b=KwIuHBTsCd/bXMrZbJvZoqaUO3/resejy+26sUCtypLAIyDgtexcrUwVcjIdB8NOAAAx9pSXoZe0VxtNMN2RcIs5k5ckuDbp4k5WNKkKv0prv+Ap7r/N4Mt7XRnoZVOYFH6A01LM1XNAhMfkXOXppmBzbBCDgzhWG1IqPuqhbIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718907461; c=relaxed/simple;
	bh=iY15znjKwXj/mYMfmF3+a0bhsiOgCwhdhV8LAVnf6/I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ValYHQjiH/1Zl35dcHCdPRvh46q2Ge/XQDRiUCof5y0XIQ9sC14kDf80HaDSnK5ozo2c3x/NV1soWPUZYBz/ZmhAReqTU/Tq7OuE0RG6Rx0P9GlSA2zM0A7reactaIdnajV+P6Ad9iscS0Mqjr2ypTzmZCTCfCgxWRcw8RUh3DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B72xskRo; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B72xskRo"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62a3dec382eso14204957b3.1
        for <llvm@lists.linux.dev>; Thu, 20 Jun 2024 11:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718907459; x=1719512259; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=txPbdh0UwgPW6j6zme2yNhfuJXXQO0kUOBEsBGdoZYA=;
        b=B72xskRo9HSX5l/pV00DO46DNNv/4Iw1hEVwrxa/hB7sBelFLr5KrUcKnw6OR0lXJ4
         bFzmAhTG5hiJSZWx7VkjIpCsfWrJCYiTMBvID7RIYhhccNupQaA0jPQgyiFF9eO/Rb4K
         NjW8kR0e3wRhzd60KoOD38LSBjq6lRHrUV6AbsOLRGiqxGJbE+C+SjL8xWLqdrJVvSU8
         SPQvfjs9yRZ4EyD/8YI+pVltGxqGsesorDrVN8R6v+xs1lilpfPn1z1/VOzpxNUt2ONS
         tx0g8ghaMp6CLIjcm2w3I68Kk+hLOBnKhqQGNkgHMDyCuW/HyJKGEHReOGL7o2ajNQLZ
         GrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718907459; x=1719512259;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txPbdh0UwgPW6j6zme2yNhfuJXXQO0kUOBEsBGdoZYA=;
        b=S5yGkIX+VzvsU0CUF0u7o5fANUQUAqMjOUvuUM9kEJ3yla+lGJDH1+yf48HiSG4E71
         DrL03dAJpuV/zZ79vK5td9EEyCQScEbe4zo3WwprPGLfWYMDQA5CRLHXLo+Zj4lMqIhw
         rXyFD6CCTEZw95lbUVA6rqFITV06Qs7T8qR+bZdsnyrCTOv1qnlbwADCBK5LHoYP4TDF
         kZHmN7tGMpdE+kgK0oCjt2RMEcuGOQaGyK5ldLTntzsHiQwlFHyE2E12bl3HzVWUSlX7
         4a+QbmKNAnvbVMbdXeGh/JPTkVRhUndN7gjAiN6ZM/fZ0zsCvfzqbpA37/xXeUElpZ6u
         REXg==
X-Forwarded-Encrypted: i=1; AJvYcCUbU2RdaOBSz1OvOkp3S739NrA4P6XTzzbVyjDZ1bju/0hRhk/xCVyF1D00CSxdZwNskJwIuhS2Hlh3VTdglZhxaP1Ixg==
X-Gm-Message-State: AOJu0YxX9j3g7JmcDnii7Ubllt7HBDyhBrs0zrypf7LvcKgySSQmw6Rh
	+NTsPtJ/P/jjZopAXl2IAnqQ70XPeR0lGP2kwRM68LtnCZexTFk6p3KxgBjoZkkB+e+3Bxqioon
	2
X-Google-Smtp-Source: AGHT+IF8GVDMyvGZpRp4boOIOSvfLSv3xxNhz/7qXqDIgZdXB8RVhwD0g/1O17E1anqM5aheujLEfMzdr1M=
X-Received: from yabinc-desktop.mtv.corp.google.com ([2620:15c:211:202:6cd4:2b82:abfb:6e47])
 (user=yabinc job=sendgmr) by 2002:a05:690c:30a:b0:620:32ea:e1d4 with SMTP id
 00721157ae682-63a84340c6dmr12853057b3.0.1718907459308; Thu, 20 Jun 2024
 11:17:39 -0700 (PDT)
Date: Thu, 20 Jun 2024 11:17:36 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240620181736.1270455-1-yabinc@google.com>
Subject: [PATCH] Fix initializing a static union variable
From: Yabin Cui <yabinc@google.com>
To: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"

saddr_wildcard is a static union variable initialized with {}.
But c11 standard doesn't guarantee initializing all fields as
zero for this case. As in https://godbolt.org/z/rWvdv6aEx,
clang only initializes the first field as zero, but the bits
corresponding to other (larger) members are undefined.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
 net/xfrm/xfrm_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 649bb739df0d..9bc69d703e5c 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -1139,7 +1139,7 @@ xfrm_state_find(const xfrm_address_t *daddr, const xfrm_address_t *saddr,
 		struct xfrm_policy *pol, int *err,
 		unsigned short family, u32 if_id)
 {
-	static xfrm_address_t saddr_wildcard = { };
+	static const xfrm_address_t saddr_wildcard;
 	struct net *net = xp_net(pol);
 	unsigned int h, h_wildcard;
 	struct xfrm_state *x, *x0, *to_put;
-- 
2.45.2.741.gdbec12cfda-goog

