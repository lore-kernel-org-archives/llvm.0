Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5821E7F
	for <llvm@lists.linux.dev>; Tue, 13 Dec 2022 00:17:14 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id ep17-20020a17090ae65100b00219702c495cso852715pjb.2
        for <llvm@lists.linux.dev>; Mon, 12 Dec 2022 16:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8EoQ5xUEc1FhkDzFjTM8ar5jGOrCyi+Uxx/y/QqNxRU=;
        b=ipDKG2JVkVU4OEFWDzPMjQvpwLjKrvLtAsE0Q12Ig0QpxJrg8GZmiIm/+azC7Rsqa2
         1pdKNzn7q+j8SVvNFFE1MwcgltFtLpVT1j20hR2QXC2Javgns9JomPzKxX8az0MVR8Lr
         xwxNQ4L+57LcZAeNwj6COf48lC0gORWpzAAh4EHs1sxnOZZrp+oLMfA4c+3AeRny/IkJ
         jwTjCm1aa2Xqxkk8MuRjUDMVdOpUJRa/4/CvkiRx5C364j7RnnRN0GmaWDsiuRVgQoLD
         8mXK/UHXSQfeZuLkyN4NIw4jy3LAgiOHXlbk3sYihSHK7Kz3E1BePP1k4h5mJdMfm87Z
         NXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EoQ5xUEc1FhkDzFjTM8ar5jGOrCyi+Uxx/y/QqNxRU=;
        b=tq43PE8gjLCAt8vlhM4TBOj5EHcwVbCzAwxggVBjmmbhmfU19bCS+nkIL6G0XvPDMF
         tD65zuHBnWgf+i4asgsF+vpzFQC3SGVvHrPjbZ0WrhrkrSf/ssrvPtoPbz4PIVRnYihX
         yKvYkaiov9o9NNoLyGTSzvT49rPlaAuO5FMdk2Rh2UT5cmF3YBIQ/4Dh7tU0US/ppZ21
         9MWHQFLMt3gESPBz2wjDDN7nc1Ai6vK/gflBe7MyKpWGHNHzHFjDCYDe53uxDEjIWleU
         DkQZ935FqqM5VAV38FSko/DC7k/mFJ+Xt9AgRVVNiAI6i7R95dXwz7GDIUfjo7QDVVqP
         SrfQ==
X-Gm-Message-State: ANoB5pkrssdwPL7OKk9FnDx6qOq+VSblBc9sgf1+zf2cbhGJvZUsXjxC
	8/BayHrhJhGdpU1n9pnJolYYOFSxjUE=
X-Google-Smtp-Source: AA0mqf41e8RRAh+qKfNTJDDY/qqZQdHGGB0nRmZ6p6Bfn39lpFfpCEPh+Tpnh5gE0AblUZ/3qOhiatioU1w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:bc86:b0:189:6ab:a97c with SMTP id
 bb6-20020a170902bc8600b0018906aba97cmr77809422plb.39.1670890633860; Mon, 12
 Dec 2022 16:17:13 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 13 Dec 2022 00:16:49 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-11-seanjc@google.com>
Subject: [PATCH 10/14] KVM: selftests: Include lib.mk before consuming $(CC)
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

Include lib.mk before consuming $(CC) and document that lib.mk overwrites
$(CC) unless make was invoked with -e or $(CC) was specified after make
(which apparently makes the environment override the Makefile?!?!).
Including lib.mk after using it for probing, e.g. for -no-pie, can lead
to weirdness.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 6594ed51eeea..2487db21b177 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -182,6 +182,11 @@ TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH_DIR))
 TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH_DIR))
 LIBKVM += $(LIBKVM_$(ARCH_DIR))
 
+# lib.mak defines $(OUTPUT), prepends $(OUTPUT)/ to $(TEST_GEN_PROGS), and most
+# importantly defines, i.e. overwrites, $(CC) (unless `make -e` or `make CC=`,
+# which causes the environment variable to override the makefile).
+include ../lib.mk
+
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
 LINUX_TOOL_INCLUDE = $(top_srcdir)/tools/include
@@ -207,10 +212,6 @@ pgste-option = $(call try-run, echo 'int main(void) { return 0; }' | \
 LDLIBS += -ldl
 LDFLAGS += -pthread $(no-pie-option) $(pgste-option)
 
-# After inclusion, $(OUTPUT) is defined and
-# $(TEST_GEN_PROGS) starts with $(OUTPUT)/
-include ../lib.mk
-
 LIBKVM_C := $(filter %.c,$(LIBKVM))
 LIBKVM_S := $(filter %.S,$(LIBKVM))
 LIBKVM_C_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_C))
-- 
2.39.0.rc1.256.g54fd8350bd-goog

