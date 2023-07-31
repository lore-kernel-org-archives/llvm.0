Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03A31DDC0
	for <llvm@lists.linux.dev>; Mon, 31 Jul 2023 18:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A0FC433C9;
	Mon, 31 Jul 2023 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690826958;
	bh=Eb18bMMUZkKagNn+C4Y50Vy1Cg7bID/NgVClslAn604=;
	h=Date:From:To:Subject:From;
	b=kGUeEmNeMlQm8cde18GWfz871eP9XzNOV1eKzxczNFR2m/8BDMOCdft3OffkNOnQJ
	 DEZU2fzWRt4WsX6BVw7uRb5aMSr+tjS3T7WXhJzT1n8qOMJvqgvuwAmowOpb+EMywr
	 +G2YQb5LL64+HaOtUEL/PCO1e+GQIwKnJcJDb75xwoxb5MZCv04QM+gdrGB0/o41vK
	 4ZwhWnVsdSzqHGFRUdii+kygT7VHfcdRa1MEAF6xI5esaeow584BWGYqAyJAyXvh31
	 0IjpKQzH+shPfvvuZSnZx4G2pfQ5ByueMz9mmF9JxdcUDalRDwJj5/obPyJF+Wxntb
	 mbTkhz71lN0zA==
Date: Mon, 31 Jul 2023 11:09:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Prebuilt LLVM 17.0.0-rc1 uploaded
Message-ID: <20230731180916.GA2401456@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded a prebuilt version of LLVM 17.0.0-rc1 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

As with Linux -rc releases, this is not the final version that will
ship. If you run across any issues, especially ones that were not
present in earlier LLVM releases, please consider reporting them to us
so that we have a chance to investigate and fix them before the final
release.

Cheers,
Nathan
