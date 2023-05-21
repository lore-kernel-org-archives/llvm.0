Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F553111B
	for <llvm@lists.linux.dev>; Sun, 21 May 2023 09:43:13 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684661803;
	bh=IRUupTWokl6bSvN/Qk4Ov6+kUGTwoo0KFMWwChixIDM=;
	h=From:Subject:Date:To:Cc:From;
	b=cqxlSIQDXcaATq4ZkEomg3mY2IIrtqss61smptg9yb0lL1E7hdITHmKOiQkYwWMPr
	 dSUmlXT3YXWXIAj6wIKV373n/HOdFYkU8neAUuRNG4U2Y55s6Mf3AQV4YgSKua8BCn
	 gEy2ZeaIjLoDyfdEpiNxt0KJb6Awa7KExEknuKus=
Subject: [PATCH 0/7] tools/nolibc: autodetect stackprotector availability
 from compiler
Date: Sun, 21 May 2023 11:36:28 +0200
Message-Id: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABzmaWQC/x2NQQrCMBAAv1L27EIbraJfkR4268YuxqRsUhFK/
 27wOHOY2aCIqRS4dRuYfLRoTg2GQwc8U3oK6qMxuN4d+9ENmHJUz0hrzW+qylgq8QsXy1W4ZkN
 /CpdA/ipnN0LLeCqC3ijx3EJpjbHJxSTo9/+9T/v+A6RUit+HAAAA
To: Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684661802; l=1743;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=IRUupTWokl6bSvN/Qk4Ov6+kUGTwoo0KFMWwChixIDM=;
 b=+KCHXIX7ZFxeWvKYgiPiXSHck8c9OJAqiZ1m8d98eL9+rckJEWvb6uDCavW+0/kuvJ7Fdte+g
 m1VE13Y0y6WDZ5dPNcWR/VP/9J98CEzoH+Wt4RH1E7OYcJxR3RLRXIu
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

As suggested by Willy it is possible to detect the availability of
stackprotector via preprocessor defines.
Make use of that to simplify the code and interface of nolibc.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (7):
      tools/nolibc: fix typo pint -> point
      tools/nolibc: x86_64: disable stack protector for _start
      tools/nolibc: ensure stack protector guard is never zero
      tools/nolibc: add test for __stack_chk_guard initialization
      tools/nolibc: reformat list of headers to be installed
      tools/nolibc: add autodetection for stackprotector support
      tools/nolibc: simplify stackprotector compiler flags

 tools/include/nolibc/Makefile                | 19 +++++++++++++++++--
 tools/include/nolibc/arch-aarch64.h          |  6 +++---
 tools/include/nolibc/arch-arm.h              |  6 +++---
 tools/include/nolibc/arch-i386.h             |  6 +++---
 tools/include/nolibc/arch-loongarch.h        |  6 +++---
 tools/include/nolibc/arch-mips.h             |  6 +++---
 tools/include/nolibc/arch-riscv.h            |  6 +++---
 tools/include/nolibc/arch-x86_64.h           |  8 ++++----
 tools/include/nolibc/arch.h                  |  2 +-
 tools/include/nolibc/compiler.h              | 15 +++++++++++++++
 tools/include/nolibc/stackprotector.h        | 15 ++++++---------
 tools/testing/selftests/nolibc/Makefile      | 13 ++-----------
 tools/testing/selftests/nolibc/nolibc-test.c | 10 +++++++++-
 13 files changed, 72 insertions(+), 46 deletions(-)
---
base-commit: 606343b7478c319cb30291a39ecbceddb42229d6
change-id: 20230521-nolibc-automatic-stack-protector-b4f7fab9e625

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

