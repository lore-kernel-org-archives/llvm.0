Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ACE139D
	for <llvm@lists.linux.dev>; Wed,  3 Jul 2024 01:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719971699; cv=none; b=owQ7UgjoSlLDpHc5lDJQHBsMSgjA6qQpdSk2JameAS5lQCgSK+eleoAJzZqU3WXu6xaGwuAMMfotHYuwXIkPmk/422QvscjhLWU4ngg2BDqLL1I9U5kRCMesMRFZ4haNHV90mJ6+oHLLubWA4v1qtV0Q48eyMBTjeExgk4MFa0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719971699; c=relaxed/simple;
	bh=p1H3bMXP1kaxiJKEHWQp3wxLk1lndgbgCIxUehTD7eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C2zvyCt9MHci5F0fESSH8Eu6Ml+ZIjxlOAcd67Hxq1plPvi8N4l7no/LcHkJw7k1Vm9gqrz8ZHG++WxsZKUa+xL2R2yIZwkR129hOGEAwGOHnSh+SBaa1T+3sHP/zDAAlI/ozn8bnerP8wGO1Jp6hK6UgD1m0JRpq4zPoAjTm6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Pgq0Uetu; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Pgq0Uetu"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-718b714d362so2729325a12.0
        for <llvm@lists.linux.dev>; Tue, 02 Jul 2024 18:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719971696; x=1720576496; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHnHE2GTnxtpKeQVqGKu23WsWDVRXJprmZQx/8LwZ9Y=;
        b=Pgq0Uetuods8uncJP/B5lbkpJ/Erd2BZC/4hBNYvnYlxxaAMSNz+4yqTTktetz67ZT
         kgQP05cjywZHd6R6fiMfbSEwtf5TmafrzcsByrTqeW/biJYPnF/nUhgbGcUJgvcvq7Yc
         xjT8qgBzV+tnLBokJT2rvIOl5UlBEVgm5pKSyIX/pqoy2+Gz7k/nt+vfxiUdX8Vyg2Vk
         nm21JVI0Nxl+ghogAgP2VA/fyLQT3u8vmWCnRBU9dNgx8hg0aJ6XhhvcPNGP3Z4Bn/2o
         LkBGsZz9Y/WcruRIoad6jeyk5/hYLBi4wVoY0QkUWfjmY3MN6WclMqDFPj+bZ0nZQzq6
         rWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719971696; x=1720576496;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHnHE2GTnxtpKeQVqGKu23WsWDVRXJprmZQx/8LwZ9Y=;
        b=fBKrwoKmBJFr/MxPlMcJqT2upY0T9ah+HxZp1z/yRgj47c3wBngHcYxxomkzc3ATKW
         47C3hRNeml/4rU68NhkPAsFsi0rdgmg5DEiAo4pCNiduIfk2hc40vArHF0VgUKRyu4SH
         FMjsHuNVC7jyKo6jmPeMG60AyGEuCnNsRC4GrE/eUMwWNRCOVkcVJC160OH89pBcC1Zx
         whuO4t/MkHYJiTXxyF1KZKU9HlacCn2pA2iYHcGsTjEGPRDvpWt/xSuiwGu3osLx25As
         M2aeIyyAnIAC2n6PldT3gFlDLt29Y4UR0/DdVHdMJuHOJKpniUpmsLt9jPLcs0ZTF4ph
         oxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUduPeVjqH4vrSHq1eyS0DenHU5gsHV6wzRVQMrk5y4IEqrhfpvSyv93svxuTMNcO7kW1uuGjecDbR7UeGEILta75xMdg==
X-Gm-Message-State: AOJu0YzTfFYJE747aRS9aXuIfUX8s9jrsyhq1ZJgmLUPJL6Mxvmt1ZBm
	mFa2rH1rfAymkBcWOxGGTFPVKHJMMQzzIDXA5QJS9UrCJGbzeZD2EXAXD0wwfGk=
X-Google-Smtp-Source: AGHT+IHVaTNrEQj0UhlgCk9T6SwsM+7KULs8BJil9oMO9HLDbJD9EPjpJtrlGWIGB2o/chZZ3qmuiQ==
X-Received: by 2002:a05:6a20:8922:b0:1bd:d7:6942 with SMTP id adf61e73a8af0-1bef627701amr7103130637.60.1719971695758;
        Tue, 02 Jul 2024 18:54:55 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac11d8a70sm90881235ad.118.2024.07.02.18.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 18:54:55 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 18:54:48 -0700
Subject: [PATCH] riscv: selftests: Fix vsetivli args for clang
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-fix_sigreturn_test-v1-1-485f88a80612@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAGevhGYC/x2MQQqAIBAAvxJ7TtAKjb4SIZGb7cVi1yKI/p50H
 JiZBwSZUGCoHmC8SGhPBUxdwbLNKaKiUBga3XTaaaNWur1QZMwnJ59RsupccNq289KjhRIejMX
 6p+P0vh+S2H4YZAAAAA==
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Chiu <andy.chiu@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719971694; l=1692;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=p1H3bMXP1kaxiJKEHWQp3wxLk1lndgbgCIxUehTD7eM=;
 b=THxzHTU66KhNxRU98J3d0MKiSdJbtlJEQVuKgH/hJ0MUkrz504ey4G+CHt1Zj7NvRbhmk2SXm
 6JUG+aLMJ25AzycCjlzsfdAzISKI0z2xA994yPLwJ3CwbrrRrvPdDZ2
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Clang does not support implicit LMUL in the vset* instruction sequences.
Introduce an explicit LMUL in the vsetivli instruction.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 9d5328eeb185 ("riscv: selftests: Add signal handling vector tests")
---
There is one more error that occurs when the test cases for riscv are
compiled with llvm:

ld.lld: error: undefined symbol: putchar
>>> referenced by crt.h:69 (./../../../../include/nolibc/crt.h:69)
>>>               /tmp/v_initval_nolibc-5b14c8.o:(dump)
>>> referenced by crt.h:67 (./../../../../include/nolibc/crt.h:67)
>>>               /tmp/v_initval_nolibc-5b14c8.o:(dump)

This is fixed in my rework of the vector tests in a different series [1]

Link: https://patchwork.kernel.org/project/linux-riscv/patch/20240619-xtheadvector-v3-12-bff39eb9668e@rivosinc.com/ [1]
---
 tools/testing/selftests/riscv/sigreturn/sigreturn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/sigreturn/sigreturn.c b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
index 62397d5934f1..ed351a1cb917 100644
--- a/tools/testing/selftests/riscv/sigreturn/sigreturn.c
+++ b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
@@ -51,7 +51,7 @@ static int vector_sigreturn(int data, void (*handler)(int, siginfo_t *, void *))
 
 	asm(".option push				\n\
 		.option		arch, +v		\n\
-		vsetivli	x0, 1, e32, ta, ma	\n\
+		vsetivli	x0, 1, e32, m1, ta, ma	\n\
 		vmv.s.x		v0, %1			\n\
 		# Generate SIGSEGV			\n\
 		lw		a0, 0(x0)		\n\

---
base-commit: f2661062f16b2de5d7b6a5c42a9a5c96326b8454
change-id: 20240701-fix_sigreturn_test-47d7063ac8e6
-- 
- Charlie

