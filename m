Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E7253B42
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 01:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460894; cv=none; b=h8sp7ppYmzm6Uf1n9ygR6SBwfr0iDMpGMJVoI7nuYCspgJSG2LfW5vmPetAhWYXwp2HgZG4BHtUAyifRqgs3U+03cUARL7rk4v2gYxTIlw7R51Q+Lhgh62ulahkMg0bS3Q1uJkFbz5VvnXq0n2LygajigVNIhLT5LXNEz3QkoMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460894; c=relaxed/simple;
	bh=+4rmNqUCv5cZ7pndOhXrQMHAQ4UxfWW+wlQP/2xHpmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=StjcfHBya2bUZSSMUOdbYIb/wjhaVuPeCF0WHON8e8RaZBfFrSzshNJ7KcNaNrTnMvWsnOMMUT2jCw9GgA0utfDyyypJuKOtkCC/VyqVrCag/EpenT7NVWXF9JiihnNV7zJ2ADrENGO74yPhG1kKYGmmmZu6HCh9hZWVrBWXlm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gi2wK84m; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gi2wK84m"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e08baf860so477114a91.2
        for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 18:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460892; x=1786065692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0IyVD+1y/522lnq/7Lp1HsNfM3GsCs6wBHZ3/ZAaR0=;
        b=Gi2wK84mmh7CpHuAO7Q5dHUrQxqdiCq1sBAU8NjmpDZ2ZoGXUCG8Qh5ucoobzC13ui
         sX8jK8LV7TAUqopC7HgToA2/KSm51OpZPW8r2EsQ1LyuMvqN+bMZraRgBVcOcXJ2uOU8
         gke7Sm5q/bVyTH/5R1Xoms0wg5PL5cn9r9LfZiXGM3sr1E8nGfzLSNsZPf2hVMGWvDms
         yG8jlVDkVGK8mZwTN9uvgJvhBBSYklvCo2HNaqkIycIQD8rEbvOqowei/yHArMdRDZbm
         bKWCow3eyyQMNaA7noUjvCWhltJRT+oh0xd6QZU6Krd8Q0zl0xaK+/v93iyD2ZN+XxQs
         nPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460892; x=1786065692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0IyVD+1y/522lnq/7Lp1HsNfM3GsCs6wBHZ3/ZAaR0=;
        b=s/IGSUh77EzMuzyYcN2s2V08grdNIihTIIB/259mzKCtPtduxVxJVvqCToRuxwpFY9
         Lhkgv29NhJNADnN6xTFdsnlDD+FJr7Q1mLuvCMNjX1tUhcN4EFK4kHZj529Tp/QKt7bs
         T0hIBQ/PFeuN7r+k8vM2ytrISf/8DLy79B7HbOS/ELroPFUC9GY0HPeHSpHbggW+VxOL
         IhWv4B3y9VYIYId86Ut8yKo5CEh0lgcecmsdklx4jV22zFc1iDEoBosKydrUW9k3apkD
         uxd+IK1NFNsNmDRDRAY06UdGcaUTFrTVOKNbPHKCEQafUsj/zmprWV/R7VeRcBS+MRT+
         4/PQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSUu97KZwN8lcAiMzdPlc60sIrlRYqS/9Zna4R++rmhsKJywkOtqDPM5v2VdcmMwRaMvvg@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj9Gm+kFKXRuhyoPmPM6jkrC4RP7MHqKv7tPrW83gN5j+DpXhc
	7RMlH0z1ROio2YFF/j062e/iLDLPVIBc3+JKeC4CcDpnP5I7265nXEAo
X-Gm-Gg: AR+sD10D+dCcLtVmxNCjPm5Mlx7J1/lIjFDhxIRlIFJBpHFzRBDcPMrEGGU5AvXUp67
	1Nq87iM8YsNkHkdFd1kb1noyg+lTqNSRimHQ/inMcLrR4qFu+a7/OsGeXK2ItIdM1lYGd9isPiU
	MZ4mD/NXXpiIfh7pLD5chR3xEWZluRTwuZ+x2htoeYMSvRo657lKreceRtYJOBRxnFmbtvJgL8d
	Pi4KMC9QWZJkAHnU5dYnUG7KwVoV8TOTPitjbBXEu/g8Yng6yIwPpCN9NldCiZd9J1pIPPLkpVJ
	loXB1cdflZLmDa9GHJTjrP2Q04POKAbJWNjVQfBQD1XHC8aiOyQvHl3wdnry2jdDSKD+wmwTqHF
	rbkt8F6IqkpSEYGwt7wbygHSSE1+imS9wk9Ebyg1qraHaEYCvQxuV8NejKsYtfZnVwO8HBkiO5F
	KBU28jlh/AFF+dgNmnIoAO2QkI5fm1s0H75q08IfHT0eX0iBO4UTc6uqZXXe4hchjIHqTMMKdPm
	U88rkZjki/WMw2S9iv8Yn13/mts6j0eM+ReXjqoKznVMXOLtNTBM0HEenhamFvl3wa+GgKx8G7R
	u3qIhR5bYajahJSH/TXfmWsNJlh7JvVEJAuWig==
X-Received: by 2002:a17:90b:5188:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-38fb14917afmr92506a91.40.1785460892423;
        Thu, 30 Jul 2026 18:21:32 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38facf50124sm198867a91.3.2026.07.30.18.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:21:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	York Sun <york.sun@nxp.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 0/3] EDAC/fsl_ddr: some cleanups
Date: Thu, 30 Jul 2026 18:21:27 -0700
Message-ID: <20260731012130.1212640-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First one is a cleanup for devm_platform_ioremap_resource() and some bugs.

Others are issues flagged by sashiko.

Rosen Penev (3):
  EDAC/fsl_ddr: use devm_platform_ioremap_resource()
  EDAC/fsl_ddr: use non devm for request_irq()
  EDAC/fsl_ddr: restore MC error registers on probe failure

 drivers/edac/fsl_ddr_edac.c | 56 ++++++++++++-------------------------
 1 file changed, 18 insertions(+), 38 deletions(-)

-- 
2.55.0

