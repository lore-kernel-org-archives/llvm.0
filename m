Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A057B2CA4
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 06:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F96C36AE4;
	Thu, 16 Dec 2021 06:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639637171;
	bh=r2Y+GjX5e/u0eXEE0tEbkKF/KjAvJAimzMqFv0ZBGYU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ADCsw8pfq2mOoE1ULgtQ8P6dcADLMTui7q7yRxQPQcQxvtrSUMpSF5c3T4IgBuN4R
	 6rt4PLhvQgD742ygjyggvrIrGDg6H+ZoqtOvIKjGOFcloXgKpH+J8LO0BLYx/g23Jd
	 MNNMKGSMNmNGdFvWtw6WTfoy7nHC9lJ150ChrXfXVjnQHjXe1YHJO1VHONfZAQi1S2
	 V+iOLKVbqXm/UWnyw6TXa9S4xbgpAdwiKUFtT3Vq4Uk/c3WIgqiclm4cbu0pXz8Yzz
	 wPEIJBCh9tzCVP2sheG9cL+lt1XbhSSe7Kk1AAhK6INULJehZj+N+XlyTKu/hwabgX
	 gk/TzozCFc1DA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAL9mu0LVBSorMK9KbZ3kXYcnubi44yPDxzMroKYVYB2c=o+xjQ@mail.gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com> <1635232282-3992-10-git-send-email-dillon.minfei@gmail.com> <CAL9mu0LVBSorMK9KbZ3kXYcnubi44yPDxzMroKYVYB2c=o+xjQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after system enter shell
From: Stephen Boyd <sboyd@kernel.org>
Cc: Patrice CHOTARD <patrice.chotard@foss.st.com>, Pi-Hsun Shih <pihsun@chromium.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, gnurou@gmail.com, ezequiel@collabora.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab+huawei@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, hugues.fruchet@foss.st.com, linux-media <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org, llvm@lists.linux.dev, Alexandre TORGUE <alexandre.torgue@foss.st.com>;
To: Dillon Min <dillon.minfei@gmail.com>
Date: Wed, 15 Dec 2021 22:46:10 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216064611.45F96C36AE4@smtp.kernel.org>

Quoting Dillon Min (2021-11-11 18:40:09)
> Hi Stephen
>=20
> Would you pick up this patch? Thanks.
>=20

Ok.
