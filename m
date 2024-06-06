Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCD9364
	for <llvm@lists.linux.dev>; Thu,  6 Jun 2024 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717678873; cv=none; b=ZiudPV/4cgGzwqWehjmW5jdHfxc7GiL4JyRuHGQ5uUmnPAsYRO1lFCRKJYf2xXrpvRTHY860Mr3DU+Jvty3KvY/z6hsNrcBOUKx14AiPuYzS9KZMN/i0Dz9Le6jT7FeZfZO3T5M6tXtdBi8zJSyl+rHqSJ8bv2VeVVDDx3KZIPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717678873; c=relaxed/simple;
	bh=JuUsKChiLT+vfrAvapauPrs05KYeEB5xAXVHns6YIng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ze1AKM+k1c0vHrC6KJsCHZ0LsK/+sr1MQMm6tyyfv52ABan6sFnmTT4kV18mFL4YXNLuNEZ6oxldlhTC4NWNZdY9dN649oO18EPYFF7jg7bjnNVrGsHzBy+gDpf77nZywJ3VDUgGiETTpeIstWkvcrB+ExySiuFYk0VuEF/rji8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IzssLhcJ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IzssLhcJ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-440299bcf53so4436311cf.3
        for <llvm@lists.linux.dev>; Thu, 06 Jun 2024 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717678869; x=1718283669; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+/smkBmATmw+XKww99raJg0ggR9T5aTjmAVyB+/Cqc=;
        b=IzssLhcJ+UZntDs1+Wu1GmBBuf77Qjb2rV0m0zce8TamYWV/WDiACEUPQe2HsMjXz8
         jlxoGvbM8jEScAdGH6kKHZM5tgsNfu3WwECnUsFf3dSzwJDA+4iZQPytJzNVE8lZcUiE
         6u4/GNMOCRx/12TesoW/qP5XEciT6v6NmK3NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717678869; x=1718283669;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+/smkBmATmw+XKww99raJg0ggR9T5aTjmAVyB+/Cqc=;
        b=J5rNlsoog1yxkBgYNl5q5x3hM7oUEonOZJen/6C9lDRpDmXELMKo6EqOXUsteeqtyF
         HRmwMzCtMXpxVOyhKE/Sp/+4Ou6k38uiLzIKRcAiFxS3ZFP4bHDlKARYDjgLvMdWqDQE
         6urxyN1JldLQSv9MhZm3cUqdhsUlhclmSNTDZAMjE2JoC5mKymyJ7StBFXB0J0azYZjH
         +KxYnPkGjCv7G3dg9kQPvtvCuha4M3SXcbXCgLDyptsyZJyDtLHyK658AtYdMt3ufFC6
         HHM5ucUXQIDrV51eB7wvU+uGPD1fNFoWkpypgD5+oJtgT3kmX2oIkxv8T6lpt5f49MtP
         kaMw==
X-Forwarded-Encrypted: i=1; AJvYcCV8xnVM147FAf7otjkjD9SHTAHo99k6UC5K7Y23w0NebYSY06ni6+uIjNNr8SajnwMu0RrWb2JDnWF47RBYvxkN5Kw83A==
X-Gm-Message-State: AOJu0Yx/4CccMvrynA+v/Uq21SheEHILUWUZqI9brcmTcPsUGcbP9WTX
	9+EOYTsX31SHa5aejpwwVBVFV3tmUJhxkysMr0AJ5gJOlRdRrAEy7oPO/6a9ow==
X-Google-Smtp-Source: AGHT+IH6JUdnRck7CPLLbnhrGIHcZXdHdRadjMOXloMShAFg/P7yO2dY07pA9eCBWDpCwxUBYv7E1A==
X-Received: by 2002:a05:6214:5d8b:b0:6ab:83a5:195 with SMTP id 6a1803df08f44-6b030a96731mr59407256d6.41.1717678869377;
        Thu, 06 Jun 2024 06:01:09 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6c4022sm5998646d6.51.2024.06.06.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:01:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:01:07 +0000
Subject: [PATCH] media: c8sectpfe: Add missing parameter names
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-c8sectpfe-v1-1-c4b18f38295d@chromium.org>
X-B4-Tracking: v=1; b=H4sIABKzYWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwMz3WSL4tTkkoK0VF3TNAODJEsLM/M0YzMloPqCotS0zAqwWdGxtbU
 Au5rR9VsAAAA=
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

clang 19 complains about the missing parameter name. Let's add it.

drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h:19:62: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406050908.1kL1C69p-lkp@intel.com/
Fixes: e22b4973ee20 ("media: c8sectpfe: Do not depend on DEBUG_FS")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
index 8e1bfd860524..3fe177b59b16 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
@@ -16,8 +16,8 @@
 void c8sectpfe_debugfs_init(struct c8sectpfei *);
 void c8sectpfe_debugfs_exit(struct c8sectpfei *);
 #else
-static inline void c8sectpfe_debugfs_init(struct c8sectpfei *) {};
-static inline void c8sectpfe_debugfs_exit(struct c8sectpfei *) {};
+static inline void c8sectpfe_debugfs_init(struct c8sectpfei *fei) {};
+static inline void c8sectpfe_debugfs_exit(struct c8sectpfei *fei) {};
 #endif
 
 #endif /* __C8SECTPFE_DEBUG_H */

---
base-commit: 1aea3d1d4a21e3e7895663b848ffae79ee82e065
change-id: 20240606-c8sectpfe-5f00b9867f36

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

