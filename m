Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC16A5C85
	for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 23:48:42 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-31ea3f0e357so21282267b3.16
        for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 16:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=LDZmz11aCSYEVg05fPmunXr6uAMRHdpGu3qh7wCVrmk=;
        b=VnDSxerR7WLX8t2mlYqAcUKFg5CGRuGUirUTWpEvVqHf6hATzmCFJOfARBOjZEQBxT
         f6Og6vx5ozZX3KH8XI/6lthf7qvMHu2GUKXMTOqlc6h0wdd95aRYV/+M3OlJ0cKy1Z9+
         i8Wo4Yn4Wxg4ZI85nGT2CH4DgSNPA3Qofb89jpu6Y4CxY9UKFUnuyWshApST+aS8wM+5
         mjGzBXTDw7253wEyuFuU+l7mBB4gMUbYrkhol9K+fmvSLxC3Uj4nlUwmtsrbIcODiyhV
         W6nI+xGTLOg3bsm3vHjqAQ5PH4aQBLvtH8U0TnCgrhe3kmHRaC/qV5yD1QLVydNuesSP
         QqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=LDZmz11aCSYEVg05fPmunXr6uAMRHdpGu3qh7wCVrmk=;
        b=lNfQsIZrmKKjHpFDQSaqkqQLSr50bT8m9lmvSB9vu6DGTWEnR+XwSs66NwCPOuOvT6
         2WiCvR22k7tSkBiy1m1m/2DGWlMMrdxWOJHta+Q0KzDb0IYZE3zkhZRl2qSYS0R+qoV9
         JJjDgrm61XhdMSc7aytFLeMb6VYdWgqTdApIlYOKZTMnz81Fte8H0bk00YWaGPF6ToEO
         V11M/5c2OMutyiQmEoMM7xS1OPpFM8RutUI44JVoFxVLHW1r9G5gbeDGKf/l7ypznA+K
         WavROrdAkTbsJx1IUzeAdqYqqgPPtQyD3yR6KyMZTQ2NK3VAEnt5qoAJsVKL08aDdgI/
         HX6Q==
X-Gm-Message-State: AJIora8UPOs9fhrlhqXAr4beLqhjA0aj+ikelUaLtwKruAk8JEICkTq1
	ra1IDYf09OuRxn+7iQazRNWWVY4fF0Rkyw==
X-Google-Smtp-Source: AGRyM1uN/09X+oV51ELVoC3KtQ63wgjhD6XYFbwe7uoamv1x+crjWtCyQPxyDzXP29mFPwKB6uBpvQ1nMo8hXQ==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:2603:0:b0:66f:774d:e222 with SMTP id
 m3-20020a252603000000b0066f774de222mr1916279ybm.407.1658533721775; Fri, 22
 Jul 2022 16:48:41 -0700 (PDT)
Date: Fri, 22 Jul 2022 23:48:36 +0000
Message-Id: <20220722234838.2160385-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
Subject: [PATCH 0/2] KVM: selftests: Fix Clang build issues in KVM_ASM_SAFE()
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Jim Mattson <jmattson@google.com>, 
	Oliver Upton <oupton@google.com>, 
	"open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The LLVM integrated assembler has some differences from the GNU
assembler, and recent commit 3b23054cd3f5 ("KVM: selftests: Add x86-64
support for exception fixup") seems to be tripping over a few of those
differences.

David Matlack (2):
  KVM: selftests: Fix KVM_EXCEPTION_MAGIC build with Clang
  KVM: selftests: Fix ambiguous mov in KVM_ASM_SAFE()

 tools/testing/selftests/kvm/include/x86_64/processor.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: 1a4d88a361af4f2e91861d632c6a1fe87a9665c2
-- 
2.37.1.359.gd136c6c3e2-goog

