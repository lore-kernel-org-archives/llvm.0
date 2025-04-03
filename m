Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88292199FC9
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 16:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699429; cv=none; b=Ivnvff+nUwN1Aci2SoNlE6/qcNEpz4SpI0j+6gboTidmpyKGZaRTKLttkMb4z11LdugIb4BNZQ7Q8zAZWLCnWjxX1D4f1pKVlZEOOF/yvBXbZZkD9T7QUpL0mYVHIkFLtbQ53s8Qf3npIGZdF9j545majfjOMoi99bV5LlfnyLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699429; c=relaxed/simple;
	bh=fdOp0vaeXCptqfAjSbXItKngfrBjdP7k4t4yM8BWbPY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=GK0onO4Osj1o3uOR+ZGSL5w/zxVP0pY8fVzvPT3ZLcqEpwdNNv59jYa6Mk3Ix2KIjifhuvggZmoIPmbXtSElazZgjTuE8p9f/kc8EJC7pM81BeWugmLtPB4fQQ3eBxjkeFfMrEtkqqZ3bQUPsdve2ZREtpx5MbmSGnD6Lleoxlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tOrF5C6S; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tOrF5C6S"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2240a96112fso16104085ad.2
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743699428; x=1744304228; darn=lists.linux.dev;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KniokNw71uZt3EWA3MKzISYWsuZYW7vx6n4uto9whYI=;
        b=tOrF5C6SxjwRV/4BwoW3r8fOsVK1OCPa8Qrzl6GqtSLM76ih/Yn2VPjvknFNIrHg19
         WbSFgZMuFtFEv1sketgc7A2ZiCygvWFZGcwPnNocgI+WflndKxAMUoBJ2pu5nBlGu5yU
         682cZIIhckwGZNv8g5HV/5kv398TKd2a23bv7eUz27NPMbyYhuQ/cD7E7sv1tzxPS2QU
         24a8XWg53x4XSKUIKFKCm+XOWa1D85ZTnm8pt8V/0cAkEn6rHAk4vODICb7M7aRp59qU
         n5BDDRcu3uvT2H37Lq95Hz7WGn/K2nfgps4Ex6VU24KEq1PV+Qq/M2qvomw9C0nuX7cu
         vfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699428; x=1744304228;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KniokNw71uZt3EWA3MKzISYWsuZYW7vx6n4uto9whYI=;
        b=AG+Hy33RfNzYskc120niyAGugl1V+llwANAT/JRFvhxJS1XZOzheEIL3wySJIkOti1
         EvKUMiZSh0vQ3wqXPgwwImVSeYA6cSuKKmaHuprw82EjwEditasykB4TSwUr3DeVz39c
         0/M7pviLPiRvBWU1PuUkj4IccDmv+LItnFhr0N1OGCbTWrgbaZnIG41STjSa07lc3xmk
         S1CUwziRaeI4TuRHybQRxFm8Q2oQHsnWRmu8wjAVAnr2s/4AawakD2IwyQTMSa6R8/L2
         dAUTcCJHkUBJtmjVEMJsCoJlnyJiGpJcUtvMvLvpsQFNnJEy1gPKUjNID05AmfDDp4YM
         FhOA==
X-Forwarded-Encrypted: i=1; AJvYcCX9oUEBRwVs1YVz+le10aX0OWjloHc3tWQhrWJyBn1vMhoRGXzElWx6gMSH9mYfdsUpXmxa@lists.linux.dev
X-Gm-Message-State: AOJu0YyH8R6nDuorflosu47DmyjA1Ec2yhUUzoLD7epMlnqmgOrFhSHt
	HHFWfkSaQWGuSJquGNQpnt2sd01lAXIHrKFTMmgxRqCUmtBaDt4SOFUWW0gEi0YBljNLM0Wrz8X
	IBMGSXw==
X-Google-Smtp-Source: AGHT+IHIlj/ZnHOBNDNsCb4540qonImmu1XaeLfZnMmaQauAJSUWy8yWztGxmNvCylihSdUp2wrZRIuXuhrh
X-Received: from plsu6.prod.google.com ([2002:a17:902:bf46:b0:226:35f8:66fb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41cb:b0:224:1acc:14db
 with SMTP id d9443c01a7336-22977d97f60mr49062095ad.29.1743699427861; Thu, 03
 Apr 2025 09:57:07 -0700 (PDT)
Date: Thu,  3 Apr 2025 09:56:57 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403165702.396388-1-irogers@google.com>
Subject: [PATCH v1 0/5] Silence some clang -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Clang's shorten-64-to-32 can be useful to spot certain kinds of bugs
that can be more prevalent in C code due to implicit 64 to 32-bit
casting. Add some explicit casts to header files so as to avoid the
warning when these headers are used.

This patch started out as a single patch in a series for the perf tool
where a bug could have been identified were -Wshorten-64-to-32
enabled:
https://lore.kernel.org/lkml/20250401182347.3422199-3-irogers@google.com/

Ian Rogers (5):
  bitfield: Silence a clang -Wshorten-64-to-32 warning
  bitmap: Silence a clang -Wshorten-64-to-32 warning
  bitops: Silence a clang -Wshorten-64-to-32 warning
  math64: Silence a clang -Wshorten-64-to-32 warning
  hash.h: Silence a clang -Wshorten-64-to-32 warning

 include/asm-generic/bitops/fls64.h | 2 +-
 include/linux/bitfield.h           | 2 +-
 include/linux/bitmap.h             | 2 +-
 include/linux/hash.h               | 2 +-
 include/linux/math64.h             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.49.0.504.g3bcea36a83-goog

