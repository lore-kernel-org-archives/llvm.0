Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDCE3783C1
	for <llvm@lists.linux.dev>; Fri, 10 Apr 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814947; cv=none; b=jCHTj3Q1kuO5jtgGOz6JLrx9SBeQTcPOoftMwjOnO2N7ReczTXIERBJwGgvjOrIA0RrxRzn+k2Rp2wHM4ZNargLn0E0H+vtU7hxfimB3VDqrFoHO5OEojJZYdqtYYSmOY4ZmB587a11Ubo31ZH5OpI6cq4fSnPmLI/w1zAbiW00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814947; c=relaxed/simple;
	bh=a2pHJs2qA0ZtKDeSchRhJe00tuLQzf19+B4gHWLiYxc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DGum5C6FPsIwYA0PkTZqAevL3795dUrqMjy8eSNtk1byZw3xw1/F++oW2sOErWCHPuKolJ+QHQg7oNk7CxD7nYcQ8a3nvqNPtnQYT+hpgZ5mzWF+958Hb/oABmJT6SYnNt7SjDlD0oKpuPKPIB8d0DVjJA9cIhSWpzdm8fuWr/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=D2JA9MW5; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="D2JA9MW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775814943; x=1776074143;
	bh=O068SfSii2/1GBWY8nC2eioHN+7tVaZriZSWNDGm94o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=D2JA9MW58BzGSdlnqzWtcwvw1+j0TDuX19R+jw4DteJ9Isa1XBlYmu93tqZbMpgP8
	 JnzztbUzNZesxDqi8JtcNa0eQK9b7E9Z5V/zVfWExcOaCZxe+mVlhCFpsMilLLj6Ja
	 oVfKdxBngyjOUjMwx+ADxQQAagQyioHdmB/iU10dCbKXuQe2XbyJlE+tx+5ycIygYv
	 8Eyq/Muf4+nFbNnzY8XjKgeTcIxP43XGaNYHVkGKkzvnquxGVpQfLv0wkFYzQMaJIT
	 g1aqxY0O/PBol5umcVXkklLxrF5cDigOPkZRu64xg1PbV8Z1vjBTQKkAmtKE3YUPDi
	 rjb4tbTCVUCWA==
Date: Fri, 10 Apr 2026 09:55:35 +0000
To: peterz@infradead.org, ryan.roberts@arm.com, ilpo.jarvinen@linux.intel.com, maciej.wieczor-retman@intel.com, jgross@suse.com, morbo@google.com, mingo@redhat.com, ljs@kernel.org, nathan@kernel.org, shuah@kernel.org, akpm@linux-foundation.org, james.morse@arm.com, oleg@redhat.com, houwenlong.hwl@antgroup.com, xin@zytor.com, justinstitt@google.com, seanjc@google.com, hpa@zytor.com, perry.yuan@amd.com, bp@alien8.de, dave.hansen@linux.intel.com, sohil.mehta@intel.com, tglx@kernel.org, nick.desaulniers+lkml@gmail.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 2/3] x86/mm: Cleanup comments where LAM_U48 is mentioned
Message-ID: <21904e9d5ad5d4939cf11a9fdd35d3a883154a12.1775813245.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1775813245.git.m.wieczorretman@pm.me>
References: <cover.1775813245.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: a2c67812187a028a33fb4de6f65447bde24c4308
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

For simplicity only the LAM_U57 mode is implemented in the kernel. No
matter whether the enabled paging mode is 5-level or 4-level the masked
tag bits are the same as on a 5-level system.

Remove two mentions of LAM_U48 which implied that it could be enabled.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
---
Changelog v6:
- Add Sohil's Reviewed-by.

 arch/x86/include/asm/mmu.h      | 2 +-
 arch/x86/include/asm/tlbflush.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/mmu.h b/arch/x86/include/asm/mmu.h
index 0fe9c569d171..9dcfce439c19 100644
--- a/arch/x86/include/asm/mmu.h
+++ b/arch/x86/include/asm/mmu.h
@@ -49,7 +49,7 @@ typedef struct {
 =09unsigned long flags;
=20
 #ifdef CONFIG_ADDRESS_MASKING
-=09/* Active LAM mode:  X86_CR3_LAM_U48 or X86_CR3_LAM_U57 or 0 (disabled)=
 */
+=09/* Active LAM mode: X86_CR3_LAM_U57 or 0 (disabled) */
 =09unsigned long lam_cr3_mask;
=20
 =09/* Significant bits of the virtual address. Excludes tag bits. */
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflus=
h.h
index 5a3cdc439e38..94c5ca1febaf 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -110,7 +110,7 @@ struct tlb_state {
 =09/*
 =09 * Active LAM mode.
 =09 *
-=09 * X86_CR3_LAM_U57/U48 shifted right by X86_CR3_LAM_U57_BIT or 0 if LAM
+=09 * X86_CR3_LAM_U57 shifted right by X86_CR3_LAM_U57_BIT or 0 if LAM
 =09 * disabled.
 =09 */
 =09u8 lam;
--=20
2.53.0


