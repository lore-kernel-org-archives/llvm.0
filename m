Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBC3182
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 02:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A41C385A1;
	Wed,  6 Apr 2022 02:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649212253;
	bh=kMvDwsLnby/GtbPEZOS6QFj4PiJhpG5J89iehidYyqk=;
	h=From:To:Cc:Subject:Date:From;
	b=D0s611AuDog/P1rH2bxfW6i93GJXw3xFSVkYcsSK8ZTn0D7N0GXBglI7ZAJYSICcB
	 pIQge7cNsjIzaTtD+sD9FzRgEvGbxSpx44M1DuJO7sumchaLXP1+fCko1rksqEZMws
	 77XREAht9+1A9S3LXIAKqpNvcxHfwRxX3wP8IsCVSVqE7EJmYXWcIKAl6CvA5GANtA
	 v/NC1DudsTJdjhhqXtozbYRjKSTc+4GYSEy9q2kVuGV6iRm9407B6FW6D18mN0ssZR
	 yorREqmSSt30gXRESA20aC9+lqO14XXSqP96aPdjRVzjZShBzyRaNqMdNjLwh8pujL
	 n/M2x3NHuki/Q==
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Padmanabha Srinivasaiah <treasure4paddy@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: [PATCH v8 0/4] bootconfig: Support embedding a bootconfig in kernel for non initrd boot
Date: Wed,  6 Apr 2022 11:30:48 +0900
Message-Id: <164921224829.1090670.9700650651725930602.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

Here are the 8th version of the patchset to enable kernel embedded bootconfig
for non-initrd kernel boot environment. This version fixes a build error when
CONFIG_BLK_DEV_INITRD=n. Previous version is here [1];

[1] https://lore.kernel.org/all/164871505771.178991.7870442736805590948.stgit@devnote2/T/#u

You can embed a bootconfig file into the kernel as a default bootconfig,
which will be used if there is no initrd or no bootconfig is attached to initrd. 

This needs 2 options: CONFIG_BOOT_CONFIG_EMBED=y and set the file
path to CONFIG_BOOT_CONFIG_EMBED_FILE. Even if you embed the bootconfig file
to the kernel, it will not be enabled unless you pass "bootconfig" kernel
command line option at boot. Moreover, since this is just a "default"
bootconfig, you can override it with a new bootconfig if you attach another
bootconfig to the initrd (if possible).
The CONFIG_BOOT_CONFIG_EMBED_FILE can take both absolute and relative path.

This is requested by Padmanabha at the below thread[2];

[2] https://lore.kernel.org/all/20220307184011.GA2570@pswork/T/#u

Thank you,

---

Masami Hiramatsu (4):
      bootconfig: Make the bootconfig.o as a normal object file
      bootconfig: Check the checksum before removing the bootconfig from initrd
      bootconfig: Support embedding a bootconfig file in kernel
      docs: bootconfig: Add how to embed the bootconfig into kernel


 Documentation/admin-guide/bootconfig.rst |   31 ++++++++++++++++++++++--
 MAINTAINERS                              |    1 +
 include/linux/bootconfig.h               |   10 ++++++++
 init/Kconfig                             |   21 ++++++++++++++++-
 init/main.c                              |   38 +++++++++++++++---------------
 lib/.gitignore                           |    1 +
 lib/Makefile                             |   10 +++++++-
 lib/bootconfig-data.S                    |   10 ++++++++
 lib/bootconfig.c                         |   13 ++++++++++
 9 files changed, 111 insertions(+), 24 deletions(-)
 create mode 100644 lib/bootconfig-data.S

--
Masami Hiramatsu (Linaro) <mhiramat@kernel.org>
