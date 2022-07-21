Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E656AB3
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 21:12:46 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id k13-20020a056902024d00b0066fa7f50b97so2138415ybs.6
        for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 14:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=H9qhrESkqws7B+N4ickDyQEkgfiwzQoqEZa3FmSu3cY=;
        b=mHkbVb8pyTYQPWxcIrfNOEjTQyv7GlKv2jUyqlvrEIw43WaBE5bpTN37PKVVXUss3v
         IkGFZGYfzwwH7gvS34yfIicRB8vAcr9J2j6pNIrWs9C/77wyTqntpBio0JKdb4Dv45il
         r9k+0K6lRxoseZA33pY8lAUt6eD5LXlHyfsKu96nKHKgMGYwhXWLKYURO71ud4y1MqNa
         dhP8d18OxotrFHYcH0sCVVNjkK5ChkCvNHPIcqWTkVU0S7pREt3fEL2x9QbFIRuLLfTQ
         o1Qk5Ai+LKZZDuF6QdqNw4QHu/XJrE0oFaQI5jYGxXq7PQINPK2ti9nCnNPd4sxypiOD
         22Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=H9qhrESkqws7B+N4ickDyQEkgfiwzQoqEZa3FmSu3cY=;
        b=0whUpk7sM66fOaJ8eCpjn92PyQB0zX7CU6nadFoQjpYUclVsIrLre9GhSz3i+QItoA
         sDmuh/4fThl7rZwki1GS20vdjsmcknE71IBVi0CA/C+xcL23hM3ZHbPXiOcvb2w/9/pj
         BZtuE0ZaxIy42Xyzu0ZEOTf/jA45sGOiIgiL9rEwV6E8/ZlqRHGERk4+Vk+rNRxoOiTs
         vlxK/fHvLWupTDJ0THnWPuqvxgg/R23NT3yW82yvGlnSqUjW6djISIUk6osc0Q+0m10R
         mqvX0Kql1UgdSsCru9mCBydBpfAgimANq8B3O0lptcjb8M9ZztfkJmVJDUEIv4VPaVZI
         n2eg==
X-Gm-Message-State: AJIora/DxyrUXUVZMZ2nFcE1OlxkhGZcQ7NVDsA8Co4bIQ+/kB2ZYJNn
	0bZA+rhoVMa1OJDgFF32z7Ft8CuVONagLquAiQ==
X-Google-Smtp-Source: AGRyM1vTYnR4aUWgN23O0d/xGeCiiVR9GEMqYRiTTMzQgIpMCx+gOwuM+yLRXZE4QVVT2iCwBiTkp6dnAnUtBxecvw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:21e:d672:5a6a:420e])
 (user=justinstitt job=sendgmr) by 2002:a81:7709:0:b0:31e:6ee2:dbe6 with SMTP
 id s9-20020a817709000000b0031e6ee2dbe6mr481076ywc.438.1658437965705; Thu, 21
 Jul 2022 14:12:45 -0700 (PDT)
Date: Thu, 21 Jul 2022 14:12:18 -0700
Message-Id: <20220721211218.4039288-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
Subject: [PATCH] soc: sof: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Justin Stitt <justinstitt@google.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Tom Rix <trix@redhat.com>, sound-open-firmware@alsa-project.org, 
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
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
Reported by Nathan here:
https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/

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

