Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5542FE59C
	for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 17:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080711; cv=none; b=ddmDoYZrnUASuHr5RE1lF5uv0rkn198DMwtxDuCh4fdJbVLnM5sHLSFdjJBwsr8zsR5yrfvkVFUcjN2Ejs7GT9nBNmIj79q6exXlW1Yblt8Jw9HbLJZA6VveFFoFpi1mGcPrdfw3BFxrVeaDQBJex8CBS/lENAHbNfM7T0WOaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080711; c=relaxed/simple;
	bh=Z4KNmSbzCRQ9FO16Hx9lP73OGb9Qh7EQcw3jrjxUPJU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=X1jwrMlLsu1bA7YCbX/QUXdo0OYPzrb8iPPQonT+GAIw9wncZEMSqLwIYR2PBEnulD7So6W1XiEJ8Qsu2VdINP3MFOU9pSTivyJyKTJ4KnmXbThEyvGLtdwuyOcgYoyf25TpNtZUrLf3jYD2ABDwxvPHTXHH1WvJw5LVk2L0hqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cm78rUKB; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cm78rUKB"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c0bead25feeso789234a12.0
        for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 09:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766080709; x=1766685509; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dhOE0qDuO3LHBfcaO+AbZihIszuhVYqbQJCtl05LcL8=;
        b=Cm78rUKBLjJEm7wwIJkdRYigIiIG70Zs3dvlBSVzGaFi0okyCGa8L2qc0hVfCoUM5i
         kxYxu1/kiyrsyx11P+e1bCE/lXNqNoDpjvLKlcMkxqBelGfGmByAMFj6bxYVZdhtspsn
         oAu9EVc22P/yuIclRN+cK2UfnA25KWU3Dyl3E7ctOJxxyzGoXyU5psXV1TyFDPJExy64
         TYOBbXaDsLsEdkJPJgdh+lKETg0OkKT9wv4g0s8sBCsf0HsuoqlnVve32kOLs0Ouutbz
         xPcdVJ58ryaivFVWDqztNzYVRK3/z0J1BSBFFgOdAPhWA+JHhntG3WPvzXZHKIgf5+L3
         UT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080709; x=1766685509;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhOE0qDuO3LHBfcaO+AbZihIszuhVYqbQJCtl05LcL8=;
        b=Gvl8k9gnx2kZbbWwNl2dr7sZCZGaoKz2Id2FK8SbyZl5ebZM99l6QmzXEZIGDK30Hn
         J8iSE1We0U4VMyz7k84fSoRWDbUAjXvwo03tHHuA3noJ5eJQvigIajWN1r+xsuup0UWb
         hR69EIOfaG+qOa7gXoQ33YMIqn48GaUYFGACdQgrtNDsxm1m2+VaDeV4296RId4hjMqN
         ABKDowmucG9Q8oXRPDsmzkp9xaPJed/R9T2VlS70WWnaPEegVp5m75QxK00Wj846B7pS
         iKCh0GEdwU4iaxATFi+IC4C8iGwWHI4Il4h/tWdzAuxtIdJfXerdiHZo1jSto0GDKrhh
         +OvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDz7JgvbN1fctP4RqNWJxCRZdf90A9tYV3reaN1tN4nKrQr7sJTjd1JHNN9M0imNzFIqAC@lists.linux.dev
X-Gm-Message-State: AOJu0YzmJakSGmc0QVDMhjwR+RG3LaRY50FN9SXD2weiA8sImXnTcb0a
	lLNnQwHpjgG+FbG4WOshvuY/mOUE+lDPC/nELKf1qssRY63CyJ2wPPXobuGMc8Bqoxla/9jtFEz
	3J4Thz3zACR9FBQ==
X-Google-Smtp-Source: AGHT+IErkw9tNWlT8KhSs/OKoLzI83M92d2V9nNa+7cdO5vCZtx0OnC4z314RMstHiBKRzLsamW2JVeM79NOtA==
X-Received: from dlbbs11.prod.google.com ([2002:a05:7022:90b:b0:11d:cfca:1df5])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7023:d03:b0:11b:9e5e:1a40 with SMTP id a92af1059eb24-121722ab330mr138760c88.15.1766080709402;
 Thu, 18 Dec 2025 09:58:29 -0800 (PST)
Date: Thu, 18 Dec 2025 17:58:06 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251218175824.3122690-1-cmllamas@google.com>
Subject: [PATCH] kbuild: prefer ${NM} in check-function-names.sh
From: Carlos Llamas <cmllamas@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

The check-function-names.sh scripts invokes 'nm' directly and this can
be problematic during cross-compilation when the toolchain is different
from the system's default (e.g. LLVM=1).

  scripts/check-function-names.sh: nm: not found

Let's prefer the ${NM} variable which is already set by kbuild. However,
still fallback to plain 'nm' to ensure the script is still usable when
called directly.

Fixes: 93863f3f859a ("kbuild: Check for functions with ambiguous -ffunction-sections section names")
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 scripts/check-function-names.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/check-function-names.sh b/scripts/check-function-names.sh
index 410042591cfc..08071133e5a5 100755
--- a/scripts/check-function-names.sh
+++ b/scripts/check-function-names.sh
@@ -13,7 +13,7 @@ if [ ! -f "$objfile" ]; then
 	exit 1
 fi
 
-bad_symbols=$(nm "$objfile" | awk '$2 ~ /^[TtWw]$/ {print $3}' | grep -E '^(startup|exit|split|unlikely|hot|unknown)(\.|$)')
+bad_symbols=$(${NM:-nm} "$objfile" | awk '$2 ~ /^[TtWw]$/ {print $3}' | grep -E '^(startup|exit|split|unlikely|hot|unknown)(\.|$)')
 
 if [ -n "$bad_symbols" ]; then
 	echo "$bad_symbols" | while read -r sym; do
-- 
2.52.0.351.gbe84eed79e-goog

