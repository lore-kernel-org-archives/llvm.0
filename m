Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEFD22A7F2;
	Thu, 16 Jan 2025 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737037760; cv=none; b=WUrli1Z+BUmUTvrQuKJink12PpALgufS64dTINEak+IwlPon43XbFSC6d87fyy86Xz3xkVK7N3JIRbeKLOb9teQN/Kk2zhNjWEIKjRixh/Sqvf4Wkudl79G0CbnWWxsTeF9yOAzMUHI7rTu6plOlJ4pFa7ww4iWZ0KNV5zdZeEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737037760; c=relaxed/simple;
	bh=epe2+DyPA/LzFRpYzDdjy8wNjOL0RelUOt1iCadAqRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W4YZ5+hVPKTiDxCVvcCAhVDMihTolOz4urUdhR1PSw4TYMQII3NfWrW0CJ7ILe5Y6Gagydl0GEvCNus0Yf8wv6vRYe5FbK2iHNUFroJB6JShMijkxvxq/ulfD+NWKh2uw5uzGX/XHu8c5FLZ7pkXpFRvsS8RiWQlX+DtsRSDHdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyL9egeB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyL9egeB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BECC4CED6;
	Thu, 16 Jan 2025 14:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737037759;
	bh=epe2+DyPA/LzFRpYzDdjy8wNjOL0RelUOt1iCadAqRk=;
	h=From:Date:Subject:To:Cc:From;
	b=iyL9egeBissYEXplrTQsjKMzjvwiNEl1s0IjUHVtcdSoiA/tjpdXSiVQkPWSFPYjl
	 51lB9ArSJs1viNhTCufJDkhtWQwP9QQ0blsMxS7dem5J2E5neTg0C8gUbkk2asvHP1
	 /9izfJo+qAB/Uhv6LWh6mOHSC1Beo+qGt8hTGFJ8OXsjEJbcNBUEE2DurkauhUKoVN
	 Pe+LWA0L4KPyOzqqNgJV97amU46mtBiE5/XXPLN9pi1kn0EHtSfQKSqtnAjC13xC6p
	 ecoKfxMsg+nmq29f4JuMNqyEe4pnqLubH6KM8wJxEgxeZ6xb4yPHjmUEyV6Qrx/3aU
	 dTkTgU43IGcYA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 16 Jan 2025 07:28:42 -0700
Subject: [PATCH] x86/asm: Always inline serialize()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-always-inline-serialize-for-noinstr-v1-1-b7a37b2af04b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJkXiWcC/x2NQQ6CMBAAv0L27Ca00Ur9iuHQyIKbNFuya0Al/
 N3KcQ4zs4GRMhncmg2UFjYuUsGdGng8k0yEPFQG3/pL61zAlNf0MWTJLIR/O2X+Eo5FUQqLvRT
 PFCl2PgwxXKGWZqWR38fl3u/7D+ky75h1AAAA
X-Change-ID: 20250116-always-inline-serialize-for-noinstr-4e9e9826d967
To: x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, 
 Sean Christopherson <seanjc@google.com>, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=nathan@kernel.org;
 h=from:subject:message-id; bh=epe2+DyPA/LzFRpYzDdjy8wNjOL0RelUOt1iCadAqRk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOmd4ntLOwLOpXxfd0ktb9+kG73yRrrl6yfX+8jvEduoX
 eKuXzK9o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzkWCHDP/sTd3Zt/FFZvGmD
 eJFz4NlnkV8OFO3g4Ojwn31k+gnfa48Y/kdbWHnPa4+buZ/3WvyiJUdu9xRJVAvafzZZdHfGpie
 hrJwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

serialize() may be called from noinstr code and if it is not inlined,
objtool may warn like:

  vmlinux.o: warning: objtool: __static_call_update_early+0x2a: call to serialize() leaves .noinstr.text section

Mark serialize() with __always_inline to clear up the warning and
prevent future ones from occurring.

Fixes: 0ef8047b737d ("x86/static-call: provide a way to do very early static-call updates")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/202412181756.aJvzih2K-lkp@intel.com/
Reported-by: Sean Christopherson <seanjc@google.com>
Closes: https://lore.kernel.org/Z4bWnWYqu1LaD-JG@google.com/
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/CA+G9fYv-AgeUpP1yPDmy48T869Ms80jgUdjnwtBNoJmCKQvZDQ@mail.gmail.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/x86/include/asm/special_insns.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/special_insns.h
index fab7c8af27a4d00647f2f52e7fe4f91bd42a7291..03e7c2d495597597a635f83116fafa1a95ed357e 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -211,7 +211,7 @@ static inline int write_user_shstk_64(u64 __user *addr, u64 val)
 
 #define nop() asm volatile ("nop")
 
-static inline void serialize(void)
+static __always_inline void serialize(void)
 {
 	/* Instruction opcode for SERIALIZE; supported in binutils >= 2.35. */
 	asm volatile(".byte 0xf, 0x1, 0xe8" ::: "memory");

---
base-commit: 37bc915c6ad0fb8a192dafb6b7046c79cad1f4a2
change-id: 20250116-always-inline-serialize-for-noinstr-4e9e9826d967

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

