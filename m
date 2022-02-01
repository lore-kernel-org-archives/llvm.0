Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9823FDD
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 01:09:03 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id 68-20020a621547000000b004c74bbd2819so8234835pfv.18
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 17:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=bL3FT8k/Xb3BcGI4WIfdGnBaIJMFJqmCvBuj1gJGH44=;
        b=qfjP1xUS1KlVS/IMykXefKvK1qQTncFnnytcKJMuNz7cZ6izT1HFdUafvswOgJug6w
         fUu2gRE/sPO/gMGaQJHy1cu/gikzlTFd+dwYsScIQ2aSEr19oNQfPZGlCSgrgT+A/ptb
         /BmWw9Q/5FLUgVtaJXFmF+ufSdVc0dVArOlkXmwriEDJ5vmsdUA1krlC7d3M4dgj/hAk
         ZH38ahZRKwAFuq+7rfQkwCiebPXcQlBJDlblbvkGBTV3eebX1oiryLzUoQsHW5mONR+9
         1uIdR6azhY2x3J/pkEG8jDjFnokQdpdQEl+iLKEku7fanF+2DkTtHnGCKT2OvwN8+DmO
         kjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=bL3FT8k/Xb3BcGI4WIfdGnBaIJMFJqmCvBuj1gJGH44=;
        b=fjfzq3bFRqRvgVhQLoiYICnf1PzbRBMAqMOWREIlzfS1pj2IZ60U5+Sl/x7QMlOwfN
         dthdD9WUIGUu+PJJ8eVUcvGAlE9bmbpvx7cD/qVZiw0bLP9EvlOB93KJvMujbVo8kSrw
         tZv31jJ6QZtVbZ1uZS0YzO07KLdIo63M72rUS+pvm3WUgxGOu3TSAzR9nZ0zDmZdeI/H
         WB+cSq/mmf/QQZDjw+gj2eTqfY6fXcXdz6d42W8QehSxr5S4+bwH0G4kJZ5fwzL2UD9y
         uE5ojrojMI6JVwqkSfAn4q/m9ZTBumNcDtVa8fw6GQ5oKo6uUfaqNCowFFQFxrzT2ans
         Je8g==
X-Gm-Message-State: AOAM5312GzIYitcl/eEyOw1pGzfayOEGypgpVbDz104lKJLuCzynwfiS
	vgyqJv33pGFTFtSq6hBo8ssQKQO+h0s=
X-Google-Smtp-Source: ABdhPJyr1xQ8ILXqOSdU52v8l3fst3RJPIJ4yAP+ddUL0kFfLBBG3IGhmHWreArnTTL96e8JdujXax4R5iE=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:7784:: with SMTP id
 o4mr23247435pll.173.1643677743484; Mon, 31 Jan 2022 17:09:03 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Feb 2022 01:08:38 +0000
In-Reply-To: <20220201010838.1494405-1-seanjc@google.com>
Message-Id: <20220201010838.1494405-6-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220201010838.1494405-1-seanjc@google.com>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH 5/5] KVM: x86: Bail to userspace if emulation of atomic user
 access faults
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
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
index 37064d565bbc..66c5410dd4c3 100644
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

