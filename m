Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909E12597
	for <llvm@lists.linux.dev>; Wed,  3 Aug 2022 20:44:54 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id r64-20020a254443000000b006707b7c2baeso14187729yba.16
        for <llvm@lists.linux.dev>; Wed, 03 Aug 2022 13:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=0sKogew4m6eCnkm9Qwz368UT9tOW4WxFrPuJ/tuZBLY=;
        b=ob5DwtSjNECtxnS+HT9qoDLpsMlGuD4A/DhuB8jtbj96zm7uzCWnWlX+AiA1OUjzWU
         aqQdI6op/b1qZn2enAIscsZCDTY3DK2dPQPyYuNp/w6zUr9V3sENZuk1TSMLDGjSu1QW
         5RqZgwgK+WcrVObpOSatpr5G0sPmzOo5mil/POxat7xjWKAmVE4ULVIguXSh5npxVwus
         HSOEaImyJF9jklYeGzL/yThSRIa8f7pW2sjf65LsLL8okLaK+39bR0XwEFTjHhpwEKyb
         11Yl+p7oJaiZduYb7i+ZhCdj40d+5JQpiijRq7tHU4Rnhzo1uQudKhmcal39TM8WCoBM
         KTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=0sKogew4m6eCnkm9Qwz368UT9tOW4WxFrPuJ/tuZBLY=;
        b=cWklJbv5eBP76I+lxgU/0gp5wjxIPqoFck+00oBIYOrF6yf2QCG7vmlIEvvIyPMQBL
         JriIBjasSv0+uoCJjSPnbUYV/qCnuJoEn7tPuGGsUuX/e9fiSTdMvwiMeMfm6Xz/9SBA
         6Vi6cvE+BNtkSAxMsxLnyPf6NfLRBpm1JbixNfZkS1jdYqt2ToZx9pnl5f5osFh/lBOd
         UoYtuQ5zgE35Jy1AqmqNFd19UOVguc3sqKVWg65camO9OC7R9ZvW15SSTySGBb+z7IMT
         GkoYQj8Q+PSQ9wIrXRfoeEDhtM3PgIvpbm+53TFe1ISTPeZFLrYIWDLIepsBTK21oiSl
         lR6w==
X-Gm-Message-State: ACgBeo076bFaN0T2uC7HgdW0zYISjqJAqJ52UqoXTRgcO1tRQF8FtgD2
	t3SVo/0vuA8KwaQajgUFIPR/cpp+OrXpDzNp5A==
X-Google-Smtp-Source: AA6agR5swAlRAG0PoXXTtzTzeRtGlfsuTK3cgLN3STV50CkZr1FuU63M63rJYJC1oNB2Odd/8z1DQzP4Zmk5hllYvg==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:1bc6:4ec2:4609:dea0])
 (user=justinstitt job=sendgmr) by 2002:a81:5ca:0:b0:31f:38d6:f59f with SMTP
 id 193-20020a8105ca000000b0031f38d6f59fmr24401528ywf.324.1659559493505; Wed,
 03 Aug 2022 13:44:53 -0700 (PDT)
Date: Wed,  3 Aug 2022 13:44:42 -0700
Message-Id: <20220803204442.2996580-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
Subject: [PATCH resend] ASoC: SOF: ipc3-topology: Fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter these warnings:
| sound/soc/sof/ipc3-topology.c:2343:4: error: format specifies type
| 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
|                  SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
|                  ^~~~~~~~~~~~~~~^~~~~~~~~~~~~~~^~~~~~~~~~~~~

Use correct format specifier `%d` since args are of type int.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Reported-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: resending with the subject corrected, this patch fixes a build
warning that will break the Clang build when CONFIG_WERROR=y.

Original patch: https://lore.kernel.org/all/20220721211218.4039288-1-justinstitt@google.com/
Reported by Nathan here: https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/

 sound/soc/sof/ipc3-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index b2cc046b9f60..65923e7a5976 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2338,7 +2338,7 @@ static int sof_ipc3_parse_manifest(struct snd_soc_component *scomp, int index,
 	}
 
 	dev_info(scomp->dev,
-		 "Topology: ABI %d:%d:%d Kernel ABI %hhu:%hhu:%hhu\n",
+		 "Topology: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
 		 man->priv.data[0], man->priv.data[1], man->priv.data[2],
 		 SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
 
-- 
2.37.1.359.gd136c6c3e2-goog

