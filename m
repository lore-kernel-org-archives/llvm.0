Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F50772
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 09:41:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79C2460F70;
	Mon, 27 Sep 2021 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632735688;
	bh=9hhtJVsGexG0XVk3k/pwBPZOJmTujKncE9iL0HXJp30=;
	h=From:To:Cc:Subject:Date:From;
	b=do7Grx6Q2G3z3JCOdoY72cgg/pNHi9Hw4uOyOAIVymjxJtguRuFrBjo+9Uc/xi6QH
	 bJG7HYtl+c5EFp2DGkIbb3dLU/HZHp/7hdFk3G674B5sgxMTKEJRZOHHAEWhp4UHqa
	 45pSzv4j8v3wGo1ookpJs9YjLnph54fHfZK14pI9JwhCItVPyG5WOf+A5mVxqxeMwb
	 HYPsFht2GVeWKjRPDo9AnotnrPrk2EfBviwluHIfbx3c2UHM55s6sFAI89uZtZrOxK
	 XjDiLaINnWPg70jpFsYcIGt+cnKNKw/6T61fCSBXAP1sDkP+6WtS6K9ueqZ7sl2dip
	 RGZyku3YMepOg==
From: Arnd Bergmann <arnd@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Al Viro <viro@zeniv.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] vboxsf: fix old signature detection
Date: Mon, 27 Sep 2021 11:40:58 +0200
Message-Id: <20210927094123.576521-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The constant-out-of-range check in clang found an actual bug in
vboxsf, which leads to the detection of old mount signatures always
failing:

fs/vboxsf/super.c:394:21: error: result of comparison of constant -3 with expression of type 'unsigned char' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
                       options[3] == VBSF_MOUNT_SIGNATURE_BYTE_3) {
                       ~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
fs/vboxsf/super.c:393:21: error: result of comparison of constant -2 with expression of type 'unsigned char' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
                       options[2] == VBSF_MOUNT_SIGNATURE_BYTE_2 &&
                       ~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
fs/vboxsf/super.c:392:21: error: result of comparison of constant -1 with expression of type 'unsigned char' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
                       options[1] == VBSF_MOUNT_SIGNATURE_BYTE_1 &&
                       ~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

The problem is that the pointer is of type 'unsigned char' but the
constant is a 'char'. My first idea was to change the type of the
pointer to 'char *', but I noticed that this was the original code
and it got changed after 'smatch' complained about this.

I don't know if there is a bug in smatch here, but it sounds to me
that clang's warning is correct. Forcing the constants to an unsigned
type should make the code behave consistently and avoid the warning
on both.

Fixes: 9d682ea6bcc7 ("vboxsf: Fix the check for the old binary mount-arguments struct")
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/vboxsf/super.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/vboxsf/super.c b/fs/vboxsf/super.c
index 4f5e59f06284..84e2236021de 100644
--- a/fs/vboxsf/super.c
+++ b/fs/vboxsf/super.c
@@ -21,10 +21,10 @@
 
 #define VBOXSF_SUPER_MAGIC 0x786f4256 /* 'VBox' little endian */
 
-#define VBSF_MOUNT_SIGNATURE_BYTE_0 ('\000')
-#define VBSF_MOUNT_SIGNATURE_BYTE_1 ('\377')
-#define VBSF_MOUNT_SIGNATURE_BYTE_2 ('\376')
-#define VBSF_MOUNT_SIGNATURE_BYTE_3 ('\375')
+#define VBSF_MOUNT_SIGNATURE_BYTE_0 (u8)('\000')
+#define VBSF_MOUNT_SIGNATURE_BYTE_1 (u8)('\377')
+#define VBSF_MOUNT_SIGNATURE_BYTE_2 (u8)('\376')
+#define VBSF_MOUNT_SIGNATURE_BYTE_3 (u8)('\375')
 
 static int follow_symlinks;
 module_param(follow_symlinks, int, 0444);
-- 
2.29.2

