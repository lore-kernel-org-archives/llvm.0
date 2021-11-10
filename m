Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604342C82
	for <llvm@lists.linux.dev>; Wed, 10 Nov 2021 23:07:56 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1636585249;
	bh=JNTYqQ2cqHeyvdtglZHIL3kmDnAz5/OnGEDYq81CnOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gdF0b8DxjCDbSGQinTCpxRSnAPUmwWFG/0LOw3UrBSVruA6YtOg/QEAaeF7theQ1e
	 AcbYbWwf5zYAlzORmA2mFdEbC7q7Lr/m2Jo5xk6ap97V4HHOt8yAUB8ZifNtuXFpF0
	 gfsfRDZRYrCIUydW5XYjQEXjZSjm4wJNtP25DV54=
To: Nathan Chancellor <nathan@kernel.org>,
	linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
	Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	llvm@lists.linux.dev
Subject: [PATCH 2/4] HID: intel-ish-hid: hid-client: constify devicetable initializer
Date: Thu, 11 Nov 2021 00:00:41 +0100
Message-Id: <20211110230043.701167-2-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <YYv22iWQ7yTfMNC5@archlinux-ax161>
References: <YYv22iWQ7yTfMNC5@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Previously the compilation broke on clang and gcc < 8.1.0 with errors like
"error: initializer element is not constant".

Fixes: 0d0cccc0fd83 ("HID: intel-ish-hid: hid-client: only load for matching devices")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index fb47d38d1e87..cff7da0578b6 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -12,9 +12,9 @@
 #include "ishtp-hid.h"
 
 /* ISH Transport protocol (ISHTP in short) GUID */
-static const guid_t hid_ishtp_guid =
-	GUID_INIT(0x33AECD58, 0xB679, 0x4E54,
-		  0x9B, 0xD9, 0xA0, 0x4D, 0x34, 0xF0, 0xC2, 0x26);
+#define HID_ISHTP_GUID	GUID_INIT(0x33AECD58, 0xB679, 0x4E54, \
+		  0x9B, 0xD9, 0xA0, 0x4D, 0x34, 0xF0, 0xC2, 0x26)
+static const guid_t hid_ishtp_guid = HID_ISHTP_GUID;
 
 /* Rx ring buffer pool size */
 #define HID_CL_RX_RING_SIZE	32
@@ -953,7 +953,7 @@ static struct ishtp_cl_driver	hid_ishtp_cl_driver = {
 };
 
 static const struct ishtp_device_id hid_ishtp_id_table[] = {
-	{ hid_ishtp_guid },
+	{ HID_ISHTP_GUID },
 	{ }
 };
 MODULE_DEVICE_TABLE(ishtp, hid_ishtp_id_table);
-- 
2.33.1

