Received: from 13.mo584.mail-out.ovh.net (13.mo584.mail-out.ovh.net [178.33.251.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDCF2CAA
	for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 09:26:13 +0000 (UTC)
Received: from player762.ha.ovh.net (unknown [10.109.146.53])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id ABC6022F51
	for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 08:48:22 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
	(Authenticated sender: rafal@milecki.pl)
	by player762.ha.ovh.net (Postfix) with ESMTPSA id D55F1259D81AC;
	Thu, 23 Dec 2021 08:48:18 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-96R001d4729cd0-16f6-476f-b75c-fcf1799bac4b,
                    F8CB8CBF602DC8C83A84A692D7DC258C8FD1F5FC) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp:194.187.74.233
Message-ID: <646b67ae-92e3-dc46-62bf-0f18a008d0bd@milecki.pl>
Date: Thu, 23 Dec 2021 09:48:13 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: drivers/pinctrl/bcm/pinctrl-ns.c:286:10: error: passing 'const
 char *const *const' to parameter of type 'const char **' discards qualifiers
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
References: <202112230616.y4Aa2Lyi-lkp@intel.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <202112230616.y4Aa2Lyi-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4023403319252331483
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddtjedguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfesthejredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepudehveevgedvteeghfduhefgieeuhfejgfejhfetgfehtdegjeeluefgfeffueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdptddurdhorhhgpdhgihhthhhusghushgvrhgtohhnthgvnhhtrdgtohhmnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeeivddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvh

On 22.12.2021 23:55, kernel test robot wrote:
> tree:   https://github.com/0day-ci/linux/commits/UPDATE-20211222-144502/Rafa-Mi-ecki/pinctrl-bcm-ns-use-generic-groups-functions-helpers/20211117-064419
> head:   da7c70cdea1466b4234a30658ee2b5383545a629
> commit: da7c70cdea1466b4234a30658ee2b5383545a629 pinctrl: bcm: ns: use generic groups & functions helpers
> date:   16 hours ago
> config: riscv-randconfig-r042-20211222 (https://download.01.org/0day-ci/archive/20211223/202112230616.y4Aa2Lyi-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project de4e0195ae1c39f1c3b07834b8e32c113f4f20eb)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install riscv cross compiling tool for clang build
>          # apt-get install binutils-riscv64-linux-gnu
>          # https://github.com/0day-ci/linux/commit/da7c70cdea1466b4234a30658ee2b5383545a629
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review UPDATE-20211222-144502/Rafa-Mi-ecki/pinctrl-bcm-ns-use-generic-groups-functions-helpers/20211117-064419
>          git checkout da7c70cdea1466b4234a30658ee2b5383545a629
>          # save the config file to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/pinctrl/bcm/pinctrl-ns.c:286:10: error: passing 'const char *const *const' to parameter of type 'const char **' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>                                                 function->groups,
>                                                 ^~~~~~~~~~~~~~~~
>     drivers/pinctrl/bcm/../pinmux.h:153:18: note: passing argument to parameter 'groups' here
>                                     const char **groups,
>                                                  ^
>     1 error generated.

You are testing this patch against wrong tree. See message in my commit:

V3: Don't drop "const" from "ns_pinctrl_function" @groups. It's possible
     thanks to the commit bd0aae66c482 ("pinctrl: add one more "const" for
     generic function groups").
     This patch depends on above commit for that reason.
