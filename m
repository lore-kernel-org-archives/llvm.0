Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567E015A8
	for <llvm@lists.linux.dev>; Tue, 13 Dec 2022 00:17:06 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-3d3769a8103so152028417b3.17
        for <llvm@lists.linux.dev>; Mon, 12 Dec 2022 16:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=M8gKXPtvSnujkFWzKh+1TE/D8A+unHwbuyURFcPqV7g=;
        b=oikR4k/YvNkMbE/UC5Bzf96qpIJXJtiLGFf80pbar3MbSe9xkR02tPegsy1MzPNRR1
         P/fMWRdmCHGRG+4PJC/RAb6f/NEYb7PQ365rsPpPKl8pDpDF9JnKgjnxoUL5hnPz5Xb6
         yoMSKg+Y0gISjOVsP4kt5i2sv2hP5zRNYjcFA15TS+vJvIu+ap5a/9+DImee/7HjS/Yb
         gs0wlNl86pWuU4fl75bzelkmpLN94j1fUy2W233vaON/4saTKkmge9ChxVbDRExK9IYF
         j5TnBzD4rBnxTOTGDNEtCTlBtPdi3Ztq5EGDj1efhIP6Gb2LPLoX+8LsYHJWr3TQSoEI
         LNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8gKXPtvSnujkFWzKh+1TE/D8A+unHwbuyURFcPqV7g=;
        b=YwAS5cNDovmho1oLbeCmF8lBCAPelYgXUF0XZVY2qHVyNbVNT3VrY9xB9ALPZiJp/d
         0lXu7yhdBgOKF5tJ9+6E0wmLpyER+5J8Cct9k4apzGtSCFj3jQ/tRFpqwjIDSW/rqxuD
         Q/gIgb4/ijAIekm8n+LpF57oHMDx/4wgU+jKpS/c3Wl6AojrjF7ya6IXrXly3/j6V010
         SRpuF+/498vr87WCYO1W+LcxIMmdGfnmR/TAE69hgL+cz5+AFTXsZC1nP/E/Wu7wj/EN
         gBE3vUt+FF78YBvEHCryYbBZ4U7B8vZscZDq9rZncjJmTc15ccHG/X4KMn2X3m8pERt/
         QSxQ==
X-Gm-Message-State: ANoB5pktV7Ku+bkbzQU4vg3Gztiws9xP89exhK/9UpwBCL7i5ggjHJ7k
	bliFAE+vpJ1lW7aBU8mR8WJs2JLnsss=
X-Google-Smtp-Source: AA0mqf7Q9qI1wDH/dcWjWFM94U57KTqb7jtGhaAh76MhvnBCcz2/FuDXsNQTZH108HtSEVOKNLQckow7PUc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:50cd:0:b0:707:18f:7226 with SMTP id
 e196-20020a2550cd000000b00707018f7226mr10335955ybb.505.1670890625378; Mon, 12
 Dec 2022 16:17:05 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 13 Dec 2022 00:16:44 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-6-seanjc@google.com>
Subject: [PATCH 05/14] KVM: selftests: Fix a typo in x86-64's kvm_get_cpu_address_width()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>, 
	Sean Christopherson <seanjc@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix a == vs. = typo in kvm_get_cpu_address_width() that results in
@pa_bits being left unset if the CPU doesn't support enumerating its
MAX_PHY_ADDR.  Flagged by clang's unusued-value warning.

lib/x86_64/processor.c:1034:51: warning: expression result unused [-Wunused-value]
                *pa_bits == kvm_cpu_has(X86_FEATURE_PAE) ? 36 : 32;

Fixes: 3bd396353d18 ("KVM: selftests: Add X86_FEATURE_PAE and use it calc "fallback" MAXPHYADDR")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index c4d368d56cfe..acfa1d01e7df 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -1031,7 +1031,7 @@ bool is_amd_cpu(void)
 void kvm_get_cpu_address_width(unsigned int *pa_bits, unsigned int *va_bits)
 {
 	if (!kvm_cpu_has_p(X86_PROPERTY_MAX_PHY_ADDR)) {
-		*pa_bits == kvm_cpu_has(X86_FEATURE_PAE) ? 36 : 32;
+		*pa_bits = kvm_cpu_has(X86_FEATURE_PAE) ? 36 : 32;
 		*va_bits = 32;
 	} else {
 		*pa_bits = kvm_cpu_property(X86_PROPERTY_MAX_PHY_ADDR);
-- 
2.39.0.rc1.256.g54fd8350bd-goog

