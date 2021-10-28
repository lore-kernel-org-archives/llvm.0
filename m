Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21642C82
	for <llvm@lists.linux.dev>; Thu, 28 Oct 2021 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/PIY8vpGmbdsegSx8bPFAOGGxlkKA3QOtmJXtI5iQwc=; b=gE3WT86JNN5XETZIatV/AeHQox
	dko7Pb+DuDautpcO/ym6NuWBsGaG2z3NMUgM2YXATH1BsiVOzicqBiJ3jO5dWLFXQvU85Egf05z98
	qRjn6q29n0YHczp3fdQZ8G7X9i/B9UDG6hrw1+Jg6KdpXJpOj/pmSj9aoogICs5CavgPSVKfULu4o
	yUwYNQ+V/2cPYqpw1DXwlXhW6l7Y6MjKJAVgw9CX0MHK6Q36drPVYnrY1jux9QQfPCUTLymY6PduE
	gOY49vdzVRJo+IN96/xkLaPf4LYzevIiyvCEShL+wsqcKLiXQSIRQ1FxQx6hRQP8CuLXbs97sXOpm
	zqC6atGQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg6we-00CpDn-R4; Thu, 28 Oct 2021 15:03:56 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E1CA030022C;
	Thu, 28 Oct 2021 17:03:55 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id C8EF220279F20; Thu, 28 Oct 2021 17:03:55 +0200 (CEST)
Date: Thu, 28 Oct 2021 17:03:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Michal Marek <michal.lkml@markovi.net>, X86 ML <x86@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Support clang-$ver builds
Message-ID: <YXq72/yPe76DhDLu@hirez.programming.kicks-ass.net>
References: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
 <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
 <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net>
 <YXqyHhWGJfDkuxjP@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXqyHhWGJfDkuxjP@hirez.programming.kicks-ass.net>

On Thu, Oct 28, 2021 at 04:22:22PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 28, 2021 at 04:15:02PM +0200, Peter Zijlstra wrote:
> > On Thu, Oct 28, 2021 at 11:07:40PM +0900, Masahiro Yamada wrote:
> > > On Thu, Oct 28, 2021 at 10:44 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > Debian (and derived) distros ship their compilers as -$ver suffixed
> > > > binaries. For gcc it is sufficent to use:
> > > >
> > > >  $ make CC=gcc-12
> > > >
> > > > However, clang builds (esp. clang-lto) need a whole array of tools to be
> > > > exactly right, leading to unweildy stuff like:
> > > >
> > > >  $ make CC=clang-13 LD=ld.lld=14 AR=llvm-ar-13 NM=llvm-nm-13 OBJCOPY=llvm-objcopy-13 OBJDUMP=llvm-objdump-13 READELF=llvm-readelf-13 STRIP=llvm-strip-13 LLVM=1
> > > >
> > > > which is, quite franktly, totally insane and unusable. Instead use the
> > > > already mandatory LLVM variable to convey this, enabling one such as
> > > > myself to use:
> > > >
> > > >  $ make LLVM=-13
> > > >
> > > > This also lets one quickly test different clang versions.
> > > 
> > > 
> > > Please read the commit log of
> > > a0d1c951ef08ed24f35129267e3595d86f57f5d3
> > 
> > That's yuck, I like LLVM=-13 or LLVM=-12 much better to select between
> > compilers. Means I don't have to remember wth they live and or wreck
> > PATH.
> 
> Even better, why not do something like:
> 
> if test "${CC:0:5}" == "clang"
> then
> 	LLVM=1
> 	LLVM_SFX=${CC:5}
> fi
> 
> Then we can simply use: make CC=clang-12 and have it all just work.
> 

Like so..

---
 Makefile                       | 26 ++++++++++++++++----------
 tools/scripts/Makefile.include | 22 ++++++++++++++--------
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 30c7c81d0437..1d0d4494e01d 100644
--- a/Makefile
+++ b/Makefile
@@ -423,9 +423,15 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS 2>/dev/null)
 HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
 HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
 
+CC_BASE = $(shell echo $(CC) | cut -b "1-5")
+ifeq ($(shell test $(CC_BASE) = clang; echo $$?),0)
+LLVM := 1
+LLVM_SFX := $(shell echo $(CC) | cut -b "6-")
+endif
+
 ifneq ($(LLVM),)
-HOSTCC	= clang
-HOSTCXX	= clang++
+HOSTCC	= clang$(LLVM_SFX)
+HOSTCXX	= clang++$(LLVM_SFX)
 else
 HOSTCC	= gcc
 HOSTCXX	= g++
@@ -443,14 +449,14 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
 # Make variables (CC, etc...)
 CPP		= $(CC) -E
 ifneq ($(LLVM),)
-CC		= clang
-LD		= ld.lld
-AR		= llvm-ar
-NM		= llvm-nm
-OBJCOPY		= llvm-objcopy
-OBJDUMP		= llvm-objdump
-READELF		= llvm-readelf
-STRIP		= llvm-strip
+CC		= clang$(LLVM_SFX)
+LD		= ld.lld$(LLVM_SFX)
+AR		= llvm-ar$(LLVM_SFX)
+NM		= llvm-nm$(LLVM_SFX)
+OBJCOPY		= llvm-objcopy$(LLVM_SFX)
+OBJDUMP		= llvm-objdump$(LLVM_SFX)
+READELF		= llvm-readelf$(LLVM_SFX)
+STRIP		= llvm-strip$(LLVM_SFX)
 else
 CC		= $(CROSS_COMPILE)gcc
 LD		= $(CROSS_COMPILE)ld
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 071312f5eb92..94c41083a7c7 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -51,12 +51,18 @@ define allow-override
     $(eval $(1) = $(2)))
 endef
 
+CC_BASE = $(shell echo $(CC) | cut -b "1-5")
+ifeq ($(shell test $(CC_BASE) = clang; echo $$?),0)
+LLVM := 1
+LLVM_SFX := $(shell echo $(CC) | cut -b "6-")
+endif
+
 ifneq ($(LLVM),)
-$(call allow-override,CC,clang)
-$(call allow-override,AR,llvm-ar)
-$(call allow-override,LD,ld.lld)
-$(call allow-override,CXX,clang++)
-$(call allow-override,STRIP,llvm-strip)
+$(call allow-override,CC,clang$(LLVM_SFX))
+$(call allow-override,AR,llvm-ar$(LLVM_SFX))
+$(call allow-override,LD,ld.lld$(LLVM_SFX))
+$(call allow-override,CXX,clang++$(LLVM_SFX))
+$(call allow-override,STRIP,llvm-strip$(LLVM_SFX))
 else
 # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
 $(call allow-override,CC,$(CROSS_COMPILE)gcc)
@@ -69,9 +75,9 @@ endif
 CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
 
 ifneq ($(LLVM),)
-HOSTAR  ?= llvm-ar
-HOSTCC  ?= clang
-HOSTLD  ?= ld.lld
+HOSTAR  ?= llvm-ar$(LLVM_SFX)
+HOSTCC  ?= clang$(LLVM_SFX)
+HOSTLD  ?= ld.lld$(LLVM_SFX)
 else
 HOSTAR  ?= ar
 HOSTCC  ?= gcc
