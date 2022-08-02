Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74B77F
	for <llvm@lists.linux.dev>; Tue,  2 Aug 2022 20:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC440C433C1;
	Tue,  2 Aug 2022 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659471927;
	bh=Ey9Ry8FgMCnLx5z8M7GJPMUkYp4CCdxvX06b5Ic/gt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hp5bIZmqftWQO7deymF2MqbDs4Muz1xzBpfB8Qizv7v/qYbHWMyoT5Q8mZGcToR0+
	 n7UNcUOjT6Y+CLHF4lfV75jNPQ0RBZAL7lJ+YmDINn/8WSBYTRUXyflrsaAtOO21nA
	 gPofzjCstkI0fHxWDtx9bLg5bTMZoQCKqOhUSY489uSgfaX/xb4WqV4ObpTkd0csPV
	 k/0hlV5ZKlJayvsGYSot7UF15Fc3TR2EYcci/68qNPlx5Jd3w/XdAo49ztP6Gshz1V
	 Dk6bhhuSpsSotDalr6yONcw66lx8SOKIEsLVl7nCTnA2SR0Hg72WKYsuqDG7xwUD+W
	 7NVK+8DywYyxQ==
Date: Tue, 2 Aug 2022 13:25:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Tom Rix <trix@redhat.com>, sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] soc: sof: fix clang -Wformat warnings
Message-ID: <YumINAZ4WaM4rG7Q@dev-arch.thelio-3990X>
References: <20220721211218.4039288-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721211218.4039288-1-justinstitt@google.com>

Hi all,

On Thu, Jul 21, 2022 at 02:12:18PM -0700, Justin Stitt wrote:
> When building with Clang we encounter these warnings:
> | sound/soc/sof/ipc3-topology.c:2343:4: error: format specifies type
> | 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
> |                  SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
> |                  ^~~~~~~~~~~~~~~^~~~~~~~~~~~~~~^~~~~~~~~~~~~
> 
> Use correct format specifier `%d` since args are of type int.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Reported by Nathan here:
> https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/
> 
>  sound/soc/sof/ipc3-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
> index b2cc046b9f60..65923e7a5976 100644
> --- a/sound/soc/sof/ipc3-topology.c
> +++ b/sound/soc/sof/ipc3-topology.c
> @@ -2338,7 +2338,7 @@ static int sof_ipc3_parse_manifest(struct snd_soc_component *scomp, int index,
>  	}
>  
>  	dev_info(scomp->dev,
> -		 "Topology: ABI %d:%d:%d Kernel ABI %hhu:%hhu:%hhu\n",
> +		 "Topology: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
>  		 man->priv.data[0], man->priv.data[1], man->priv.data[2],
>  		 SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
>  
> -- 
> 2.37.1.359.gd136c6c3e2-goog
> 
> 

Is it too late for this patch to make 6.0? We are trying to enable
-Wformat for clang in 6.0 and this instance of that warning was
introduced this development cycle by commit 323aa1f093e6 ("ASoC: SOF:
Add a new IPC op for parsing topology manifest"). If I am tracking all
my patches correctly, this is the only instance of -Wformat that does
not have a patch applied to a maintainer's tree so it would be really
unfortunate if we could not sure it on for -rc1.

We could probably route this via the Kbuild tree with an Ack along with
the patch that enables -Wformat if it cannot go via Mark's or Takashi's
ree.

Cheers,
Nathan
