Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EBE51017
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 11:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706182386; cv=none; b=etD0wGd+7hnDNhIFvJfo/zb3ptJhzR361pidGtfGmipQ7hQJaysqJAqEqtn6C9zEpt+b87S39+uGLOHK5PRawwyaIMn7aDH9phvtIGvp2tf9FWU9n7wqhfdum233jo2SWEcq0IYREKZG1mqE0Tw7NPwlA3EAD7pXJTQCoPLRV9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706182386; c=relaxed/simple;
	bh=ywQcTtrCDMHJcI+QkXWX2nFyJwoVE8xehI2i+Z3nGsk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m4cLuWE8vnjuNKUo7UOYMX2+P18kQdMi3PHF2NXE8eVJRdQaOF5uqqfDLJEvtLLy8TQfbeChxFBL6RVBqmuM96eS2fLC76CFxmsuYCvYoJEGW7nsZpn8gH2SBngrl/CJ+H8h11RL0okHJNKVsYrAJaBC52AHJZZIknRSXcvGLTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KJl0yM6A; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KJl0yM6A"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-40e53200380so56708195e9.3
        for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 03:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706182383; x=1706787183; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fLLl1bcVbRYtnIzLBeH2xJGti8beoepv/z/uSZlJPHo=;
        b=KJl0yM6AxvWfjapQtl6GzLUzgVtRChNG8pf/LBX5fLRtTlfS8H59YVlXQPZMIg2oD5
         HE1XlQD2m0w2Bhd7rqPnLvNVU6p2VkSf9clLy7TK92VkuZGGlQCKw/IpkY7Mafz3DPFg
         wh7nD+k7j0PJCnsgRZ+c30DIu6kkocGqLFxDDYWzjHDZxaaKlhLsZNXWGNAwJHLuoOPM
         jVeXOp3SuEVJOrLKi8OJJrNJKrNYTW2TEGT0an7kFwTwLG7AUMUpH+/n9Ysh7l+DX1U7
         NbvE37IWY4raQ09frLp/GYMsTlHJE4Q9UmVNoUZYHGjiHyPmqUYlydD0hOPJVrlBFuqx
         hnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706182383; x=1706787183;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLLl1bcVbRYtnIzLBeH2xJGti8beoepv/z/uSZlJPHo=;
        b=hd/Z6CXgWuDCmPNQ9omGPu4jSM2NWpCZ740g60CaCf5+carhhJ3xe6FxKAneE7zvN1
         ZD6ZrpIEexlztabMlACcAQZdOMd6+o7/lK73HhfGh7Z248nQWCng0+WkKbJCZf6k+lBy
         S3bz5qu5XN7Y08TYI4ei5Ql+EHoJbkSTabe64o7HKbxDJG/eHrZzs4thUbGbtGgX18oI
         C/laD+p0VqRrtNXwkAz4M+YVaBJETgQxpkPhjfFP3XT7xuvIWyClk4XjE4qXov0Rlwca
         bfzn3YDGpXxuRSueEawTuOG0pxus4ibhotlpYdAF3QVcLrdoZ1ASsgc4yBrIZEnqrUZT
         aJOQ==
X-Gm-Message-State: AOJu0Yw8pwO7ducerwXF960tBQvEsURo3wYvncyZiGJSKNVvlLa41DJg
	hb21r7ga3mVdgRfJYxpdj9TkmN3UBkV7lbeQPoEtt7RljD2QRHO4VCYOz7I2/C/jS1J0NA==
X-Google-Smtp-Source: AGHT+IH+tHtY9FWpEc9qh8w6jVw/qndHIKRZi4Zi4jc1hJlvKLmXv0672PzSqvht8FRd715mL9u57xeg
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:600c:4e0c:b0:40e:c720:f327 with SMTP id
 b12-20020a05600c4e0c00b0040ec720f327mr14276wmq.4.1706182383051; Thu, 25 Jan
 2024 03:33:03 -0800 (PST)
Date: Thu, 25 Jan 2024 12:28:30 +0100
In-Reply-To: <20240125112818.2016733-19-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240125112818.2016733-19-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; i=ardb@kernel.org;
 h=from:subject; bh=DDaOUA3J+CFMHhm3e2XXAeDqtyhjkdr8A2J8hJRp8QM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXWT6wfmH+v9haLvWOZmMFrJXOT6Yz094E3RseZ9K47vm
 /XtUvaHjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRpg5Ghm0sH1ScTbRyzT9y
 LT5+VOxYRanmRG27Jp4J++av9Zuc7sLIsLeAS7395J5HEZYJvUVbV/Nxt13WjZNdJpJ7wl/vXc1 bLgA=
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240125112818.2016733-30-ardb+git@google.com>
Subject: [PATCH v2 11/17] modpost: Warn about calls from __pitext into other
 text sections
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

Ensure that code that is marked as being able to safely run from a 1:1
mapping does not call into other code which might lack that property.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 scripts/mod/modpost.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 962d00df47ab..33b56d6b4e7b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -825,6 +825,7 @@ enum mismatch {
 	ANY_INIT_TO_ANY_EXIT,
 	ANY_EXIT_TO_ANY_INIT,
 	EXTABLE_TO_NON_TEXT,
+	PI_TEXT_TO_NON_PI_TEXT,
 };
 
 /**
@@ -887,6 +888,11 @@ static const struct sectioncheck sectioncheck[] = {
 	.bad_tosec = { ".altinstr_replacement", NULL },
 	.good_tosec = {ALL_TEXT_SECTIONS , NULL},
 	.mismatch = EXTABLE_TO_NON_TEXT,
+},
+{
+	.fromsec = { ALL_PI_TEXT_SECTIONS, NULL },
+	.bad_tosec = { ALL_NON_PI_TEXT_SECTIONS, NULL },
+	.mismatch = PI_TEXT_TO_NON_PI_TEXT,
 }
 };
 
-- 
2.43.0.429.g432eaa2c6b-goog

