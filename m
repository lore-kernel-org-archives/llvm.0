Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937642906;
	Sat, 27 Jan 2024 00:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706317008; cv=none; b=m0iQsvk3kUND6V7zsd7+h9SO7DIJb/UHjU1hJvv2l25oGqFFq8zFBLih0FCiC/YnGYtze5r0wPY8JpvoquEuVTUb1J2WWdT1ZZcliNZv/jtI+aPaWRX0+ZknzE0uBnN+3EqOdb3E3WSoP8RqmNBo4Hj40GYIc3/jAB7a7X2AJn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706317008; c=relaxed/simple;
	bh=KG84u+AkEH0r3Ca0/Kjc9Q4sbbcaHXDZghFieSQRSBY=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=tG/n8VGZe7QM+GqOEOxVm+K/DfgqXyEnZ0g49zlNeNBS/Cb54HatPw6pWlYeC/4eh7RZ3zSqaScl2FFkdhGVRZs5aWrH8aiqeKUSbfhBvPbkGbrO7TEAPWlNHZglEPP1dTWucFCeHOrNTrPj7vJZHBmUiK2cKR8bZudm7EF8Mbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jeAoVpcF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jeAoVpcF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FEBC433C7;
	Sat, 27 Jan 2024 00:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706317008;
	bh=KG84u+AkEH0r3Ca0/Kjc9Q4sbbcaHXDZghFieSQRSBY=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=jeAoVpcFYiIfeuxNNxeU51QuwDxTZ4Md6aJWK3GTaPGMA0I6VOfhJo+s9RGn0eW6U
	 AD6m5B0Sm+S54yltP23/n5xmkLZFMJ3NRH3rQYBgE2t2SpwghFN9dknAlQagqjHXQB
	 YelhBiO72DVVSZulVOCFZqFBTMX5ttnB6sTAxJnA=
Subject: Patch "powerpc: Use always instead of always-y in for crtsavres.o" has been added to the 5.4-stable tree
To: gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org,llvm@lists.linux.dev,nathan@kernel.org,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 26 Jan 2024 16:56:37 -0800
In-Reply-To: <20240126-5-4-fix-lib-powerpc-backport-v1-1-2c110ed18b1d@kernel.org>
Message-ID: <2024012637-thicken-rework-ab70@gregkh>
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

    powerpc: Use always instead of always-y in for crtsavres.o

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-use-always-instead-of-always-y-in-for-crtsavres.o.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Fri Jan 26 16:51:54 2024
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 26 Jan 2024 10:37:02 -0700
Subject: powerpc: Use always instead of always-y in for crtsavres.o
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,  linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,  Nathan Chancellor <nathan@kernel.org>
Message-ID: <20240126-5-4-fix-lib-powerpc-backport-v1-1-2c110ed18b1d@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

This commit is for linux-5.4.y only, it has no direct upstream
equivalent.

Prior to commit 5f2fb52fac15 ("kbuild: rename hostprogs-y/always to
hostprogs/always-y"), always-y did not exist, making the backport of
mainline commit 1b1e38002648 ("powerpc: add crtsavres.o to always-y
instead of extra-y") to linux-5.4.y as commit 245da9eebba0 ("powerpc:
add crtsavres.o to always-y instead of extra-y") incorrect, breaking the
build with linkers that need crtsavres.o:

  ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory

Backporting the aforementioned kbuild commit is not suitable for stable
due to its size and number of conflicts, so transform the always-y usage
to an equivalent form using always, which resolves the build issues.

Fixes: 245da9eebba0 ("powerpc: add crtsavres.o to always-y instead of extra-y")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/lib/Makefile |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -34,8 +34,8 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)	+
 # 64-bit linker creates .sfpr on demand for final link (vmlinux),
 # so it is only needed for modules, and only for older linkers which
 # do not support --save-restore-funcs
-ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
-always-$(CONFIG_PPC64)	+= crtsavres.o
+ifeq ($(call ld-ifversion, -lt, 225000000, y)$(CONFIG_PPC64),yy)
+always	+= crtsavres.o
 endif
 
 obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-5.4/powerpc-use-always-instead-of-always-y-in-for-crtsavres.o.patch
