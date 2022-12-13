Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B7F15A8
	for <llvm@lists.linux.dev>; Tue, 13 Dec 2022 00:17:13 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-3b48b605351so152632017b3.22
        for <llvm@lists.linux.dev>; Mon, 12 Dec 2022 16:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cl2hz2Xl0INQZgi0/FdsZaZQh2aAYVKtm1GOrQ0BNuA=;
        b=qtuKL0chntBw8WmvJab1K7kXx56vDxcM9Lz3Ed1k66okiPfskMIfRbRPhkpYl+zGcP
         mkp5v4Xa7xKSkNVTIU5I70auAIKnC0QeyzQFPgSFF7WWS+tDOctc4tDRG/YuUfhAOX4B
         t8ijgFRQsDMni3C+Sb2bEyRHhRoH07jF7n9YtSS4rtkdGTPQ9kigYoTmO1aL/fn/jywD
         tNkEscjQPz0T4cqIQReHVuDH+sIuUu9AxFpVApk///ScvT5q9609eMJOQx/F3P0B5FVO
         7yKU4XPqBRk3J8E/xxsYrzOoSaTZobfNQITHw9pavl02O+kx8NUkPc5JhtHd2UP0Zuz7
         2pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cl2hz2Xl0INQZgi0/FdsZaZQh2aAYVKtm1GOrQ0BNuA=;
        b=LY/0HuvBtgQRz6WIMjpArgAhErWxHecTLm99Iv70E6lM1Mb6cI+ea7OGmt190rIT0a
         iiAl4xxi9TYB2rodItgOHNPx9q2qOcWrYY9d3lTp5DdUXQeo4P5p4RhGAcoXW2dmoOlj
         +PIkwkT70I6wVU8qw2SHAJ4Toz7NYH3ZbwLRkXvGDK6HqV9JuXxmOyJcPSttwOEDLz7K
         SpMZ41o5FMuKGH6RON0XJASwTgBmpv/f6nOqdLG1RGHZvY9TCLYCHh+n2JzVakrS+oJe
         BfbZh7iRO6BhL/MnnkZ7ZscM2YbG3V9l0/A3STlDYpNlsziqQt3B8xbf/S/xYUSZGWCW
         y4YA==
X-Gm-Message-State: ANoB5pmRmh90cX6jKKIV+OCToFpmvgUL23LD8l9ECBMa2qy6oFRkPFsO
	nK8+UII0KIQyQhWdQoUpL6ANFwI3C2U=
X-Google-Smtp-Source: AA0mqf5PAbtMk1FlbJUnxb446gjQZtpZQwbl0k154cV60HQy1+WGqGPPTBe02uIxBcfNlX5eyXkFbuPBOrQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:3303:0:b0:6f0:be3f:26f0 with SMTP id
 z3-20020a253303000000b006f0be3f26f0mr67005598ybz.512.1670890632080; Mon, 12
 Dec 2022 16:17:12 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 13 Dec 2022 00:16:48 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-10-seanjc@google.com>
Subject: [PATCH 09/14] KVM: selftests: Explicitly disable builtins for mem*() overrides
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

Explicitly disable the compiler's builtin memcmp(), memcpy(), and
memset().  Because only lib/string_override.c is built with -ffreestanding,
the compiler reserves the right to do what it wants and can try to link the
non-freestanding code to its own crud.

  /usr/bin/x86_64-linux-gnu-ld: /lib/x86_64-linux-gnu/libc.a(memcmp.o): in function `memcmp_ifunc':
  (.text+0x0): multiple definition of `memcmp'; tools/testing/selftests/kvm/lib/string_override.o:
  tools/testing/selftests/kvm/lib/string_override.c:15: first defined here
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

Fixes: 6b6f71484bf4 ("KVM: selftests: Implement memcmp(), memcpy(), and memset() for guest use")
Reported-by: Aaron Lewis <aaronlewis@google.com>
Reported-by: Raghavendra Rao Ananta <rananta@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index a6050dcc381a..6594ed51eeea 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -191,6 +191,7 @@ else
 LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
 endif
 CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
+	-fno-builtin-memcmp -fno-builtin-memcpy -fno-builtin-memset \
 	-fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
 	-I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
 	-I$(<D) -Iinclude/$(ARCH_DIR) -I ../rseq -I.. $(EXTRA_CFLAGS) \
-- 
2.39.0.rc1.256.g54fd8350bd-goog

