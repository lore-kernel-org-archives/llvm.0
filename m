Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834DD348860
	for <llvm@lists.linux.dev>; Mon, 27 Apr 2026 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305958; cv=none; b=mD8KO23KQtFwaRC6Z9ZJf2cXJbMnZVMkNvsKQ3B2i/YB4O/qj4Jze+Ad0u0lDN4PdEZDcxkv5YfyusiMMtZsUnPjtY3+bVCxvPqOKWfERLwyOJ2nTn2VpDCeeR2caDW4H/hcsS4TB2zrJ7ZPRA7eSHEyq3iOo25LqOQq3vFbVC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305958; c=relaxed/simple;
	bh=T5Q/izJx7hg/QUUHDFKPTpLsTO4+gBEZnXygCLpSSjc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ERn1JTqFQl0HWhNIQ7KtDenSrCslPNnsqQJN8XPXyYZ2kM8YFuSwijAymK2g/Fbngr/O67g34+RFp/M/JTbwa2nDyxQ4V24Trd7KydtFkhp3kW91HpnZYRTxMVefHxPblT4EOQXaQjZmZRQyjPo1449Cs5ZawLDIRVad6Fl1TA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Zv86YZ7x; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Zv86YZ7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777305953;
	bh=T5Q/izJx7hg/QUUHDFKPTpLsTO4+gBEZnXygCLpSSjc=;
	h=From:Subject:Date:To:Cc:From;
	b=Zv86YZ7xyFxBwjQTToySmVhX3+mKRB8iXSB8ZVxyPe0JBplEvO/eusx8iLots+XpX
	 C0EhpS5D4oa613eM8MFub+rRJpAWkeonOKgL3rHGX6CFXWSgxI0qLob/mkFn6LEaCt
	 cQGxIi5CFBesI0AALHD2pcIqj7o8rWjqYBDyYYBc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/2] kunit: qemu_configs: Add or1k / openrisc configuration
Date: Mon, 27 Apr 2026 18:04:55 +0200
Message-Id: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDWZ1k8TVxELajAkJS0iadxds
 fwW7wXw5Jg8VEkARyd7Xm2ETBMwU2tHEtxHg0JVYq60WA7Lu1idXAQiZoWRWa+RIAabo4Gvb1Y
 3v/3RzWT29wD3/QAec5j2bgAAAA==
X-Change-ID: 20260427-kunit-or1k-00035c13d70e
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777305952; l=593;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=T5Q/izJx7hg/QUUHDFKPTpLsTO4+gBEZnXygCLpSSjc=;
 b=ZBGpsShrNJn7Kugx5aDvGmon6NXXf746zYSo+kRMHfUeeJSpI7EjU8aS3SmahUvJbLuzLnlvp
 9FgudjqwtJ+ChQxf1V5maSTBRLRyWMQ9feCDSOYegxlxVMFuI9cdbAD
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add a basic configuration to run kunit tests on or1k / openrisc.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (2):
      gen_compile_commands: Ignore libgcc.a
      kunit: qemu_configs: Add or1k / openrisc configuration

 scripts/clang-tools/gen_compile_commands.py |  2 ++
 tools/testing/kunit/qemu_configs/or1k.py    | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260427-kunit-or1k-00035c13d70e

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

