Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A2E46AB
	for <llvm@lists.linux.dev>; Mon, 19 Dec 2022 15:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AAEC433EF;
	Mon, 19 Dec 2022 15:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671463571;
	bh=Hu3FgL4IL2JBUaBE8gcwEdnNOK9X7aQnS/FovjtJwVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLmlZ4DJOz+bov2ywGFmpGv2cnN9MmEWec4sgfMw02D/jehX/d0/+5kJ8laLaysM/
	 KbWRAF4qtYRmG68V0ULPUWIjQqNbL8qecPsp5uDqLkPkOURdxruVfWcjodPW1deGjb
	 e84/P3TY/X6+AZ+pP8/JXdvyRfb0dj/MjUCU+bPFKrw/TAHQuOGeNYPe/VXj3oyvsG
	 4WHgx5wcqJtfPmMKfMGqi8w/XY0WLdPQIailN61lYb5u1mSrQ3icCVIZq6fsH6TM5k
	 1IV5yDtm5zqQNCGomQIpaBmeX5LLXUhGrGSiy2D+Rw3L8u1uVVw2K56ryTxfxNv4IL
	 /1tVZYHtYUtrw==
Date: Mon, 19 Dec 2022 08:26:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linux-stable <stable@vger.kernel.org>, llvm@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>, lkft-triage@lists.linaro.org
Subject: Re: Linux-stable-rc/ queue_5.10
Message-ID: <Y6CCkWLcNZMqN8UV@dev-arch.thelio-3990X>
References: <CA+G9fYs=G_AAbkNOfLv7Oyvt6uOZ8CYun8fUQ-GghoKtbD5WAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYs=G_AAbkNOfLv7Oyvt6uOZ8CYun8fUQ-GghoKtbD5WAw@mail.gmail.com>

Hi Naresh,

On Mon, Dec 19, 2022 at 08:47:32PM +0530, Naresh Kamboju wrote:
> The MIPS tinyconfig with clang nightly  build failed,
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build warnings / errors,
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=0
> ARCH=mips CROSS_COMPILE=mips-linux-gnu- HOSTCC=clang CC=clang
> tinyconfig
> 
> /tmp/calibrate-9ea8cf.s: Assembler messages:
> /tmp/calibrate-9ea8cf.s:134: Error: .module is not permitted after
> generating code
> /tmp/calibrate-9ea8cf.s:168: Error: .module is not permitted after
> generating code
> /tmp/calibrate-9ea8cf.s:192: Error: .module is not permitted after
> generating code
> /tmp/calibrate-9ea8cf.s:216: Error: .module is not permitted after
> generating code
> clang: error: assembler command failed with exit code 1 (use -v to see
> invocation)
> make[2]: *** [/builds/linux/scripts/Makefile.build:286:
> init/calibrate.o] Error 1

Thanks for the report. This is a toolchain regression that should
hopefully be resolved soon:

https://reviews.llvm.org/D138179#4002068

https://reviews.llvm.org/D140270

Cheers,
Nathan
