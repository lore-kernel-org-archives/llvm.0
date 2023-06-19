Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081526ABD
	for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 08:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8663AC433C8;
	Mon, 19 Jun 2023 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687162826;
	bh=3qmrbX+gre5g324ufIaHDRifEUP5SgH9Kco2mZL155U=;
	h=From:To:Cc:Subject:Date:From;
	b=mdMIswmrdfZbEPolQxk4U3MMdRbKG7clRlpwVVU+po7lodeNJWfqP5tlXv7sOyBzk
	 zuKikrud9u1SwwPwOPAY/P0xvVwd5knb/W0+3i7VdRoYukOUV65ZNl5a2qR1iZY19F
	 RxU3Ev3AcFf2V8deVvxspGeIiOKmuRu9tSTIHKiPThxC2Yax0XE8Dqs/lw2XVwohf3
	 +blK27iRqPof/ng//FKYF95MaC18xx2pYaGreus772awP0FtgxvHQNbrUsAZwK+aLK
	 rBJ8KzE9ezDRoObYV2aghtCwwYI4h9bY2dIH9TE8wToyvEryGZIz6raw1Y0Wv28w63
	 MQMC0ne7t2ctg==
From: Arnd Bergmann <arnd@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Steve French <sfrench@samba.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] [v2] smb: avoid field overflow warning
Date: Mon, 19 Jun 2023 10:19:38 +0200
Message-Id: <20230619082019.656605-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang warns about a possible field overflow in a memcpy:

In file included from fs/smb/server/smb_common.c:7:
include/linux/fortify-string.h:583:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
                        __write_overflow_field(p_size_field, size);

It appears to interpret the "&out[baselen + 4]" as referring to a single
byte of the character array, while the equivalen "out + baselen + 4" is
seen as an offset into the array.

I don't see that kind of warning elsewhere, so just go with the simple
rework.

Fixes: e2f34481b24db ("cifsd: add server-side procedures for SMB3")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
----
v2: fix typo in array length, and make sure it still addresses the warning
---
 fs/smb/server/smb_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/server/smb_common.c b/fs/smb/server/smb_common.c
index a7e81067bc991..39c6c8d7d0623 100644
--- a/fs/smb/server/smb_common.c
+++ b/fs/smb/server/smb_common.c
@@ -536,7 +536,7 @@ int ksmbd_extract_shortname(struct ksmbd_conn *conn, const char *longname,
 	out[baselen + 3] = PERIOD;
 
 	if (dot_present)
-		memcpy(&out[baselen + 4], extension, 4);
+		memcpy(out + baselen + 4, extension, 4);
 	else
 		out[baselen + 4] = '\0';
 	smbConvertToUTF16((__le16 *)shortname, out, PATH_MAX,
-- 
2.39.2

