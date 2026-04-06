Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF5839098F
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 18:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499743; cv=none; b=nXGMMGJAmiM8tNwJIkASjF5099zbZ6EpzQDYG5T+gmgCeNgetNp5ODfRwWJQm5wQ58BNVP1cb85GOEE5zZ6MR/c2sLvGE9jLsn/DnN4xM9q6CqJYCzK+mQOut2N8cL09qUFCOkbHMUH+IXnlrBap1EJB1CVCqqHHYw1ejskLikE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499743; c=relaxed/simple;
	bh=SaQAAu0R4n5ZEcWB6xTQZwJd7/g3hGbip0D2H+lQ8i0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jgi0vK2RmWSZ39RLbpntLFz5LYVzOvlvF0GABLzXa7E1Vt7t+U2P/K+deAF45OAudzBl2qh1Cz8jTyPmXVly1G/4xb+fjN7V9GQoKFVV/wO4XTUo132svKjc2Whg0zbjr5g2451w//pW/mLig6nh6gFMClGZ4lreQfk7BWkKKEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OdsHysa8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OdsHysa8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4889e045bc6so25550015e9.2
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 11:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499740; x=1776104540; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QaHQlokHi0wyDMWf6noY5cEfbJwKDe2MTnhc6Fz4Pxc=;
        b=OdsHysa8yLHsrXjp6dn4KYtUw+vAt6wqFkCcbylrbc3qbILu3HBOAW2PtuBxPM98pm
         jAmnR1AHX0lB+gvpoICrS4SPV62DsD2g2SczCTotvevA42rkq09MT9Wq9KDT4eZMrGho
         UykTS181SxSMe9rxkOwOJxkG0Y+Jzd7J0Pl9jaHOKy9RgapP9e7vVudAu5JPK+3BK7Cd
         JlL6UmO2iqaXrztKpdUDHaJFf0h1n5yYpwkj9mdjsRP8ZIknyXn791OhLdERKtO8j2XM
         D4QJUvMSKBf1Ur9RccfBp47q8fH4YfabrOmnUrVhBdkHc00Y7xk1hijEn4wA1tbP4ot/
         XCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499740; x=1776104540;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaHQlokHi0wyDMWf6noY5cEfbJwKDe2MTnhc6Fz4Pxc=;
        b=N3RApyfnXSmwlrtB5DKj4BmPAlQEjSvViR88/zAvm65DNSsJLljOEF49naHymdRizp
         maYkfv02lgpotcaDFyNpj2izumY3PTiDMspzOjKupN/Jye652ZINy9GkNDA4Lw1wDV62
         CX6DeoclutwZm9yDeNYqlvH8lGa6JEg3sRLeAq7MhtAU00KCtR14f6yYztQ96DHPkHrF
         a8s9aiARin656fV8CkKMAWTGL8UetnQJBZl5NZxzf58u4pknd7SJtQgUtbDUEWxJd10W
         F8lIoUWWAsqf3R/iy3SG+VGjaLSKM+ifWak1zqSC28mP/afkQb8kq4V6eER8DN3D865j
         ynuA==
X-Forwarded-Encrypted: i=1; AJvYcCVOANlwSdW1ZtmRmW2ph/CQj9L64dksUs8RQdNRteDDmXbG+RppjBrx+jb1SkPnuC3QoYtP@lists.linux.dev
X-Gm-Message-State: AOJu0YyJCa4WHb3Q8sG1vsIo5JPbdYM87kbDaTDuYn5y2Hze20HRccVi
	/j2TQFCSiZe8AjIAsubjhoNGinZuQF+670YX5DbD6++KKDuCUqJl8VRDFBM7usUi/VM=
X-Gm-Gg: AeBDietHkfJQ4EbaGE/WTJeeN9pGnooHfEwxPztY7ycylQNbQeJZerEVE5HeuhzgNgk
	bEVOmJs3gw/UPmcxWWrqC58Ecg7FkFnGvswg49EmSSCb7c6DhqSqwxNYVXI2NyE6OcuRhcJZfJX
	wjxtr1ukW6DANYKMst8iAesLza2yi/WSonm7ao1ej/U8JlFDGP5ax2uif4UWvd+M0JMDPR2xO9N
	UhHJx51F+N8AZlrzJ2hbGLIeA4Ci6cGzUHGcxlP6eQO+Bq7aFacwW4e0xcyZaeabOLxWUpQ6fj7
	HGkGoxiXo9Xtm1DUSrdYFeVGmBN9IQEncan9EsBa27Ewtk1WhLLCI7FwHNYUAPHFLULimyaaZKJ
	VWRkWdaW1D8pOJPhgD63jmHdtGKlSdYcXEFAZNPbvVMfFDbHjgUcDdMLGDan+MjhX/LZFuvp6y8
	ooc097JZEWbw6C
X-Received: by 2002:a05:600c:820e:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-488997ee0bdmr201259725e9.30.1775499739953;
        Mon, 06 Apr 2026 11:22:19 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bab899fsm17026240e0c.5.2026.04.06.11.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:19 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Subject: [PATCH v4 00/10] selftests/bpf: Tolerate partial builds across
 kernel configs
Date: Mon, 06 Apr 2026 15:22:12 -0300
Message-Id: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANT502kC/4XOTW7CMBAF4Ksgr2vqvzi0q94DoWrijImrxkEeE
 1Gh3B0bNhES6vKN3nx6V0aYAhL73FxZwjlQmGIJ5m3D3ADxiDz0JTMllBVGSE746zNSJt6d/Pc
 YyE3RhyM3Tmv0jWtsD6x8nxL6cLnL+8Mj07n7QZcrVxsdEPIuQXRDPRWOR7zk9xEoY6qNIVCe0
 t993Cyr9P+OWXLBNaBRToBvrf+iM+HWTSOrM2a1ZvRrRhXGC9sKoXcCPvonRq8Z+5rRhWl2LUg
 pjbLarZhlWW7DHajzfwEAAA==
X-Change-ID: 20260401-selftests-bpf_misconfig-4c33ef5c56da
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=4943;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=SaQAAu0R4n5ZEcWB6xTQZwJd7/g3hGbip0D2H+lQ8i0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDHdBYBzdcN3tqFZ3uiwl8nruBkJatNyW9TwA6lWc7ka4FAUYXWKil81L3wR3W+Qy9BLMxUWT+6
 bBO8ZmLr98A4=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Currently the BPF selftests can only be built by using the minimum kernel
configuration defined in tools/testing/selftests/bpf/config*. This poses a
problem in distribution kernels that may have some of the flags disabled or
set as module. For example, we have been running the tests regularly in
openSUSE Tumbleweed [1] [2] but to work around this fact we created a
special package [3] that build the tests against an auxiliary vmlinux with
the BPF Kconfig. We keep a list of known issues that may happen due to,
amongst other things, configuration mismatches [4] [5].

The maintenance of this package is far from ideal, especially for
enterprise kernels. The goal of this series is to enable the common usecase
of running the following in any system:

```sh
make -C tools/testing/selftests install \
        SKIP_TARGETS= \
        TARGETS=bpf \
        O=/lib/modules/$(uname -r)/build
```

As an example, the following script targeting a minimal config can be used
for testing:

```sh
make defconfig
scripts/config --file .config \
               --enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
               --enable DEBUG_INFO_BTF \
               --enable BPF_SYSCALL \
               --enable BPF_JIT
make olddefconfig
make -j$(nproc)
make -j$(nproc) -C tools/testing/selftests SKIP_TARGETS= TARGETS=bpf install
```

This produces a test_progs binary with 579 subtests, against the total of
708. Many of them will still fail or be skipped at runtime due to lack of
symbols, but at least there will be a clear way of building the tests.

[1]: https://openqa.opensuse.org/tests/5811715
[2]: https://openqa.opensuse.org/tests/5811730
[3]: https://src.opensuse.org/rmarliere/kselftests
[4]: https://github.com/openSUSE/kernel-qe/blob/main/kselftests_known_issues.yaml
[5]: https://openqa.opensuse.org/tests/5811730/logfile?filename=run_kselftests-config_mismatches.txt

Assisted-by: {codex,claude}
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
Changes in v4:
- Drop the test_kmods kselftest module flow patch: lib.mk gen_mods_dir
  invokes $(MAKE) -C $(TEST_GEN_MODS_DIR) without forwarding
  RESOLVE_BTFIDS, breaking ASAN and GCC BPF CI builds (Makefile.modfinal
  cannot find resolve_btfids in the kbuild output tree)
- Link to v3:
  https://patch.msgid.link/20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com

Changes in v3:
- Split test_kmods patch into two: fix KDIR handling (O= passthrough,
  EXTRA_CFLAGS/EXTRA_LDFLAGS clearing) and wire into lib.mk via
  TEST_GEN_MODS_DIR
- Pass O= through to the kernel module build so artifacts land in the
  output tree, not the source tree
- Clear EXTRA_CFLAGS and EXTRA_LDFLAGS when invoking the kernel build to
  prevent host flags (e.g. -static) leaking into module compilation
- Replace the bespoke test_kmods pattern rule with lib.mk module
  infrastructure (TEST_GEN_MODS_DIR); lib.mk now drives build and clean
  lifecycle
- Make the .ko copy step resilient: emit SKIP instead of failing when a
  module is absent
- Expand the uprobe weak stub comment in bpf_cookie.c to explain why
  noinline is required
- Link to v2:
  https://patch.msgid.link/20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com

Changes in v2:
- Skip test_kmods build/clean when KDIR directory does not exist
- Use `Module.symvers` instead of `.config` for in-tree detection
- Fix skeleton order-only prereqs commit message
- Guard BTFIDS step when .test.o is absent
- Add `__weak stack_mprotect()` stubs in `bpf_cookie.c` and `iters.c`
- Link to v1:
  https://patch.msgid.link/20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com

---
Ricardo B. Marlière (10):
      selftests/bpf: Fix test_kmods KDIR to honor O= and distro kernels
      selftests/bpf: Tolerate BPF and skeleton generation failures
      selftests/bpf: Avoid rebuilds when running emit_tests
      selftests/bpf: Make skeleton headers order-only prerequisites of .test.d
      selftests/bpf: Tolerate test file compilation failures
      selftests/bpf: Allow test_progs to link with a partial object set
      selftests/bpf: Tolerate benchmark build failures
      selftests/bpf: Provide weak definitions for cross-test functions
      selftests/bpf: Skip tests whose objects were not built
      selftests/bpf: Tolerate missing files during install

 tools/testing/selftests/bpf/Makefile               | 113 ++++++++++++++-------
 .../testing/selftests/bpf/prog_tests/bpf_cookie.c  |  24 ++++-
 tools/testing/selftests/bpf/prog_tests/iters.c     |  10 +-
 tools/testing/selftests/bpf/test_kmods/Makefile    |  15 ++-
 tools/testing/selftests/bpf/test_progs.c           |   7 +-
 5 files changed, 120 insertions(+), 49 deletions(-)
---
base-commit: a1aa9ef47c299c5bbc30594d3c2f0589edf908e6
change-id: 20260401-selftests-bpf_misconfig-4c33ef5c56da

Best regards,
--  
Ricardo B. Marlière <rbm@suse.com>

