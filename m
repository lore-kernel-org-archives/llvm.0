Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF46A2C870
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706182381; cv=none; b=mG0HPgNT9vXDs5CZdE8aMyzeDZPHFWPWFtFne0gY4zvrbJWECyXc4rBXv3DZ3qKrJ/fvVpqevBVgIdCXAzWnWoapgj65Gt/YsCs48KW7eLSjlEsAfkTibuBq8spP9ozpXnjym5lhnpyrZkdUx0PUqj7dVoeAg7c4gKl+FHDraJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706182381; c=relaxed/simple;
	bh=BHUup4Ao15H5a0x4s+HXfGoWgWU/14gkkZKIK0ZXAdk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nUsx6l+sjizG0mDqEoNPZHxlAPrimOxm6tM/XbXjM8DkacAfIJpDkieiFy0wcoOvBQe7bc7M90QW6EUadz7Hw3U3TcTOw6KAcC29DlsPYPkkIl6lKkUp6hCRcLQIhIXsOO4OO4pJakYCDQ9EMASHWc1oNAS3HBICxmT72kAl8jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yaxhLAsd; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yaxhLAsd"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-40e5317c7a5so49447845e9.0
        for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 03:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706182378; x=1706787178; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=usiDcusxejCbluC36Vpk0on80rVNZ7Itzv8e5WwmSQI=;
        b=yaxhLAsd69g1acz8sgKLf6SaelJ5uFOi20cGeJefPzuWWypMY9Dy2ThgobA4/MMDAR
         G/w1gBzxlv52ERw94OpmE4ZwDdlTI+u7TDKzjF8ej7hv5uIRNszATqSxoqmAY9ucquSE
         hW+qnsWFDLUTp7+9Hh4k00LyAtThuoebykm9JD4Ey6wH9YCoz5gV/W23+feiJRAABix4
         fV1V4rrfwmd8M1UJ4pTyhAIBa4B2Zll1pE5S5oVN+sIq/letCE/HGGqtqNVuPEmztk3V
         lHcqXyGIVQg2HgLuJnoBvNouUlpJ/vhMaI0sermog/+RIIrqLHLQiwtxQ9BQluoI6nTf
         TQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706182378; x=1706787178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=usiDcusxejCbluC36Vpk0on80rVNZ7Itzv8e5WwmSQI=;
        b=R930Pqfd8ULzz0aOKePgVQKatgzEyALepzaGbBb706souruROTY4RErYUy4hk/Oiol
         hTqyUsW9WDmjvZW/i/UqRrwHrybd+3lsR8buZSldKo2y/ZuleCXpQW2Hwt1Rszq9Y1/8
         ieH0ausnlbln+8x312wVccPsDpYOhs2A7ybqHrVENymKUYaY/PGs/2Tlvt+AzPOj1NKD
         FCI79M8AFB4hlbVfFaICFUZ/Gl2cnrMa31B4llejhqPrVHYCAIfCzlFXl+W+SwEhYDQt
         fFJVu7iq57ulsVy2l8ckiq0gGdk0Q/o3Ry5V5nlcFp625uCMOW3EVmUsSB1Uy5/G/UJC
         Gjmw==
X-Gm-Message-State: AOJu0YwX6Y1fc03pXhJFhz6KwZlwYZGG545BdRzFZHHuFSNjDcNug0zp
	q5uf2TfN7xGYTCFWmOh0bxKUmCQSOvJzLfliEgNBuOK14OSlIVToCZ8FcVb2QcakGA3rwg==
X-Google-Smtp-Source: AGHT+IGsV107+K7TOxmwkTUoUOuVj5/vzxbnMAjH8LA17Jnnycz0y2KEShse2Cd6EBIE1k2lRzS3OPhs
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:600c:1e1c:b0:40e:d2b5:f9c8 with SMTP id
 ay28-20020a05600c1e1c00b0040ed2b5f9c8mr10496wmb.2.1706182377907; Thu, 25 Jan
 2024 03:32:57 -0800 (PST)
Date: Thu, 25 Jan 2024 12:28:28 +0100
In-Reply-To: <20240125112818.2016733-19-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240125112818.2016733-19-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=ardb@kernel.org;
 h=from:subject; bh=+Hn8XwOONyFACfVl0+TV+ToDQrCQwdquUdW+H4YgWKM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXWT68tdC0+Wx7q93Op2UuuemL2I66Gngl4O3H+7Ly35/
 Kpcsku8o5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExE+z4jwyFGw42c5z81zN/r
 MM1w9uVn5tMD5VhYn2RUh1t9nJx6ag4jw4GL548zXrGP75w8r+pPiuyaa+HcfdeX9M3nENW5KuM UxwMA
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240125112818.2016733-28-ardb+git@google.com>
Subject: [PATCH v2 09/17] x86: Move return_thunk to __pitext section
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The x86 return thunk will function correctly even when it is called via
a different virtual mapping than the one it was linked at, so it can
safely be moved to .pi.text. This allows other code in that section to
call it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/vmlinux.lds.S | 2 +-
 arch/x86/lib/retpoline.S      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index a349dbfc6d5a..77262e804250 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -134,7 +134,7 @@ SECTIONS
 		SOFTIRQENTRY_TEXT
 #ifdef CONFIG_RETPOLINE
 		*(.text..__x86.indirect_thunk)
-		*(.text..__x86.return_thunk)
+		*(.pi.text..__x86.return_thunk)
 #endif
 		STATIC_CALL_TEXT
 
diff --git a/arch/x86/lib/retpoline.S b/arch/x86/lib/retpoline.S
index 7b2589877d06..003b35445bbb 100644
--- a/arch/x86/lib/retpoline.S
+++ b/arch/x86/lib/retpoline.S
@@ -136,7 +136,7 @@ SYM_CODE_END(__x86_indirect_jump_thunk_array)
  * relocations for same-section JMPs and that breaks the returns
  * detection logic in apply_returns() and in objtool.
  */
-	.section .text..__x86.return_thunk
+	.section .pi.text..__x86.return_thunk, "ax"
 
 #ifdef CONFIG_CPU_SRSO
 
-- 
2.43.0.429.g432eaa2c6b-goog

