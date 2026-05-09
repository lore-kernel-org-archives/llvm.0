Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629C61CAA68
	for <llvm@lists.linux.dev>; Sat,  9 May 2026 00:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286771; cv=none; b=r1QwZI6NwIlRyfWX+kiL3PbN69yjvg9S2VnLdQpxsIDCv3/s1wJrvooPn5uqyqrnAcCD/HHBPtZiuwClqmm/AhJ/sqlTtDt/lNlgrrSGu3THJcXMnH75gFFZhwzXBW6g6ZburvWVUmjuTGfXwZmToC/GYkusU5HMWmp9U4q2mHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286771; c=relaxed/simple;
	bh=cwAJtaIa3HAbxdD9fPSDi6pvOQg5BHTwme768t43EHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gm3+hpteuCYvWj8msz2HmWeemzI8TMHBXJdinnkXkW1ahvqTVt5n1vT1KaaIYO7GNK84Ukk/fA+X7lPmk/IIPpoqAb8JHQb0mPK0W2VcMziPFNwG7cSo8dgWczZJXqnIiUEBioKuITsY6rtFlRLmfpVkDxA6lLElC8UrPkKwL6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTbgYyyH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTbgYyyH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so1322803b3a.1
        for <llvm@lists.linux.dev>; Fri, 08 May 2026 17:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778286769; x=1778891569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jRY9lec9jfKBu3OUprYTLDApFu69WThjVKh+9vZTH68=;
        b=hTbgYyyH0FWyfu2Q7CwY+3lR8Rn4Br4gR+pm5fwpy7uF+Db9BcHcsckKO/9wMLS0pw
         ipLjXYkm0ycVRY+xhzysdd3TTMbSYy6j2f8WsmG+bmP+kHuI2A8cFyEzL0txB4HiJUMp
         XCVOSfo5CxLp3VQGbV/BMWRNYRvgo4ynKUi8QGmGS4Q/tWg8qcY4cz72uwxcCYtNyohA
         25p2hZVVhvjq5o9g/UcpQLzLAE0WE9V3t6nH+c22c1SSEgi6by+SlM4t0Jl7hqH0/HRn
         nDy34rV6kkvF2isZR/+XQIxtC2Ap4h7HVAI2yeJIzNypE+3K5iiKzZQCz8n5ZoI4J/wc
         MlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778286769; x=1778891569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRY9lec9jfKBu3OUprYTLDApFu69WThjVKh+9vZTH68=;
        b=rDpeEy04yu4kjMVQjsJqQrsimSc3mheJAGQLWyHO4siryY2R1zYGFp9VGlV8XZrUBy
         hC4ED9XbM1vMxIxvKrvVreD6MI6hG9PlODKuoG+QO2rKqMXfOsA9BPNhihdqYDdU4nkK
         f8HM6pWTR1e2ajHY/hnYrC+TWWC7wtGkCwcDgXVx5rnRzWtlUjLXZfI1h0q/VH7EgipQ
         vbzcLlCuYiMAVNKvIy9s3HAVgmqXX22Va4RWYG0mUEjqarle5IjpNR4L4YIDRnE5KQ0O
         5DmaND/rIBao6y0A7ecd2i0NTN1plVrP8MKg/Rvo0EMQyhTqsCsxNGqd8Pz/j/vgASyN
         GKBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+F3TNybspXT2vWv0f7ePtLBXQ+tMMO3s9xd0x0Mm2hJrOHF/nEGGV3hetE8MhAuIfIOVKt@lists.linux.dev
X-Gm-Message-State: AOJu0YzSJseQSlSBJUEmCpOnhTVEvWVOfpyP9U/hOVbl/iYyHeo5q3o2
	xDhR7lgBZVvDLmAuig+k4OdBSPzlicxnhqiE6+tEIJGsiEAYX1WqM8XO
X-Gm-Gg: Acq92OGpd81J/WGkVH/BNg9eB1l/oW2SiXgIvY4jzknluJxe4n7IJm6WMG/p85OcpcM
	spmYsVKk/A5FhboLGsEgg8EoQ9kveE8ZlokYiTSI04K+6ANnXuhC3JMoRmVGO9iBSB1tT90YW7y
	hh6hcqEL6M+PHzMY/UyQnEz1A+6SbJpnvnynGM5YDPrLePwkGnRiGSNGIPt7wvgMIKSH6GqLMzT
	BdwQY+VFaLKqref4lQFvpHfaAr+VEbmZiNantAjfxJtXNTV6vBfQ46eLfA7ScncBSPX3FH18hb3
	JHd+do/0ZnEbrNV44TYSh0nDWJT1StEuxxq2YzedGXpSff4Rr+CQcV/+hvjo+PqZAgcN0QeGbT0
	ASth+m3onnqMPslA3yf4KLAW5mr7jpSZ8bGLO+zs/rpMHjRFD379d73e41rb01IBTpqLY0nwbp2
	nzNPvmn/q25bEhXZmjgVWzgfgUsI9YBO8oMry4AKKmQdGAxulGYNfsjBxVDjI5VxiHxy3LZ5nRx
	TdR6aQyw7w8AewCaqwdAHrq1yn/FVCHq2I=
X-Received: by 2002:a05:6a00:2e96:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-83bb8b74857mr7784664b3a.23.1778286769291;
        Fri, 08 May 2026 17:32:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d34872sm13648108b3a.22.2026.05.08.17.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:32:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] gpio: merrifield: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 17:32:30 -0700
Message-ID: <20260509003230.955814-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Intel Merrifield GPIO driver builds on non-X86 platforms when PCI
and ACPI are available.  Allow it to build with COMPILE_TEST while keeping
an explicit ACPI dependency for the ACPI lookup path.

Tested with:
make LLVM=1 ARCH=loongarch drivers/gpio/gpio-merrifield.o \
  drivers/gpio/gpio-tangier.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 9e1ed0f451b9..51f510fa8cc7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1818,7 +1818,8 @@ config GPIO_BT8XX
 
 config GPIO_MERRIFIELD
 	tristate "Intel Merrifield GPIO support"
-	depends on X86_INTEL_MID
+	depends on X86_INTEL_MID || COMPILE_TEST
+	depends on ACPI
 	select GPIO_TANGIER
 	help
 	  Say Y here to support Intel Merrifield GPIO.
-- 
2.54.0

