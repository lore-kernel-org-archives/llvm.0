Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D54023C2
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 09:14:40 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id c65so5740720pfb.1
        for <llvm@lists.linux.dev>; Sat, 28 May 2022 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2cmreXVkKeTuS3iLda3uDJCEUdvooYyM7QNARThfArQ=;
        b=VTRt1uLhMTgIvoICyNK1K4DvISkrJto6QUdz42wHaQhFckzhegvbpDenZo1DkDOsuP
         lECoEOynKmg/Ze93ddslExgRDFXN9ZEbbT1sN8I3ZE3dxVWd4hlEJojzEDtVC5S2ybDx
         O3M+kDI7BSFLOBRuRtDow343Wthn0enWane8a0D/6JK/s/DByaq1I/aGT/qZjQ7apeCh
         Ha8lnoT/XUfmfTN1KsCGh6lhI7O9pEP+07R/QL6uVc0mJWjbA7+kJsDHxnynuIKyVGN2
         THFWA0HQz1gfwdpeePJEmsooJz2NNv2A39aBeDwiGXjIAuwoq8++Fuw5S7FjQsgxaBM2
         fLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2cmreXVkKeTuS3iLda3uDJCEUdvooYyM7QNARThfArQ=;
        b=1qJXHDry9RQ+9poMxVgoFIfrLrxTcM9uottj/y/jcBGRcjSRdyoahjax24WNUesQMO
         c4nzoOml/fS0zFsBDzNiRkeigC3/1mdaF/kNE4e/xj4HwJJJFWNL7jQNMLn2rCZiPrrB
         Jg++i6w0lY6ogVr1B1yNBC5e0Thqc/OrWc5QqZKOik1O8eOtoaksV5vmNsKMJWcF4aSG
         fElrZwOZqmRQ3TR9imFy7SQMa0ritNfZnbfBALzZSyP2taGOsNfgmCB9D/cmPgO3oPlo
         D2EPYg5creynGpaNnx3riFVc6tqZSg2NWhaLJnF/iWVTlV8ht3yosHP8pxIJ2IAyh5ff
         GsyQ==
X-Gm-Message-State: AOAM530lgZWJ88RJ/Cl8Uw/42AQBRvBMp5EkwTO/pz5OZBDyfOLec7XY
	ZcsxvteIuWKf7ts5geZ7+4k=
X-Google-Smtp-Source: ABdhPJxTZ3//L0+n/S1b5h79f4IEubXD+U1hWPngiQJyYJKXN7Cu3aGrFpYqFoZGccOa0dTRsa6SPA==
X-Received: by 2002:a05:6a00:15c5:b0:518:9848:4915 with SMTP id o5-20020a056a0015c500b0051898484915mr30768636pfu.62.1653729280076;
        Sat, 28 May 2022 02:14:40 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-83.three.co.id. [180.214.232.83])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902f68c00b0016198062800sm5320179plg.161.2022.05.28.02.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 02:14:39 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Nikolai Kondrashov <spbnick@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	llvm@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: uclogic: add missing function name in uclogic_params_hid_dbg() kernel-doc comment
Date: Sat, 28 May 2022 16:14:03 +0700
Message-Id: <20220528091403.160169-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220528091403.160169-1-bagasdotme@gmail.com>
References: <20220528091403.160169-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

uclogic_params_hid_dbg() is public void function. The comment for
kernel-doc, however, lack its function name on short description, thus
triggers "missing initial short description" warning.

Add the function name to fix the warning.

Fixes: a228809fa6f39c ("HID: uclogic: Move param printing to a function")
Cc: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: "José Expósito" <jose.exposito89@gmail.com>
Cc: llvm@lists.linux.dev
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/hid/hid-uclogic-params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 71501453de12e4..0319e3f1527f1d 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -102,7 +102,7 @@ static void uclogic_params_frame_hid_dbg(
 }
 
 /**
- * Dump tablet interface parameters with hid_dbg().
+ * uclogic_params_hid_dbg - Dump tablet interface parameters with hid_dbg().
  *
  * @hdev:	The HID device the parameters describe.
  * @params:	The parameters to dump.
-- 
An old man doll... just what I always wanted! - Clara

