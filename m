Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C192C82
	for <llvm@lists.linux.dev>; Tue, 16 Nov 2021 15:45:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48FA661526;
	Tue, 16 Nov 2021 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637077519;
	bh=8TF7QOfF7+R14bacNbYtsjRF9nV+tpGDEihkxlTXlm0=;
	h=From:To:Cc:Subject:Date:From;
	b=Hl6K8FSpYKKvecJf34MpSSYi2EKo6dElx9+Ufh/iJ7utquAz/JOkv3/Nq4Bo/qPz2
	 0Lsta+7Bscr1h2RBzBQYLPfhoW+elpJIu1JeQLh0VIPQcIN91C4ElcI6vrI+JSD8Cz
	 NsLKCxbZ3c9szKOxu/xmuUbzO1TERecRAmPTsyXxIbI64fcRyea9oIhI3pDpVO3ty5
	 TmgztPs3q1L91jB7Pc3ZX4V690En+3IKOsk1Qz5+9uhpgVJVhDNUWCC+6dHRK4f0t5
	 nyBozvlfWBwvYM4ftEXb0GSkAJMhwFoyjlm7kL5hDv6pxN698zhzq+SfRynWUqZzLM
	 yZO50VqO46/LA==
From: Nathan Chancellor <nathan@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] hwmon: (tmp401) Fix clang -Wimplicit-fallthrough in tmp401_is_visible()
Date: Tue, 16 Nov 2021 08:44:39 -0700
Message-Id: <20211116154438.1383290-1-nathan@kernel.org>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Clang warns:

drivers/hwmon/tmp401.c:526:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
        default:
        ^
drivers/hwmon/tmp401.c:526:2: note: insert 'break;' to avoid fall-through
        default:
        ^
        break;
1 error generated.

Clang is a little more pedantic than GCC, which does not warn when
falling through to a case that is just break or return. Clang's version
is more in line with the kernel's own stance in deprecated.rst, which
states that all switch/case blocks must end in either break,
fallthrough, continue, goto, or return. Add the missing break to silence
the warning.

Link: https://github.com/ClangBuiltLinux/linux/issues/1505
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

Feel free to squash this into the offending commit.

 drivers/hwmon/tmp401.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index f7b6a2c4fbcf..b86d9df7105d 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -523,6 +523,7 @@ static umode_t tmp401_is_visible(const void *data, enum hwmon_sensor_types type,
 		default:
 			break;
 		}
+		break;
 	default:
 		break;
 	}

base-commit: 82b520da9134a594eb9816759ed66ba6ef44888e
-- 
2.34.0

