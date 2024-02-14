Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E115C10A31
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 01:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707873933; cv=none; b=kZno4eOydkLWrCJlze52g69HjP10PY0lL9p88ImM6CTP9RretfX8OiA1AcElO8gLZDMbqYcs36NwfTtJwsO1HOZRfDVtnOqZ58gA/aCZ1qcrgIdKz0cfN5ewCordD5hpJJSrsz5Z2dsdF+giSxAEXvdVGj2SAenAMjmM/hYcu7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707873933; c=relaxed/simple;
	bh=yOEMQLS0HBWD1xpp/GEUAOHOe6zYSrs6EjP/pYr8yKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFs01rmXl4/KldDFj63HcIe/C5A/SGTsFuPLDUPWGixReogELNWn6N9u35ToWaI1zon+WhaWjRgjW0rUQvOFrjw4hEhe4bRpXUOo6DMHxBdQMcM2oxaYxIb8ldHaMfJmnLMI/yFy1uTRySN9FOmE58J9kJtzGUcXcUdux0thqAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIX2dB6u; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIX2dB6u"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-21a01c100a3so1990171fac.1
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 17:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707873931; x=1708478731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zqcKGjJIq8z28bcz9jGNmiRh2zlXlrXCYNsKpGAsbk=;
        b=kIX2dB6ucAGNGz3/BQit17apq3bZX5vgxTrRnVs4XrM8m4zL3yiyFeql9QyNtE2Iqg
         KAdkPnXgf7QRkytNJx/nYiXYu59Bi0/bl7wFN7nY4LnQCh8BbnUUbwvWGNQm9MgR1xvt
         JiX+kwq3x29ZiiQ+XTthSZHMFjmB3yUygM7VerBT5GE1x9KOP2+zTAJL2oxI6nZcxeKd
         Na+tpHPC35BnJgtYBvbxsptgEhSEEnwvJPx8WwHLRf8VN4M5QDgDDZbU9H/S2Q5dbLPg
         48v4Imk6mGr6/9GgTPYFGfj2SidYCdU0OVnSUeUCyjdyx9ERSJji/VPQjyrb0g7jcKC1
         7cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707873931; x=1708478731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zqcKGjJIq8z28bcz9jGNmiRh2zlXlrXCYNsKpGAsbk=;
        b=EYe4AuenvkUwEkOITNlTCqTu765unyCgjK8XeVX6OIWwI+RRbbrm7zTQKiyqkIplXo
         T5MWVr3JmglQCTUQxbh9EYkhL56Zh0w+o7Dvw+Zsm1NmQRVFOnz37am5g3ESNeFnnfu1
         L2qsXviHaDQr+587vA6deoz4MQozHjgqND4leX6921UhSMLuA66PkyvP28CLO/43G9vl
         QIcafPrVORkE/JD5AHs6K0nlbRgAV5CyBLX1HlyR4Xgf1MBl7AeoJq+Vw+HvT4C/p8N0
         onDY241o5XlrNWgsJEHLO3iHN9SzHKGcSMil0khqR4MIbA5BC+Bf9yXNcZTX7FCcXkNy
         YhmA==
X-Forwarded-Encrypted: i=1; AJvYcCXHR4F0PypMk/QXmulum0pF/EKF2HOnXR0Bx4Y83JA+P69fAT03JBvgSGbIIhXUlNuzfslx9EkRt33KrVvOd4hlKVpNwA==
X-Gm-Message-State: AOJu0YxvG/mwGuAjZtZcLVRNZwK4kd/PFb2IJ08a9j8L5i/+F/nw7R5V
	peTwgCAy1UuWh7N6gIeK0XigUqlU0fIl6dxR61GqVlTk/NFjL1Dv
X-Google-Smtp-Source: AGHT+IGkPWH3yWst8zIhaEqoltQddmcw8FOkSPKhRemNOFMvUlGw/MFK4UEg1BMeMV6v3qIWULcviA==
X-Received: by 2002:a05:6870:84c2:b0:21a:216d:3a6a with SMTP id l2-20020a05687084c200b0021a216d3a6amr1195402oak.52.1707873930990;
        Tue, 13 Feb 2024 17:25:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVv1/HqwbbPQn8gnhT+3LrX1gtJKlF9y4+dDoI8DuptB9zKlMmYPlEA9NbSXc7Wg1qo5pU1tT2nPwL9R7K/x0hS8W2NQ6FKvh7TFU7du9IwKDTWJTsYCzl/xgDX+pM/hBynoFTzCmtPyjqMTRnatvME3uCT2Yqmi5r+5/X0m9XOEvFf71xLF6HJ+Ch6gyxc3oAatPw9jPfzVxMrjPDUyVy52T5Bw1MDX5whs0UBXXDKWBKTXiat5eSwOir99hrhzR55jp4MkLwW9bUTSdGhqpz3tDxveYLBih+jg96V47GtOSIU7CQgGSijeXr8yIqDqpHgHVxhT6CRRwcHPXkVM1VAnhcr4WDy1//qmSNJLrIip2eevvh4bpwaApC0+d3Thzy0pToic/MDQa9oeFNNLrBhhR8=
Received: from my-computer.uh.edu ([129.7.0.170])
        by smtp.googlemail.com with ESMTPSA id pc7-20020a0568701ec700b0021a89fff00esm572928oab.19.2024.02.13.17.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 17:25:30 -0800 (PST)
From: Andrew Ballance <andrewjballance@gmail.com>
To: justinstitt@google.com
Cc: andrewjballance@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	masahiroy@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nicolas@fjasle.eu,
	skhan@linuxfoundation.org
Subject: [PATCH v3 1/1] gen_compile_commands: fix invalid escape sequence warning
Date: Tue, 13 Feb 2024 19:23:05 -0600
Message-ID: <20240214012439.879134-2-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214012439.879134-1-andrewjballance@gmail.com>
References: <CAFhGd8pvhzehMGh1XEHBct7CGEQuF0CZeneMH3D6cKSRj5UdHQ@mail.gmail.com>
 <20240214012439.879134-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

with python 3.12.1 '\#' results in this warning
    SyntaxWarning: invalid escape sequence '\#'

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 scripts/clang-tools/gen_compile_commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 5dea4479240b..e4fb686dfaa9 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file_path):
     # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
     # kernel version). The compile_commands.json file is not interepreted
     # by Make, so this code replaces the escaped version with '#'.
-    prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
+    prefix = command_prefix.replace(r'\#', '#').replace('$(pound)', '#')
 
     # Return the canonical path, eliminating any symbolic links encountered in the path.
     abs_path = os.path.realpath(os.path.join(root_directory, file_path))
-- 
2.43.0

