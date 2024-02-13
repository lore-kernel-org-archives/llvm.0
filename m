Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5193917CD
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 02:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707791330; cv=none; b=E177xYRWVrEXDFZLRzfZ+GvsCTBtcjlliFfMcoa+r6r1AsMjEgrino3i042crMoOfoD7SK5RHuQ1/1gYcODpbeC7ue2wBTP4vLwmPntyNnzeMHQQ5Ofa5PQ+x9dPKICJahc+nR2u7w3S0Iqp6ATurDnuI68tvcdRAxG6u4HW1Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707791330; c=relaxed/simple;
	bh=lS7jLHLrY8Ciy5hAj58zcA0N7SPeX/1bhP9tKSiltgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CP+y2Qu2cdYaMS2OAePFGJITg7FzG+be8HKhacjPJPiQ4S5oHod0SF3sJjCXFRi/C+/Mat4q+XxBEOj42hLLpC6q51Y7UJSfmDQvtiXcmznrDWcwzxIhKhvFD1XM5iwZMmXWOl3VpYflpjDbkmCMRBBUUO1dl2Z7yv58ImyFWuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBVvDCNI; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBVvDCNI"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c02adddb8eso2067743b6e.0
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 18:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707791328; x=1708396128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/OmXCx8g8elO8SoedySQ4pLKPgoxvCMvmMdcFHXu4s=;
        b=SBVvDCNIobQgBcDpbPel0/byTjpDu4SZpea1bqVT775pS6OUCvvB1BnhFVKYRSm/kZ
         2maXRzbNYRdt+ZMWp4c7Lqvb+zWkCneSOo0C1yzgBV5BvCSiX6UNvq4axLENDun5bTHV
         rMtEiWRVA6Yh9hCurnsH5tfTwxhaj+G3JISZy+2eXPtrmsLfg2BVjoXDl+Q6JDxgkZQq
         gpppu71O016z6tt6zDS/uLdghaBfpcfaxqeXnmH61R8D4e9pLLySlIinVlYzGBXm/5HX
         xkwn6je9TY8llPweZzf6a4dWdEGix3fe21kQuIoOZFwnOBR3tGQKQmMy+PdyNNIzFiwN
         bHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707791328; x=1708396128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/OmXCx8g8elO8SoedySQ4pLKPgoxvCMvmMdcFHXu4s=;
        b=eJmxx3vm8D6Z6VtoiPQYzXxTn4++6sy1L53Q5YigrllAcZHUnqD+1p7WC3HCtu+won
         tc0P8cCBlJTEpsCRhhJmejRoSvfwa0KmO31CVjvxzHePFOyuQt34F7byHpPqy1fvf7P8
         i/fr9WmQtOePdLOjqJJCP0uVOZa7flJwSHMefI+YbjPqwIETvoALFlCMNp4GkrDdIYa4
         qzlThgcyRLQHjLYhqdtm1V98XIg7I/gK7e8n+6F6Wf1qeMpm7kS8H4HN2gi8FoZWqSRO
         YGCDHgmmCVv2GfSCVFq64yp6tPMVrbIp8cxl7VgddV981djfrikDXqKO+w2OH8kapZhi
         CyNg==
X-Gm-Message-State: AOJu0YzIPxm7b8HLOhVF6VymTqjAasULxrhmFsAvDcJvjTVKlf0irQb7
	0PtFeTT+dpOlz+1YFR2ZomOwg3PBhbcjKHrsIvXeIATMjLqt6+ch
X-Google-Smtp-Source: AGHT+IFYE7I8Dz7ov5LfZYYYrsOfOjyDP4rG/WT2wczaUt7Dgw8hcpzrYmz6aIurdM+JQ9/CSsvUjg==
X-Received: by 2002:a05:6871:29e:b0:219:92b2:d2cf with SMTP id i30-20020a056871029e00b0021992b2d2cfmr10616708oae.27.1707791328369;
        Mon, 12 Feb 2024 18:28:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5Y0UHdG6DgUZwiOuH/Mdr3BAT4veNANsUUPQjuqvFL+K8mT+mGuzm6hZA1vBJ9qfWluwPSx6wZORKT9+4/9mdoZnmvScFYsocx+msYPh2yBq/VS8/JhtZnHC1GMGSLoD+Lu8sKjudVeNVZ50GwVZLQV2MWzhUhHyN/eFEe0us562vuywl5GTgR3V0/jGsn7Tax6wAyGtlLsK26HOAp83q1wfDW8dGu3KLL+OY8XLhPIUJZyJi/zlQ6/uR0VdXJabCNCJzz0mR09KFFAXrHfuzFxvF7vUa9IOGF+l9kd0jRXnJZMD63iyI7j7YV22Dcl9GCxYGTK/9wd2njqdB6hfWFK58gA0jtbP0PmUfk5CHSdbLjhKqcyjxStNnSZUmA73YhK/sOUwH/2g1VLrRLdAugJApLg==
Received: from my-computer.uh.edu ([129.7.0.170])
        by smtp.googlemail.com with ESMTPSA id z9-20020a056870514900b002198ca39e99sm1659648oak.17.2024.02.12.18.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 18:28:48 -0800 (PST)
From: Andrew Ballance <andrewjballance@gmail.com>
To: masahiroy@kernel.org
Cc: andrewjballance@gmail.com,
	justinstitt@google.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nicolas@fjasle.eu,
	skhan@linuxfoundation.org
Subject: [PATCH v2] gen_compile_commands: fix invalid escape sequence warning
Date: Mon, 12 Feb 2024 20:25:52 -0600
Message-ID: <20240213022552.754830-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAK7LNARaW1V5X79BFW5_YTKY+n+OSp+_ACpRxpiw+VOJ+2hf=g@mail.gmail.com>
References: <CAK7LNARaW1V5X79BFW5_YTKY+n+OSp+_ACpRxpiw+VOJ+2hf=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

with python 12.1 '\#' results in this warning
    SyntaxWarning: invalid escape sequence '\#'

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 scripts/clang-tools/gen_compile_commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 5dea4479240b..93f64095fda9 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file_path):
     # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
     # kernel version). The compile_commands.json file is not interepreted
     # by Make, so this code replaces the escaped version with '#'.
-    prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
+    prefix = command_prefix.replace('\\#', '#').replace('$(pound)', '#')
 
     # Return the canonical path, eliminating any symbolic links encountered in the path.
     abs_path = os.path.realpath(os.path.join(root_directory, file_path))
-- 
2.43.0

