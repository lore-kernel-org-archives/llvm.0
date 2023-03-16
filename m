Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D6D20EE
	for <llvm@lists.linux.dev>; Thu, 16 Mar 2023 08:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2570EC433EF;
	Thu, 16 Mar 2023 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678955077;
	bh=G0/nBtH8WC56Cxm7yIAPjZh8oJ+J26uaPEtLVwTwW9Q=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=LbER2ll3sWe0BvNwX4QAfPEAvcw/awd6Ox3S5NjqbPkb/n4LzPtb/yZI7R2CaZ27c
	 V2DinlSbHEzzzDeGNUmHIY/SQn95Wo96iU+pkVpsXF+IaxqWOxpdXjN2HDoxRu1Vt+
	 QCsrZM5AMyn6wrjf/T4qH+6kk5YaE90nLhxUOmcA=
Subject: Patch "Makefile: use -gdwarf-{4|5} for assembler for DEBUG_INFO_DWARF{4|5}" has been added to the 5.15-stable tree
To: gregkh@linuxfoundation.org,lecopzer.chen@mediatek.com,llvm@lists.linux.dev,masahiroy@kernel.org,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 16 Mar 2023 09:24:34 +0100
In-Reply-To: <20230315214059.395939-1-ndesaulniers@google.com>
Message-ID: <16789550744893@kroah.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    Makefile: use -gdwarf-{4|5} for assembler for DEBUG_INFO_DWARF{4|5}

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     makefile-use-gdwarf-4-5-for-assembler-for-debug_info_dwarf-4-5.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From ndesaulniers@google.com  Thu Mar 16 09:23:48 2023
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 15 Mar 2023 14:40:59 -0700
Subject: Makefile: use -gdwarf-{4|5} for assembler for DEBUG_INFO_DWARF{4|5}
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sashal@kernel.org, stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, Lecopzer Chen <lecopzer.chen@mediatek.com>
Message-ID: <20230315214059.395939-1-ndesaulniers@google.com>

From: Nick Desaulniers <ndesaulniers@google.com>

This is _not_ an upstream commit and just for 5.15.y only. It is based
on upstream
commit 32ef9e5054ec ("Makefile.debug: re-enable debug info for .S files").

When the user has chosen not to use their compiler's implicit default
DWARF version (which changes over time) via selecting
- CONFIG_DEBUG_INFO_DWARF4 or
- CONFIG_DEBUG_INFO_DWARF5
we need to tell the compiler this for Asm sources as well as C sources.
(We use the compiler to drive assembler jobs in kbuild, since most asm
needs to be preprocessed first).  Otherwise, we will get object files
built from Asm sources with the compiler's implicit default DWARF
version.

For example, selecting CONFIG_DEBUG_INFO_DWARF4 would produce a DWARFv5
vmlinux, since it was a mix of DWARFv4 object files from C sources and
DWARFv5 object files from Asm sources when using Clang as the assembler
(ex. `make LLVM=1`).

Fixes: 0ee2f0567a56 ("Makefile.debug: re-enable debug info for .S files")
Reported-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Makefile |    1 +
 1 file changed, 1 insertion(+)

--- a/Makefile
+++ b/Makefile
@@ -888,6 +888,7 @@ ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
 DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
+KBUILD_AFLAGS	+= -gdwarf-$(dwarf-version-y)
 endif
 
 ifdef CONFIG_DEBUG_INFO_REDUCED


Patches currently in stable-queue which might be from ndesaulniers@google.com are

queue-5.15/scripts-handle-brokenpipeerror-for-python-scripts.patch
queue-5.15/makefile-use-gdwarf-4-5-for-assembler-for-debug_info_dwarf-4-5.patch
