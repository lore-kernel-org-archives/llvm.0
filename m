Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B8F285C9F
	for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 22:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756248710; cv=none; b=Caf5/rEfEXu88AMSFYGEouJdMdb73X8XVDBscnNZ5dF/GPMVM5GcI6RFo8nSty+f5B7VUoJHxY860v+fGhyZfUMCckitmKl1NgpX6r6k52MHarnia5ehvpK2EeJ+elm3hbQU6iTe8wTggJFnoXCp0m7OgPTf9m8A8ULKFzk95u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756248710; c=relaxed/simple;
	bh=hgk4XDMvj1XRZUEv0zpCfESAIhrSX8CeXQ0czb2Zh0M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sVWMy7DcFaeeYQUoxfto5FhCg+8XHjLuXErAiTWYS/QTtRv5kZY2lZBq9GsROd8BCxubQAIiowpGWQtxeEJKMGW0Sc8k9hgT9FVisC7GjmpV/dnnd9Z7wuZhB39iWb3qmD8nqR1TqBdQhaQwnozSJ6mSj/g57BYzHT/I+eeI7RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACxNeViI; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACxNeViI"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b47174aec0eso4059742a12.2
        for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 15:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756248708; x=1756853508; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nZ1zyXSSIOQ4H4hZM313mvzovTi9cnOMX7vreXvwnt8=;
        b=ACxNeViIEBF2lRgPpbzH9Z52P+L03YEvu/wSzlVmK2Vvn92fUIH3W/uEBsplX1E9uW
         5Usn9Wp5RhYwFmlIUaoPB6rjxBNoFQxuLwCbya3BpCL+xKzCfi3fByyYqcL2i2D1kblz
         My4Bi8NSD2gNdKOcuD0M5mab+7JObNKpIwBK/FaJ4DNh8ln0QEQkomYTSU1TDG4fwCYU
         6tEnp7yUtcqil5X3EZAczaskXzcd6pEFFyqBWpA9H8/CMJHApRE1ei+P7iw20kzDZKYB
         m+i4+rQ71VUfSqhp+Iy6oGakADLm4We2fQR05o79hLoFQubWtSeLzuP9yQJn1/Ia/xtY
         DlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756248708; x=1756853508;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZ1zyXSSIOQ4H4hZM313mvzovTi9cnOMX7vreXvwnt8=;
        b=NCjwZiuhBpISa1Ks4aV3Xa9o6BQJqVN+DoTmjBNa0WmpdLyKvIppzJzJkwZnJqoIiA
         +EoWtYP952MPjn+/MACRI3RKLEA1NLW2LJnYdMNHYrie7u0x/gAM4tD6SnTAxcHO1VX0
         vkyFNthkeOBlvUpaAsQf3gNhIzcqHGTmOkZj2veEA9q08Xy4hsFT0KYhncVQ8l38wwIx
         AL3Z3d7nrIsXRJGPeWfdPDcaTmJZKcSf7KImp8pGLVMORItyuj06kUsEHV3ERff0r8Jo
         vI3WaxUpa2GXUXpb0pjmLcnsn/ohdL+EOLRcWtZuLwWwE3trCUIQz62WVSOt5kTvMF0s
         VWNA==
X-Forwarded-Encrypted: i=1; AJvYcCVuc9YCYC+zdfBebGvDua75t5x0b/0o6az4wd7BDxA6ngY5wzxoua7zQ9Kexq2nKkTQqANi@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgkwj5Reqft0mE1axElVAzqN89KDv4LMV1YEgSm2Br0uik5wnN
	Qic+BBe5pzOhAQ4dDxlDDadF2+XSPkVD28jK0S1+yf6lXddW0rpHBN2I
X-Gm-Gg: ASbGncsYqYGuPiU2vDlsBWLXW77BrygRi/qJEnUg+YHfsSGS0dpi4lHMdImeL20xl5b
	d3HJpytq7BfPvlZ5MRIrywZWZmwvS5jEDrAh9W/ERPnlkiyEvedVMFOqUcg7AwRKnv5nBdp1Pa6
	KvjrUQh8i02BFfU2ySvDX6JCql02lHcYBDS9lrL+o73k5wO1Y9jqfYn7FaCxDsfzperE5gf7X6x
	YmcwHq/ZfUY5OQF+j6X9TxKCgX+GcTkbtQ2XDdtRmsxEjPsjNfSdRKhbj00ZnFirTZh/qOGwMyX
	K+Fsf2AX6r8CSsyNLjkWQnRqaNwagnSmN/mfvVJo82t00ezmNONeYVdog64kfauKoG9+8YiyXY4
	5+fvHEY2br8sDXUb/bFSi
X-Google-Smtp-Source: AGHT+IG/HzQ4hMId5Yct6mGAhKNYFzfy96p39xqVpexqISKH81EdXf5MkxVWA1nFcqIHqt/EM66QhA==
X-Received: by 2002:a17:902:ec82:b0:247:7e9:110d with SMTP id d9443c01a7336-24707e91239mr101058735ad.6.1756248708113;
        Tue, 26 Aug 2025 15:51:48 -0700 (PDT)
Received: from [0.0.5.57] ([136.159.213.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688a601esm105340815ad.162.2025.08.26.15.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 15:51:47 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
Subject: [RFC PATCH 0/5] tty: Add KUnit test framework for TTY drivers
Date: Tue, 26 Aug 2025 16:51:30 -0600
Message-Id: <20250826-tty-tests-v1-0-e904a817df92@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHI6rmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyMT3ZKSSt2S1OKSYl3ztOQUiySjJANL41QloPqCotS0zAqwWdFKQW7
 OILEAxxBnD6XY2loARpCBXmkAAAA=
X-Change-ID: 20250824-tty-tests-7fcd8b2b093e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
 Abhinav Saxena <xandfury@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756248706; l=4094;
 i=xandfury@gmail.com; s=20250614; h=from:subject:message-id;
 bh=hgk4XDMvj1XRZUEv0zpCfESAIhrSX8CeXQ0czb2Zh0M=;
 b=mSY5yCA3KyC3Jqpzeam3sxhrqhDy9sptr85JvnLMfcV7xFOHeUh1WHDvH6DvdeIHlJNpXm7ph
 p1EdMuN7iI6AUnv/NRn/HgYTdbqiB4Uy6CHqf9MebJo5XZAOXaGCc0s
X-Developer-Key: i=xandfury@gmail.com; a=ed25519;
 pk=YN6w7WNet8skqvMWxhG5BlAmtd1SQmo8If6Mofh4k44=

This patch series introduces a KUnit testing framework for the TTY
subsystem, enabling deterministic, automated testing of TTY drivers and
core functionality without requiring hardware or userspace interaction.

On an x86_64 build with CONFIG_GCOV enabled, these tests increased
TTY subsystem coverage to approximately 10.6% line coverage and
14.7% function coverage [1].

Problem Statement
-----------------
Testing TTY drivers today requires:
- User-space interaction through device nodes
- Complex setup with ptys or real hardware
- Limited ability to test error paths reliably and deterministically

This series solves these issues by providing in-kernel KUnit tests that
exercise real TTY core paths under controlled, deterministic conditions.

What This Series Provides
-------------------------
1. Reusable test helpers (`tty_test_helpers.h`):
   - Minimal (~150 LOC) infrastructure that any TTY driver should be
   able to use
   - Automatic resource management
   - Integrated into core files under KUnit guard, with
     `EXPORT_SYMBOL_IF_KUNIT()` to keep the production symbol table
     clean

2. Mock TTY driver:
   - Demonstrates how drivers can leverage the helpers
   - Enables deterministic scenarios without hardware

3. Core TTY tests:
   - Validate open/close/read/write/termios paths
   - Exercise hangup, resize, and error handling
   - Ensure real kernel paths are tested, not mocked stubs

4. ttynull driver tests:
   - Validate data sink behavior of the null driver
   - Provide a minimal driver contract baseline

5. Optional coverage support:
   - GCOV integration for test coverage analysis

Future Work
-----------
With this foundation merged, follow-up work can:
- Add more coverage of TTY core functions
- Enable each TTY driver to maintain its own KUnit suite
- Introduce stress tests and race detection
- Extend to include more tests for other tty drivers:
  - UART drivers: test interrupt handling without hardware
  - USB serial: validate disconnect and reconnect sequences
  - PTY drivers: test resize, flow control, and hangups
  - Virtual consoles: test Unicode and input handling
  
Testing
-------
- All patches pass `checkpatch.pl`
- Verified on x86_64 with:
    ./tools/testing/kunit/kunit.py run \
        --kunitconfig=.kunit/ \
        --kunitconfig=drivers/tty/tests/.kunitconfig \
        --arch=x86_64
- All tests pass (working around tty_read wrapper in progress)

Feedback welcome! :)

References
----------
[1] Coverage reports: ttytests.haunted2bwanted.me (alt: linux-9ik.pages.dev)
[2] kunit.dev/third_party/kernel/docs/usage.html#testing-static-functions
[3] KUnit: docs.kernel.org/dev-tools/kunit/
[4] TTY driver API: https://docs.kernel.org/driver-api/serial/
[5] Big thanks to LDD3! (Ch18 especially!)

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
Abhinav Saxena (5):
      tty: Add KUnit test infrastructure configuration
      tty: Add KUnit test helper functions
      tty: Add mock TTY driver for KUnit testing
      tty: Add KUnit tests for core TTY functionality
      tty: Add KUnit tests for ttynull driver

 drivers/tty/Kconfig                  |   9 +
 drivers/tty/Makefile                 |   7 +
 drivers/tty/tests/.kunitconfig       |  44 ++++
 drivers/tty/tests/Kconfig            |  44 ++++
 drivers/tty/tests/Makefile           |   2 +
 drivers/tty/tests/test_tty_io_core.c | 249 ++++++++++++++++++++++
 drivers/tty/tests/test_ttynull.c     | 163 +++++++++++++++
 drivers/tty/tests/tty_mock.c         | 186 +++++++++++++++++
 drivers/tty/tests/tty_mock.h         |  34 +++
 drivers/tty/tests/tty_test_helpers.c | 387 +++++++++++++++++++++++++++++++++++
 drivers/tty/tests/tty_test_helpers.h | 239 +++++++++++++++++++++
 drivers/tty/tty_io.c                 |   4 +
 drivers/tty/ttynull.c                |   5 +
 13 files changed, 1373 insertions(+)
---
base-commit: 8d245acc1e884e89f0808f64d6af3fc91d4903a0
change-id: 20250824-tty-tests-7fcd8b2b093e

Best regards,
-- 
Abhinav Saxena <xandfury@gmail.com>

