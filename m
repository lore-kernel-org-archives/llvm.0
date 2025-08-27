Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81DC4438B;
	Wed, 27 Aug 2025 22:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756333972; cv=none; b=DYsMu0hRFVj/V846LXF7VVr80UeaJC2j3W7ClNn6bNiZpSISoXoCawlONe+7tyuIQCJBvBhmtx+MIa7vWBxdN34aY7Z/hnTl5GR7Chp8025VtRmemIbv40k/0K79mQHAVTHSpAwBmrMzHUGFLHhwgKsCG68QT3IRbTnPACC++Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756333972; c=relaxed/simple;
	bh=cRelml25IfoTwK51wDUFEa70KndPvy9eVTz2jlD6W/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcAsUCAzxBxgPxfDOLK2PY2WLyG5M9WIDgndkoR31HetxcDZgRsLq90WpMwGw/USsNEYJcbirrHCRTajRPF7uwJabuXJWmSfFVj6CWXPHMsRIO3PSP9QLUaelSRkbvbV0831d9f5fIm/jIKFgX7dN2k+ghxCy+bMv/8QWQv98LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLVXA3rv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLVXA3rv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435DCC4CEEB;
	Wed, 27 Aug 2025 22:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756333972;
	bh=cRelml25IfoTwK51wDUFEa70KndPvy9eVTz2jlD6W/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLVXA3rvVL/xLvQM02B2kEiKsZUFYbVnDpYKlY74wcDwZ1PSzb9ZeX0twU4Gf3XSc
	 xScyl/c+8K4sM/srfX/Ih9RIk30m+ZudPEWJFCnFcP1EkMjnP9duhl8tCp1RJ2iHzd
	 fhAY5T6iMgkmf7hmFN/GEjBpKxDTiuC9G8p2stdT51PnEbsvsmgoBzaXQshdWJxX0z
	 qPr7jugXhyXUOEzyJqig6YEANXErQkc+QIYL/1LK+mXoZEwyBzvHq/Qf/hLaGT7nCS
	 q0voC0Vvq6PyJ3Ryq9y1IV7NIs5YBwKqk8/aNerzXsPKwPoQr2Ibgu4AY0HmpaYq7g
	 81lYPv1PVPh5g==
Date: Wed, 27 Aug 2025 15:32:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Ingo Molnar <mingo@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>,
	Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Bill Wendling <morbo@google.com>
Subject: Re: [linux-next:master 4166/4221] vmlinux.o: warning: objtool:
 dev_pm_opp_find_level_exact+0x47: no-cfi indirect call!
Message-ID: <20250827223247.GA414199@ax162>
References: <202508261620.orOkZR9F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508261620.orOkZR9F-lkp@intel.com>

Hi Peter and Viresh,

+ kCFI folks

On Tue, Aug 26, 2025 at 04:37:57PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6c68f4c0a147c025ae0b25fab688c7c47964a02f
> commit: f441989dc8b0ebb984b4781856865eeb17d1bff4 [4166/4221] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250826/202508261620.orOkZR9F-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250826/202508261620.orOkZR9F-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508261620.orOkZR9F-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> vmlinux.o: warning: objtool: dev_pm_opp_find_level_exact+0x47: no-cfi indirect call!
> >> vmlinux.o: warning: objtool: dev_pm_opp_find_level_ceil+0x75: no-cfi indirect call!
> >> vmlinux.o: warning: objtool: dev_pm_opp_find_level_floor+0x66: no-cfi indirect call!

Not sure if this is a clang, objtool, or source code issue but I figured
I would brain dump what I have so far when looking into this.

Initially, the warning is odd because I do not see any instances of
__nocfi in drivers/opp/core.c? I could reproduce this on next-20250826
but not next-20250827, which both contain commit 894af4a1cde6 ("objtool:
Validate kCFI calls"). More simply from the robot's configuration:

  $ git switch --detach next-20250826
  HEAD is now at d0630b758e59 Add linux-next specific files for 20250826

  $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper defconfig

  $ scripts/config \
      -e CFI_CLANG \
      -e COMMON_CLK \
      -e CPUFREQ_DT \
      -e OF

  $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 olddefconfig vmlinux
  vmlinux.o: warning: objtool: dev_pm_opp_find_level_exact+0x2b: no-cfi indirect call!
  vmlinux.o: warning: objtool: dev_pm_opp_find_level_ceil+0x35: no-cfi indirect call!
  vmlinux.o: warning: objtool: dev_pm_opp_find_level_floor+0x30: no-cfi indirect call!

As the bisection landed on the merge of the tip tree in -next, it only
appears when x86/core is crossed with some other tree. I did my own
bisect of next-20250826 between the tip of tree and its -tip merge,
landing on commit b5323835f050 ("OPP: Reorganize _opp_table_find_key()")
[1], which was on the mailing list as [2].

  # bad: [d0630b758e593506126e8eda6c3d56097d1847c5] Add linux-next specific files for 20250826
  # good: [92a783272bdf0b37d72314fbd5c6d18cfb4b45fa] Merge branch into tip/master: 'x86/core'
  git bisect start 'next-20250826' '92a783272bdf0b37d72314fbd5c6d18cfb4b45fa'
  # bad: [968d16786392f6e047329f5eff66acc131636019] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
  git bisect bad 968d16786392f6e047329f5eff66acc131636019
  # good: [907ba6bf3993355b2623c1697714d9f8716ab30a] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git
  git bisect good 907ba6bf3993355b2623c1697714d9f8716ab30a
  # good: [c8a60cd0aa8fad5819652e7c720a290afc7c5c17] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
  git bisect good c8a60cd0aa8fad5819652e7c720a290afc7c5c17
  # good: [76e1b7343acf0ab8fd282b3695a3dfd252170d08] Merge branch 'docs-next' of git://git.lwn.net/linux.git
  git bisect good 76e1b7343acf0ab8fd282b3695a3dfd252170d08
  # good: [51d79d123b615ac83aa0f4bad988c2c6a29bf986] media: i2c: vgxy61: Use the v4l2 helper for obtaining the clock
  git bisect good 51d79d123b615ac83aa0f4bad988c2c6a29bf986
  # good: [2b26dcb4f826aca743eacedbcfd68e3539375bc9] Merge branch 'next' of git://linuxtv.org/media-ci/media-pending.git
  git bisect good 2b26dcb4f826aca743eacedbcfd68e3539375bc9
  # good: [72dc2cebef803c8dab2908fb7627b591e71a1dc6] Merge branch 'cpufreq/arm/linux-next' of https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git
  git bisect good 72dc2cebef803c8dab2908fb7627b591e71a1dc6
  # good: [16d861d2bce8b1d28b6d94ffbfcdaa9cf833542b] pmdomain: mediatek: Add support for modem power sequences
  git bisect good 16d861d2bce8b1d28b6d94ffbfcdaa9cf833542b
  # good: [211dc59b7bb5ea0a6ea29072f04a4498c7ab046b] IB/hfi1: Use for_each_online_cpu() instead of for_each_cpu()
  git bisect good 211dc59b7bb5ea0a6ea29072f04a4498c7ab046b
  # bad: [b5323835f05043242537250a070e25f46bb1e1a4] OPP: Reorganize _opp_table_find_key()
  git bisect bad b5323835f05043242537250a070e25f46bb1e1a4
  # good: [ca489c6c68264c3a4d1d701af6fdda6df9833489] OPP: Add support to find OPP for a set of keys
  git bisect good ca489c6c68264c3a4d1d701af6fdda6df9833489
  # first bad commit: [b5323835f05043242537250a070e25f46bb1e1a4] OPP: Reorganize _opp_table_find_key()

It reproduces with

  $ git reset --hard 894af4a1cde61c3401f237184fb770f72ff12df8
  HEAD is now at 894af4a1cde6 objtool: Validate kCFI calls

  $ git merge --no-edit b5323835f05043242537250a070e25f46bb1e1a4
  Merge made by the 'ort' strategy.
   drivers/opp/core.c     | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
   include/linux/pm_opp.h |  30 ++++++++++++++++++++++++++++++
   rust/kernel/opp.rs     |  16 +++++-----------
   3 files changed, 139 insertions(+), 17 deletions(-)

as well. That patch has been dropped due to issues at runtime [3][4],
which explains why next-20250827 does not show any issues.

Looking at the source and the diff, the removal of 'assert &&' in the if
condition before calling assert() in _opp_table_find_key() is suspicious
because the three flagged functions pass NULL as the assert parameter. I
guess this might be another instance of "clang destroying codegen when
encountering UB"... :/ this diff resolves the warnings:

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 81fb7dd7f323..90ee92961901 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -546,7 +546,7 @@ static struct dev_pm_opp *_opp_table_find_key(struct opp_table *opp_table,
 	struct dev_pm_opp *temp_opp, *opp = ERR_PTR(-ERANGE);
 
 	/* Assert that the requirement is met */
-	if (!assert(opp_table, index))
+	if (assert && !assert(opp_table, index))
 		return ERR_PTR(-EINVAL);
 
 	guard(mutex)(&opp_table->lock);

[1]: https://git.kernel.org/next/linux-next/c/b5323835f05043242537250a070e25f46bb1e1a4
[2]: https://lore.kernel.org/20250820-opp_pcie-v4-2-273b8944eed0@oss.qualcomm.com/
[3]: https://lore.kernel.org/4066c0b4-807f-401e-baaa-25f4891f10ac@samsung.com/
[4]: https://lore.kernel.org/aKyS0RGZX4bxbjDj@hu-wasimn-hyd.qualcomm.com/

Cheers,
Nathan
