Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94019325493
	for <llvm@lists.linux.dev>; Fri, 14 Nov 2025 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130483; cv=none; b=pOtedmS9XA3S0V79I8S87EBCRK/0AnD06QAEXo2OKYhULT4kmgyzR8St6830pA2LTFLZl1DBuwvCDgWXsc/A3S3j205zgMwSN0JebmT00wLyHCZUN7ovba1437/dKOgYmX6dVwapIHLeDBbf9F+p5N80S0JoS5LxK265eaLOe28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130483; c=relaxed/simple;
	bh=BklQGKunSWSC90jjl2C7ggGLVd/hWGKHl6qwpD07aVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=emwo+So9gvZFOY8XpKf7AT+lR9uMNIOjwQ/oToR7n+nJqo9ATfrgq4BtFF/rC1fL/ogDuQgoVccWVBImFbebQvxSIaW2XilExlXUuTCgx/oAW9R8Ylajthple6uERH0DAeFq4dItdvmhCXIpDlnsuOctsyQZxWe847m2X3Aq/w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EinRn237; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EinRn237"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-948733e7810so80540739f.0
        for <llvm@lists.linux.dev>; Fri, 14 Nov 2025 06:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130481; x=1763735281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LaRuk9UO1iAqBvlrA4UzPK6vezrUTGPRno5ObeOs0zk=;
        b=EinRn237IlWfF2ukINjd6/nVXacmpuGXhFP5jvELESjZUYh9XP7oqqJar0te6DjvAW
         Lrn7Ebe3z4uAGUehI7HfwVCdD/uD/2cSYHbpyBECO0EYqupXYgpuefitrbNdb/VhGO9P
         KEcl0WLva6uGU5LznQHUOK6SwvjmyU9lVBqws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130481; x=1763735281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaRuk9UO1iAqBvlrA4UzPK6vezrUTGPRno5ObeOs0zk=;
        b=In+P4r2P8byqT5Q28wigcPQOA5zlgggxuxQbOh+bcThPCwKArRGgYAMAzp2axR1yyS
         g/piUztl9bX8HZiG5MItgbYX9R8pYwHI1ZXFfttNJlWL6oq30FhRPHAww2fVgZADrlf7
         LJl8+qvDvDCV5bnvQOy4FoPzmdZV0/anqDsbO5UbLhngrhANRL2RHDp0tAsm1y12Zh/R
         AD0n3FXEpRddMawnKJ/ZGlQVi3m4OBzdREwtc73LtyZHB7NuGhobCocx7l6AmVBXz4Rn
         nNUTZjXfq+4XQGBPMSwhxQ62NiHdq7fqvJAWxpYEUA68fUq1RNdvEiitMAnxaMi0V3RK
         f1YA==
X-Forwarded-Encrypted: i=1; AJvYcCUB7mVd89OLp4nRliAwieAxlfTpWiniDIFNLcSqXQ4BU4R1NsH/DfpJI8Va4VcAdJATBf/P@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2WvEWfkyJfXv6k9413heVTFv3SqiZs9qT1er0xvoipdmSmowt
	nEi/I4kwd5dHzfsWZ70TYRTjToIgdlyHLjfO+Vwsyj83hEssfzUe905wP0gN+2XWXQ==
X-Gm-Gg: ASbGncudf5yz1y+j0XkmMBZxm5bVvApeBGFL6+IKqB8TxRLBQIomPUUG2H86WYEhJ/y
	LI/InYyy/7M3L+59ikDHwsUaJ8+5fAuu72c28k0HRQ74ostOsKHizY7YVgYYRGUyhz+sb2D2Bz+
	Yt8aTYAmBxec0gizFwS8C+wp/zN7Q2L8hI2/A8xRDDOIeMIYz8j9cQidfLKDmkxNEZkNL+fZg8Q
	heVWI+Wv1+kGdTHselk5Y/CUlG9FGhq7m1BOh2wr8eIYbG31O0Qwur5TjYCSf6PNxO4Aui8k0if
	2m3n2j2BXxrX05KanR//8RSGqhUlrs/pdx/nONZ+CwnNnfXo8arO7i9nGczoNyd+ggsuLXOgxZ3
	MR5SnHNjvIl7umol06ipEuH1QD9EBnTS9y+xBZ402l7GH0Ob00SkkRiYYDqou3+WiGESbx3t97j
	mtB4d/
X-Google-Smtp-Source: AGHT+IEELYloZwlPDfzBUS2CIFoqpVbdAlJTEoxSRiFLxI6XsjRz4z61w7km+eDQVxqihK9V+Z/gwA==
X-Received: by 2002:a05:6e02:3812:b0:433:7b22:c2cd with SMTP id e9e14a558f8ab-4348c8be2b8mr48366475ab.8.1763130480703;
        Fri, 14 Nov 2025 06:28:00 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:00 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Simon Glass <sjg@chromium.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Sterba <dsterba@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	Rong Xu <xur@google.com>,
	Tamir Duberstein <tamird@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 0/8] scripts/make_fit: Support ramdisks and faster operations
Date: Fri, 14 Nov 2025 07:27:26 -0700
Message-ID: <20251114142741.1919072-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series updates 'make image.fit' to support adding a ramdisk to the
FIT, either one provided as a parameter or one created from all the
kernel modules.

It also includes a few performance improvement, so that building a FIT
from ~450MB of kernel/module/devicetree files only takes a few seconds
on a modern machine.

Changes in v5:
- Fix 'use' typo
- Add a new patch to split out module targets into a variable
- Build modules automatically if needed (fix from Nicolas Schier)

Changes in v4:
- Update the commit message
- Provide the list of modules from the Makefile
- Reduce verbosity (don't print every module filename)
- Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
- Use an empty FIT_MODULES to disable the feature, instead of '0'
- Make use of the 'modules' dependency to ensure modules are built
- Pass the list of modules to the script

Changes in v3:
- Move the ramdisk chunk into the correct patch
- Add a comment at the top of the file about the -r option
- Count the ramdisk in the total files
- Update the commit message
- Add a way to add built modules into the FIT

Changes in v2:
- Don't compress the ramdisk as it is already compressed

Simon Glass (8):
  scripts/make_fit: Speed up operation
  scripts/make_fit: Support an initial ramdisk
  scripts/make_fit: Move dtb processing into a function
  scripts/make_fit: Provide a way to add built modules
  kbuild: Split out module targets into a variable
  kbuild: Allow adding modules into the FIT ramdisk
  scripts/make_fit: Support a few more parallel compressors
  scripts/make_fit: Compress dtbs in parallel

 Makefile             |   8 +-
 arch/arm64/Makefile  |   1 +
 scripts/Makefile.lib |  10 +-
 scripts/make_fit.py  | 264 +++++++++++++++++++++++++++++++++++++------
 4 files changed, 243 insertions(+), 40 deletions(-)

-- 
2.43.0

base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
branch: fita5
