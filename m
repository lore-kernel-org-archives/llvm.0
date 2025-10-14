Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B249D2EF64F
	for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435128; cv=none; b=GhjmraJZ4EUAZ1O6KUX3+UL0EUNU2H2LRZpUyhrkzHbkE9SJPesJUy6tBg5GR5/PIQIjG7TU3GSydDqfWLOaa1EQuFXccjL/5hIozOU4EPuqtW0KGKZX9YX7xVBqrOh92kZx8KpvLr+k9r/0NbzkV1M1RjlnJWQRpKePVsjU210=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435128; c=relaxed/simple;
	bh=eh4ANO2d3smDKZZwIDnxm/MQXjsXiFsIqghETlox01s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/S3wMNEAmgwpIW1wKHqQ0mQJ/vcRzV835DPh26HC8BIo/q03+0fE5LBwEuX2+xBY8DNNdbt4i+Ue4DmIC1qyZoU/ZPOetMZWo8G7jxw+bW3gac5e+eAxeZl35q/gXORJN87biwdz55IUiPtgRTHzdW+cTceJ4cWn5AFUIZdwKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=J/rwQA1O; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="J/rwQA1O"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FC321F745;
	Tue, 14 Oct 2025 09:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1760435118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vSi4m7GHZ1XhKbCHDk6/gXFjTYG4yzDfHQT53TiQIyI=;
	b=J/rwQA1O6X/jO0+uRiWzutma2o99jVSY7lRhRdo3jBJc0LIZOPEY/8ra0n7s+g2mg3NRSv
	h6MOE/HsbTJjJ6Cyj3QxtiNepOJ8Eyzs4iDe9i+UBrx0IznNASZPLfLfK0EdSq23chGNST
	cmh5eRZ12iQGl9TxAQtLI4KyMHQDOM6J5/DUvWpNPgfo4NQeKmPsZ5deb6eLJjKROEubKu
	9648ElaWCgGJDIYM7uV8KQ91G8JaDKs9+R5Q7RxrLXpFKDsiJV029Y/7Xn3/O8pm+Egown
	oa6f+Zvdw2pHaZnFMVVgrGIyQrr/pDBbfXfKlBdjLzM7hkwEAUMZLt8G9rfzzw==
From: Guillaume Tucker <gtucker@gtucker.io>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	automated-testing@lists.yoctoproject.org,
	Arnd Bergmann <arnd@arndb.de>,
	workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RFC PATCH 0/1] kbuild: introduce containerized builds
Date: Tue, 14 Oct 2025 11:45:10 +0200
Message-ID: <20251014094511.627258-1-gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io

This proposal emerged from an email discussion and a talk at Plumbers
last year:

    https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/

The aim is to facilitate reproducing builds for CI bots as well as
developers using containers.  It's achieved by providing a wrapper
around `make` in a separate Makefile.  Here's an illustrative example
with a kernel.org toolchain in a Docker image from tuxmake:

    $ make -f scripts/Makefile.container CONTAINER=tuxmake/korg-clang-21 LLVM=1 defconfig
    Running in docker tuxmake/korg-clang-21
      HOSTCC  scripts/basic/fixdep
      HOSTCC  scripts/kconfig/conf.o
    [...]
      HOSTCC  scripts/kconfig/util.o
      HOSTLD  scripts/kconfig/conf
    *** Default configuration is based on 'x86_64_defconfig'
    #
    # configuration written to .config
    #

    $ make -f scripts/Makefile.container CONTAINER=tuxmake/korg-clang-21 LLVM=1 -j8
    Running in docker tuxmake/korg-clang-21
    make: warning: -j8 forced in submake: resetting jobserver mode.
      SYNC    include/config/auto.conf
      GEN     arch/x86/include/generated/asm/orc_hash.h
      WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
      WRAP    arch/x86/include/generated/uapi/asm/errno.h
    [...]
      LD      arch/x86/boot/setup.elf
      OBJCOPY arch/x86/boot/setup.bin
      BUILD   arch/x86/boot/bzImage
    Kernel: arch/x86/boot/bzImage is ready  (#1)

The initial idea was to add an if-else block for when $(CONTAINER)
was defined directly in the top-level Makefile but this seemed too
intrusive, hence the approach here with a separate file.  It's easy
enough to create an alias for development purposes if needed.

While the example above uses a tuxmake image, I've also started
preparing reference container images with kernel.org toolchains and
no third-party dependencies other than the base Debian distro:

    https://gitlab.com/gtucker/korg-containers

These are convenient for exercising this feature but any arbitrary
image may be used of course.

Guillaume Tucker (1):
  kbuild: add Makefile.container with CONTAINER option

 scripts/Makefile.container | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 scripts/Makefile.container

-- 
2.47.3

