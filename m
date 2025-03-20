Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7E922AE59
	for <llvm@lists.linux.dev>; Thu, 20 Mar 2025 23:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742515157; cv=none; b=rluwAlkouq4xcxqz2NN/iA6boi6IoWMXWTX9c2VfAvNe+NnrELqxLnBtH913bafTa6pgJfEjQRq0BTZLzGqKJvFO1MVY/p+C3xvfotLGgY0WFwWB6f4s6MVditj3GShNaF25wCMBVvzNdgJvqdBrJyiZUhaqCHeifwVWfKkIUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742515157; c=relaxed/simple;
	bh=KWXgKeeRyxAABGX1lfsepKxCW80NDLlNH+a5wGO3ias=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pN/q5VXyyaLK5JKZGLHvyyemYHC0WGLFz5yBb2z583yh22DZ93xKM3Hnp50P01ClakEz5wJH2jCxVjzLqADOo71Le/xy7q5I3AKX6wN/pAQNIeg4eMH7PDYbM9+bTmSZEbp3bLQBvqj7o9omz3r12qPf0d3JSsDVxwWZcyCpCSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vAApHsso; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vAApHsso"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-224347aef79so30078735ad.2
        for <llvm@lists.linux.dev>; Thu, 20 Mar 2025 16:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742515155; x=1743119955; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=loL07EFpzn9RFKU+1xqTjFTK8szpohqpYkvK4IMMJvM=;
        b=vAApHsso54RNOD97794QqihZY1sF7TRjmN/pFtdr4bnYtknqAueJdmH8VOCbPBwHRO
         wc8FW4livlvELYA7VeDFrLwF4gUD3pGO6QGKiNI+ogIRf0tBLUaL/WFVeNnI682H4yCV
         3jGpRGimKtU37IaF85lOPwfbDcqb3pJLvdXxfH41aLslE2v9ZDKHa6Sbz15cYboKQP8G
         NYWwEU6sTcgTzmDMeXkQZbYu6PQ3qPD5klVKpJAs54Ye4yj5BZq5TSYYbpiEg7JEVMkO
         C47flXy6nkLoQqtAApnKTrW5pFtoXTmTPh+9289fhIlw9kiCfXyNCczmNPtV0SnqUkcn
         jW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742515155; x=1743119955;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=loL07EFpzn9RFKU+1xqTjFTK8szpohqpYkvK4IMMJvM=;
        b=cK07wZtBCCwlC7CmS3iSHGsmkj/12aEBdGNjhU76CQtSnnYrnOxkfJmAfZ1hwXEc1S
         WJnRbQ5x8FZYs63XcbvdDTZycmArrj4UV+dUJDFrXbnYK27RL3QRbUQwF078khb7a16t
         ZaAT74ZUuQMsJwDrP4bg3FiTQQEFDRXcookVAhMxSyidV4NXSLjDVsOAbyNxsPlpdIFC
         +SNB/WG04cYYet5+NbkrHLdWcKLLldDHAJdjT82fn/CMTZoLVqrBMMcAsZNewwnhBvpS
         XMLHtR7qxJn5Va4btDjpcB13a9p9cWtCLwx/leUz3k4/O1ornbf7IlIr7BXvbFMTbTuA
         mxqA==
X-Forwarded-Encrypted: i=1; AJvYcCWPGzPwsy/fghxUFAIsFFk0oY4qSw6ReB2chpAifo/OIh9JJG0jLDER0xE1iiYcrjupMAzt@lists.linux.dev
X-Gm-Message-State: AOJu0YxstH0w79sVQGsFefDlGDVZOnCHyL+gsvZDY6Zz3LQcNkhvREwT
	XXPY08tBQMa16/8Tuui1SSaecqtvGbGSVPrlaYhWq9rDBy9LVMn+Mg7mLG+oZpveLkhE+HoDTWD
	evyuZfr6xuDJg8R3HvA==
X-Google-Smtp-Source: AGHT+IE1j4tW7U4miv/y5fn9y5TOdg/R4Dy4plBXh7gVZbeDYE6afhmC9AZBc/+Ph53Y4uJfcVzswUVKCNNLOFbd
X-Received: from plgu5.prod.google.com ([2002:a17:902:e805:b0:223:58e2:570d])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d50e:b0:224:7a4:b2a with SMTP id d9443c01a7336-22780c50a89mr16920945ad.11.1742515155584;
 Thu, 20 Mar 2025 16:59:15 -0700 (PDT)
Date: Thu, 20 Mar 2025 16:59:10 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250320235910.334620-1-changyuanl@google.com>
Subject: [PATCH] clang-format: add for_each macros from libfdt
From: Changyuan Lyu <changyuanl@google.com>
To: ojeda@kernel.org
Cc: nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	Daisuke Nishimura <nishimura@mxp.nes.nec.co.jp>, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

Add two for_each macros from scripts/dtc/libfdt/libfdt.h.

Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 .clang-format | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.clang-format b/.clang-format
index fe1aa1a30d40..4decda7474e1 100644
--- a/.clang-format
+++ b/.clang-format
@@ -210,6 +210,8 @@ ForEachMacros:
   - 'evlist__for_each_entry_from'
   - 'evlist__for_each_entry_reverse'
   - 'evlist__for_each_entry_safe'
+  - 'fdt_for_each_property_offset'
+  - 'fdt_for_each_subnode'
   - 'flow_action_for_each'
   - 'for_each_acpi_consumer_dev'
   - 'for_each_acpi_dev_match'
-- 
2.49.0.395.g12beb8f557-goog

