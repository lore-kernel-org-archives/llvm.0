Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F43E23C2
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 09:14:37 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id 202so6346563pfu.0
        for <llvm@lists.linux.dev>; Sat, 28 May 2022 02:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GURDLD8fq2AWOdGy1BHqDXdBjLx5bVXEyWSiOccXTFA=;
        b=YEYAbQLZVyGOPW5q4qCpmJz2/LnPnAd6qik6FWAHDEjH5YfqQwL3C6QGUoAOkObnbK
         HAbUdoX5X1ku9dx5nNVLj9RvhAwD7VeFPy9tiQFM6H8xjdmD8HWocqzxw3qqFBW1lyDY
         M4/TOtVySSw0pKdPboWBs5hHk5Crb6Zyx1my4xIoHb61AanhYhdU4jLW6I2Z5sYnF05R
         paOCT16OvCabwdzIiE4QKBVSBNAn82adwTlNO2KHaxCjyeDUuFSPkmL2m0ctdTlFwkes
         dhWi2y37HUu4X4z+miEAJOyl/vnqD2tjuHM/Vfq/LVg5eQ5BQ9u04tnaNSYVkG7NEt/0
         gGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GURDLD8fq2AWOdGy1BHqDXdBjLx5bVXEyWSiOccXTFA=;
        b=cohrYKP6AKWBdcFlk5fD7dZkvin+z9boR3NUwon0NGUZdDkq4sloiP1hou04lxljrt
         k2W4Y6QEo4TApFevIfRSANiJ08UJW5taV5V9n8/tg4q++QPup4tf+ZboRgFC07PWXvML
         2f1mbL0JHThFzlk6Ge0JB2G/eYAsMqedhOe/Fdfi3DAWaXdk+d7/O4xdr4fP3CT27QLD
         vz8iBEfUvteAa5a8DaEkqXf1n2zXxIe6R1G9Uf9Mb+K22aL4Q1spIGuiHhhG4UphVK8G
         fgdH9gEaMGIVCKSMCSj19fPfKPPNQBSx23oK0m382YZQqMv3Vr4YzXPqhNhqMSvqI+1Q
         L7Cw==
X-Gm-Message-State: AOAM532jZCfMDZa+ibLvnZk95n8WuKJbcD6Y4qo7GiCUpnCFXNeEqvpA
	wQlAnOR7N4gQt14KPvBz5js=
X-Google-Smtp-Source: ABdhPJyWJQoeIcudr0763uMq1YHoIpFW+NSB6/bA4tJRRtTuk9T/ssqTDu2E1yv15WgN8FH+cScgLQ==
X-Received: by 2002:a65:6055:0:b0:3c6:adfd:5135 with SMTP id a21-20020a656055000000b003c6adfd5135mr40786271pgp.146.1653729276731;
        Sat, 28 May 2022 02:14:36 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-83.three.co.id. [180.214.232.83])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902f68c00b0016198062800sm5320179plg.161.2022.05.28.02.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 02:14:36 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Nikolai Kondrashov <spbnick@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	llvm@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: uclogic: remove extraneous asterisk on uclogic_params_* static functions comments
Date: Sat, 28 May 2022 16:14:02 +0700
Message-Id: <20220528091403.160169-2-bagasdotme@gmail.com>
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

*uclogic_params_pen_inrange_to_str(), uclogic_params_pen_hid_dbg(), and
uclogic_params_frame_hid_dbg() are static functions but contain
double-asterisk (/** */) comment, which confuses kernel-doc as public
function for generating documentation.

Remove the extraneous asterisk from these comments.

Link: https://lore.kernel.org/linux-doc/202205272033.XFYlYj8k-lkp@intel.com/
Fixes: a228809fa6f39c ("HID: uclogic: Move param printing to a function")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: "José Expósito" <jose.exposito89@gmail.com>
Cc: llvm@lists.linux.dev
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/hid/hid-uclogic-params.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index db838f16282d64..71501453de12e4 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -20,7 +20,7 @@
 #include <linux/ctype.h>
 #include <asm/unaligned.h>
 
-/**
+/*
  * uclogic_params_pen_inrange_to_str() - Convert a pen in-range reporting type
  *                                       to a string.
  *
@@ -44,7 +44,7 @@ static const char *uclogic_params_pen_inrange_to_str(
 	}
 }
 
-/**
+/*
  * Dump tablet interface pen parameters with hid_dbg(), indented with one tab.
  *
  * @hdev:	The HID device the pen parameters describe.
@@ -76,7 +76,7 @@ static void uclogic_params_pen_hid_dbg(const struct hid_device *hdev,
 		(pen->tilt_y_flipped ? "true" : "false"));
 }
 
-/**
+/*
  * Dump tablet interface frame parameters with hid_dbg(), indented with two
  * tabs.
  *
-- 
An old man doll... just what I always wanted! - Clara

