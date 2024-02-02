Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5D9F9C6
	for <llvm@lists.linux.dev>; Fri,  2 Feb 2024 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706869008; cv=none; b=UYVa4dJbDNZ7sxmTg6hBd2+2tOALOUUJqrWUAZkQtzSWMLWepqAXT02Kt8vq/Pe7jc1PbsGp0RlEMQIf6nfijqDMFcaH8o3QHgcWm8/aXi04Qt4ZhSE5vRNzN9i5Kkuf3HzQ36Ddzu0JIUQ11QzkEShSV3egoGb7P3tRWKMZpT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706869008; c=relaxed/simple;
	bh=2l9nEKso4+AOWcpX8WNY7A6dHeDCfYN/6uhOB8hks2s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R6ffDp9fOCIY9/WmFjfcYVjnxcx5hjrYaKLLnp87h9x9gr+ozaQXOr7Hd4yvZuVxoZDg0R38Bfq6MxV+oVEXLv09VhsDI98NPcDO/d+OtVb2M5/goJDOKY7VhAQ67XoFCmYfwIOzh8FnEO8O2tXmPS92QeHRh3hHsLXorYMXUAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kMC+AE4g; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kMC+AE4g"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6dde65d585bso1281499b3a.0
        for <llvm@lists.linux.dev>; Fri, 02 Feb 2024 02:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706869003; x=1707473803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6EHXdAThkGXTR3eJPl49+AVsRbrPUkQd45PvGXZEUlI=;
        b=kMC+AE4g3m8JWBBRPKVLtPApdbpAocRnJG50+TRwtQ8+uXuyq/3K/pjs6o1HPIUzmb
         XP0KfmmMNi/SzNHL4KIRfqLVO683A3lCpj61xD8S5NzTgNpvWNvHdto8qOL9lV0Oimud
         rJbJ30rPLNbf43nP0dzSvHRD3VRbPnY72QYx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706869003; x=1707473803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EHXdAThkGXTR3eJPl49+AVsRbrPUkQd45PvGXZEUlI=;
        b=d7JHcto5AjyIAKEsnA1JdLJ5eg76QhVAafo/AdbevXJgLG9M6mu9LueuRrjDTWb2qs
         z+3QqD2d2PrqVIEvUfbnfakukmdx2GrlxlZ106jzmV/9P4Xvti/INV8Aqyin1MR8KqXd
         Id+3HgUH8OX3nNIlQE6z1vWOMT18M8T+4o8xUbbHpBj+EUKrR+ZIval3UrRBd9ptlqlQ
         S7vwQ9yiapM10ooqRDOdGOoLcu04NpySnYckaESKIUDCONiqYJ1pY9VzjLdXVO58sWJq
         l/mVuWQFOiN4EdG2dFgQcuVuib5Qv1iddWvrV+5qlYbhQo6D5zx01eqe+xJxGfbtZINu
         asnA==
X-Gm-Message-State: AOJu0YwpsZs7NOz4J5SszeG7ogO2tQP7RcJv/w3gtiasS8UJPLqrn0Xl
	Urs/ii4E0/GVp3dUzrpLtdtC56R4uGdxYbbCD24wpMmMsEN49PgEap9j/33ZHg==
X-Google-Smtp-Source: AGHT+IHMKOiQ6mHZakC/jI0iiftn9S+TFj6r9sQjHhGGiqUcwILCJdVCYMDM6jzLDgaScuq8as349w==
X-Received: by 2002:a05:6a20:94cd:b0:199:c9a2:fb0 with SMTP id ht13-20020a056a2094cd00b00199c9a20fb0mr8667691pzb.16.1706869003557;
        Fri, 02 Feb 2024 02:16:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWM0evwmk61ML9mKlP7sQqZt4NIu2CDf4tNN7ZfZBwVop6WGktFTrN8OQ6otbkJV/lVl6pxcL/V59G96BahEDFx4D7uY4o04C+92sAr/f+65Vbvjtnyg2OPcPHZOyvi6dhxH+kafSvPLJ0gPpvBuxExxguupg7UHSjrbBnSuY7diqz3XRNyLJLE+k3NrKhDBQVfDkjSCPv5+IPi2tsC4kTfC8bHtbQ9Ds1QNM+OfHrrAG95YPgJkHok9YDBlFI2yp2omYAuCblWCU4E8xsjCg4uDuDPIrLsHiSO/YSQ877+xeTLG4We7BgzltdppTfhDtq5LoXEOHmAuGsaNV44gP/1OkY/j2EKxPna1dwhxyWss5i11x9OKRpqTatFqLO9bRvuZjNP5JYKnM70Ypx/DONZf56mG3Z/X3xbiG9mWGOrrlhF8VkWCvK/2DlLipi7xDyBvtYleNfk9SMbxw2SILv94Pjffr/mFJybLlIBEQVzRFgY1Lzh5lWQA7tomI9J5O+hbVp6srbBPr/obebIVCKkQqaan6RFPi81BbO8TUbrbFI8LUK+uytdppF3tBQ/UWgWGYhbMHdL3uarjfDfTC+h/5sXe7a55tsWq4g=
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u26-20020aa7839a000000b006dde0724247sm1273062pfm.149.2024.02.02.02.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 02:16:42 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Fangrui Song <maskray@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Bill Wendling <morbo@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 0/6] ubsan: Introduce wrap-around sanitizers
Date: Fri,  2 Feb 2024 02:16:33 -0800
Message-Id: <20240202101311.it.893-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2894; i=keescook@chromium.org;
 h=from:subject:message-id; bh=2l9nEKso4+AOWcpX8WNY7A6dHeDCfYN/6uhOB8hks2s=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlvMEGR2w/jDkKre5GPT1/M/XftJt/c1PyB4wL/
 haxlFPUi1KJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbzBBgAKCRCJcvTf3G3A
 JtsCD/9zn8FXQvcFAIIQgYZmbnBXO2DwIbRtXhGNbq2Nup24+qU2V23CPL1rxaHKDC/EiJJEnKb
 e5BpVrssi1sNVM0eT1gSuZh3+Fe9MuSkT1qu5cuE+fhykPOt7JYBmAot97DhLNGpbC4Wh6wS2Gm
 zt9zRh7VdGjswl0SiQQT3Ko7H0hMo+8Du/2ufEy3yiken9zj1VMMJ1KoVnxpVhaMUra5smuX5fZ
 xfIadzk4bYAjWidY713+WT72pgRr7qsh7cHstL2GUq2+nI0GL0j6nmtuhPKMexyPaOp6rTzXwvb
 Z7GBANHBt9W7RFT2e5jxCw2iSyb/9aZQDjTzC7dGQNytXEvHnP+Phzhj7xCmXOuITiwx70ObSXS
 ME7gGoLJ13vK/Z1MOOR4KUNhbNwuaGi5yPooFb0xcsg4KnCSY2MOorFK9WWpu/OjmWo+DxUMEvR
 1J/KCnkcS1uyoVLsNj2Sh3VJJfz2UhtJtuwtqbFW43Uy4aaj00q7AmQ+NDje2eWQ70R0R+2XSMI
 ndQHgrn7bxz13hk+ym9Je7oT6lJtEH74ncnlLRyN2B+2wk61/16LUCxqpP2Qjq0ZUSeYdi1IICL
 eEpdx3A5WLH/w5PScFuSOwRUsIvtR3tCIgLvj1N4YRLGfj9EYX2DFA1VIUBOXReGwVa9kHKDz29
 jIcc1AN WIb7pOrg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

v2:
 - improve CC list
 - add reviewed-by tags
 - reword some commit logs
v1: https://lore.kernel.org/all/20240129175033.work.813-kees@kernel.org/

Lay the ground work for gaining instrumentation for signed[1],
unsigned[2], and pointer[3] wrap-around by making all 3 sanitizers
available for testing. Additionally gets x86_64 bootable under the
unsigned sanitizer for the first time.

The compilers will need work before this can be generally useful, as the
signed and pointer sanitizers are effectively a no-op with the kernel's
required use of -fno-strict-overflow. The unsigned sanitizer will also
need adjustment to deal with the many common code patterns that exist
for unsigned wrap-around (e.g. "while (var--)", "-1UL", etc).

-Kees

Link: https://github.com/KSPP/linux/issues/26 [1]
Link: https://github.com/KSPP/linux/issues/27 [2]
Link: https://github.com/KSPP/linux/issues/344 [3]

Kees Cook (6):
  ubsan: Use Clang's -fsanitize-trap=undefined option
  ubsan: Reintroduce signed and unsigned overflow sanitizers
  ubsan: Introduce CONFIG_UBSAN_POINTER_WRAP
  ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL
  ubsan: Split wrapping sanitizer Makefile rules
  ubsan: Get x86_64 booting with unsigned wrap-around sanitizer

 Documentation/dev-tools/ubsan.rst | 28 +++-------
 arch/arm/Kconfig                  |  2 +-
 arch/arm64/Kconfig                |  2 +-
 arch/mips/Kconfig                 |  2 +-
 arch/parisc/Kconfig               |  2 +-
 arch/powerpc/Kconfig              |  2 +-
 arch/riscv/Kconfig                |  2 +-
 arch/s390/Kconfig                 |  2 +-
 arch/x86/Kconfig                  |  2 +-
 arch/x86/kernel/Makefile          |  1 +
 arch/x86/kernel/apic/Makefile     |  1 +
 arch/x86/mm/Makefile              |  1 +
 arch/x86/mm/pat/Makefile          |  1 +
 crypto/Makefile                   |  1 +
 drivers/acpi/Makefile             |  1 +
 include/linux/compiler_types.h    | 19 ++++++-
 kernel/Makefile                   |  1 +
 kernel/locking/Makefile           |  1 +
 kernel/rcu/Makefile               |  1 +
 kernel/sched/Makefile             |  1 +
 lib/Kconfig.ubsan                 | 41 +++++++++-----
 lib/Makefile                      |  1 +
 lib/crypto/Makefile               |  1 +
 lib/crypto/mpi/Makefile           |  1 +
 lib/test_ubsan.c                  | 82 ++++++++++++++++++++++++++++
 lib/ubsan.c                       | 89 +++++++++++++++++++++++++++++++
 lib/ubsan.h                       |  5 ++
 lib/zlib_deflate/Makefile         |  1 +
 lib/zstd/Makefile                 |  2 +
 mm/Makefile                       |  1 +
 net/core/Makefile                 |  1 +
 net/ipv4/Makefile                 |  1 +
 scripts/Makefile.lib              | 11 +++-
 scripts/Makefile.ubsan            | 11 +++-
 34 files changed, 278 insertions(+), 43 deletions(-)

-- 
2.34.1

