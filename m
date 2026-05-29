Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2413B47F9;
	Fri, 29 May 2026 21:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088461; cv=none; b=BTmTGs6pvhGzZTKa+yB4Kh3LUOA7atJZvjiAuAYCC2p4qoIU6bLoCsTXz2k3jo9lPrpUbCgQRXdenFE7KycCOU9598p6siny9k9XcwQ9RLEu21+uxTIbHS/qLDMpbA1QOr1c2wKaHiFu7av23cZFeCYfa2NgQ1uZ6nTd9XyKmT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088461; c=relaxed/simple;
	bh=BeSjDVEUs5cxVxsA3Lsc9BG98tAXeeiAJntU1JVS6l8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aRp2xmRoORd/sxRuKeOegO4dX0hsYf4ODCAtZVeV30npJh/G3oAmO010oT+RGrEArI3thUXCGSMU2rQQmpL0zrjRR82L+dvOhONtm+rfclx8TPuNqDm4pUqbGU4FODM/UphZm1p4Ko7SjHgI2WJHgelG1IyzpShpsAl4eaEaArs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4LVW4K1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4LVW4K1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BE21F00893;
	Fri, 29 May 2026 21:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780088458;
	bh=W4kgomCxiK083xQP72es5bL3/Wo4fueIjZAYHzL/bWM=;
	h=Date:From:To:Cc:Subject;
	b=S4LVW4K1vWnzYseQOAufd9ARs4gHGeM3KlXgoY/V6FwgLQPI/uguBGDUJLfA6KWSJ
	 5L0kkDkszAHb0hL+8a5A/QLsfm/F9TLUgMe5JyK0pw5GpBBtfTAs6rDvyrOP2u/WeF
	 S071EWMFYmieMz52qv8IaMEQtpGi0e409dLoOl1EOJwM4B4JN2+KYyIUWQ8ziN2TL0
	 MB4V2rGJ5J4scVwCvtCKSuxtpoEExwRPOv7kfW8b43wdXQTuRpZe3ePFJ4W3hieSTd
	 mYfN/xIfzT6oA9Hww7CwZasieL4Eh6elyGvYHZnD5ClS+BxpHyKV2aCbcdCa82wTZW
	 3lsi2ywRmZtjw==
Date: Fri, 29 May 2026 14:00:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [GIT PULL] Clang build fix for 7.1 #2
Message-ID: <20260529210055.GA2415550@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please consider pulling this small fix to disable -Wattribute-alias for
clang in the few places it is already disabled for GCC, now that tip of
tree clang has implemented -Wattribute-alias as GCC has. If you would
prefer for this to wait until the next merge window given your recent
comments on the 7.1-rc5 announcement, I can resend later. Given how
simple it is coupled with just expanding what already exists, I figured
it was not unreasonable to send it as a fix now, especially since it is
showing up in our stable builds as well.

This has been in -next for several cycles in one form with no reported
issues but I updated it yesterday to avoid breaking the build for other
versions of clang-23 that do not have this flag implemented, as this can
be rough on vendored toolchains or people like myself that have to
bisect LLVM between releases and it was rather simple to do with another
pragma line.

Please let me know if there are any issues or objections.

Cheers,
Nathan

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git tags/clang-fixes-7.1-2

for you to fetch changes up to 175db11786bde9061db526bf1ac5107d915f5163:

  Disable -Wattribute-alias for clang-23 and newer (2026-05-28 06:51:30 -0700)

----------------------------------------------------------------
Clang build fixes for 7.1 #2

- Account for recently implemented -Wattribute-alias in clang by
  disabling it in the same places it is disabled for GCC.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Nathan Chancellor (1):
      Disable -Wattribute-alias for clang-23 and newer

 arch/riscv/include/asm/syscall_wrapper.h | 4 ++++
 include/linux/compat.h                   | 4 ++++
 include/linux/compiler-clang.h           | 6 ++++++
 include/linux/compiler_types.h           | 4 ++++
 include/linux/syscalls.h                 | 4 ++++
 5 files changed, 22 insertions(+)
