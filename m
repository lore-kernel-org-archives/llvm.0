Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626AA93A
	for <llvm@lists.linux.dev>; Wed, 26 Jul 2023 23:11:46 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b8b2b60731so2128455ad.2
        for <llvm@lists.linux.dev>; Wed, 26 Jul 2023 16:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690413106; x=1691017906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4jdfUVTE7WBKRvJpfj2d5OTzyL4Pf20Sw0o+vzmWQg=;
        b=cWEM4cw/Xmvw/Yc4U7z6EZydB4+ARQlb9npX06puzQ8ttDgkdjkLDLzoPXiRYyO1Dc
         /WllWfsJwr4GdgXe+YaoqU38sCxEm2l1Zikmsb8G2cVdoF/6xfyjMS/+FISKFdO/zoHp
         JJ/jVwdqi8Mz+WxcTEieLsTvVJsQPtnbc/Oe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690413106; x=1691017906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4jdfUVTE7WBKRvJpfj2d5OTzyL4Pf20Sw0o+vzmWQg=;
        b=a8GWJqme4mtP3LlByIbx3hwy4mPMld9HoYeNVuvi2waJeR7XwrAWIO96KQnTp6/Mgt
         eFjFyo44KZ6bMxBQKsszv9+yJGdlB0o4cPr3+pG0iABrUiR1EkgbxBbgW1aPc5MkPHaX
         I1Hq7B8SmdP4NHsjEvkmQv2mC6af16iAFxHeQTUiGAHsdXE3C2pfOstLqCyjZu8RRcQS
         YLv+wqebgP/+xk5tXosrCEF4rBN9TJzl105KupDg4LTw5Wx11cQk5aTLWs3ThDeWbNZq
         jO1/fowTASQxUJ03x1T86fv1dJRd3byh37wX/tCx5kWBipIjWzwMXs5BDtTEUwiP/6rs
         WLaA==
X-Gm-Message-State: ABy/qLbopJ/JY1lpd30ATaStkAWkyXJDeuH2KKL4cFuJ79iDXxJEP75a
	2wN5iagAk5LzyaCrXBNxzJSO7A==
X-Google-Smtp-Source: APBJJlHIRT7RagOVEgkyJ4BE8SHUXCP9y/ZI0M+lOoJtFqUBjQgpXV1jOJkoWH9XFaUzbitXWxJXWg==
X-Received: by 2002:a17:902:f545:b0:1bb:a367:a70 with SMTP id h5-20020a170902f54500b001bba3670a70mr2634155plf.17.1690413105998;
        Wed, 26 Jul 2023 16:11:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902e9d100b001bb9883714dsm82329plk.143.2023.07.26.16.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 16:11:45 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Juergen Gross <jgross@suse.com>
Cc: Kees Cook <keescook@chromium.org>,
	kernel test robot <lkp@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ajay Kaher <akaher@vmware.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] x86/paravirt: Fix tlb_remove_table function callback prototype warning
Date: Wed, 26 Jul 2023 16:11:43 -0700
Message-Id: <20230726231139.never.601-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2323; i=keescook@chromium.org;
 h=from:subject:message-id; bh=LqLAiBHCS3SOIFmrkPyUKr3/p9LAy4Na2qeKgbyRhrI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBkwagvwZ+7zZjxcV7wmzqScO6yy6gJ+KlcGXU/K
 mS4h3RYHdSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZMGoLwAKCRCJcvTf3G3A
 JhbOD/9dxIW8nQqK8eLsN8DjarrXXo2MbTowMSbdqTmppURh3d8EQCiVCszUdxoaRUHvFmiKUwD
 D86KLX1tiSS5FlmX4ehFA5HpFl8hytrIv6LOuRxqCpKGC2bBI/G9LV1VsezmZIaynIqq33TTzSb
 109A2v1VaTm7/xkCakSz3YP1bb54E0aaHp1s8DpDiDQd0TyfFi/M8mdGqi/obyPLhg8JG+rijen
 upCg0o3/Ein1HDCtKa6opIYvNATV0grvRApCnAIctGb9+8SFY2a0OfcJKvkl6PzUSboTIYJGhUj
 BouFli9hesufXioK68mpt9jpJN8jbgriMKaxEWrFmMQFplcKDGpsF1mCidFz+XzJYoBc9JHktUb
 6MkSAssX4OZC+kqJ6DLNqCWg5au02WpdbEhCtzMlZm79xenUBUIgOEulsIrUSqjm1Cs2q5ovoJl
 OOrOyA0ckQKVx+JXSgwDfog4rCyllA0sD2ui31ftHyETeH8MPOr6t45gSN/h6rtv3lNCmlbPuLp
 zwt96o1ZirQgD3U2/AVclaSoqcS7bsL22skLip02dZ0Zx4mVqTxfueAigIzDiB79B6dz+3V4E5J
 ypR9j+96fTzo6acv0GLam7/8ORNyRhm10PhPoup2PKCgVqq2FuhihR9cmInkFlclyfcxbFFHNBh
 00lNaL4 PSbWXsTQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Under W=1, this warning is visible in Clang 16 and newer:

arch/x86/kernel/paravirt.c:337:4: warning: cast from 'void (*)(struct mmu_gather *, struct page *)' to 'void (*)(struct mmu_gather *, void *)' converts to incompatible function type [-Wcast-function-type-strict]
                           (void (*)(struct mmu_gather *, void *))tlb_remove_page,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add a direct wrapper instead, which will make this warning (and
potential KCFI failures) go away.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307260332.pJntWR6o-lkp@intel.com/
Cc: Juergen Gross <jgross@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Ajay Kaher <akaher@vmware.com>
Cc: Alexey Makhalov <amakhalov@vmware.com>
Cc: VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: virtualization@lists.linux-foundation.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/paravirt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index ac10b46c5832..23d4d7114473 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -79,6 +79,11 @@ void __init native_pv_lock_init(void)
 		static_branch_disable(&virt_spin_lock_key);
 }
 
+static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
+{
+	tlb_remove_page(tlb, table);
+}
+
 unsigned int paravirt_patch(u8 type, void *insn_buff, unsigned long addr,
 			    unsigned int len)
 {
@@ -295,8 +300,7 @@ struct paravirt_patch_template pv_ops = {
 	.mmu.flush_tlb_kernel	= native_flush_tlb_global,
 	.mmu.flush_tlb_one_user	= native_flush_tlb_one_user,
 	.mmu.flush_tlb_multi	= native_flush_tlb_multi,
-	.mmu.tlb_remove_table	=
-			(void (*)(struct mmu_gather *, void *))tlb_remove_page,
+	.mmu.tlb_remove_table	= native_tlb_remove_table,
 
 	.mmu.exit_mmap		= paravirt_nop,
 	.mmu.notify_page_enc_status_changed	= paravirt_nop,
-- 
2.34.1

