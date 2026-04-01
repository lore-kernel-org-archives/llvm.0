Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B15A4035D0
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 16:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060136; cv=none; b=TalI71fBYCwUSizAyb6pg5MxBHssPff1zsx5v9QsardItH0Xk9FZRx+daXjcK3q2esm5km74+Q2fmbC9NzSpfLHzmgOVTYZnAIGhx7OqcodwqWuEPjV1yqWUFJoEOLSLdmXonm2At+EkuqR+iUrDJ7/EooTVno46nGeMdIWm8IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060136; c=relaxed/simple;
	bh=39Oa2loJA7hp7uvZHKhwdxu0ZLV6qyUTOt1cn55M7w0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qXYAGjpTtU6C1PjowxDxBkSoYR/bUJrqOhVf/qZkYYL61MYjcWhgAsgjlmu10VyIyHeTmCEQB5I3DSlHBsW3CaEupJuhIUvWxwNT3dKJ4n/WgTYgr00mz1gZaDpNepVVoiOtd8muaqhPp/xw5dOwXIe01m+cmQmjBBdd9Ljs6y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UVvRN9Y5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UVvRN9Y5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483487335c2so76452305e9.2
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060133; x=1775664933; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVrOnlJE4y/6fgO3OqR7CiW+cGL6Q90xMJNV21DISQY=;
        b=UVvRN9Y55hoEFK+LWY1Ds28wy1cqEPaLf6eMmjt2WOAsxcpCFgvwdYIJBeMQEqNcSO
         WvhqcoC2Z1NLQHQWOxaVuzqN6CLrPJU9NMGZzpsxtWkp+V+ViFX/81rSeGgSQfOXMIMc
         cHELEdI6d3sjQX6WEs0Y2B8yRbOcTTqTAVPgLvFGPMV8ypliNv9R9FLcTrUVdOv3/ej0
         z5zEBQ3AsuR0ABlB1QFZ+XWVU9ksWQ3FaF8KOAjOXVbqkuAzufU/gFxa5mAgzD53DuZw
         oU74r+nZOYGWBxw+pB6Y3EuOWJcwe766IcsbOPv0sV7XNP05YP4+URr8RmX1Xw86FWj7
         XWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060133; x=1775664933;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVrOnlJE4y/6fgO3OqR7CiW+cGL6Q90xMJNV21DISQY=;
        b=DCG9hJl0aFYRP9j9HvMdBddUIB4GswOx4Bk3KqDZ0dRlLkW16FPoysb3Tc+0EARELb
         N01uCmkU6dOecgyLiUYiysv6NKp+D5/96ieoBcGx86S3dWoKpOQZnpc9VzWPfz9BNgOu
         bQKwAXu9F96nC+IAlmk2mnUouI8uB5sHxnu/RkXzOi1+d9L6EdyAmArms8B2f3IGnxCa
         AA2w8ZKd027ubXpUWYb74bcFjQllHDtTUgdQ5m2BigAKp08a0z/bICrM6TIrIe5saDLk
         kVTRcbJPDWnb69fx8Egw2Id/oN7fZ3QEaB4gTL6ZFP+jf+s4mOeTCur9JkfoNBwnCP13
         DZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcpoXB575VjfL/BVXu1S128o5zUp12sGGll9USvIs2MPS2/o/ADd5hDaisbxO+o5WlDfW0@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr4DXSlzMgkWBz0+eChDSpYG4rW6RUikXTMl1Y6LzPvQ5QWGkn
	uVsLUofYuZk19Otap3Agq9M1SeLb5Ma7fxAfjjuR4T0Lxi5OTA32dNUANNS1jdDtYkXtaZEn2SV
	fqf494vk=
X-Gm-Gg: ATEYQzwWbLHYl707a2zsZy69H2e7ugPNvYmvEXGRTnOytPQZ3SBdiOYe2+KtHfDkebb
	OBwupSlpmT0h6rLcdpwQAKrpdsw1kGBOFteei73HTQKP4UKBgMen1p863VMg6RvohOQYT8vcGCn
	+UIQ+Jq0ZGvfiIiZ9ORM//gjPDXqvFhgZyAXF8kQvB1oBvMDgzE6acHDWwMxavu0coM89uQziFy
	uqdEprJAlHTVyT76+4XFiTpiSQR0i2h55r7ZB09U3s5i3Xnp+RdRcZnTbKMf2RCUWnKPy8LXuTp
	ojqmsLPcC/TTtVgBrF80KfQUUxTH+PeeHnSiKuBUqUnDXDKiN5cGe8sybVI5ym824snqGfSqyyD
	yzkjL0ztkY+XwAG38iqXQeYsXwmtzr7g8rKbteJTVIZn5Ex+ciZM1pp51CdwW090q/ElpgpYuzH
	JxN2IJrj1Y
X-Received: by 2002:a05:600c:8b08:b0:485:3f1c:d897 with SMTP id 5b1f17b1804b1-48883572159mr70556245e9.9.1775060132990;
        Wed, 01 Apr 2026 09:15:32 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba81b53sm13782e0c.4.2026.04.01.09.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:31 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Subject: [PATCH 00/10] selftests/bpf: Tolerate partial builds across kernel
 configs
Date: Wed, 01 Apr 2026 13:15:07 -0300
Message-Id: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAItEzWkC/yWMSw6DMAwFr4K8rtXwXfQqVYUS44CrElCcVkiIu
 ze0y3l6MzsoR2GFW7FD5I+oLCFDeSmAJhtGRhkyQ2WqzjSmROWXT6xJ0a2+n0VpCV5GbKiu2bf
 UdoOFbK+RvWy/8v3xZ327J1M6c+fDWWV00QaazinnMPCWrrPVxBGO4ws6B3YEnQAAAA==
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=3207;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=39Oa2loJA7hp7uvZHKhwdxu0ZLV6qyUTOt1cn55M7w0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QE5dIUSreOCoDYxhzPTEq3DJLb2+vGdSKNAVzISqlkYZVoHLRq6mwXKx0oQ44AaKNqx2hIvqJzb
 LJUWjO0NHigw=
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
Ricardo B. Marlière (10):
      selftests/bpf: Fall back to distro build directory for test_kmods
      selftests/bpf: Tolerate BPF and skeleton generation failures
      selftests/bpf: Avoid rebuilds when running emit_tests
      selftests/bpf: Make skeleton headers order-only prerequisites of .test.d
      selftests/bpf: Tolerate test file compilation failures
      selftests/bpf: Allow test_progs to link with a partial object set
      selftests/bpf: Tolerate benchmark build failures
      selftests/bpf: Provide weak definitions for cross-test uprobe functions
      selftests/bpf: Skip tests whose objects were not built
      selftests/bpf: Tolerate missing files during install

 tools/testing/selftests/bpf/Makefile               | 107 ++++++++++++++-------
 .../testing/selftests/bpf/prog_tests/bpf_cookie.c  |  11 ++-
 tools/testing/selftests/bpf/test_kmods/Makefile    |   6 +-
 tools/testing/selftests/bpf/test_progs.c           |   7 +-
 4 files changed, 88 insertions(+), 43 deletions(-)
---
base-commit: 0eeb0094ba0321f0927806857b5f01c1577bc245
change-id: 20260401-selftests-bpf_misconfig-4c33ef5c56da

Best regards,
--  
Ricardo B. Marlière <rbm@suse.com>

