Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA53F1D5CF2
	for <llvm@lists.linux.dev>; Mon, 16 Dec 2024 23:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734390806; cv=none; b=awn/qbA/B3NWYuwCeIYSqffwt1JDMVOYMwq7tGvX2T9RnXI4vz0t2AJLAV5mji6mrEN0CyErgyp0urxdbvhHCc6VWJYSTlX0QwO+cfgndZtREeRBCUkWavcQ6VjZze7kBCUGqttADx0BEtDnu33rtysj2DTMgw0a/VvWx5ojfeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734390806; c=relaxed/simple;
	bh=IOgGM2w7pk3oigV1gqLUmR9Qqpa9O/Il6zfGw3fe3jI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TSN+UFXm70/AqGqWJNke860x79g6S7HRy/kCMZi4DQBkq7f+9W2R9NelPMyJGJ6B7LZMrogoW8OxdRuwTimVbOBcxXusAtHlQd5dG4c582XdSmw6T1qNa+F2W0uAipn3cpCSS6SnSHWv2wcNdEnNAIiUr8e5tzc49cR4hZqRk9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=AxAkJ+YO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="AxAkJ+YO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21631789fcdso37226705ad.1
        for <llvm@lists.linux.dev>; Mon, 16 Dec 2024 15:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734390804; x=1734995604; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Cbp0zEgt8sYGgGttOagenj605vUWFx5sipZ2Yl2U3s=;
        b=AxAkJ+YONMptC9u8flEaPgOWt4GKrApU5gusgT6tKyRl5aGlC0uSKKQKjDgPgKAHQL
         hju5kgpjJ6XJUVMIDn0H/4nC7zMZt6s6HDknQu9EWYyfoEVmPDWaS/UGcvrUq672WWBi
         7zQevT4kCxIG5GaJyalsapebM1rdX09hzOsE/kvaYVfVDBGIKvjyKt4ERlcvvfLIptx1
         b0IBAyiPx+YqvJvjoEKaCaPNK+f+Z833B+qW1e/oO0S9s5Bw1AsZA0dvxyGtDEd7ABMw
         pmNMtiskzQtBbBsdAlFUxabJNE1OJ3SzqGLEm8UX8Jt+N2ylwwywGXT+SerRVyJDabCW
         0Ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734390804; x=1734995604;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Cbp0zEgt8sYGgGttOagenj605vUWFx5sipZ2Yl2U3s=;
        b=nCEAY2XXp23pcPf85PHcX4vJMfO6rF/aot+bU+E9hVUkeKgSASnPcnwmSKGKPJb6wO
         VztLc62AKug8envNAOa/LxMvOz2tQ+6CgZUwmwSK60qENhKknB/JU9NghYJmsa5bgJ8G
         pkIu0ysokBogQToITH7qtYRV6eWu9qyBQ0/ZU2LuIinCAcp2irFxALFqbtotHAN5kUSx
         +26OoHbqyN+ib5mha9ahGSFPT84OxoWBkG70fSbFChu+u56tv7IK/eLAGevSxkbbbVPJ
         tvEILHDa2trCLHShnN6gG0m3pbQ0JfCDvhyFLFYTN+h7PXEALKLfLaWNJ1ax6jUvE8I0
         Dhag==
X-Forwarded-Encrypted: i=1; AJvYcCWFyZfPj+z5yeHEKfU3n95T6/i/gzshfEF3mq6CdmYgxC4T2ByIIFjI4W958Rb5K7iTuTez@lists.linux.dev
X-Gm-Message-State: AOJu0YxljGPinbdsFBUCLTE929oysRZddsfCkXpy4mJR3ho6xD2I6OzU
	83BOEIhpcwGn5vDkFp2zHZGJ41sd+KZwSE4dDhwEa9YYNKi6UYkLJmTRacwbkL8=
X-Gm-Gg: ASbGnct88X9QpTopGQn66kVecXSjo79NDVjq1MHTGsLLvGvrWbwyyiST8t74FyJ7aiS
	TXBndYl6juM6w3KXvIhpKqsiF4a4n4hG9pJ9azWZdwPDzPhjYaGRH6+VG2ZJ+lQcSFY4juh4Z3v
	DuitRFPBh3XUXAUW6CffQSlIaryqZdUN8UonOFJi5VyaF9WV6BrKgqXn/ZEvuV6feCzP2h63L0A
	kgO/YQy+Yk/+ivOMHgWBH39Z3Ga9yOJNYmxvZnhsICf5wqBv1+Hal2Fio8KVlJgssT4M4x1
X-Google-Smtp-Source: AGHT+IFjshciKlmIzBIB1jw3LAR8ZYMAQPyyhOAHw8JXPxmnDCkeL3I1RpqctkebF7xjVj+9QrljiQ==
X-Received: by 2002:a17:902:e94d:b0:215:b18d:ca with SMTP id d9443c01a7336-218c9262d3fmr19286865ad.18.1734390804203;
        Mon, 16 Dec 2024 15:13:24 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcc47bsm48333255ad.63.2024.12.16.15.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 15:13:23 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] perf: tests: Fix object code reading test for riscv
Date: Mon, 16 Dec 2024 15:12:50 -0800
Message-Id: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPKzYGcC/x3MQQqAIBBA0avErBNyLIiuEiFqY00LixEikO6et
 Hzw+QUyCVOGqSkgdHPmM1XotoGwu7SR4rUasMNeozbqIok28mOFc7jt6Q8r5FZOmwrOxw49mTA
 OUAeXUA3/+by87wdZlscZbAAAAA==
X-Change-ID: 20241213-perf_fix_riscv_obj_reading-cabf02be3c85
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Nelson Chu <nelson@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=IOgGM2w7pk3oigV1gqLUmR9Qqpa9O/Il6zfGw3fe3jI=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rCFo5+3e1tQisqpS6cac/wyM1MmJaWySK9PGtBBvOv0
 6Xbun91lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMBG+LEaGb7e2ZHT+jXg/4T8D
 c2X1sxcK2mW1O46Jy13fG73kPPv5XEaGxZM1Cxg2/bUOU7Tlnu+i9MlYSu3ZjWSraXInZx/vuze
 VAwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

There was a breaking change to binutils objdump that causes partial
instructions to no longer be dumped. This behavior is different from
what the "Object code reading" test expects. Add a Kconfig variable that
checks the version of objdump and conditionally enables the perf test
fix for riscv objdump versions effected by this issue.

A binutils patch has been sent as well to fix this in objdump [1].

Link:
https://sourceware.org/pipermail/binutils/2024-December/138139.html [1]

To: 

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      kbuild: Check version of objdump
      tools: perf: tests: Fix code reading for riscv

 arch/riscv/Kconfig              |  5 +++
 init/Kconfig                    | 10 ++++++
 scripts/Kconfig.include         |  6 ++++
 scripts/objdump-version.sh      | 69 +++++++++++++++++++++++++++++++++++++++++
 tools/perf/tests/code-reading.c | 17 +++++++++-
 5 files changed, 106 insertions(+), 1 deletion(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241213-perf_fix_riscv_obj_reading-cabf02be3c85
-- 
- Charlie

