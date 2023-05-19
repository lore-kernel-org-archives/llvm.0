Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8795510942
	for <llvm@lists.linux.dev>; Fri, 19 May 2023 14:48:24 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-96f6e83e12fso99176466b.1
        for <llvm@lists.linux.dev>; Fri, 19 May 2023 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684507702; x=1687099702;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Pi3Rw8sgVO8xNLiFOSc3vh8jvsieIJmukGipCTTKtY=;
        b=msg2K7jeMevFEiMSN8QJQ/3c/dYy37lA8oHNZqtHi2kDelQ3Ar1DrcDAHBEHqiSFit
         uYkUcdH7QTIRUnajGapBzF1iozq//DsG4gEDw3uGf9IUdvwMgVv0AbKqAB35yYQ+dNHA
         O3tLZxHzcwjRNtoZhpEuhaA+BSYcaRmHDz+TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684507702; x=1687099702;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Pi3Rw8sgVO8xNLiFOSc3vh8jvsieIJmukGipCTTKtY=;
        b=aQ1sCkl5AqVG4+HBI+yXToYC3OstFNzzBEP9P9whZZGr89ZZjGXL3kOnXJc1ig1vQf
         j+qMCzOs//IZZv5oKwJnx7sf8dFiCGQ0z7xRcnc34v18vIYzLuZ9sNkiGsZrfmv3H19U
         Rx379rmSchGxnEYFWeMWOx7AsPk+8FANNa16BhEzabTKKMxg7mIsHUyBjvZWIHgAiq2c
         RF64vhxq/pi7SYxGKkH5sctYlz4SiQmEwfAFfUivYAnrY3iK6M4FQbKj/FE/wirBs7ia
         S/yYWmZs5MmMrhL4Z811wXB1zWwEgFE4OKULaRnk2MsmI+OqFMqrBLN2Hr+i5lVg2Aa+
         RzxA==
X-Gm-Message-State: AC+VfDzA9Zv2mzOzRBkTGzv9hmPLXjUCbCAG3+HOwPzjJz8kw/MhKKUo
	90TBPiIdn3kNabHh8x9YUGe4rw==
X-Google-Smtp-Source: ACHHUZ5MUiw26m3rCs8XC1mrIu74pUR1qli+EK5QOjHWaKOChgchSRO6OKsp0cMc1uGVgjtxdYp2FA==
X-Received: by 2002:a17:907:7b98:b0:965:ff38:2fb3 with SMTP id ne24-20020a1709077b9800b00965ff382fb3mr2160890ejc.74.1684507702682;
        Fri, 19 May 2023 07:48:22 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:62fd:274b:c2ab:69bb])
        by smtp.gmail.com with ESMTPSA id a2-20020a17090680c200b0096a68648329sm2349437ejx.214.2023.05.19.07.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 07:48:22 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 0/4] kexec: Fix kexec_file_load for llvm16 with PGO
Date: Fri, 19 May 2023 16:47:35 +0200
Message-Id: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAeMZ2QC/33QwWrDMAwA0F8pPs/Dsi3b6Wn/McZIZKUxSxNw1
 rBR8u9TdxxZTkISehK6q4Vr4UWdT3dVeS1LmSdJ4tNJ0dBOF9YlS66ssc44C/qDv5jeaZQeBO0
 RDFmXwTakZKZrF9ZdbScaZGq6jaMUh7J8zvX7d8cKEl7/41bQRrcxpJ4sRfL5hYY6X8vt+jzXi
 3oTbLWHgBUgg2HMCDGFZgdwh4ATAHsDgVI2nOIO4A8BLwA4bxBS3yTeuwAPAXxcgMF1vXwAots
 BwiEQHk+0FpETtJ3HP8C2bT8j1I769wEAAA==
To: Eric Biederman <ebiederm@xmission.com>, 
 Philipp Rudo <prudo@linux.vnet.ibm.com>, Dave Young <dyoung@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Baoquan He <bhe@redhat.com>, Philipp Rudo <prudo@redhat.com>, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ross Zwisler <zwisler@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
 llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2021; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=/xaeieVFQ6xdVDAz17gKeKb/9LFf3JIRAWtpj04iWQs=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkZ4wblqq2vLEoov6/zQ06eVyMdiDERAJkV5+vM
 0Kb8EQIujWJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZGeMGwAKCRDRN9E+zzrE
 iGc6D/9Uc+9TyN5zpqQv/iPV4DIP0EzzJIG/jXsFC25ZH9GGK0P96Opd5J5JN/UBqzVN1pPqTG8
 whwLcR1HGsHebM96si7noWhhoeQFYNZsfECVOBnJrtr5+Tgxi3gbHmt9SbQK/ooI8sCV2fE9OLO
 +6jUrRN8J2/GnSXGouHOTiHbDvSA1pJk0b9fKMnYWKf/lYNFuIO9Ol6T8wD35b3IP2eW0pUKlmE
 4DjAr09BunIB/vGH5dzsxU4gBzL5PAuyoEXRI1hwItqrkkYg9BDfir75GxJRAGnXhbd3je5gB7w
 GQWCdkOsOtKMG/aGAsrGVq+zJZ0IoiB8C6yOOgHM4pKwlGW8+dIr+mXf2oVCu6ARy7RSPU5SuC5
 JAiNIJ6RnJfqXbFoL/qSGqKXwj5MD7lDnA9j420LvaDbvnyAaA5kqh+CTg3iBRmQSZlPYzjf962
 lYpA3mDeFRUnH/0F9ADI43vIzU0OhBL82x5IdqlKa53O+slulwrIu6A4jbqHOzcG0B2t3wbMZYu
 14UaQd3qxdzkYwDNz54i/nrQ5aRZfXFy1POrJyVK+Ot4AWdWvANYRQ4AT2kdOh89qMvSsGY27ik
 a2Xm5HkapVpv0I+1+r5A3tNL2x39NooxsWrVmMyMO0+ke+HCx6m8/KbxNZcxxP9vzqf2SGxCVDj
 TgRqej+1SpCQ5XA==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9

When upreving llvm I realised that kexec stopped working on my test
platform.

The reason seems to be that due to PGO there are multiple .text sections
on the purgatory, and kexec does not supports that.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v7:
- Fix $SUBJECT of riscv patch
- Rename PGO as Profile-guided optimization
- Link to v6: https://lore.kernel.org/r/20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org

Changes in v6:
- Replace linker script with Makefile rule. Thanks Nick
- Link to v5: https://lore.kernel.org/r/20230321-kexec_clang16-v5-0-5563bf7c4173@chromium.org

Changes in v5:
- Add warning when multiple text sections are found. Thanks Simon!
- Add Fixes tag.
- Link to v4: https://lore.kernel.org/r/20230321-kexec_clang16-v4-0-1340518f98e9@chromium.org

Changes in v4:
- Add Cc: stable
- Add linker script for x86
- Add a warning when the kernel image has overlapping sections.
- Link to v3: https://lore.kernel.org/r/20230321-kexec_clang16-v3-0-5f016c8d0e87@chromium.org

Changes in v3:
- Fix initial value. Thanks Ross!
- Link to v2: https://lore.kernel.org/r/20230321-kexec_clang16-v2-0-d10e5d517869@chromium.org

Changes in v2:
- Fix if condition. Thanks Steven!.
- Update Philipp email. Thanks Baoquan.
- Link to v1: https://lore.kernel.org/r/20230321-kexec_clang16-v1-0-a768fc2c7c4d@chromium.org

---
Ricardo Ribalda (4):
      kexec: Support purgatories with .text.hot sections
      x86/purgatory: Remove PGO flags
      powerpc/purgatory: Remove PGO flags
      riscv/purgatory: Remove PGO flags

 arch/powerpc/purgatory/Makefile |  5 +++++
 arch/riscv/purgatory/Makefile   |  5 +++++
 arch/x86/purgatory/Makefile     |  5 +++++
 kernel/kexec_file.c             | 14 +++++++++++++-
 4 files changed, 28 insertions(+), 1 deletion(-)
---
base-commit: 58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
change-id: 20230321-kexec_clang16-4510c23d129c

Best regards,
-- 
Ricardo Ribalda Delgado <ribalda@chromium.org>

