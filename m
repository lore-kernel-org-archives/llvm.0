Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4760315B7
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 01:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707787273; cv=none; b=HRYaaYtB3lHswRMerAMLz8lPnoqyVim4vfO1XyEp25ELGZGA4aUH5d1kc2mo62vNkcP30NqW9ClF09Y2b9Z8AzGx3Blvet9hQCxshKWQ80So5k9m8gXvFjz1P3UZkenSMsimXrvVxKr2BS2ZIj348htXIbiMJXx9MDerAxZjkoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707787273; c=relaxed/simple;
	bh=MLa4lf5uOURASMI9xTK+nE7rsYG01Lm5JO7kjMN3Hug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FifO9poytpScWhhC4rYEM3oZFuv6hRspcP9QjhkAiY8m3V3t3JBxuHfck6I4Q1jxACkDm+Oy036Zfn1wQLpOMa1LZvc/hKhhQ5XF34h05kP9NWbN0XWXmuYhpBZKJLCZGbVKlwelcWGdgc/Xkl8iYNh+wf9H+9WmC585fTpQG88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSLTojKt; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSLTojKt"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3be9e11ee59so1918278b6e.1
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 17:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707787271; x=1708392071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIo9+CGA3o+sMvcBIMz3KkHVBSc3Wr6nRUoyuv+/nR8=;
        b=GSLTojKtRiq6lkimHKTg5JJ55XoRuXeMnGhPb0OQT1BGYj71eNMpv5q3uLCLPj8LcZ
         KeT/u3NiOpd3iTnL+fjp/ET+WRkOWrN3HzsxsLnWkYf9wFpaHhW/NtJR9IhmiPEu84wl
         OSih6H7YO2mrVAQSxZs2z4dS3/pp2dXxQwT0zQ1Fvzv4zjzk2YcrhDcjCffTqAl8kn/l
         GCzOTKZ3gIQGmkGR6Whvyqo8pWe0QT1FHeQ12BxbaxgCtctA6ioNPvol+Qzub2SMzxI4
         5Wa9PQPawkAMGeaekAPAi5n2bMPz2U6s41vKau68JDOTSHcDOhcUo/PJcLXWzuBSbBNJ
         t2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707787271; x=1708392071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIo9+CGA3o+sMvcBIMz3KkHVBSc3Wr6nRUoyuv+/nR8=;
        b=JU8hD41GWbkTqN0HgHWIibgIky5Mn5cIcx0oMDzfpOnk5pn81t+ZArZplBBis8+8T2
         TNJBc0NzN3c6u6o/kqSoxmry7/LcqQ9Y845uuLxjp3lfUu407zELEsT2YQ5g+eePLbX1
         Ybkr007Wtr1DTs4x6ClkuLpxTBOJUPeSJMCB4OIq5TfHmXKX6MsBpIJBgxh1AemjzO6f
         zHII2JIS8Te7KQh+lOfEFoxoT8MZDS51xF96IP8cQthMTHyBJUbTnglDhTSlhBHP3aog
         Y966b0RqX0QcQvCbi3IzeIv9DzAXwY6vcSTqPekOi2k7pBxk2xnphuUkFkAv7sJr42eo
         nLEA==
X-Forwarded-Encrypted: i=1; AJvYcCXBhwwRb4X5HIu2JZerDzCycW44zlZy+NeLeAbb8AKMfyaU/1xDNWNM0Pi8/jbr5mNlujy7CJtm6F9JlD2zIAQaZnMRuQ==
X-Gm-Message-State: AOJu0YzzWVYHABr9waX33xiLiyNxbkL4wxbp3x/7MtMk2JDvQJ01Ocye
	Zjv15eL9bLgyQcw78cV8OQf4wwjC1Pb3UfaCM3G2iGFF7q3o8tsi
X-Google-Smtp-Source: AGHT+IGjp+ccfroJZ3LNYqvyf6Zlsgxk1ZaLug+4zFgnhDGKHley2D321KNOkNQyZiRxP83AMZcHrg==
X-Received: by 2002:a05:6808:10c4:b0:3c0:34d9:4d7a with SMTP id s4-20020a05680810c400b003c034d94d7amr6265831ois.18.1707787271258;
        Mon, 12 Feb 2024 17:21:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnosEBHMfhXLylxB4Sd2Ldd2A9Q8ewSUvpAgHc62FKI/C23e856L052Hw6hUbM3KAgZE6n9p1UWawNKbVUE3sQfRjeGKBGiXBCkGbohcOsXDQp6T1hAQ0PdbOGLG1pvF1dC9JkCbe6JjZaWbXeaQqcLti2l6Ofthy7oTKVIrUGbpQhGCvr+oaB1BcF2jP+IxyzJmc44YIYcVULUtimTKQXO3KLR1roFU+/cVxPl+689lIndzRTtZqW/Q7agREhmuDKCbVYMGrbdsiq4p1hEguZAis1OTJunv/+20VabCeCDHv5dQWaGJqHuHtMamai6zlKmpYNoj0f5X1o82JGVrP0hIroCIfaJoILcz8TFFQ0S1axztVuD222/fARm8P5OfAoXW8PKDb3YS6tk45Vq2vA6g==
Received: from my-computer.uh.edu ([129.7.0.170])
        by smtp.googlemail.com with ESMTPSA id k18-20020a0568080e9200b003bfe05691f3sm277684oil.9.2024.02.12.17.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 17:21:11 -0800 (PST)
From: Andrew Ballance <andrewjballance@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Andrew Ballance <andrewjballance@gmail.com>
Subject: [PATCH] gen_compile_commands: fix invalid escape sequence
Date: Mon, 12 Feb 2024 19:20:33 -0600
Message-ID: <20240213012035.750928-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this fixes the error, "SyntaxWarning: invalid escape sequence '\#'"

the error can be recreated by running
    make CC=clang compile_commands.json

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

