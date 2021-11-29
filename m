Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A562C82
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 09:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BBAC53FCD;
	Mon, 29 Nov 2021 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638179276;
	bh=5CENAf/8QanA+lLNHGoriAWyTBD8I6cnLPIi4nuvTN4=;
	h=From:To:Cc:Subject:Date:From;
	b=H5x3OCE4WZM12i3Vle4WyTNxy+SESS5l9MQeZY2n7ErMwupHa1wRMhIDBf89g7wm0
	 6gSP3nnbNkjlvyl5EfRHCHT9yuFlAICe30EKLNuUnfkgpJwvV7j/LK/tpRwFkXXtNL
	 ngawzo+pjvK7MjnPQuBBEVueMaD0DcmNhT89Dcki0PS010FrjtX4z8KjMu49WiD2hB
	 Gbe7aXtjeIzubLax6URGtRpmgiSQWSoZk9ytffAodGu1kBI6yn/I9CQGZat+iZ9dFm
	 X+llPm1yrsTkJuLdmzOSQUGh9OICb+q4/osiwb1c99vuQQuHtvh97hr5+sg2lMOfgk
	 gS60XsLMi2/+g==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mrdGM-000RAt-2h; Mon, 29 Nov 2021 10:47:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Andy Gross <agross@kernel.org>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Antti Palosaari <crope@iki.fi>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Kees Cook <keescook@chromium.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Robert Foss <robert.foss@linaro.org>,
	Todor Tomov <todor.too@gmail.com>,
	Xiaofeng Cao <caoxiaofeng@yulong.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 00/20] Solve the remaining issues with clang and W=1 on media
Date: Mon, 29 Nov 2021 10:47:32 +0100
Message-Id: <cover.1638179135.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Currently, using clang with W=1 and CONFIG_WERROR causes media to break.
This is reported by builder.linuxtv.org.

This series solve the remaining issues.

v2:
  - Use __always_unused for the code we're keeping
  - Dropped a couple more unused functions
  - Added reviews got from the first submission and addressed some comments.

Mauro Carvalho Chehab (19):
  media: adv7842: get rid of two unused functions
  media: saa7134-go7007: get rid of to_state() function
  media: davinci: get rid of an unused function
  media: drxd: drop offset var from DownloadMicrocode()
  media: drxk: drop operation_mode from set_dvbt()
  media: m88ds3103: drop reg11 calculus from m88ds3103b_select_mclk()
  media: si21xx: report eventual errors at set_frontend
  media: solo6x10: mark unused functions as such
  media: si470x: fix printk warnings with clang
  media: radio-si476x: drop a container_of() abstraction macro
  media: lmedm04: don't ignore errors when setting a filter
  media: au0828-i2c: drop a duplicated function
  media: adv7604: mark unused functions as such
  media: adv7511: drop unused functions
  media: imx290: mark read reg function as __always_unused
  media: davinci: vpbe_osd: mark read reg function as __always_unused
  media: mtk-mdp: address a clang warning
  media: cobalt: drop an unused variable
  media: mxl5005s: drop some dead code

Robert Foss (1):
  media: camss: Remove unused static function

 drivers/media/dvb-frontends/drxd_hard.c       |  8 -------
 drivers/media/dvb-frontends/drxk_hard.c       | 23 ++++---------------
 drivers/media/dvb-frontends/m88ds3103.c       |  6 +----
 drivers/media/dvb-frontends/si21xx.c          |  7 +++---
 drivers/media/i2c/adv7511-v4l2.c              | 22 ------------------
 drivers/media/i2c/adv7604.c                   | 18 +++++++--------
 drivers/media/i2c/adv7842.c                   | 10 --------
 drivers/media/i2c/imx290.c                    |  2 +-
 drivers/media/pci/cobalt/cobalt-cpld.c        |  5 +---
 drivers/media/pci/saa7134/saa7134-go7007.c    |  7 +-----
 .../media/pci/solo6x10/solo6x10-v4l2-enc.c    | 12 +++++-----
 drivers/media/platform/davinci/vpbe_osd.c     |  2 +-
 drivers/media/platform/davinci/vpif_capture.c | 11 ---------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  2 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  7 ------
 drivers/media/radio/radio-si476x.c            |  6 -----
 drivers/media/radio/si470x/radio-si470x-i2c.c |  4 ++--
 drivers/media/radio/si470x/radio-si470x-usb.c |  8 +++----
 drivers/media/tuners/mxl5005s.c               | 14 +----------
 drivers/media/usb/au0828/au0828-i2c.c         |  7 ------
 drivers/media/usb/dvb-usb-v2/lmedm04.c        |  3 +++
 21 files changed, 40 insertions(+), 144 deletions(-)

-- 
2.33.1


