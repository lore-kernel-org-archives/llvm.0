Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E8D1A23A5;
	Sun, 29 Jun 2025 11:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751196663; cv=none; b=Ed+9+YqL3X2lLljolnYV4bTzlOGNkcBrhdkz7Vd1mCtReKsI6jffC/euns98jjlNHjqNKPTu2PSvBl+UpZ6ihp7ngXR54jYYb5+Yc1Ff2TQhhFJyBm0QW2WQJxgesONVXvhqzYS+WWnHEjySF4lkW0l7cUozg7w9ATGejRIwfqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751196663; c=relaxed/simple;
	bh=UqJ5yC8IXVrYyMPp7M4cddX+td36SAkjeKoqUf4iZHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AMr5PADbINTaAM5abivRiJSnKabqb6ezsoYsJpGiooovo6bITaVVsoZ2wwLrcPkVeUXtibwDTod08DMGxzQIkkj7OKojaabXLpLV/eShjFE3wBlJkuXOOt4TLYHz3pAcZQM/LGoquvOh/cuEzjeKF8S88CnRRrIWL8KqFPOplHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3XQAyw3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3XQAyw3"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313154270bbso1059220a91.2;
        Sun, 29 Jun 2025 04:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751196661; x=1751801461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o46zGpyrwMV+rXCp1UXOdJkQcBjDglXNYVLQA/nYN1g=;
        b=B3XQAyw3VE/hRJcIhijujFQxhDuh5d3KqB1F5rVBJt4WN8kuc/LC1yQUCF4LW38LYo
         68mIlAkwJO9wtlks8+zDi8EsvRkIksm7zxsXSf0Uj2/ysmFqLpYIqRLLbUfobdsaBcan
         Jlb/qaIoatyGshY7s4w2lZEAsiHoBkIZGN/NUjEYiKclb/KbBsufOVWnxMxOfiUjPnq4
         Zd2pnC6v2F/IkAcFFUGUpMsXZwHV68aFZJoocQ/vwzYdSk/mEjaX1E6Z37U3nwqlEm62
         ToXY2IWHGimmzA6B/mgzVjNi33U0X9IMIWEx3JTu5jtrYeJH44sq4O/yjuKDTDMqwY1F
         xBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751196661; x=1751801461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o46zGpyrwMV+rXCp1UXOdJkQcBjDglXNYVLQA/nYN1g=;
        b=wEukjlan5UQeuRHsPRiLjWV5JMoe1vJkit6yOW0+Gsp4Rk9mHAUlCyCSNAvkv6XA9y
         ZoU6+Ms6/vmcupSY52p7NLQjZGf4KZswB6sAZAaUdaYpmh8Y8SaOmE4qzxK2BH+yqaD2
         qV926/TiU6yRCpsuLbP/MiSpITpUMkN0H2Q40Les7uwQdBRHJOgeaLdHdoNo7hvtyLnj
         /yG+VFVlgwHILjYtUmhjZBOdFtL7iXF6I0lm7HQSB23c/EeHFh6mwwXjIJY7TKgfP8bR
         xQJV3xJ2XS/hkXTh0t8wb3vIrb4/OdVNiLMVd+vp4zXB2h9fzzNkaaXza8ueTRsRjnWF
         BT1g==
X-Forwarded-Encrypted: i=1; AJvYcCWk2oUeBsSC1ei3WifSQkxcCxqfEgG1c5jIab7uEsGKWqWgGlwtf/T0+IEbUsiZU0DWDKwtJIHbv1nKyD+V@lists.linux.dev, AJvYcCWwegJyCyjoZYT4rifa3HmfEOpWCeRRFkToM4wxc2UDVrQoNg9wQtiv8pKfBf68UhzdJO6f1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRjjO9QyEqM54v3b/WV5C126+THEUhkTswoqA42qB5R65JGk1h
	ooIf1omElqN96oPAndtDjZEdBXq4TXDgm55cIAM9lv1sO0kjyir2yGa+
X-Gm-Gg: ASbGncsTSNUX7C8yXTLFnDrlg4d7b7ecTqp+NSFSj0XZS4RvdkqAK6Q4thO6jxKPtwC
	fuWqKjW/zjJZjS5u9D9n5fkRQ3LOgStbQ0qXMDLLGsQEjqV50ZLMXDu+H0TVER8XnOR6EISfg+p
	h9ZTkNEQMhEBnDzGbsMZgHbjdhclqotLmh987ceEkLhV1bhxqJO+qdAiypjPNFp6TKPTW+xm/nh
	45fQvQ6RF3NIOXNE+/S+Uj9G0WBDD5dSiQ1AvKYU4odzTXvz32YYnhNaoQ94brmaJ56pS6ck8ho
	X1APiM1Op4Om/N5Be36rS1MCt9iIjn1isSoJNbRbBdxUwrp5cuIheRKJe5H9i0n8JFHJioHKV9B
	8PAWJ99ctJKuKE+CrPY4pCvbT+lji5jbhrN1mMD1eVrHCvId21wBfSTQmfNPE
X-Google-Smtp-Source: AGHT+IFvo+LkDyVCc2WnJ7fJYF9lW6fRmLFZJRmkVSMwgKjDjypnxlC0XPNBI8jPg7mmOJe/LyqeVA==
X-Received: by 2002:a17:90b:3d87:b0:311:9e59:7aba with SMTP id 98e67ed59e1d1-318c8ecd027mr14920502a91.2.1751196661282;
        Sun, 29 Jun 2025 04:31:01 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c1523351sm6576896a91.48.2025.06.29.04.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 04:31:00 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	llvm@lists.linux.dev,
	LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v7] staging: media: atomisp: code style cleanup series
Date: Sun, 29 Jun 2025 19:30:50 +0800
Message-ID: <20250629113050.58138-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series applies clang-format and fixes all checkpatch.pl-reported ERRORs in the AtomISP driver, excluding the i2c directory as advised by maintainers.

The changes include:
- Applying clang-format (excluding drivers/staging/media/i2c)
- Removing unnecessary parentheses in return statements
- Removing unnecessary zero-initialized globals
- Fixing space issues after unary minus operators
- Wrapping complex macro values in parentheses
- These patches focus solely on mechanical style cleanups with no functional changes.
- WARNINGs reported by checkpatch.pl were intentionally left for future work to keep each patch clear and manageable.

The full series and corresponding commits are also available in my public Git repository:

https://github.com/lc-wang/linux/tree/b4/atomisp

To: Hans de Goede <hansg@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: llvm@lists.linux.dev
---
Changes in v7:
- Split previous monolithic patch into multiple smaller patches
- Applied clang-format to entire driver excluding i2c directory
- Fixed checkpatch.pl-reported ERRORs (parentheses in macros, unnecessary return parentheses, zero-initialized globals, spaces after unary minus)
- Left WARNINGS untouched for future cleanup
- No functional logic changes
- Link to v6: https://lore.kernel.org/r/20250627-bar-v6-1-b22b5ea3ced0@gmail.com

Changes in v6:
- Applied clang-format across the entire AtomISP driver
- Fixed all checkpatch.pl-reported ERRORs
- Added explanation of tooling and scope
- No functional logic modified
- Moved 'Suggested-by' and 'Link' tags above Signed-off-by
- Link to v5: https://lore.kernel.org/r/20250625-bar-v5-1-db960608b607@gmail.com

Changes in v5:
- Replaced space-based indentation with tabs in output_1.0 directory
- Used checkpatch.pl and grep to identify formatting issues
- No functional changes made
- This patch is now focused solely on tab/space issues
- Link to v4: https://lore.kernel.org/r/20250624-bar-v4-1-9f9f9ae9f868@gmail.com

Changes in v4:
- Moved assignment operator '=' to the same line for static struct definitions
- Remove unnecessary line breaks in function definitions
- Update commit message to reflect all the coding style fixes
- Link to v3: https://lore.kernel.org/r/20250622-bar-v3-1-4cc91ef01c3a@gmail.com

Changes in v3:
- Removed extra spaces between type and asterisk (e.g., `*to`) in function
  declarations, as pointed out by Andy Shevchenko
- Update commit message to reflect all the coding style fixes
- Link to v2: https://lore.kernel.org/r/20250621-bar-v2-1-4e6cfc779614@gmail.com

Changes in v2:
- Fix patch subject prefix to "staging: media: atomisp:" to comply with media CI style.
- No other functional changes.

Link to v1: https://lore.kernel.org/r/20250621-bar-v1-1-5a3e7004462c@gmail.com

--- b4-submit-tracking ---
# This section is used internally by b4 prep for tracking purposes.
{
  "series": {
    "revision": 7,
    "change-id": "20250621-bar-573b8b40fb80",
    "prefixes": [],
    "history": {
      "v1": [
        "20250621-bar-v1-1-5a3e7004462c@gmail.com"
      ],
      "v2": [
        "20250621-bar-v2-1-4e6cfc779614@gmail.com"
      ],
      "v3": [
        "20250622-bar-v3-1-4cc91ef01c3a@gmail.com"
      ],
      "v4": [
        "20250624-bar-v4-1-9f9f9ae9f868@gmail.com"
      ],
      "v5": [
        "20250625-bar-v5-1-db960608b607@gmail.com"
      ],
      "v6": [
        "20250627-bar-v6-1-b22b5ea3ced0@gmail.com"
      ]
    }
  }
}
-- 
2.43.0

