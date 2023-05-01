Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C44D62F
	for <llvm@lists.linux.dev>; Mon,  1 May 2023 12:38:56 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-50a14564d17so39255293a12.0
        for <llvm@lists.linux.dev>; Mon, 01 May 2023 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682944735; x=1685536735;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJc/FIv16Z5bKlEeMjq3JH7jrMiztUQ6tRChXDQSURU=;
        b=oKFN/r8uKGx9Dr4DETHEAj7XJds+1Bkl9Cqn4Z6CQQSxDowYbUKPXMMW3MeG+X8FYo
         fBbtsDIE6lZ/2kRnHPaVvNFwGmN5R+12wlVOtMs22XZvF4DeqmQ7ZLHPROSNR6NOEBIy
         hQHlXVgw1kAmIgV931djagKU+oBuvB30KXM04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944735; x=1685536735;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJc/FIv16Z5bKlEeMjq3JH7jrMiztUQ6tRChXDQSURU=;
        b=YaEj/fcAX43nrYCvrzuV10mNkNZyly15nP0jNIl2GV4SS3f/xK13io22u1uqILfVum
         txFLFd/9mdbZf7NPt2Tbw3KLoPTCoOChBAUqntqWQQKYb5sVWSFLkDvlN8iUU0/jiVBn
         j559QKz4NXNC84/PNbM39A5LwQDDp3UfIXl/DUohSppNMPGLFxq4DLnfReVkOH5l03L+
         cyD1HF5vEFWfudiUmqw5xdpm7qbPAyl4OTKoi2epKhV0GrviR1UBWg5rHTq+KVj4tZmv
         6iTFvkh4h81TknzmfuK5Gifl3C2E974xHhua0C0UQzv+51BK1U1sGT7Gio/KullmY/YN
         v0iw==
X-Gm-Message-State: AC+VfDx9HU6W5FVRCMWc87aR83U/m5TSSvO1l2/YEeVBWo4svXhvJ8Ww
	4Cf7hY5OkfuaD+6dEucRES1ePQ==
X-Google-Smtp-Source: ACHHUZ5dy1t28pTgAv9ZewhiQXtL5zGnuRNOu5Z+CKjak1xPicSHjkyOJ9snAkywki500Fps2M3Y7g==
X-Received: by 2002:a05:6402:4413:b0:4af:7bdc:188e with SMTP id y19-20020a056402441300b004af7bdc188emr6406640eda.16.1682944735175;
        Mon, 01 May 2023 05:38:55 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:c573:159e:712e:688b])
        by smtp.gmail.com with ESMTPSA id c8-20020aa7c988000000b0050bcbb5708asm146772edt.35.2023.05.01.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:38:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 0/4] kexec: Fix kexec_file_load for llvm16 with PGO
Date: Mon, 01 May 2023 14:38:18 +0200
Message-Id: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALqyT2QC/33QzWrDMAwA4FcpPs/F8n922nuMMhJZaczSBOw1d
 JS8e9UeR5aTkIQ+Cd1FpZKpivfDXRRacs3zxIl/Owgc2ulMMifOhVbaKKNBftON8AtH7oGX1oF
 CbRLoBgXPdG0l2ZV2woGnpus4cnHI9Wcuv68dC3D4/I9bQCrZBh971BjQpg8cynzJ18txLmdxY
 mzRu4BmIIEilxyE6JsNwOwChgHXK/AYk6IYNgC7C1gGwFjlIPZNpK0L3C7gnhc4b7qePwDB/AH
 WdX0Ax4+WyLYBAAA=
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
 stable@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=GVJi+03Xz3YcKIs9vohmPUDUq2YTUUxMRlFdBxq2C24=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkT7LAFLlAuOy2Pigaz4i/nocmi0AaG2bDBwCis
 1EE/BR48JCJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZE+ywAAKCRDRN9E+zzrE
 iBVJD/0bvdaJk33Kto6cW3Qh7bkAyMST0SlVrSVNNRzCcHkU8OMpa7+OaBEM6aylG0KK+gBpSC+
 9M/aU99yVviz/wK8tmypnptMZYvvfeVNiQeO93KdPzYmUZTepOB54/pajMpWdXzgXYnQD+5fVJj
 XS1Mg4dxUrfaWd9jTaMg6bMPcw4hnduHVIUToP1960WZux+4iyt66qBkHDTUhEe+4aLJdIPu8y0
 TXEFshDvlVqy/6h7WqW2Wn9X038Lecaf2Cb+vKG/dtcFncw1BsXiCUe+Ny7zQhFXCb+9f3XeamD
 VVWQ8RhWqq+IsHt/LUVH0SWBcwegONn8/OA3jHsAfFQY9s2iYABKgoBbDzq7QuVR4DeXsS/B8kd
 Je8L101yFCiVa6aM7T/iN025l2Pr0M6mSxPsEZbwbXYUnADYf4FjlVcsvSiBCQghUXRcE7yb0zE
 9s1uOFvgW1Tmn9KJTK5e91CRxAKAz5AUF/fiqJYtGJuXhPypDbO7xrVcHx2XV/9/KFsCVAWCFli
 izkP0mT4SSvRRjga1EF091s9YDLMxKe287MF0LcOdNASLL8QmYbIG4Nk2KJcqLUx7RR/UAzd6LI
 mzp4oKuDvSVn1XPWMnSidoCM4GInDmiQ20x5trgZ1hUVyat2PHBgU0I5SdzrjK2gYZDAo/Q8/4q
 9iNvZ9J8J2WbZpw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9

When upreving llvm I realised that kexec stopped working on my test
platform.

The reason seems to be that due to PGO there are multiple .text sections
on the purgatory, and kexec does not supports that.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
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
      x86/purgatory: Remove profile optimization flags
      powerpc/purgatory: Remove profile optimization flags
      risc/purgatory: Add linker script

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
Ricardo Ribalda <ribalda@chromium.org>

