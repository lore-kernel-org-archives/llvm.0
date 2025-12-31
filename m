Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEC4284883
	for <llvm@lists.linux.dev>; Wed, 31 Dec 2025 17:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767200898; cv=none; b=mKp9Ex9QDlw+2+C4ccoZubxDLD8AIWRxy5ss/v6SjdsV2tCsoHD6+KUAAbuhy7QoaA53FYwSZ8nbF7W+2Ee5k1pusTUxxs5f7ZkJSahi8Set2b6vp6N25tPKgc5FPQelJwDQiXw+eZgiyqgueGHwrnKtBgVsyR2+DsuHGGGJb0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767200898; c=relaxed/simple;
	bh=zXzBQVYOVZtCeBWwTOWDok+0Gmvjb9G1jyZ6W0/6hFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d+6dFcdQ49laLuIEgQfnRzEHuHgaYL49j78fJmgQnHUewmaL3S7SjAPV4ETHtPQs5C2+iJN4dmJFpkHiy+9k9mhRcFVais7T4I5bQ7lMmXwj125iDvYVKch7jmoj09dfSUF+itTY748RTyAogv4HYtUhIk39YNDbLj9KVUY4heY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=iuAbOG0r; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="iuAbOG0r"
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id C082E58013C
	for <llvm@lists.linux.dev>; Wed, 31 Dec 2025 16:52:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 158CB44369;
	Wed, 31 Dec 2025 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1767199921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=evmHzmeXGr9WFVB5GGpxyKiY3i5zd0f9TxFsBMVcac8=;
	b=iuAbOG0rBbSgMR2mu2b2SmprcEGhVesYdO+HGAar94r3nC80AoekfGc2MCnYBLiq3eVV7o
	g6LxV9GjM5rmM4/IZhP85pvVoOjtcMScA39QanBdJePB/0w/3GepTleB/f0X7ZxlVCcj1O
	XlVZ9GQeXzG08sY6L+dRykP5m8o3g8+9wkMtKs4p7dZY+8Wvr0xnL5u9oGgIlYx6n1X8vT
	DYM9EJKWxcvxYoZDL5hnt0Y1eNuSoz/pweW+TO/m1YG3d8ReaSl+Wf+C+ADgyG/9KpStLk
	W3leMld6vxyq9Y6IX3+Cgdvlg8jeBXXDB3m43jbHv3Eq23mhD6zNvmglzsp6Vw==
From: Guillaume Tucker <gtucker@gtucker.io>
To: Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	David Gow <davidgow@google.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org,
	workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/2] scripts: introduce containerized builds
Date: Wed, 31 Dec 2025 17:51:48 +0100
Message-ID: <cover.1767199119.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekfeegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepteehhffgudetheehheetffehtdfgvdehiefggedvhefgkeduvdfhgfdtteduteefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedvtddtudemkeeiudemgegrgedtmeekiedvtdemhegtuggsmegrugeisgemjegvkegtmeegvdehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemhegtuggsmegrugeisgemjegvkegtmeegvdehfedphhgvlhhopehrihhnghhordhlrghnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeduheekveeugeegfeeiledpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifohhrkhesohhnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopehgthhutghkvghrsehgthhutghkvghrrdhiohdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
X-GND-State: clean
X-GND-Score: -100

This proposal emerged from discussions over email and after a talk at
Plumbers 2024:

    https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/

The aim is to facilitate reproducing builds for CI bots as well as
developers using containers.  Here's an illustrative example with a
kernel.org toolchain in a Docker image from tuxmake:

    $ scripts/container -i tuxmake/korg-clang-21 make LLVM=1 defconfig
      HOSTCC  scripts/basic/fixdep
      HOSTCC  scripts/kconfig/conf.o
    [...]
      HOSTCC  scripts/kconfig/util.o
      HOSTLD  scripts/kconfig/conf
    *** Default configuration is based on 'x86_64_defconfig'
    #
    # configuration written to .config
    #

This patch series also includes a documentation page with all the
relevant details and further examples about how to use the tool.

To go one step further, I'm in the process of preparing reference
container images with kernel.org toolchains and no third-party
dependencies other than the base Debian distro.  See this thread for
more details and options to host them in an upstream way:

    https://lore.kernel.org/all/cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io/

Say, to run KUnit using the latest kernel.org GCC toolchain:

    scripts/container --shell \
        -i registry.gitlab.com/gtucker/korg-containers/gcc:kunit -- \
        tools/testing/kunit/kunit.py \
            run \
            --arch=x86_64 \
            --cross_compile=x86_64-linux-

---
Changes in v3:
- Refactor common code for Docker and Podman
- Add docs.kernel.org URL in help message
- Use pathlib Python package
- Handle signals in parent process by default
- Add --shell option to use an interactive shell
- Tweak debug messages in verbose mode
- Specify Python 3.10 as minimum version in the docs
- Provide an example env file in the docs
- Update docs regarding interactive shell usage

Changes in v2:
- Drop default image but make -i option required
- Look for Docker and Podman if no runtime specified
- Catch SIGINT from user to abort container with Docker
- Explicitly name each container with a UUID
- Update documentation accordingly

---

Guillaume Tucker (2):
  scripts: add tool to run containerized builds
  Documentation: dev-tools: add container.rst page

 Documentation/dev-tools/container.rst | 201 ++++++++++++++++++++++++++
 Documentation/dev-tools/index.rst     |   1 +
 scripts/container                     | 199 +++++++++++++++++++++++++
 3 files changed, 401 insertions(+)
 create mode 100644 Documentation/dev-tools/container.rst
 create mode 100755 scripts/container

-- 
2.47.3

