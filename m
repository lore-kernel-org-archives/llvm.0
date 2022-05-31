Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04948210B
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 09:28:46 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id a63so6124769pge.12
        for <llvm@lists.linux.dev>; Tue, 31 May 2022 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ovlQV07b/85+mO2OCXKW/11MoYcvf02O+pSiKdhkCZM=;
        b=FWEkNweQ57edkYWJKbyGu4pVyAWkpBV58kd5VWFfolSszAKdAUeemBTAqkKI9DnjOC
         FYViRDoqnWi8S5dLzsKApNjnxzhHIr1Rdq+PrNKFxAXmx4UO7CSJrEhZn73XTeM2zOtL
         HIC6G4VvXALeg4UsYhYgeRnqxG4JHpU/o1FG9BCZ6vOoCAYWsqoJEZKParR7pf8UGYdo
         20ZkrVmhEZRj90n8L/k2oFS8bS7tFpD0dx8ws2csMT49P5ZnjX//mdk0pO28bZqki9fH
         MRa3KDRzzWb95gWM+ILAb1ZF6479Nzp8JeeBouymxLJf6eAaQsrC/53ZBXNrYABD5yFu
         QxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ovlQV07b/85+mO2OCXKW/11MoYcvf02O+pSiKdhkCZM=;
        b=vpeNM7xFvQgDbzXW+ydUr4GbrZEhVRjJL2rI8LzSYNDWYonj6pzHqzD9AmGElbeML7
         +yd450bgYwjUW3pK93b5JICdEeLAdevaLgQ7qK4yclJ+OjVJ9fMYJIyfbzYJU1wTy2T2
         lgvihW0aaw/qt3s7r6HpVzvrxVGF6wfBdoAn42UQq6GFlQtv1fH5BQsYl+wTs6M6c7kk
         A0VZppLTc+i9FOjRmoatmBhN2VSlB+OmjTcwJywQTpNp1N5vhr0rOdLh1vbtehqs+7iv
         4ibbLfn/Hy7cBgAtg5QgCFtTRQ9qdu/zkwiUQtWvfSYUACVh4C6SM66vKz9xN0q3Kakp
         AEFg==
X-Gm-Message-State: AOAM530uQJ3Mp75qQRHYhaZEsGGf71bNafJaENEs4B+l1RFdhxJA6it8
	HdBn1xvoRTdfdzLXwhIwbcw=
X-Google-Smtp-Source: ABdhPJwxVJLUZd58TQh/Bx7hRuzo8leLW4V6ciNU8WD1VtQjP5zYKpQAUNUqgp+pqneF6TMjRoEFvw==
X-Received: by 2002:a62:6144:0:b0:51b:99a7:5164 with SMTP id v65-20020a626144000000b0051b99a75164mr1201085pfb.61.1653989326462;
        Tue, 31 May 2022 02:28:46 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-1.three.co.id. [116.206.28.1])
        by smtp.gmail.com with ESMTPSA id g80-20020a625253000000b0051b9d27091bsm379905pfb.76.2022.05.31.02.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 02:28:45 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Nikolai Kondrashov <spbnick@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	llvm@lists.linux.dev,
	stable@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: uclogic: properly format kernel-doc comment for hid_dbg() wrappers
Date: Tue, 31 May 2022 16:28:17 +0700
Message-Id: <20220531092817.13894-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Running kernel-doc script on drivers/hid/hid-uclogic-params.c, it found
6 warnings for hid_dbg() wrapper functions below:

drivers/hid/hid-uclogic-params.c:48: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Dump tablet interface pen parameters with hid_dbg(), indented with one tab.
drivers/hid/hid-uclogic-params.c:48: warning: missing initial short description on line:
 * Dump tablet interface pen parameters with hid_dbg(), indented with one tab.
drivers/hid/hid-uclogic-params.c:48: info: Scanning doc for function Dump
drivers/hid/hid-uclogic-params.c:80: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Dump tablet interface frame parameters with hid_dbg(), indented with two
drivers/hid/hid-uclogic-params.c:80: warning: missing initial short description on line:
 * Dump tablet interface frame parameters with hid_dbg(), indented with two
drivers/hid/hid-uclogic-params.c:80: info: Scanning doc for function Dump
drivers/hid/hid-uclogic-params.c:105: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Dump tablet interface parameters with hid_dbg().
drivers/hid/hid-uclogic-params.c:105: warning: missing initial short description on line:
 * Dump tablet interface parameters with hid_dbg().

One of them is reported by kernel test robot.

Fix these warnings by properly format kernel-doc comment for these
functions.

Link: https://lore.kernel.org/linux-doc/202205272033.XFYlYj8k-lkp@intel.com/
Fixes: a228809fa6f39c ("HID: uclogic: Move param printing to a function")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: "José Expósito" <jose.exposito89@gmail.com>
Cc: llvm@lists.linux.dev
Cc: stable@vger.kernel.org # v5.18
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Changes since v1 [1]:
   - Approach the warning by fixing kernel-doc comments formatting
     (suggested by Jonathan Corbet)

 [1]: https://lore.kernel.org/linux-doc/20220528091403.160169-1-bagasdotme@gmail.com/

 drivers/hid/hid-uclogic-params.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index db838f16282d64..647bbd3e000e2f 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -23,11 +23,11 @@
 /**
  * uclogic_params_pen_inrange_to_str() - Convert a pen in-range reporting type
  *                                       to a string.
- *
  * @inrange:	The in-range reporting type to convert.
  *
- * Returns:
- *	The string representing the type, or NULL if the type is unknown.
+ * Return:
+ * * The string representing the type, or
+ * * NULL if the type is unknown.
  */
 static const char *uclogic_params_pen_inrange_to_str(
 				enum uclogic_params_pen_inrange inrange)
@@ -45,10 +45,12 @@ static const char *uclogic_params_pen_inrange_to_str(
 }
 
 /**
- * Dump tablet interface pen parameters with hid_dbg(), indented with one tab.
- *
+ * uclogic_params_pen_hid_dbg() - Dump tablet interface pen parameters
  * @hdev:	The HID device the pen parameters describe.
  * @pen:	The pen parameters to dump.
+ *
+ * Dump tablet interface pen parameters with hid_dbg(). The dump is indented
+ * with a tab.
  */
 static void uclogic_params_pen_hid_dbg(const struct hid_device *hdev,
 					const struct uclogic_params_pen *pen)
@@ -77,11 +79,12 @@ static void uclogic_params_pen_hid_dbg(const struct hid_device *hdev,
 }
 
 /**
- * Dump tablet interface frame parameters with hid_dbg(), indented with two
- * tabs.
- *
+ * uclogic_params_frame_hid_dbg() - Dump tablet interface frame parameters
  * @hdev:	The HID device the pen parameters describe.
  * @frame:	The frame parameters to dump.
+ *
+ * Dump tablet interface frame parameters with hid_dbg(). The dump is
+ * indented with two tabs.
  */
 static void uclogic_params_frame_hid_dbg(
 				const struct hid_device *hdev,
@@ -102,10 +105,11 @@ static void uclogic_params_frame_hid_dbg(
 }
 
 /**
- * Dump tablet interface parameters with hid_dbg().
- *
+ * uclogic_params_hid_dbg() - Dump tablet interface parameters
  * @hdev:	The HID device the parameters describe.
  * @params:	The parameters to dump.
+ *
+ * Dump tablet interface parameters with hid_dbg().
  */
 void uclogic_params_hid_dbg(const struct hid_device *hdev,
 				const struct uclogic_params *params)

base-commit: 8ab2afa23bd197df47819a87f0265c0ac95c5b6a
-- 
An old man doll... just what I always wanted! - Clara

