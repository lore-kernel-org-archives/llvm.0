Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4212B16D310
	for <llvm@lists.linux.dev>; Fri, 21 Jun 2024 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719004705; cv=none; b=pr2ghs7ZrX+NpcgYV/hmnGbk3crfPbv3sW9wbpSnwCex+nEcpjreIoDEWyXxgf63CCn1yXZTcgbduYGrAbHpvhKqgTwu73hwWUNHECBsvcve1mhGIDsuJNW1bSGPqJuYTwjLWCT8au2PrbYsp5uUKnWBeS0W4sLf/dRmX40OPws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719004705; c=relaxed/simple;
	bh=B+G9QtsD7C2Jc3sDzbUlvXmN736PbhSU6BpyDPCIla8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dfakESYb+OY35OvoEzPpe/QBkvAW/B9GNRPAcGQBxiFcXnK6o8OhQqvP6DTqDocUeCtRBMM1JLvfE3nkDcfYIcaa2yX1peOsNXgwaJJQPyyNBCCxCx9O5SOkbkQQ9vLGZcuhXzchOG30Uo2dkhqhk4E5J/pRbT+sZPjGEdcp4+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j9AapKxt; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j9AapKxt"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-632e098ab42so45135087b3.3
        for <llvm@lists.linux.dev>; Fri, 21 Jun 2024 14:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719004702; x=1719609502; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lEa6AhAPPJv6m60+8usBRJvGW03PUOWIeiJHHFIJ3k4=;
        b=j9AapKxtxMA6dIgo6z9fqIpICHEulASIbuAQ8lplbnQroemIAaTOWp5T/Idrd7SJKk
         bQZ+/cFhdqobh5zvtugG1KpESaqlIqb/i8zrLe76I+cc1pMNU2GCJYiKYh0roVDRLQj1
         1WXrQFAVTI06iB+Vpy8KluRheGL0Hxm2wZrNwJExMa3d/Fjs2cEFH68OoBi7BCpelTcG
         3Jz9WHT3xbqCwUxy7URf+QD3HFZZq6J2mu72K83t+AmNBs03qxt/ax1USaQoOgdk6wZA
         XzlPJuIhYS7fyArbgr4iTcd/o/dVjPB9dViKCe/zMyNJd52D9EZ/o2XPRk3NgmU1bkmv
         N1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719004702; x=1719609502;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lEa6AhAPPJv6m60+8usBRJvGW03PUOWIeiJHHFIJ3k4=;
        b=d2CYpbJRrlYypSv20HSLQKvU7e+ExdOFHPFiNQb0mnWQPEBdPG66vCiGMb0/zRZinu
         O7KglvWCt3XLuMvJMNhpLPd4JiQVkGLHyXID1kH3VdUYbjMy9m5QjUZ74nv9Dd55HLnk
         /to7aFW7eFSeJsXLSNP71OWBBexVquiOIS10I1ujTAILpY0+6TPV/0df/Mlhm6EOoWms
         4yNygxj/ucH2e8up05siyEQFYqGyCNfSnmv3uOF2gKC0OQDqzCoA8mZgd6h+ypKm8Rlg
         nTlm3B6IbLd2iEPXSrYCkyJcUnjbxuAmWpIstHbcJ/pZO60ECcDifpb5fVyRLjQrQICu
         9tig==
X-Forwarded-Encrypted: i=1; AJvYcCV8pU8XoTT3YEEqcZy/BnpKcPv7l2fG4YyeMJJ3DQ3XOy7PssrXq87Xr4K2zZCM9KuqiRICQ2gR0Mxq+NTz4jgQruLiLQ==
X-Gm-Message-State: AOJu0YxyrOaDXSJaHOUNkkCoe2d3NuBDBYwzMVOHeGXnDaJ5qNUMQWFo
	gmCMIWjs2X1+3NKiyZmf/SGUxhZnv3a2A35RJ3EvXPVPRZMX6hFFUVSzXYn1v+WHFRNBiSI+zi3
	T
X-Google-Smtp-Source: AGHT+IEP/2Rh6WitHSvCa6ePiTeFcXPS1z9OBz0PJKzZRVE8qWAYk4K12RXfyoLq827IauC3/poGWrv3R4c=
X-Received: from yabinc-desktop.mtv.corp.google.com ([2620:15c:211:202:9257:c357:1f0c:2e57])
 (user=yabinc job=sendgmr) by 2002:a05:690c:6106:b0:627:a962:4252 with SMTP id
 00721157ae682-63a8faf1313mr15919837b3.7.1719004702263; Fri, 21 Jun 2024
 14:18:22 -0700 (PDT)
Date: Fri, 21 Jun 2024 14:18:19 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240621211819.1690234-1-yabinc@google.com>
Subject: [PATCH v2] Fix initializing a static union variable
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

Empty brace initialization of union types is unspecified prior to C23,
and even in C23, it doesn't guarantee zero initialization of all fields
(see sections 4.5 and 6.2 in
https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2900.htm).

Clang currently only initializes the first field to zero, leaving other
fields undefined. This can lead to unexpected behavior and optimizations
that produce random values (with some optimization flags).
See https://godbolt.org/z/hxnT1PTWo.

The issue has been reported to Clang upstream (
https://github.com/llvm/llvm-project/issues/78034#issuecomment-2183233517).
This commit mitigates the problem by avoiding empty brace initialization
in saddr_wildcard.

Fixes: 08ec9af1c062 ("xfrm: Fix xfrm_state_find() wrt. wildcard source address.")
Signed-off-by: Yabin Cui <yabinc@google.com>

---

Changes in v2:
- Update commit message to add/update links.

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

