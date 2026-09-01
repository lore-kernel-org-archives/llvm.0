Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AF5474255
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251438; cv=none; b=JHydoeaWvxc/xrcPDRwZMkrblWb1QiH4aeE9y5LV0BPSmIGup5QYpxZsuYFqMLytu+MgxBmfIRTpdi60Iq/1W11WkwofIcCcZ6MpcYPPdRRlnY2OnVV2WR73/yLE/oJ9tYP0MdOeCKZ6LwvuchJgHQOZ8jMdI4keToO1Uwdj1m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251438; c=relaxed/simple;
	bh=DlPWvl7VPmpyoxjPLEXDDFgGlZBGBcqWJsRTiZvvGGY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABphMXHFYDpmHUCgEmh0m7DQdFt7N82TkZiXxYhx+IV7eCFrtmfqzJuzpFFtCviSbzw944z1eHGfWpLF8h+SctmaK/Zq052xma2LWIOt43y5AY27oMeW+Cub/8eUq0tly7ySzMSlVybZEhgpseom4aBz+etG5PgPcxPZXqMWEKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/MCVhpO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/MCVhpO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso23056485e9.3
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251435; x=1788856235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=winUkNgWZKpQ2EAEJkwIhIBpCcK8DMcWRELm0nMiNB0=;
        b=r/MCVhpOlHy8RxvSI8qSHsoCDM6HXRgLcpiwms0wCnhRaSv/DkRN3vtu5wp4QBFwES
         Y3itpxTfr66LdCaeKo7q+8JCQGxyImOD2QCRy8rpIEHpgXR8RpfAeYd3IrL+j0fm9aVU
         Wqu3blWJD7TPcc+36B2fHKFOHwH9iDikyZTWtbF7Dfc84SGQguVt0YwRkOzNaFhmbRwa
         NHNZ9PAUcmDd9aZT/Y6CiWsBlGvP47DHz/I4DME/g9qC2fg/uFJtU2aNY1NXX14UId52
         6PaFUZlPYAiF+L/CK7qUQBHyEZKde8iFOqr7aNjZSLHLoM7rN9n96XyE9ODV9kbtAzUg
         sxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251435; x=1788856235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=winUkNgWZKpQ2EAEJkwIhIBpCcK8DMcWRELm0nMiNB0=;
        b=hlxSKUJmPNR+uDfXeCWqIdiBNld1+5TPeqr2Qp5B3U4bI9Fmp5kpEFct99OvDI+lW3
         lGznlgXoNW+pxJuoDskoFVfpzeRnhk60TzMHhrpLCai/zCeCsnHtpApAQPPlMiTbPtWB
         6uOU2Y2rbUHI7PbOeFr1txxT8b1CnMWPW6U95o0qLhwab7O4bAb4VkNvQ9TkeRiLB3//
         iWdqJo3DoZJp+Ic4iida2Yltvq4+b3Ww7W3WR6vpe1fx+fVX+LWOPXkp3XWj66IkBTNH
         0D0YchnUE7I/w3H3ZBkgQCVVqaX8onXgsfqSDrjrbTpz0JmMtBz6LuU0wgTMNMaWI6nB
         vdVw==
X-Forwarded-Encrypted: i=1; AHgh+RrKZR82F+9ag9aUypJI9Qzns4exiY2cSB51p1vv22m9BqQjVH4I2qZu5mdxGGMwLKNlX7nL@lists.linux.dev
X-Gm-Message-State: AFuF++kdr3+rRqw2PA/F6Ud66oOEBooN1pj6m+jLqzfaeg7JROpgv1SL
	4FdTyDu2lCZlP/kY+tY5oH0wEBZ6VP3QGL+KDodcPnt+zFjsORTZdKHb
X-Gm-Gg: AR+sD11SjFyC5jZLZC2koio+NaA9x8e/8uLPn3oOFSKJJh/5sRacMTTU3rdsXNg8qpl
	yZ3xfmmrbCVPxC5NwxyzP7E9NIt264jT0hnv/4SmwGgeevb0/8/Tycte3XVY9yBA8/WnfVUmmtS
	emXgDdtNKGTDsmsp2K4tCQP5q54lqhhKw+P6YxkoXLDOOYkUhAN6u9HrMoz3eODD7JMI/SgZMk8
	5Y7CgODYaEosi1mnpBd+oR0YgX+dDStdJcpohfq3sgzbFuc4j4eTQ4jMYTsDRhT4/pjRpYMmUjE
	2MiHQVMhZCcSB3WtolUMh18LKdGHhxfS6lmu7R9eCdF1i6sr4IJrKBbcRDMPZVTDa/7IlJKXoLC
	OreyiYsbMR4zXzSqctC4ealzGUxlPZCofBIhYMMFCt0uEB6wxSl8uxDkm9p4LgeeF5MVeyLiMpr
	JoyfZuJ1Cn6RrSuS1qaH+c+XJU5jRiZL86tcGD0Q/1yZtl7Y3AzeRY4kIujWgRQJ1J6qEREey4u
	hgWHF3lZqVvmLLGLUh93abwJ/9e5fBuD+Eem3QNhLwLBZ/P+//e
X-Received: by 2002:a05:600c:19c8:b0:49b:c8e:a211 with SMTP id 5b1f17b1804b1-49b91c20bfamr493430315e9.5.1788251434958;
        Tue, 01 Sep 2026 01:30:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:34 -0700 (PDT)
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
	Randy Dunlap <rdunlap@infradead.org>,
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
Subject: [PATCH net-next v15 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue,  1 Sep 2026 10:29:23 +0200
Message-ID: <20260901083001.8044-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
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
index 0b42e898f4d8..1b4f79be5e54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9757,6 +9757,15 @@ F:	include/uapi/linux/if_bridge.h
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

