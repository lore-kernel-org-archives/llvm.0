Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679FB2C9D
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 00:50:07 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id 127-20020a630585000000b0035de5e88314so11323503pgf.2
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 16:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=3/7OuVceBn0EleUU7nySvspzg5VyH7dxhNHRLM/3NIE=;
        b=EtaUGeB0crakORjKPe7ruh7EgNS85rRKIo1vZQSAgHFcEudyPUz4RuiIq+KtjJYiZR
         1OqL25OxkYDNrCXKWKLz2YOtA4ckbOSJ3+YP4TfziGxQnMIEELSoi06HE/9CeAUSLKXU
         kSy5TvR9DjgowQ6RUPus4vXm0kcKZIN0W/4GBqjk0cAptuQUniCap/nPA6FskhIFtUeQ
         TTChArhpBpKfLOJe2aEt4MAxjHdkfSWQ++Di3jyS/VRH2ieCQD9GR20lU+klsKYnE5iY
         Fk4wRG/2OAgDLpvQ3U/NmazfqzqkzoGGPPqm8cy9lzbAKtPwG/yzEg1DGV4eFnlG7ZaS
         qHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=3/7OuVceBn0EleUU7nySvspzg5VyH7dxhNHRLM/3NIE=;
        b=P14w+8aJLjXac4fWz3oc/BKzG/O1gEu+ofdn1Q+AfiGLb5/mGOA2UUMXSFeN8Xg8Mn
         nwRIqNfmOGYYX8LJkRv934RdcoKFhUsxAz7MM737FKF7fd4zA05TDXXHKqxZ9zDRr9/d
         2xvDzrL7R6yaGeIUU37ro9lE24SXtZnenzoBKf2fwFYM5Z01thbBd9SZqDS6z+NawQuT
         kEMXiWtE8n8HerEbZd/M9Kos/MGvRNhl/f4osatSUZr+JgRUtcaE8sCfAlHRQDTyU9gp
         +FUScvtpHRsiqhRyHC70V5Sav3+Y2k0n0u4bSbJDGFuGrBTevlMWRtq8uWCagF0LPEKT
         ZVlw==
X-Gm-Message-State: AOAM532QL83NWwqQRkREQtM9BVrv4qaMEPWsrS2rtRfzNaIkW/db8SDR
	AGLw5fPnIkEt1qZpZjW7eYm5Kfe0GgI=
X-Google-Smtp-Source: ABdhPJxaOUM0XxNVSnap4U+XQvTqFWJQ1EEDHMwv7ezGfJzzItoGIpIVtAqpcjtk78QdP1E/SRU2o8215xU=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:b212:: with SMTP id
 t18mr13193260plr.80.1643763007012; Tue, 01 Feb 2022 16:50:07 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Feb 2022 00:49:45 +0000
In-Reply-To: <20220202004945.2540433-1-seanjc@google.com>
Message-Id: <20220202004945.2540433-6-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220202004945.2540433-1-seanjc@google.com>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH v2 5/5] KVM: x86: Bail to userspace if emulation of atomic
 user access faults
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Tadeusz Struk <tadeusz.struk@linaro.org>, 
	syzbot+6cde2282daa792c49ab8@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Exit to userspace when emulating an atomic guest access if the CMPXCHG on
the userspace address faults.  Emulating the access as a write and thus
likely treating it as emulated MMIO is wrong, as KVM has already
confirmed there is a valid, writable memslot.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c9cac3100f77..24e0981816c0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7217,7 +7217,7 @@ static int emulator_cmpxchg_emulated(struct x86_emulate_ctxt *ctxt,
 	}
 
 	if (r < 0)
-		goto emul_write;
+		return X86EMUL_UNHANDLEABLE;
 	if (r)
 		return X86EMUL_CMPXCHG_FAILED;
 
-- 
2.35.0.rc2.247.g8bbb082509-goog

