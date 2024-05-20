Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9B8CEFC1D
	for <llvm@lists.linux.dev>; Mon, 20 May 2024 02:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716171429; cv=none; b=RSUQrK2BPjzPxa+p6ZNTpkEPGRh5ham1qqJ5aaeVzx8Wy1qUO7e8LeNJzvkEAsdKxuMyHrFrrOLXx1Vokv/tGXkH55EJZLUx7VWWBqSf3hY5IfyWl8eLqEV0CrLHdZ8vWZcAgb/ayf8F4BWRpXkqfa6LkUnPOnabhosOkDsa/lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716171429; c=relaxed/simple;
	bh=XHIQ95g/vueEcW57EIQgD5QSEjqfOnGsPYbNMssLwlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EYsulVBlBg+/rrqo775h0zdGEbYbJHdtvRMAWyhlV5fxP2pzANUJ0RunFrZJOIg6wFGe9msRHzOZlnBkoo2d4OaRQ7gtv7zS9lE9A7ShdsExDx9V+odsb2Gmzgr6vnszGtOdoRdvxOsuFE5/w/jMZcPdMwbC4T6XdkcSayuo55I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id DE43D6026E8D1;
	Mon, 20 May 2024 10:16:49 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] Bluetooth: btintel: remove useless code in btintel_set_dsm_reset_method
Date: Mon, 20 May 2024 10:16:25 +0800
Message-Id: <20240520021625.110430-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker(scan-build) warning:
drivers/bluetooth/btintel.c:2537:14:
Value stored to 'handle' during its initialization is never read.

No need to repeatedly assign values to 'handle'. Remove this useless
code to save some space.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/bluetooth/btintel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 0c855c3ee1c1..f1c101dc0c28 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -2542,8 +2542,6 @@ static void btintel_set_dsm_reset_method(struct hci_dev *hdev,
 		RESET_TYPE_VSEC
 	};
 
-	handle = ACPI_HANDLE(GET_HCIDEV_DEV(hdev));
-
 	if (!handle) {
 		bt_dev_dbg(hdev, "No support for bluetooth device in ACPI firmware");
 		return;
-- 
2.30.2

