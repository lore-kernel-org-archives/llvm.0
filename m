Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D757E
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 03:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC14C4339C;
	Thu,  2 Feb 2023 03:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675309104;
	bh=8GlZd68+4GdEpugeLuTwpZAYZlhX8nffQvGke0BiXsY=;
	h=From:To:Cc:Subject:Date:From;
	b=dTL8edCYQ7BvU6RjB4z+2mTJGO3Ko15of/lXcJODalcE6Mex4LEJUssTrRzCj1zRy
	 LtrEXoj20thMLOZaGqldZ3MCoxNPQv/zs6K56YLqNeknGZW29BfbPLn87A83YAocY3
	 AKfB4/w1pxpORWT47j2vnksn+5SQgbGPP68uN/tC/PYSKufeXU1vALDIVTP2fUtXrA
	 T+jFFitOXUdle4+t5/1MDUfpOUcqtGnIpGt57hmLQbRi2qmxz55k0ibmupxDRjdOx/
	 k3ZKjJbm7cIXkSmrEHeuNXQkcJ+b0e4Urec+/mHe152rzjPAiS4mUyynCZjsCb0V4i
	 yeM7L1kOyeIJQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ben Hutchings <ben@decadent.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev
Subject: [PATCH v4 0/6] kbuild: improve source package builds
Date: Thu,  2 Feb 2023 12:37:10 +0900
Message-Id: <20230202033716.341858-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This series improve deb-pkg and (src)rpm-pkg so they can build
without cleaning the kernel tree.
The debian source package will switch to 3.0 (quilt).

My next plans are:

 - add 'srcdeb-pkg' target

 - add more compression mode

 - rewrite snap-pkg and delete the old tar macro



Masahiro Yamada (6):
  kbuild: add a tool to generate a list of files ignored by git
  kbuild: deb-pkg: create source package without cleaning
  kbuild: rpm-pkg: build binary packages from source rpm
  kbuild: srcrpm-pkg: create source package without cleaning
  kbuild: deb-pkg: hide KDEB_SOURCENAME from Makefile
  kbuild: deb-pkg: switch over to format 3.0 (quilt)

 Makefile                 |   4 +
 scripts/.gitignore       |   1 +
 scripts/Makefile         |   2 +-
 scripts/Makefile.package |  94 +++---
 scripts/gen-exclude.c    | 623 +++++++++++++++++++++++++++++++++++++++
 scripts/package/mkdebian |  23 +-
 scripts/package/mkspec   |   8 +-
 7 files changed, 706 insertions(+), 49 deletions(-)
 create mode 100644 scripts/gen-exclude.c

-- 
2.34.1

