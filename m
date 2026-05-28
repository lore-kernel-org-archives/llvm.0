Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC7A34040F
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 21:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780004327; cv=none; b=F09pvV6QC4HFigA80hnO9mCmzIoxpYEHSbEL6v2P/0c04c6Hr3HelWPXWfyiJT5wEg1hypcEf6nyhLwEm4x+SOU37u+03a4TZpU6aI+01hoAeBdByFaHug+uBR66DAR8B3LpF2K3NjbP1iL9iqNPoPn9fzPSNpDTRHVTYGVKRb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780004327; c=relaxed/simple;
	bh=Qm0ClVgDR801I+ouZbmXtpJMj50lr1fOBsz4IDlnCjc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pWsmiqWixwm6OBwSeN+LqvajrLexRvgEPDgBQ8uBSvAZaTHX0s+AyL710uTSTjwl/xSebkaS4xyA/9bSR/RlWmQgE67i1AVSHDnCN7kIKDdF15h+mejNv4u2CfBM7Q5URsZOoSdMb8HcoaSGAVUlQbXHapC1Sxct8LCeYQgZFFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i0ApNpr9; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i0ApNpr9"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-304d8613efbso1329763eec.1
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 14:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780004325; x=1780609125; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RJqAJojaJ8zfnf1d2GA7xSP8FvOiPajlnN1Xf8Iccu8=;
        b=i0ApNpr9RgZZgpDOBAJsFytQfYeIe6LckTNJcraCZARuaFso1d0e5Svcke1S0Xx/Zs
         fY8xzLOxTo//UTm6s5qMioEqHz36722X8oRmUHH3mn1t5eP2hF2ewQ38CAChoXFNU7O9
         qvR/R32kVtgFBkksPtuEXPA8ehW+WZVPKcxcChV5zi3L+eXWYc8e2kK8pP8BwTKL/vOb
         1LvBd+qts4JMx1mvwZbQg154wcUni+eZddNbergYRnOlsoK8aGQMCAX4vzZP4SI/XlyR
         04YYzxKXb3ee3Yg44Xse5tR/jx4nfWhaqo6qH6v9I01DhAuXAJaQb7amGfXuNfxQ/460
         0Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780004325; x=1780609125;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJqAJojaJ8zfnf1d2GA7xSP8FvOiPajlnN1Xf8Iccu8=;
        b=Hy4oAPOGelk0IZY6p8ZCSMpaDVQcNUIuhqhew99T4iCRl3PTvNm5TDzw8BZjm/nx08
         dCRBYZpbzF7iSAxpxZ2h1zn7f+2pVRZSdvlMEzb2To/JJijPoF9PnVbwJ7OgyQuhNcCQ
         GFlMfGChXYLiZdnB30fXgsYJC7xY4pzFgXnr8SMyJfi4qsnapmYLyMge5Ako+5DX60kS
         ydmoIivagVTgYzHECh2mo0/UY75S5rDUmz9eiZ/IciNBPuEYQC37J4SbiO9YpJX2/Npm
         +jkjLb32un7WViXcHPMkhm9FJho4ktNjY/8k7tzE9X5po4eRPJ9wV01ZD2LeBZH4J4nP
         gYxA==
X-Forwarded-Encrypted: i=1; AFNElJ8Xw7sFDU7lBKD3pPiUTG1ZfdjQYPBTejCGYa0SX4GqZYvphuBIOOcWeYQ93+7VuxQbOaGe@lists.linux.dev
X-Gm-Message-State: AOJu0YxiuXeW9Y31QRQojcN5oBkzJoGxTgO5yE9sp0YWc/kyH0G945IJ
	dSiQSX6XQoB1vrSXIMuaZlRk56sCDwuce/dys2hQmI7rSIln2ysvrRH3mm/pnQhPXNyigPMWSGw
	MVdi0+iDBg0dgByJEhxgSvAiPeuQ7+w==
X-Received: from dyjk24.prod.google.com ([2002:a05:7300:2718:b0:303:93ec:5fc5])
 (user=ndesaulniers job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1008:b0:304:6782:d57c with SMTP id 5a478bee46e88-304eb13916bmr131522eec.15.1780004324464;
 Thu, 28 May 2026 14:38:44 -0700 (PDT)
Date: Thu, 28 May 2026 14:38:41 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOG1GGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyML3czc+KTE5GwgkVSpa5iYkmpslJJsYGKZqgTUUlCUmpZZATYuOhb CLy5NykpNLgGZoVRbCwD3xNl3cAAAAA==
X-Change-Id: 20260528-im_back_baby-1ade32dc049e
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=G37kqG19J0fT90FIX6gZgD3l/cpQxiU38uBYq55AfXs=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780004322; l=3204;
 i=ndesaulniers@google.com; s=20260528; h=from:subject:message-id;
 bh=e4E1W/ubyy6eoS6wLc7Upd/F0ktRDYTG2gsNUpKQwfA=; b=cgLdoDrxBSrFtk9KK92hKq8JwEIJ+hIp5Vbklh1HyqiQ9lAL6XP9u0Z8FfdNdlgyn0sHyk6R0
 sCfSeCYxqhqAWQEng533s+jL//Lk87YkR9S41SC4EfByycDV3IF80IP
X-Mailer: b4 0.15.2
Message-ID: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
Subject: [PATCH] MAINTAINERS: update ndesaulniers
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	gosst-kernel <gosst-kernel@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, 
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I'm coming back.  I will return.  I will possess your body, and I'll
make LKML burn.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 .mailmap                                                               | 1=
 -
 Documentation/process/embargoed-hardware-issues.rst                    | 2=
 +-
 Documentation/translations/sp_SP/process/embargoed-hardware-issues.rst | 2=
 +-
 MAINTAINERS                                                            | 2=
 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/.mailmap b/.mailmap
index a009f73d7ea5..f863781b0102 100644
--- a/.mailmap
+++ b/.mailmap
@@ -634,7 +634,6 @@ Nicholas Piggin <npiggin@gmail.com> <npiggin@kernel.dk>
 Nicholas Piggin <npiggin@gmail.com> <npiggin@suse.de>
 Nicholas Piggin <npiggin@gmail.com> <nickpiggin@yahoo.com.au>
 Nicholas Piggin <npiggin@gmail.com> <piggin@cyberone.com.au>
-Nick Desaulniers <nick.desaulniers+lkml@gmail.com> <ndesaulniers@google.co=
m>
 Nicolas Ferre <nicolas.ferre@microchip.com> <nicolas.ferre@atmel.com>
 Nicolas Pitre <nico@fluxnic.net> <nicolas.pitre@linaro.org>
 Nicolas Pitre <nico@fluxnic.net> <nico@linaro.org>
diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Document=
ation/process/embargoed-hardware-issues.rst
index 34e00848e0da..d07f16c3c7b8 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -308,7 +308,7 @@ an involved disclosed party. The current ambassadors li=
st:
=20
   Google	Kees Cook <keescook@chromium.org>
=20
-  LLVM		Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
+  LLVM		Nick Desaulniers <ndesaulniers@google.com>
   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 If you want your organization to be added to the ambassadors list, please
diff --git a/Documentation/translations/sp_SP/process/embargoed-hardware-is=
sues.rst b/Documentation/translations/sp_SP/process/embargoed-hardware-issu=
es.rst
index 9d444b9c46d3..7d4d694967c7 100644
--- a/Documentation/translations/sp_SP/process/embargoed-hardware-issues.rs=
t
+++ b/Documentation/translations/sp_SP/process/embargoed-hardware-issues.rs=
t
@@ -287,7 +287,7 @@ revelada involucrada. La lista de embajadores actuales:
=20
   Google	Kees Cook <keescook@chromium.org>
=20
-  LLVM		Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
+  LLVM		Nick Desaulniers <ndesaulniers@google.com>
   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Si quiere que su organizaci=C3=B3n se a=C3=B1ada a la lista de embajadores=
, por
diff --git a/MAINTAINERS b/MAINTAINERS
index 461a3eed6129..2f06cc2e463c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6259,7 +6259,7 @@ F:	.clang-format
=20
 CLANG/LLVM BUILD SUPPORT
 M:	Nathan Chancellor <nathan@kernel.org>
-R:	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
+R:	Nick Desaulniers <ndesaulniers@google.com>
 R:	Bill Wendling <morbo@google.com>
 R:	Justin Stitt <justinstitt@google.com>
 L:	llvm@lists.linux.dev

---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260528-im_back_baby-1ade32dc049e

Best regards,
-- =20
Nick Desaulniers <ndesaulniers@google.com>

