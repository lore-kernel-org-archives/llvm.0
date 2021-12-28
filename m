Received: from mail-sz.amlogic.com (mail-sz.amlogic.com [211.162.65.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AFA2C80
	for <llvm@lists.linux.dev>; Tue, 28 Dec 2021 02:48:05 +0000 (UTC)
Received: from [10.28.39.18] (10.28.39.18) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 28 Dec
 2021 10:32:55 +0800
Subject: Re: [PATCH v2 2/2] pinctrl: meson: add pinctrl driver support for
 Meson-S4 Soc
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
	<llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, Neil Armstrong
	<narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>, kernel test
 robot <lkp@intel.com>
References: <20211227080649.32275-3-qianggui.song@amlogic.com>
 <202112280001.MfQS59Vr-lkp@intel.com>
 <CAFBinCB96pGwxBhUxmwihvW+xWF4ex1C-XYO8u6zm6RsmHKaKg@mail.gmail.com>
From: qianggui.song <Qianggui.Song@amlogic.com>
Message-ID: <b71bcbb8-117b-f6d8-bcfe-03d4fdc6df1f@amlogic.com>
Date: Tue, 28 Dec 2021 10:33:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAFBinCB96pGwxBhUxmwihvW+xWF4ex1C-XYO8u6zm6RsmHKaKg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.39.18]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)



On 12/28/21 2:15 AM, Martin Blumenstingl wrote:
> 
> Hello Qianggui,
> 
> On Mon, Dec 27, 2021 at 5:16 PM kernel test robot <lkp@intel.com> wrote:
> [...]
>>>> drivers/pinctrl/meson/pinctrl-meson-s4.c:9:10: fatal error: 'dt-bindings/gpio/meson-s4-gpio.h' file not found
> In v1 of this series you also included a patch "dt-bindings: gpio: Add
> a header file for Amlogic Meson S4".
> Rob gave his Acked-by tag which means that you need to keep the patch
> in the series but add his Acked-by above your Signed-off-by line.
> Patches should only be dropped from a series if they are not relevant
> anymore or if they were already applied to a tree by the maintainer.
> In this case Rob just gave his Acked-by but the patch was not applied
> by any maintainer yet.
> 
> Please send a v3 which adds the header file patch back and includes
> Rob's Acked-by in there.
> 
> 
> Thank you
> Martin
> 
> .
> 
Sorry for that, I will send v3 later with GPIO header dt-bindings patch.
