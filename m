Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A10A21A928;
	Sat, 26 Jul 2025 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753516403; cv=none; b=g09ZT+41gTSOg3ZUoxSH1B6VF22WlgR7gU7iIu3bKobOet7vV1G0kojM6IwP1V+Q4mgDVSn/BKXhDmHlUpWnI5bQZl0TJHECQIDW61dL9hI67VNs6YdOwEQWptHSliquj5aIp8jK32mciYDtCp0XI0ywv3tbP+Da7jXfr8558LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753516403; c=relaxed/simple;
	bh=3Qjdm6PtWrFNTZBStfguZeGDAbUBJUIMNAuc5t1bQCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b47P/0XY6cDHQmatXCZavzLBvzv09EeamfVnYUe/9cSX7HWqWYjUNhA7rMi83p/NJWZ88MAx6T/I4cC9tYityp7nAajRanlZaGQdiS66Jp9sTut0bKHU1iMztRaowiBCYkHevfZ+ymWRvmgL8BQ0RzvBv8ozkGA52Gj/agF/r0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Es/56V6l; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Es/56V6l"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso2760266a91.3;
        Sat, 26 Jul 2025 00:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753516401; x=1754121201; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCdGgGFrudYoJJ6O9JjbvqrUoaz8feQegg9lFN6eSkQ=;
        b=Es/56V6lr05oiuuG+FzM6d74ifg6AfMKJGavy7XtnXMyzQMxid6g3Gr3VRQQEp3Ruy
         vF3oXYY/eNR31WKn977VWSKP+uW4XYZJJ2bu/phg3jm+5KqQr56LXMN+5M9EoUapmJZN
         DWcm/fggWvs0BUDps4VUWY3IEBr65pgK7gdqmCHQilywEQrHCIqNMpSncI2Smt4E6SxE
         1ilPQDQd62XZie1F7dm6kaaLhRsvOBwrTD0G530bS25O1nez1GHlIoHSB1hQVL5P96HA
         c18Xb/s9G1gVaElNXQIzPw2hFGJKla9g7e1E2416x2nPyRBzhDAUqqi2v5oVPtwEOnN9
         gmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753516401; x=1754121201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCdGgGFrudYoJJ6O9JjbvqrUoaz8feQegg9lFN6eSkQ=;
        b=YwmXLrYaBMXCQTcUWUkf+5amE/q98rlkY8Gts2ozYivG8wae9wRMXWHW61kZsGicwR
         3Z0VE7unla/tO405CHaVgKxsdaBQ4LNgCDWOT6hM5ULE83gxBc1lx2aST1dlvJ+zjoUZ
         awjf8QK0P50DWDITYAiZLZPgVsuVv69bLA0CKu+817590Glm5QNNEIUnt+rRReqyU8n2
         QlN1B03a2S5KT9s0T8ZhRXt6Po9Pa590WI702VFyTD6HL/yKa8xoUJFu4tPrW1Nblgne
         HZNlK97idO1O22H72CAoJojIEB060lCg2OWtZLbrL82Gplgi+wvSYhY7SUzvka27kMPQ
         kr8g==
X-Forwarded-Encrypted: i=1; AJvYcCUz7LMG9/MzeRULCSQ2muDaSXTGjgEoasA11zRYMq8Cr9+Ynj+1AKDFj0XDBwyBzLjrGgzJDA==@lists.linux.dev, AJvYcCWwo3kEDrcwZ+yMElKQ6zhMaBzOc86cIkvo6TV7p1PVQNcLEoLhg+eMs9EUlCatlEIBWPNWs1un1op8aYB5@lists.linux.dev
X-Gm-Message-State: AOJu0YzNfB1WOkhZTLhHiUPl1CfD+QgCrNtqGIDk//L0SUpUmLTbgSbE
	hUrHYQwS5lf59zb15T7WNftm7SjgPQhHEmGkUDEeSAxe8WcUXuRlDPQh
X-Gm-Gg: ASbGnctZPMzDX2aD11etPtXiiL6QbPh8mD9N3Ld5A5jDt7Jv2QAgKpvDAY+rb7lo8Rx
	CnmIpnXyO7/wCURQk62XBSfoUj4Oe2fk3UxfXQ0apl4AYkoa0p46aU4gNBHagtqM4x8AaTOMPBf
	HIovGCsuxUDv8yJ/FD7ITapJVorP+DzaeLuBIJog2KvNuC4H8BBju9hpm9xux4kwDQOj0c88r0y
	/WL7qb8kbBxvAKaAyhuSEmWAvrs2lsHhH6dVZpXCBtYhlGvwnV5F5mz8S6UvQQ5YDY/1QrlgHrR
	WJdFc+ZuChcHXrVpAB+fcowLB0Zgg4kkIGelmsBJK+M4AEg7J/N+PJY4B6JxqQc9gATZgH/B4tM
	H9x6VRfu+039GO2ylXLMZF3aR3UaqN9DQlSaFqFvUqF5dNWJugtqi194YRw9ejWMJsbQB2Xlkp/
	+cWFYXjb5hCQ==
X-Google-Smtp-Source: AGHT+IHor8mK9tBLBooGw5x/C/AHysHucS5DWnFL7pQyxEsxLj5rNCjCX0gnoVkVb6bAF5sJv5UoAw==
X-Received: by 2002:a17:90b:1e4a:b0:31e:3f8b:216 with SMTP id 98e67ed59e1d1-31e77a2f7d9mr7919333a91.11.1753516401189;
        Sat, 26 Jul 2025 00:53:21 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm1234979a91.1.2025.07.26.00.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 00:53:20 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sat, 26 Jul 2025 15:53:11 +0800
Subject: [PATCH v11 1/4] staging: media: atomisp: improve kernel-doc for
 ia_css_aa_config
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250726-new_atomisp-v11-1-46eba1953fba@gmail.com>
References: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
In-Reply-To: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, llvm@lists.linux.dev, 
 LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753516395; l=1268;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=3Qjdm6PtWrFNTZBStfguZeGDAbUBJUIMNAuc5t1bQCI=;
 b=FanCKmuJq56Xx1ro272HoaBJuA1Auoo/7X2DjFhi86bQArOiPdoZoHRqqat7LBgLpd+52nTwU
 kftGY9+lNYrD++mWUHQ6dB3MieqeP1gPMB7Ah2m4/MuhkLAM+XtR9Qr
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Move kernel-doc comment for strength field in
ia_css_aa_config from inline to structure-level comment
for better readability and tooling compatibility.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
index 2f568a7062da726397f55b1e73dadd27fcd1f2f8..f825f537a5366f6b97170dd44827436fd800d105 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
@@ -28,11 +28,13 @@
  *     ISP block: BAA2
  *     ISP1: BAA2 is used.
  *     ISP2: BAA2 is used.
+ *
+ * @strength: Strength of the filter, in u0.13 fixed-point format.
+ *            Valid range: [0, 8191]. A value of 0 means the filter is
+ *            ineffective (default).
  */
 struct ia_css_aa_config {
-	u16 strength;	/** Strength of the filter.
-					u0.13, [0,8191],
-					default/ineffective 0 */
+	u16 strength;
 };
 
 #endif /* __IA_CSS_AA2_TYPES_H */

-- 
2.43.0

