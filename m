Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258AC2C86
	for <llvm@lists.linux.dev>; Thu, 18 Nov 2021 12:28:42 +0000 (UTC)
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MEmtx-1mu4It3t63-00GFM5 for <llvm@lists.linux.dev>; Thu, 18 Nov 2021
 13:28:40 +0100
Received: by mail-wm1-f54.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so4686631wmz.2
        for <llvm@lists.linux.dev>; Thu, 18 Nov 2021 04:28:40 -0800 (PST)
X-Gm-Message-State: AOAM532g7SBmcCOdvlOu+T+7zfFiwsaFEMihEXTMbNOBK1euru4D9W/q
	YstUdfja8Q3au2VkrMuIIhPGV7/i1ZK/mQmo7wU=
X-Google-Smtp-Source: ABdhPJwHPm5rqs1mRtoVU3VyAD82P9B5WdxoHRl5cSOj+PTUOb9M4G3I3oGcy5XOrtizC7TPV0BPZor0dkPA4ESo0Ng=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr9556680wmb.1.1637238520555;
 Thu, 18 Nov 2021 04:28:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211111073145.2504032-1-arnd@kernel.org>
In-Reply-To: <20211111073145.2504032-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Nov 2021 13:28:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2hdrxz0rsDxWRu7B2Hfv-+Oo3yPndoLNH5KZw9Y2Knzg@mail.gmail.com>
Message-ID: <CAK8P3a2hdrxz0rsDxWRu7B2Hfv-+Oo3yPndoLNH5KZw9Y2Knzg@mail.gmail.com>
Subject: Re: [PATCH] [v2] iwlwifi: pcie: fix constant-conversion warning
To: Luca Coelho <luciano.coelho@intel.com>, Kalle Valo <kvalo@codeaurora.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Johannes Berg <johannes.berg@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>, Yaara Baruch <yaara.baruch@intel.com>, 
	Matti Gottlieb <matti.gottlieb@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, 
	linux-wireless <linux-wireless@vger.kernel.org>, Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:X6jAOFFO1RPrGxxEPukKciAgL7RVS+0TvVw4M2wX3CskyAYGUXp
 Ysl7GpB9yfumURZB0QyDMj10Xbf4Qh7H/JNs2yUUCy/V/SP8H3nhXsocgRtoGbMQ2yBF60g
 f1tRmE/eRCq49ZpOZT5Zp5ITSIqADGmIkwnea5U8rHLtEWAhwPfMpW0EXMRyvbY+LLxIS8n
 0oUyOtg7aHQJDlwRffNuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:knSG82j+dH8=:PuhlzdOPDqnV8E+I0KpXB+
 96QG5PteTqeB39g6TXqYK9IkAXh3cFSWb0oe4tl42bc/LGOsJkUWRKMTAhNuHmuabOcWAInjS
 9Ntifjx31Uefgq+pohCBh1Jy15rsn7AfuI8jvmEGP8BHZr+FcgCVWcGGVRYQU/EdPeH3Ckxwj
 xhSJ/xl4Bjx5MrlnBfKeX3V3TYbRtIIHqZ7DJKuR3dRNOR/dVWCzZ/j6j1ZH/0Giq0YVqCV8g
 G+Y5GwFU7cvs5jvtFt/ybb3fOcee/eI2CgsOHS6WStBSqgeqkfI7e3ocOEleHjhBaDj64iDPf
 RnKvnQeD+OE6Dr6PmPLwJnx7d0ZEklUAlNFx3c+kvPSUbip3DoSCMPrRFAKNVYAVW71MKgm1D
 j0o6+J536wK6YwquISLvfoby+H+9m4mHVYLi2GlBBaWP1Ur6yRkKtEfRsqE8FDQ3ad6lTk1r/
 EXVTCsW7TmY5gtbwGTp8pzC9aabhWQOK5wULrhxGzGAgflIUh9xlkVUTXACbFk+Tc5AnUhufV
 fwCHhlYXfQmPhuI+AEuo8oiFqp+zYS7hPBvmK6q6j7+JDRPXIVrc5/sixd4cmhHqxaxjufOWd
 CJ6HLQ2Ph8OXUDCvtMzDLEreqBa3ILz4CGM3TUV0vzjhHDeCjMhTGAdLXxwXatTVvivEdkNku
 7lYkl9A0G3G/FsOsYZ6TtOObqFQeqknIqc/W8KMcNQCPgnC9X53GnPQ/DOe6KVlkYl0s=

On Thu, Nov 11, 2021 at 8:31 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang points out a potential issue with integer overflow when
> the iwl_dev_info_table[] array is empty:
>
> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1344:42: error: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551615 to -1 [-Werror,-Wconstant-conversion]
>         for (i = ARRAY_SIZE(iwl_dev_info_table) - 1; i >= 0; i--) {
>                ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>
> This is still harmless, as the loop correctly terminates, but adding
> an extra range check makes that obvious to both readers and to the
> compiler.
>
> Fixes: 3f7320428fa4 ("iwlwifi: pcie: simplify iwl_pci_find_dev_info()")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Something went wrong on my end: I thought this was a clang warning and
that I had
fixed it because it didn't come back with my v2 patch. However I now see it in
my gcc-11 test builds, so I assume this was a gcc warning all along, and that
my patch does nothing. Please disregard it if you have not already applied it.

       Arnd
