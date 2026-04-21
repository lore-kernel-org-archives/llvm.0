Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3101138F635
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773415; cv=none; b=vCXHcBcRftF+y+QoOAm/fxy/SSjcS33tK2q3eWyWjUPc9RUoG2Bv5Rb4pt1WM0Ci/2JkSYnvRmmhJZpyZx46195LM4l9p/iGYsSGBzzKRoWSiJD5R/3VQuOHWjmCIX9QyxFzSa8tUTUk+9xX00nFZKheZUifgcqxgPEcKRMNTS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773415; c=relaxed/simple;
	bh=G+7npAxWSqcEL97/LfgOxKQnSNWCZCNbCO7e2cHdvoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EtDLLNhJml9aomHVJdFGDRclfHvS6+Ac6On53MFC3dAtM6OAZUPoL+hp8Ggdio/Sz4wMTpeHfSMvAlomrZVbEilwUZ/E63ljiPUumt/FJfsmm4IZ+v0112bzSlvlPxEs3CASDpXJTr6zf02cxrO9QxEK5EIPseWNuXWOYh5VV+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKhgjYsa; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKhgjYsa"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35d95017a68so2708642a91.3
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 05:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773412; x=1777378212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mYvELhLaqGtSokpfPVRkmugugq4w5jY0uoduoY+P08E=;
        b=EKhgjYsaciYefbJ2fmrMlF0q7rBRte9l3Oz/ixM5iSzM9j6Yi+TBg1trM0qRB0/tQR
         Q7hikXR3g2atNdGUfpc/7z30SWHEEoovvM7fvDA6suN4kxAbh3TeNRWWofl6vT3AM5ku
         Jdh1Yutid6Op99gdEGhfpPh1mziF8pWmI0eA9MwScQAbtgw06SmT6Kj6udIstu4lWa/6
         WxctS1VC1Sl0MZzQW7wqbZuxR6j+Pi1zr59AWMKpHiG800v19feF/Jhb30s5fT2Y9eE0
         yhB1+f3WwScqCgm3rNLmY/MhTStlR+2x074FfMfsA/Z7fiME1Rs94/GFlmvuhMvmPAdM
         +v/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773412; x=1777378212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYvELhLaqGtSokpfPVRkmugugq4w5jY0uoduoY+P08E=;
        b=WAvfL893h8S3I6AkDrEDymVCLOo6juXpr6oNL5tVzOrI5IeBdx1xiM37K9mjJ1gJoR
         Y+6YF0AJGI/vnfJZdipkflhpU+nel5J5+d1tELBZXNjWP+2Zo+aHBqWJlz3oa4jPsWal
         MSVUi1cdgJm2RwkAKpseybSrgMb/7vUgNAvt1Ot0jkapOe1rJyGgqMPZdCyJwKnagqis
         ymJhcs69CadOYDSJO35jHPjsfozt59IfK4yFQDfvo///1t8XVYzYjmiPxcSq5AEwte3L
         hot7SFfzQxOYrTRUxqoNv7lBmNCOByRf/7cF9DttLxmaR4k8n/1xqlwsXS0/PfBkjDp/
         nYHw==
X-Forwarded-Encrypted: i=1; AFNElJ9qWREvy67Q0QIDqOWKlI2KPN1OalSPQZjMrOYV0GLcgwD37XPMIjje8juvz2FwHB2k6EXz@lists.linux.dev
X-Gm-Message-State: AOJu0YygsDGGVSdZX8mWEGUT3kaEzNNJJfuJmcMq5QPMiR0TRA2GfdM1
	xgOK9JzXL8mkIsmAZvQn93Pv/OiLzR+kJLmfUO/NpfRyaQDIEqeAD/2d
X-Gm-Gg: AeBDieu/rnErOWj66/yyArAhBdQpsqpGa3YuerhyGszniFiWh/dW3BbXSlRVTLmafq1
	ZLB25CkBUQ4N8Q8X4cvTr81GmHPmULZmky7QSlM019fM3wwWcV18vVfPzn9Se87IgBJn8h7jONI
	MDqZLVoD1bQP7Mo1iW2AGwdtz5z9EF1qgQJmAQ5JWoxJqRr10PlyBQS2a9+dB0y7CsvWRWqq+0i
	9dIQvasu41fJn5+mZtEGIh4thEdiXIhgEBJMHOdNPlztI90GulgSRsnfFMFLdYguRoowyDq0GmY
	prBCnYRegfadzdY3PW1zgnRliYgJFgn/oPVOXGSxaRrT9k8IChEmEqDwx67FLbQjs3cG6U1cRP1
	GvVKx+SJgpsqqMOdjlMYgxs7H8XEuFPgJMgY3pWULbgOWla5mlh+90P5lV3ss1Zi5ZIprgGZ6dn
	QabUQxcqKAdhVYpYBgirMREylkXymYT18bJNR1jNj4glAExbIpRpRMygB3FfWBbPF8UGQV0Fw11
	CS5oc51WClELbM=
X-Received: by 2002:a17:90b:384e:b0:35b:952c:43b9 with SMTP id 98e67ed59e1d1-3614040b2c7mr18545775a91.10.1776773412415;
        Tue, 21 Apr 2026 05:10:12 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701d9bfsm10045274a12.16.2026.04.21.05.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:10:11 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V12 0/4] Rust support for powerpc
Date: Tue, 21 Apr 2026 17:39:54 +0530
Message-ID: <20260421120958.190430-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable experimental rust support for ppc64le and ppc32be. The patch for
ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
merged over it. ppc32 needs some toolchain fixes mentioned in the patch
`rust: Add PowerPC support` and the discussion for that is done here[1].

This has been tested on
- powernv9 hardware
- pseries P11 hardware
- pseries(9, 10) qemu
- powernv(9, 10) qemu
- rustdoc on x86 and powerpc64le
- rusttest on x86 and powerpc64le

We are actively working with our LLVM team to get the target for ppc,
ppc64 and ppc64le in the rust compiler.


[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V11 -> V12:
- Rebased to mainline (rust/Makefile conflict resolved)
V11: https://lore.kernel.org/all/20260417152253.2312961-1-mkchauras@gmail.com/

V10 -> V11:
- Updated `rust/Makefile`
- Not all libraries are move to `rust/host` directory now. Only
  proc_macro2, quote and syn are moved
- Special handling for pin init is added. Details in commit
- Removed mkdir for `rust/host`, this is now handled by toolchain.
V10: https://lore.kernel.org/all/20260406200149.3727922-1-mkchauras@gmail.com/

V9 -> V10:
- rust/Makefile updated with review comments from Miguel
- Patch 1/4 updated with commit message and subject
V9: https://lore.kernel.org/all/20260404121610.1956528-1-mkchauras@gmail.com/

V8 -> V9:
- rust/Makefile updated with a directory instead of abspath
V8: https://lore.kernel.org/all/20260403145308.1042622-1-mkchauras@gmail.com/

V7 -> V8:
- rust/Makefile updated to separate host libraries from target
V7: https://lore.kernel.org/all/20260329160254.2592207-1-mkchauras@gmail.com/

Changelog:
V6 -> V7:
- Documentation removed as powerpc is still under development
- Added a fix for race condition in rust/Makefile
V6: https://lore.kernel.org/all/20260210090023.2587534-1-mkchauras@gmail.com

V5 -> V6:
- Added a missing Tested by from Venkat which got missed since V3
- Support is marked as Maintained instead of experimental
V5: https://lore.kernel.org/all/20260210053756.2088302-1-mkchauras@gmail.com

V4 -> V5:
- Removed a nested ifdef from PPC64 for Little endian toolchain
V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com

V3 -> V4:
- Co-developed-by header added in patch 1
V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com

V2 -> V3:
- Splited HAVE_RUST in 2 lines
- BINDGEN_TARGET_powerpc initialized before assigning the same to
  BINDGEN_TARGET
V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com

V1 -> V2:
- jump label fix for rust has been moved to a separate patch
- PPC32 support has been taken
- rust support has been marked experimental
- target.json dependency has been removed
- HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64

Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (3):
  rust: Fix "multiple candidates for rmeta dependency core" error
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  7 ++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++------
 rust/Makefile                         | 48 +++++++++++++++++----------
 4 files changed, 52 insertions(+), 28 deletions(-)

-- 
2.53.0

