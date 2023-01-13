Received: from out198-17.us.a.mail.aliyun.com (out198-17.us.a.mail.aliyun.com [47.90.198.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D253628;
	Fri, 13 Jan 2023 03:46:53 +0000 (UTC)
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1366565|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0193387-0.00120227-0.979459;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=28;RT=28;SR=0;TI=SMTPD_---.QrTXrBT_1673581583;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.QrTXrBT_1673581583)
          by smtp.aliyun-inc.com;
          Fri, 13 Jan 2023 11:46:33 +0800
From: wangweidong.a@awinic.com
To: povik+lin@cutebit.org
Cc: 13691752556@139.com,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	cezary.rojewski@intel.com,
	ckeepax@opensource.cirrus.com,
	daniel.beer@igorinstitute.com,
	devicetree@vger.kernel.org,
	flatmax@flatmax.com,
	james.schulman@cirrus.com,
	jonathan.albrieux@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	lkp@intel.com,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	pierre-louis.bossart@linux.intel.com,
	rf@opensource.cirrus.com,
	robh+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	steve@sk2.org,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	yangxiaohua@everest-semi.com,
	yijiangtao@awinic.com,
	zhaolei@awinic.com
Subject: Re: [PATCH V9 4/5] ASoC: codecs: Aw883xx chip register file, data type file and Kconfig Makefile
Date: Fri, 13 Jan 2023 11:46:23 +0800
Message-Id: <20230113034623.188604-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <5EA7B038-9B49-4E5D-8209-8689C0D03071@cutebit.org>
References: <5EA7B038-9B49-4E5D-8209-8689C0D03071@cutebit.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/1/2023, at 9:38, povik+lin@cutebit.org wrote:
> Hi,

> the issue here would be that it’s possible to select your driver for compilation without
> having selected the CRC8 functions, leading to the linkage error.

> You can fix that by adding ’select CRC8’ under the Kconfig section of your driver, similarly
> to how the SND_SOC_SIGMADSP symbol selects CRC32.

Thank you very much for your advice. I will correct this mistake

> Best regards,
> Martin

Best regards,
Weidong Wang
