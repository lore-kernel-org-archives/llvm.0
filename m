Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F5D42BE93
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440564; cv=none; b=XlDMoyhXFaEo9/bxlaCL/LZTWI1u8qON8fcnPalvronLar27Ji0Gy3RhMGOUtT61VekMgmTM08+/DNnGI+8Ox5WQzOgizh7J+tG/yWEFVnC/feEdATFdoYTRWYghi2l+ltqo3nz9uA+/iuq+6YEa9vCY4W8RvFz/rgcdJb9cplM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440564; c=relaxed/simple;
	bh=qr1ayfYw/TaUJNlhsz7JazjlE9h+RLODo9YzpXaYNW0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xpxhi1YlR4Yn22uJrU55XbmcQiLVGH9dW0xnClNs+Gtm0u15u+XYcEFitak3N87nK9NKMfcSEjcjuogMVqt8b9HTZWO3uW6geXQVD2+G+ScVjqmjj3lwODbzdr5i0dJEHHUlneRiCVxlLwBfGYarsizF/XCAc8q8K7GHjFy0rPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nuDy4C9N; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuDy4C9N"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49558ce01afso4904415e9.1
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440559; x=1787045359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=nuDy4C9NdZUF11BF82FpdTwvWIMPQ/lpTwJ5izhOAfgC0wtJS3vpww8ULk/pJAT/jI
         mLfMIGQBc6X/oOigtRMocIyxR917vxqZ0zHAjPQB5FSTA8gJpTNxDydPwMGW500MSj79
         DoO3svm2Tuk7IgJVRuOMu/X5ITP+ipuB9eL9lROeNUaXQx8gtKAlkRmJ81sJZr8oGOGn
         xzOz3mkr7RPLJ0FLSl8rpmB8aCxT8YNNEF7STuhQhRZisBub642kwi8/gYlVpRCW2Xg7
         NSqm4gnrWgB28qvOZ8SHgwHWA7W0PKbVRcS+NSaw1WId2BPWU8bfqUk8bmrFlgBf3GX6
         jG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440559; x=1787045359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=gl0LujIsZjnIPLu3J/rBWuiV0n8t+0dO7VVdoQxh0EXzuivw93KxRDT4mK/0t6ulaY
         isJfnJI+pvNZzt29DYzr7ItEHVUigsE8dTpjAeLd2u0NI3BBzc2ZcJOdLKH43tNGHIbG
         BQB4/r2V2M22HPy+k3iG3Y+h4ZRFOSpj50GUlEqc1YqQIAYzHDFBU66Q8j8m9eH+FkZd
         OuLyw8Uz6RVwWh44cHFyz4XUgfa6RMBqRN3H0HtmXsaImZwG3CBvodaH1n6oqvh/WK/w
         DL9E2WHXY03IANsM8sp4DBhCcwvyyy9XjCd7t+ACbXd6rhLn4U2kCett+WLHgwFGw0KH
         FrTA==
X-Forwarded-Encrypted: i=1; AHgh+Rou5h7jF+Xi9WL1g72CNZBADArf+nQvVi4UIwQp5LkCVLgksoh/MPxqpAEGN1KJBK05+kd1@lists.linux.dev
X-Gm-Message-State: AOJu0YzyzWBOqqcf/lNvbtKA2FazqvOzSct4Ns40DW7FjzLGYrcpUzpQ
	FAY0UjYoR0wIxx4ggKASsUnXU7U75dx9mUzWtYXcV4LLCV6IJ//dikC+/aSxWD4V
X-Gm-Gg: AR+sD12Y7IaJmfil8ChQhG9PnEZ5rEKVvn0aj37LuoTbhFd/W+neRcGnDR9NTslK8Xs
	M4v6fQg7KVQNSjbceyxBTgkBvx6mfSO8YMFm2TaUqvUs3AC1dZejCh5ASeqMk09FTtCRSZPGCvx
	ZahjCy3EmhfFxQbAG6dR3sHPGppBWelXGrFkARQDRfahFQAga6XjwiumOA+54WiAOs2EP6MYJZF
	4+fpliTIyISsGUehwKG3AEdHNzHdB7oHWktk31z9l0FU4AxfM1Toqy1sZUuKIMpB+0apLF7nV2a
	AL2ILWjI3XKCZQc98733Kd/UJZT2QC3EhQwDz1gk1A57HkVp/TPNlKIdlufCAsF4cmx1/oajWbe
	N3/X1VqJ1/VFc8V4WA4bIFBFysUDa53gVi3amnY/stX9/E0QMPhTqaKzo8pTuPqdmIgyZq4n6q9
	LeeQeqGLWi3KiUtlYZ7wE8eomEx2OG3l3sYAvAxFwy8P0dX2hs3ppYsYzfpDniKXDA9ls64RnWq
	S4OXxEeX9fE+LN+47dDdgvGK151shliFp4yNLAnlWIeDzU3
X-Received: by 2002:a05:600c:1385:b0:499:6faf:336e with SMTP id 5b1f17b1804b1-4997846c8f8mr35438295e9.13.1786440558763;
        Tue, 11 Aug 2026 02:29:18 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:18 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v13 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue, 11 Aug 2026 11:28:33 +0200
Message-ID: <20260811092843.673837-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08e43bc09735..e3ded0e4a115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9688,6 +9688,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.53.0

