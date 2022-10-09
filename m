Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEA65C97
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 20:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB442C433D7;
	Sun,  9 Oct 2022 20:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665348880;
	bh=q35u9k51iKg4WFnPv2+Jft9j9x8EK3aRtf5Pa+iGBKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l6G/+FP9dX3PX6wRIpv5S6d7aHqwjOmyGhFR5NZNAA9NLbG9Bd7N13fKUd9TUfAXr
	 GOOV/PWJMPpyeJsjlJreKpMA1GRMUVmkYF5Xaxz8OfaiQ80AUD6RWKxN/eo792EBju
	 UQQlV/11CKGd8xrM+mUaBKM/HGrTdslv6Ecd5Y/JmDF1MoLKiC3B6UNwmkpTKEmBiB
	 S2I3LLhbB38dlr+kwS1qK8K69ZjYjlglKTMD/wocHkeoLP1CYXl4Tl76wRagCMpsk4
	 tfHfPyVUB1ICmU7mUCSbWsgAMY4F6pLxMGz/YC0aJNJI0O5yaQI7tN0kMDUk4rSr0o
	 39gUAN5DIQy+Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	Sasha Levin <sashal@kernel.org>,
	nathan@kernel.org,
	ndesaulniers@google.com,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.4 5/6] x86/entry: Work around Clang __bdos() bug
Date: Sun,  9 Oct 2022 16:54:21 -0400
Message-Id: <20221009205423.1203538-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009205423.1203538-1-sashal@kernel.org>
References: <20221009205423.1203538-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Kees Cook <keescook@chromium.org>

[ Upstream commit 3e1730842f142add55dc658929221521a9ea62b6 ]

Clang produces a false positive when building with CONFIG_FORTIFY_SOURCE=y
and CONFIG_UBSAN_BOUNDS=y when operating on an array with a dynamic
offset. Work around this by using a direct assignment of an empty
instance. Avoids this warning:

../include/linux/fortify-string.h:309:4: warning: call to __write_overflow_field declared with 'warn
ing' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wat
tribute-warning]
                        __write_overflow_field(p_size_field, size);
                        ^

which was isolated to the memset() call in xen_load_idt().

Note that this looks very much like another bug that was worked around:
https://github.com/ClangBuiltLinux/linux/issues/1592

Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Link: https://lore.kernel.org/lkml/41527d69-e8ab-3f86-ff37-6b298c01d5bc@oracle.com
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/xen/enlighten_pv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 65cf405cd975..26b35e75b701 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -759,6 +759,7 @@ static void xen_load_idt(const struct desc_ptr *desc)
 {
 	static DEFINE_SPINLOCK(lock);
 	static struct trap_info traps[257];
+	static const struct trap_info zero = { };
 	unsigned out;
 
 	trace_xen_cpu_load_idt(desc);
@@ -768,7 +769,7 @@ static void xen_load_idt(const struct desc_ptr *desc)
 	memcpy(this_cpu_ptr(&idt_desc), desc, sizeof(idt_desc));
 
 	out = xen_convert_trap_info(desc, traps, false);
-	memset(&traps[out], 0, sizeof(traps[0]));
+	traps[out] = zero;
 
 	xen_mc_flush();
 	if (HYPERVISOR_set_trap_table(traps))
-- 
2.35.1

