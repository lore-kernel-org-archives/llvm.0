Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D768615A4A4
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 18:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551563; cv=none; b=Uot15TRtGD4dFIvUBwo7Mh/7J/4eU0HcpB4J36Hbli+qFkWP4/OwkX122KRr5/ENq4sEUYZYMXJoankOZAWM/SjPNW1aeLKN7COMk1DBSWAR9sR2LHSg8Juz9byiYR35/RDladwYVOfNOs14db1c9NAwqlW1E/iXtK+TNtK5izE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551563; c=relaxed/simple;
	bh=ywQcTtrCDMHJcI+QkXWX2nFyJwoVE8xehI2i+Z3nGsk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d8G1Yg2a6LhI1C2hqO0uQxCP4f2uMxB8+X1U2DVD4dy8+uYUH6dSS8+lsBAwbREfVD3UrQjwcU3iIsMjVXMFBF51Ln9Bhfd1zKr9SJSV2gVd+u39mzs+34ge6qoXHtHWqhXEm36z4iGW69xa9XZjiEdbsfyI0XirdKQK3AbJ4Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hZppwK7v; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hZppwK7v"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-33af3a64df6so416936f8f.1
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 10:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706551560; x=1707156360; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fLLl1bcVbRYtnIzLBeH2xJGti8beoepv/z/uSZlJPHo=;
        b=hZppwK7ve2Icwhau8/WzadTxvV/XT1n5xzbZffZhdtahe+BbDWdNUSM1itShdviKm4
         k0IhkZH9aQed6Okgw7QqkjDMltNyOZQfYyIMomlBWiKf9RG2EJ1ZOVFaxhA+J8gs03rN
         nDHwJyQruS/LshmNLkIB7afTIEwh31a1NseGLbR1ANUEJ3WeCGrcOZasrWU0T34nAZ71
         b6fGcqhNxroBD8ZYa+Y8Hy3mPNgaQCruPPtu62dbVgZlymIrc4n3wIjKhfNwoF31LfNe
         rntV6r8tpAkGnMWNhdgAqehWdtea7WJrJhH+6ico5jHQBsXvTMqo5CfJvCs/goeWIqw7
         5OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551560; x=1707156360;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLLl1bcVbRYtnIzLBeH2xJGti8beoepv/z/uSZlJPHo=;
        b=u6vEoJVWCf0+LX7DiLFp2UJwlKEqzuO9EFxSRZTV8xAy5WQq5UbFnanmRRW9u7aE8/
         SY/K6/ixwumL6KmXoQU5Qep778BLZWy1a+KawNEpm8UeGZ+KdsclGVzbE1SN80oCyAcA
         nddYS4Q1JqjqTzWkZLB7+ECKnmM78dkLNce7qH1HnEo2rZ2NtCECyPZBUNs5O+XjbmKZ
         J84mgpWeGGrT9F/9qpYcUt8fV2A3NLun3vzHds4mDlCn2ET1fFf6CTep9ggTJ3b/cAWu
         ROeImZlhDzNIrwarO+0L/6jQ4F0wccHMcqXU/C5vZ3EX4EKRCnsDa3GACmksswDyaVZo
         6Snw==
X-Gm-Message-State: AOJu0YzJTlDV7lZqyeOIt3Di5OToZ+Z9LmDKcqTu52dXDSw5BOwz5hho
	65PYRJ1JHKFaXnoHhOaC9Ac0sOWunyNn1Yg7VkBdgJ3JFuSpAdcUQb/X03bkYuejeHYtUg==
X-Google-Smtp-Source: AGHT+IFRYaQgWgn7lS/fBsOiZY67lNa50V8yvvYuuoCz5vPDJOnfUaUEOPLRn1IO8EMDt34AydE5rmRl
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:6000:1e06:b0:33a:e517:57f1 with SMTP id
 bj6-20020a0560001e0600b0033ae51757f1mr89123wrb.0.1706551560216; Mon, 29 Jan
 2024 10:06:00 -0800 (PST)
Date: Mon, 29 Jan 2024 19:05:16 +0100
In-Reply-To: <20240129180502.4069817-21-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; i=ardb@kernel.org;
 h=from:subject; bh=DDaOUA3J+CFMHhm3e2XXAeDqtyhjkdr8A2J8hJRp8QM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXX7i7vMP9b7C0XfsczNYLSSucj1x3p6wJuiY837VhzfN
 +vbpewPHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiakcYGVby7QyTU6idwMOc
 J38qUmJ1p+F91buzM3Z8Xzphas7LJ+sZGZYqnkl8ycjtbnKv6+ovZ1E/e8uaWONjpw6xe+z87Cp rxgYA
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240129180502.4069817-34-ardb+git@google.com>
Subject: [PATCH v3 13/19] modpost: Warn about calls from __pitext into other
 text sections
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
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

