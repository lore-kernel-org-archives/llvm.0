Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226997D401
	for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 22:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706652377; cv=none; b=awVlo/OZ965k8x8ma81seeGo9TgNWVNIQ48KXd0BQfsvFt2U5kwZte4isZAlDI98EwBcQCmra/H7iX4UG83twFAoUFc3uocETMIaye/55MvalsNOED/qZ37KiZZNj5zqnCw6MjEABhHS2YNUXn1yHuPHHCTsAF2z9l72fKoZOio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706652377; c=relaxed/simple;
	bh=gn0dvTcLJa7mfVKsNhKm9Zlhn7EMdhhcckPZdnAEyDc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cDmYJO/jmCycudvMeu5wGWlO4bauvxQgQsKa4JgV6s2BGYRGcgP4zCHCYlIQOZy57hlOCSStV8BvNT/lw9o+5Pkao5BImwORNUAdAOhyitVi7OVbcdXf8iN1kdnGircShoM2vXmP/6GR4k4/tXxnMspal7dvTnowvhw7mX1udfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W9xn8pne; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W9xn8pne"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-290ec261a61so2626872a91.0
        for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 14:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706652375; x=1707257175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EpcTNftNmXXiGzifaQkJ3S/DIHivihv6EGVVCNRvMGk=;
        b=W9xn8pneVJ0cbKqjZG6yr82mtQTmOZF9jMRs71kW0u3QireAsEP8ZnXtAQsqNqaair
         MiDz4fUQ9qU9mTU3jnpbL/kcbG1TeTbR/zMWD2H2GyT7m3HlkpGNhCbcymT5RrngB38b
         R0IoBWd1Gc2GYvNQM2VZ30BjGrkDJh8S2hAA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706652375; x=1707257175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpcTNftNmXXiGzifaQkJ3S/DIHivihv6EGVVCNRvMGk=;
        b=vAhx7wLPeVSTNnMcGnhQoN5IHyfIaAnBd0i8gg3sD0Mdh7WT6+eRf8wsG1r4obSG+D
         6H3HkX2N8x5QFUjNaL7hllBO/F6ytgGKkEkZJesciG6UDjL6IdAAylMEppE364YNBPSS
         +lYv4CLRyCPMUljFEtO7kIV0jBpKKRdN8O4nWw5IFbRQGUwEvq1nrkDustJ/iwWP+OSq
         Y6N1A8u+nwc3YYP/OpuqpgaeDTHnnnz2n+SggSQQ9Rvp5q9exHGGh+ErAQwk33ZWKRHk
         tUE4ojLUsKg2mocQZRjzwgc6F4/1g29TAl5a4NxhecOSt9TErGIE1ZkPfWnjpcz9k7Yj
         LjVw==
X-Gm-Message-State: AOJu0YzLSrwPf45kCy9y2cizxffNANWlXIXB8j9q+CB4zmmmlZWKfYqO
	+svcRgkN86q4A6ixZwbzND6sBVZE59XN+lGZTB0/2XSP6ov8DDsdfLFaIVDuUQ==
X-Google-Smtp-Source: AGHT+IHHJoa4a2zVyNjNx2GD+zQa7608axdnMQUamIHrlynGd7AyzpXh5cMXkqaU+GSW4C/fHqpsfQ==
X-Received: by 2002:a17:90a:ac0d:b0:294:1261:6412 with SMTP id o13-20020a17090aac0d00b0029412616412mr6543170pjq.9.1706652375445;
        Tue, 30 Jan 2024 14:06:15 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id oh11-20020a17090b3a4b00b0029051dad730sm9160474pjb.26.2024.01.30.14.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 14:06:14 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Marco Elver <elver@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/5] overflow: Introduce wrapping helpers
Date: Tue, 30 Jan 2024 14:06:05 -0800
Message-Id: <20240130220218.it.154-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=keescook@chromium.org;
 h=from:subject:message-id; bh=gn0dvTcLJa7mfVKsNhKm9Zlhn7EMdhhcckPZdnAEyDc=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBluXLRRnzyI6fI6v0nKvBOwzf6BxD/SzagDz7I/
 NuQhNGUexqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbly0QAKCRCJcvTf3G3A
 JoJyD/0Zaz7khw8rvEjl+ViRwJDZukx9DH9xCEPCJ2x1JZfinl2G4QysCjDd4MiRMmAUypVYeOs
 OYmwV/ZO4kJq8Zp5hps0k9/JnMFZcXR9PQEnQfqml3c674pt5bPjVRMKbwIG9rmjaMgaFsBlmsR
 kichU4kPdmgCImcDhwyYoYbC1FbwId7ylVWnEC00t2dxW08xzfIj2pongtfe9rTBcML5+5KOStu
 Xp21F2Ca8ZV034R6GBFhk6fqOZlQGhtvSlUMit3DALF1PsYATJsjjxltZ6WacTj6geLcdgzLiC8
 sttFAWk4F+VlO3EB7UPwxoXdeK2Ce7vX0pgLl6nPA/HeXAXtZIfqbynHTbsLwEbBDNEQuzbUHZA
 o7KKMEbd1LRjGdr/Axku+hw0FDzmCHDSgzTFSxQPTf0I4vJi5+QLUWirWZ9wEFvbuatVTOFn87l
 zPRN/9U+i6IqWwj8WiROByaKMehkN0vN99Fcwy5oTaWmDj3/MQ3/wHstmic8A5EAkITQkQFcMTD
 55Yh5ixwFtyG+0Ujnz/RLvdR94CBkqDz2klsSjn4Xk351lIkxP7kB7mH5RE/gZoHDjgxjpd1/FP
 qxWu6FcNBX2irtQC1VHVGrdgjaDqfyQtmKi5QiuhIzit7numZ5cc0fJRIHYgKnqUuU7LrPq5Stv
 Zuw71ws tLjJok1A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

v2:
 - Define inc/dec_wrap() in terms of add/sub_wrap() and avoid side-effects (Rasmus)
 - Fix various typos (Rasmus)
 - Add selftests for all the new helpers
v1: https://lore.kernel.org/lkml/20240129182845.work.694-kees@kernel.org/

In preparation for gaining instrumentation for signed[1], unsigned[2], and
pointer[3] wrap-around, expand the overflow header to include wrap-around
helpers that can be used to annotate arithmetic where wrapped calculations
are expected (e.g. atomics).

After spending time getting the unsigned integer wrap-around sanitizer
running warning-free on a basic x86_64 boot[4], I think the *_wrap()
helpers first argument being the output type makes the most sense (as
suggested by Rasmus).

-Kees

Link: https://github.com/KSPP/linux/issues/26 [1]
Link: https://github.com/KSPP/linux/issues/27 [2]
Link: https://github.com/KSPP/linux/issues/344 [3]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=devel/overflow/enable-unsigned-sanitizer [4]

Kees Cook (5):
  overflow: Adjust check_*_overflow() kern-doc to reflect results
  overflow: Expand check_add_overflow() for pointer addition
  overflow: Introduce add_would_overflow()
  overflow: Introduce add_wrap(), sub_wrap(), and mul_wrap()
  overflow: Introduce inc_wrap() and dec_wrap()

 include/linux/compiler_types.h |  10 +++
 include/linux/overflow.h       | 160 ++++++++++++++++++++++++++++++---
 lib/overflow_kunit.c           | 132 ++++++++++++++++++++++++---
 3 files changed, 277 insertions(+), 25 deletions(-)

-- 
2.34.1

