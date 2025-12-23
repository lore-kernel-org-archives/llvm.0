Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C78723EA97
	for <llvm@lists.linux.dev>; Tue, 23 Dec 2025 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766479439; cv=none; b=e9yvM+z+PqHv47LpgdEb37iaJvVIBZFgS3pNnw+fRkGkeEv747zG5M26N5Ucb9SbTc/XmOGv2IQW9sW7bf3hl4FN2IRDr1JVTQQJp6Aq8/r5NY/g7XpLMuSUZ1gEGKzKmTb+63e6nfTfp/lp7xuSbydAqorB/tFYPl7DFhCLv20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766479439; c=relaxed/simple;
	bh=VyBd1eV+gELd/rR0R+vBYOgANcizKnzDQ9kVhpk1qqQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rr+bKwRlCPDo9kIzI2o/hjTmeC3Z6SGONSUALDbUdzWf+6yjrxEVA/WG9sF+E/R2u8C5axP2ePS9IWyQIJE67CoPd7FnyBeHzpZPiIN+02WmAN7UOdd/bm5E56Uh4v4MHZYBlfTmFZ2Y+y2C0snojYS4JPpLdyMPCjx1+EE3fiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZfyP0Vj; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZfyP0Vj"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-11b6bc976d6so8375388c88.0
        for <llvm@lists.linux.dev>; Tue, 23 Dec 2025 00:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766479437; x=1767084237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/WvLrPfewTaP7n/Uh0KhRCzVSKciyi4EIRaB65WMUJA=;
        b=gZfyP0Vj3tiprsJsJNvi4bsfahaMizf3xeI8h35SxFrsuqdG9P9Vx5skzfcqEGYrtU
         6pQNARgtTiTmvMvboJJXfmU/T/fTTGww1BIZUFqUCDoGoR3YjyOmkBjL832ICrZnQIyU
         fJoIgO9l+njSgAKKig8KN7Pe2BqLH5yl+0ty4Mb1XUraMno9En+PCagyXioN+Am4RNPG
         T2q2cIvG2Ba/1Ysq5inaAFYHOgS3tK6rORNDTTvRvLQlNvo/Q7cRfsM68Ge49NoLLg59
         5GZfPQhgUFy4/9eNvf4Q2KkCeqGQ7HEmt4u/L3a3ex6/TZb/aldeGMbPO1JBmvj0kMWM
         UHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766479437; x=1767084237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WvLrPfewTaP7n/Uh0KhRCzVSKciyi4EIRaB65WMUJA=;
        b=JWVW7WNu65d7Dmp2BMsXL5HLsViana4bG4OmUQ06rc2xr45UJpEBNotk+fS3vPByzm
         rEW2t0F8FcN8MXjUAMPigphDN5nCI9GoDUuYpT+WJGJPfBTxzxoVfpYYguUKJfkikNjV
         fLfNTjYIInutCM1w5ak5yDl0P/Um7dxCB2YIt+J3v9t2Up20ZxJbUTqJJhhNB+ghAO8g
         cdcwic/vkgiUnzEz12scNplz/34ebLOaGUpKbHZgIxPZVUnNMv/y82ed5LYZgyeCVSTm
         9FRR/vI5rKLjP45Mydd3i46sL1XnxbmvgWbLpDkNPdF38ZRg2npNcuEWCzFugnfJqbeD
         yw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8tP0hWN4l0fHCy9T7YH5CIaMZbFZi0nGUGrtEJ3UeN3WVGFksCrWnJK5bTi2Kup4y48Ki@lists.linux.dev
X-Gm-Message-State: AOJu0YyAAOHFQ3HEDx33NIA6x1AEEpJqOSR70YKj2LmMdH3OdpUt8QtI
	iWybHftCSDwBDALfS3BlRu1euDVxw1CGGHG/ZXuFWN6REpdiGEN47DfT
X-Gm-Gg: AY/fxX7WNKCRjUqj6Lf1/nincyG7dOXk6jPI7kACDsBnBNmGLZRSJ+Dy6L5f2ce9euO
	bDpVlsp25HbRE4XtrT6ITsnvFCxwKi9r1j8NvLa6uDBxpdiHAZbBNMKQeruac2mD6HreyjrK2ZZ
	ATE22+Lw06byfeJxPdZfCkSonEjDa9mdPG2HbKov+17TljUzjckaGNrvpwwegJ+AkiOtHC4+lJ4
	v9Wx9/0yMHr4Fbp3S8UcszHRvBfPVyLVdxF0I52T75gwBHDkWaXVUjvWTOEj0Qvo7TwfVJ3dIWF
	h31Xf9vSktvs1USOME5ijdYuiKpkRNhpZpqISfKSS46xApgaQMsa7Yu/1NMLXoUpjzWKVpGSkG7
	YQuks05nY7Dk7+Ivw2E8Yg0BqmSYPNZBJQXIYvvptekj11hkafcgJye+XLo/EqZNe07C35NMvE/
	AkKgvtQdu7ulmkO16i5mVdK/oFEbfeRI/UWxEy
X-Google-Smtp-Source: AGHT+IF8M5el/p3S+HSb7uaDOqzLo07M4mW5NEfYL68wEvjV4FhIdackjxmYl2T9yCatLWm/tFAGIw==
X-Received: by 2002:a05:7022:504:b0:119:e569:f873 with SMTP id a92af1059eb24-12171aca67dmr13491735c88.16.1766479436980;
        Tue, 23 Dec 2025 00:43:56 -0800 (PST)
Received: from HUC.. ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254c734sm56720887c88.13.2025.12.23.00.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 00:43:56 -0800 (PST)
From: hupu <hupu.gm@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	hupu.gm@gmail.com
Subject: [RFC 0/2] perf build: Improve header handling for BPF skeleton cross-builds
Date: Tue, 23 Dec 2025 16:43:33 +0800
Message-ID: <20251223084337.3789-1-hupu.gm@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


I am currently cross-compiling perf for ARM64. During the build of the
eBPF skeleton (compiled by Clang), the build fails due to missing header
files. The error message is as follows:

/usr/include/linux/ioctl.h:5:10: fatal error: 'asm/ioctl.h' file not
found
    5 | #include <asm/ioctl.h>
      |          ^~~~~~~~~~~~~

Leo suggested resolving this issue by installing the following packages
on the host:

  $ sudo apt-get install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
  $ sudo apt-get install libc6-dev-aarch64-cross linux-libc-dev-aarch64-cross
  $ sudo apt-get install libc6-dev-arm64-cross linux-libc-dev-arm64-cross

With these packages installed, the required header files can be found in
the following host paths (defined by the CLANG_SYS_INCLUDES variable),
and perf can indeed be built successfully:

  *** Makefile.perf:1203: ***
  CLANG_SYS_INCLUDES=-idirafter /usr/lib/llvm-18/lib/clang/18/include
  -idirafter /usr/local/include
  -idirafter /usr/bin/../lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/include
  -idirafter /usr/include/aarch64-linux-gnu
  -idirafter /usr/include

However, I do not believe that relying on the host build environment is
the best approach, for several reasons:

a) These commands install UAPI header files on the host, especially
`linux-libc-dev-aarch64-cross` and `linux-libc-dev-arm64-cross`. These
headers originate from the kernel source tree’s `include/uapi/` and
`arch/arm64/include/uapi/` directories, and their versions are tied to
the *HOST* kernel version. If the target kernel version is different,
mismatches may cause compilation errors or even runtime failures.

b) Even if `perf` can be compiled and run successfully now, there is
no guarantee that the kernel source headers will always match the
host-installed UAPI headers as the upstream kernel evolves.

c) In scenarios where the host acts as a general build server and
needs to build multiple target kernel versions, it is not possible to
ensure that the host UAPI headers are compatible with all target
versions.

d) On the other hand, `CLANG_SYS_INCLUDES` does include host headers,
but it uses `-idirafter` instead of `-I`. This means the host headers
have lower priority. This change was introduced in commit a2af0f6b8ef7
("perf build: Add system include paths to BPF builds"); as noted in
the commit message, the preferred approach is to use kernel source
headers rather than potentially older ones from the system.


Therefore, although installing the corresponding packages on the host
can resolve the immediate build issue, I do not think this should be
considered the only solution, nor should it have the highest priority.

Instead, I think the header search order should be as follows.

- Prefer kernel source headers
  [RFC 2/2] perf build: Prefer kernel source headers for BPF skeletons
  With this approach, even as the kernel version evolves, the headers
  used during the build will always match the target kernel version.

- Allow users to specify header search paths matching the target kernel
  version (eg. via `EXTRA_BPF_FLAGS`)
  [RFC 1/2] perf build: Allow passing extra Clang flags via EXTRA_BPF_FLAGS
  With this approach, users can explicitly specify the appropriate
  header search paths via EXTRA_BPF_FLAGS.

- Fall back to the host build environment only if necessary
  Reliance on the host build environment should be the last resort.

In summary, while relying on the host build environment can address the
current build issue, I believe it is not the optimal solution.

hupu (2):
  perf build: Allow passing extra Clang flags via EXTRA_BPF_FLAGS
  perf build: Prefer kernel source headers for BPF skeletons

 tools/perf/Makefile.perf | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

-- 
2.43.0

