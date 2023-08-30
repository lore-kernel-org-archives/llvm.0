Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB64A23DF
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 15:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7EBC433C8;
	Wed, 30 Aug 2023 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693409624;
	bh=gzcbRtMaT4maj5dYPN1BKdQWxeis9Z2fvcWGGIyz/Jk=;
	h=Date:From:To:Cc:Subject:From;
	b=eYGOdS++mCbvQtDJw53dk31OQCUcdshDJwG+YBA3lwIDtL6hnWMkyh5tYVTMuTQ0z
	 nxfF7FHvF4la/rs/jbA7PpwaV++Zdo7NOrVF+845gE6qySIMl3Rh6ScxCDZ9HHwpAb
	 ITDsiHEu5VKnziZEnRYSQ2OkTvNXebFM2fZfH7cx/19NzwMkgctDDbL/ibDOXujo4A
	 2x/5I9lgcUlnxxFcQof/BD+SOrzJB2d4pUzU4MSfRwPn1E1sEY7Fii+XYBTgCbybGb
	 6pxmitgyqH286aLvwDQoNTq8oQTd5x9IS82AYqSU8QREvL/A51gm6xT8D34ZBdWnKW
	 UwMHgicxcyYoQ==
Date: Wed, 30 Aug 2023 08:33:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Apply 9451c79bc39e610882bdd12370f01af5004a3c4f to linux-5.4.y
Message-ID: <20230830153342.GA888898@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg and Sasha,

Please consider applying commit 9451c79bc39e ("powerpc/pmac/smp: Avoid
unused-variable warnings") to 5.4, as it resolves a build failure that
we see building ppc64_guest_defconfig with clang due to arch/powerpc
compiling with -Werror by default:

  arch/powerpc/platforms/powermac/smp.c:664:26: error: unused variable 'core99_l2_cache' [-Werror,-Wunused-variable]
    664 | volatile static long int core99_l2_cache;
        |                          ^~~~~~~~~~~~~~~
  arch/powerpc/platforms/powermac/smp.c:665:26: error: unused variable 'core99_l3_cache' [-Werror,-Wunused-variable]
    665 | volatile static long int core99_l3_cache;
        |                          ^~~~~~~~~~~~~~~
  2 errors generated.

I have verified that it applies cleanly and does not appear to have any
direct follow up fixes, although commit a4037d1f1fc4 ("powerpc/pmac/smp:
Drop unnecessary volatile qualifier") was in the same area around the
same time so maybe it makes sense to take that one as well but I don't
think it has any functional impact.

Cheers,
Nathan
